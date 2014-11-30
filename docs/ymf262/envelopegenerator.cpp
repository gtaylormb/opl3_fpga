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

#include "envelopegenerator.h"
#include "opl3.h"

namespace opl
{

void EnvelopeGenerator::setAttennuation( uint16_t f_number, uint8_t block, uint8_t ksl )
{
    m_fnum = f_number & 0x3ff;
    m_block = block & 0x07;
    m_ksl = ksl & 0x03;

    if( m_ksl == 0 ) {
        m_kslAdd = 0;
        return;
    }

    // 1.5 dB att. for base 2 of oct. 7
    // created by: round(8*log2( 10^(dbMax[msb]/10) ))+8;
    // verified from real chip ROM
    static constexpr int kslRom[16] = {
        0, 32, 40, 45, 48, 51, 53, 55, 56, 58, 59, 60, 61, 62, 63, 64
    };
    // 7 negated is, by one's complement, effectively -8. To compensate this,
    // the ROM's values have an offset of 8.
    int tmp = kslRom[m_fnum >> 6] + 8 * ( m_block - 8 );
    if( tmp <= 0 ) {
        m_kslAdd = 0;
        return;
    }
    m_kslAdd = tmp;
    switch( m_ksl ) {
        case 1:
            // 3 db
            m_kslAdd <<= 1;
            break;
        case 2:
            // no change, 1.5 dB
            break;
        case 3:
            // 6 dB
            m_kslAdd <<= 2;
            break;
    }
}

uint8_t EnvelopeGenerator::calculateRate( uint8_t rateValue ) const
{
    if( rateValue == 0 ) {
        return 0;
    }
    // calculate key scale number (see NTS in the YMF262 manual)
    uint8_t rof = ( m_fnum >> ( m_opl->nts() ? 8 : 9 ) ) & 0x1;
    // ...and KSR (see manual, again)
    rof |= m_block << 1;
    if( !m_ksr ) {
        rof >>= 2;
    }
    // here, rof<=15
	// the limit of 60 results in rof=0 if rateValue=15 below
    return std::min<uint8_t>( 60, rof + (rateValue << 2) );
}

inline uint8_t EnvelopeGenerator::advanceCounter( uint8_t rate )
{
    BOOST_ASSERT( rate < 16 );
    if( rate == 0 ) {
        return 0;
    }
    const uint8_t effectiveRate = calculateRate( rate );
    // rateValue <= 15
    const uint8_t rateValue = effectiveRate >> 2;
    // rof <= 3
    const uint8_t rof = effectiveRate & 3;
    // 4 <= Delta <= (7<<15)
    m_counter += uint32_t( 4 | rof ) << rateValue;
    // overflow <= 7
    uint8_t overflow = m_counter >> 15;
    m_counter &= ( 1 << 15 ) - 1;
    return overflow;
}

void EnvelopeGenerator::attenuate( uint8_t rate )
{
    BOOST_ASSERT( rate < 64 );
    m_env += advanceCounter( rate );
    if( m_env > Silence ) {
        m_env = Silence;
    }
}

void EnvelopeGenerator::attack()
{
    BOOST_ASSERT( m_env > 0 );
    uint8_t overflow = advanceCounter( m_ar );
    if( overflow == 0 ) {
        return;
    }

    // The maximum value of overflow is 7. An overflow can only occur
    // if m_env < floor(m_env/8)*7 + 1. Let's substitute m_env by 8*x:
    // 8*x < 1 + x*7
    // <=> 8*x - 7*x < 1
    // <=> x < 1
    // But the attack only occurs if m_env>0, so an overflow cannot occur
    // here.
    // +1 for one's complement.
    m_env -= ( ( m_env * overflow ) >> 3 ) + 1;
}

uint16_t EnvelopeGenerator::advance( bool egt, bool am )
{
    switch( m_stage ) {
        case Stage::Attack:
            if( m_env == 0 ) {
                m_stage = Stage::Decay;
            }
            else if( m_ar == 15 ) {
                m_env = 0;
            }
            else {
                attack();
            }
            break;

        case Stage::Decay:
            if( ( m_env >> 4 ) >= m_sl ) {
                m_stage = Stage::Sustain;
                break;
            }
            attenuate( m_dr );
            break;

        case Stage::Sustain:
            if( !egt ) {
                m_stage = Stage::Release;
            }
            break;

        case Stage::Release:
            attenuate( m_rr );
            break;
    }

    int total = m_env + ( m_tl << 2 ) + m_kslAdd;

    if( am ) {
        int amVal = m_opl->tremoloIndex() >> 8;
        if( amVal > 26 ) {
            amVal = ( 2 * 26 ) + ~amVal;
        }
        BOOST_ASSERT( amVal >= 0 && amVal <= 26 );
        if( !m_opl->dam() ) {
            amVal >>= 2;
        }
        total += amVal;
    }

    if( total < 0 )
        m_total = 0;
    else if( total > Silence )
        m_total = Silence;
    else
        m_total = total;
    return m_total;
}

}
