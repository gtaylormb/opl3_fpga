/*
 * PPPlay - an old-fashioned module player
 * Copyright (C) 2012  Steffen Ohrendorf <steffen.ohrendorf@gmx.de>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * Original Java Code: Copyright (C) 2008 Robson Cozendey <robson@cozendey.com>
 *
 * Some code based on forum posts in: http://forums.submarine.org.uk/phpBB/viewforum.php?f=9,
 * Copyright (C) 2010-2013 by carbon14 and opl3
 */

#include "channel.h"
#include "opl3.h"
#include <stream/abstractarchive.h>

namespace opl
{

Channel::Channel( opl::Opl3* opl, int baseAddress ) :
    m_opl( opl ), m_channelBaseAddress( baseAddress ), m_operators()
{
}

Channel::Channel( opl::Opl3* opl, int baseAddress, Operator* op1, Operator* op2 ) :
    m_opl( opl ), m_channelBaseAddress( baseAddress ), m_operators( {op1, op2} )
{
}

Channel::Channel( opl::Opl3* opl, int baseAddress, Operator* op1, Operator* op2, Operator* op3, Operator* op4 ) :
    m_opl( opl ), m_channelBaseAddress( baseAddress ), m_operators( {op1, op2, op3, op4} )
{
}

void Channel::update_2_KON1_BLOCK3_FNUMH2()
{

    const uint8_t _2_kon1_block3_fnumh2 = m_opl->readReg( m_channelBaseAddress + Channel::_2_KON1_BLOCK3_FNUMH2_Offset );

    // Frequency Number (hi-register) and Block. These two registers, together with fnuml,
    // sets the Channel's base frequency;
    m_block = ( _2_kon1_block3_fnumh2 >> 2 ) & 7;
    m_fnum = ( m_fnum & 0xff ) | ( ( _2_kon1_block3_fnumh2 & 0x03 ) << 8 );
    updateOperators();

    bool newKon = _2_kon1_block3_fnumh2 & 0x20;
    if( newKon != m_kon ) {
        if( newKon ) {
            keyOn();
        }
        else {
            keyOff();
        }
        m_kon = newKon;
    }
}

void Channel::update_FNUML8()
{
    m_fnum = ( m_fnum & 0x0300 ) | m_opl->readReg( m_channelBaseAddress + Channel::FNUML8_Offset );
    updateOperators();
}

void Channel::update_CH4_FB3_CNT1()
{
    const uint8_t ch4_fb3_cnt1 = m_opl->readReg( m_channelBaseAddress + Channel::CH4_FB3_CNT1_Offset );
    m_ch = ch4_fb3_cnt1 >> 4;
    m_fb  = ( ch4_fb3_cnt1 >> 1 ) & 7;
    m_cnt = ch4_fb3_cnt1 & 0x01;
    updateOperators();
}

void Channel::updateChannel()
{
    update_2_KON1_BLOCK3_FNUMH2();
    update_FNUML8();
    update_CH4_FB3_CNT1();
}

void Channel::getInFourChannels( std::array<int16_t, 4>* dest, int16_t channelOutput )
{
    if( !dest ) {
        return;
    }
    if( !m_opl->isNew() ) {
        std::fill_n( dest->begin(), 4, channelOutput );
    }
    else {
        for( int i = 0; i < 4; i++ ) {
            ( *dest )[i] = ( m_ch >> i ) & 1 ? channelOutput : 0;
        }
    }
}

AbstractArchive& Channel::serialize( AbstractArchive* archive )
{
    *archive % m_fnum % m_kon % m_block
    % m_ch % m_fb % m_feedback[0] % m_feedback[1] % m_cnt;
    return *archive;
}

void Channel::keyOff()
{
    if( isRhythmChannel() )
        return;
    for( Operator * op : m_operators )
        op->keyOff();
}

void Channel::keyOn()
{
    for( Operator * op : m_operators )
        op->keyOn();
}

void Channel::updateOperators()
{
    for( Operator * op : m_operators )
        op->updateOperator( m_fnum, m_block );
}

bool Channel::isRhythmChannel() const
{
    return m_operators.size() == 2 && m_opl->ryt() && baseAddress() >= 6 && baseAddress() <= 8;
}

void Channel::nextSample( std::array< int16_t, 4 >* dest )
{
    if( m_operators.empty() ) {
        return getInFourChannels( dest, 0 );
    }
    else if( m_operators.size() == 2 ) {
        return nextSample2Op( dest );
    }
    else {
        return nextSample4Op( dest );
    }
}

void Channel::nextSample2Op( std::array< int16_t, 4 >* dest )
{
    if( isRhythmChannel() ) {
        if( m_operators[0] == m_opl->bassDrumOp1() ) {
            int16_t output = feedback();
            if( !m_cnt )
                output = m_operators[0]->nextSample( output );
            output = m_operators[1]->nextSample( output );
            getInFourChannels( dest, output );
            return;
        }
        getInFourChannels( dest, m_operators[0]->nextSample() + m_operators[1]->nextSample() );
        return;
    }

    int16_t channelOutput = m_operators[0]->nextSample( feedback() );
    pushFeedback( channelOutput );

    if( !m_cnt ) {
        // CNT = 0, the operators are in series, with the first in feedback.
        channelOutput = m_operators[1]->nextSample( channelOutput );
    }
    else {
        // CNT = 1, the operators are in parallel, with the first in feedback.
        channelOutput += m_operators[1]->nextSample();
    }
    getInFourChannels( dest, channelOutput );
}

void Channel::nextSample4Op( std::array< int16_t, 4 >* dest )
{
    const int secondChannelBaseAddress = baseAddress() + 3;
    const bool secondCnt = m_opl->readReg( secondChannelBaseAddress + Channel::CH4_FB3_CNT1_Offset ) & 0x1;

    int16_t channelOutput = m_operators[0]->nextSample( feedback() );
    pushFeedback( channelOutput );

    /*
     * Below: "~" means "modulates",
     * F is first connection, S is second connection
     * FS
     * 00  Op1 ~ Op2  ~  Op3 ~ Op4
     * 01 (Op1 ~ Op2) + (Op3 ~ Op4)
     * 10  Op1 +(Op2  ~  Op3 ~ Op4)
     * 11  Op1 +(Op2  ~  Op3)+ Op4
     */
    if( m_cnt ) {
        int16_t tmp = m_operators[2]->nextSample( m_operators[1]->nextSample() );
        if( secondCnt ) {
            channelOutput += m_operators[3]->nextSample() + tmp;
        }
        else {
            channelOutput += m_operators[3]->nextSample( tmp );
        }
    }
    else {
        channelOutput = m_operators[1]->nextSample( channelOutput );
        if( secondCnt ) {
            channelOutput += m_operators[3]->nextSample( m_operators[2]->nextSample() );
        }
        else {
            channelOutput = m_operators[3]->nextSample( m_operators[2]->nextSample( channelOutput ) );
        }
    }

    getInFourChannels( dest, channelOutput );
}

}
