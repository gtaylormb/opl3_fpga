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

#ifndef PPP_OPL_CHANNEL_H
#define PPP_OPL_CHANNEL_H

#include "stuff/utils.h"

#include <stream/iserializable.h>
#include <vector>
#include <cstdint>
#include <memory>
#include <array>

namespace opl
{

class Operator;

class Opl3;

class Channel : public ISerializable
{
    DISABLE_COPY( Channel )
public:
    typedef std::shared_ptr<Channel> Ptr;

    static constexpr int _2_KON1_BLOCK3_FNUMH2_Offset = 0xB0;
    static constexpr int  FNUML8_Offset = 0xA0;
    static constexpr int  CH4_FB3_CNT1_Offset = 0xC0;
private:
    Opl3* m_opl;
    int m_channelBaseAddress;

    /**
     * @brief Frequency Number
     * @invariant m_fnum < 1024
     */
    uint16_t m_fnum = 0;

    //! @brief Key On. If changed, calls keyOn() or keyOff(), depending on the new value.
    bool m_kon = false;

    /**
     * @brief Block/octave
     * @invariant m_block<8
     */
    uint8_t m_block = 0;

    uint8_t m_ch = 0;

    /**
     * @brief Feedback amount
     * @invariant m_fb<8
     */
    uint8_t m_fb = 0;

    //! @brief Feedback sample values
    int16_t m_feedback[2] = {0, 0};

    //! @brief Connection
    bool m_cnt = false;

    /**
     * @brief The channels within this operator
     * @invariant m_operator.empty() || m_operators.size()==2 || m_operators.size()==4
     */
    std::vector<Operator*> m_operators = {};

public:
    /**
     * @brief Calculate adjusted phase feedback
     * @return Adjusted phase feedback using m_fb (11 bit)
     *
     * @details
     * The OPL stores the last 2 samples independent of feedback.
     */
    int16_t feedback() const {
        if( m_fb == 0 ) {
            return 0;
        }
        return ( ( m_feedback[0] + m_feedback[1] ) << m_fb ) >> 9;
    }
    /**
     * @brief Push feedback into the queue
     * @param[in] fb 13 bit feedback from channel output
     */
    void pushFeedback( int16_t fb ) {
        m_feedback[0] = m_feedback[1];
        m_feedback[1] = fb;
    }

    Channel( Opl3* opl, int baseAddress );
    Channel( Opl3* opl, int baseAddress, Operator* op1, Operator* op2 );
    Channel( Opl3* opl, int baseAddress, Operator* op1, Operator* op2, Operator* op3, Operator* op4 );

    /**
     * @post m_fnumh<1024 && m_block<8
     */
    void update_2_KON1_BLOCK3_FNUMH2();

    void update_FNUML8();

    /**
     * @post m_fb<8
     */
    void update_CH4_FB3_CNT1();

    void updateChannel();

    void getInFourChannels( std::array<int16_t, 4>* dest, int16_t channelOutput );

    void nextSample( std::array<int16_t, 4>* dest );
    void keyOn();
    void keyOff();
    void updateOperators();

    int baseAddress() const {
        return m_channelBaseAddress;
    }

    virtual AbstractArchive& serialize( AbstractArchive* archive );

private:
    void nextSample2Op( std::array<int16_t, 4>* dest );
    void nextSample4Op( std::array<int16_t, 4>* dest );
    bool isRhythmChannel() const;
};
}

#endif
