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

#ifndef PPP_OPL_OPL3_H
#define PPP_OPL_OPL3_H

#include <cstdint>
#include <array>

#include "operator.h"
#include "channel.h"
#include <stream/iserializable.h>

#include <ymf262/ppplay_opl_export.h>

namespace opl
{
class PPPLAY_OPL_EXPORT Opl3 : public ISerializable
{
public:
    static constexpr int MasterClock = 14.1818e6;
    static constexpr int SampleRate = MasterClock / 288;

private:
    uint8_t m_registers[0x200];

    // The YMF262 has 36 operators:
    /**
     * @brief The operators.
     *
     * @details
     * Operators 1 to 18 are in m_operators[0], and
     * operators 19 to 36 are in m_operators[1]. Within each
     * sub-array, the 18 operators are subdivided into groups
     * of 6 operators, starting at offsets 0, 8, and 16.
     */
    Operator::Ptr m_operators[2][0x16];
    /**
     * @brief The 2-operator channels
     *
     * @details
     * Channels 1 to 9 are in m_channels2op[0], and
     * channels 10 to 18 are in m_channels2op[1].
     */
    Channel::Ptr m_channels2op[2][9];
    /**
     * @brief The 4-operator channels
     *
     * @details
     * Channels 1 to 3 are in m_channels4op[0], and
     * channels 4 to 6 are in m_channels4op[1].
     */
    Channel::Ptr m_channels4op[2][3];
    Channel::Ptr m_channels[2][9];
    Channel::Ptr m_disabledChannel;

    bool m_nts = false;
    //! @brief Depth of amplitude
    bool m_dam = false;
    //! @brief Depth of vibrato
    bool m_dvb = false;
    bool m_ryt = false;
    bool m_bd=false, m_sd=false, m_tc=false, m_hh=false;
    //! @brief OPL2/OPL3 mode selection
    bool m_new = false;
    //! @brief 13 bits
    uint16_t m_vibratoIndex = 0;
    //! @brief 14 bits, wraps around after 13*1024
    uint16_t m_tremoloIndex = 0;
    //! @brief Random number generator
    uint32_t m_rand = 1;

public:
    uint32_t randBit() const {
        return m_rand & 1;
    }
    bool isNew() const {
        return m_new;
    }
    uint8_t readReg( uint16_t index ) const {
        return m_registers[index];
    }
    void writeReg( uint16_t index, uint8_t val ) {
        write( ( index >> 8 ) & 1, index & 0xff, val );
    }
    bool nts() const {
        return m_nts;
    }
    Operator* bassDrumOp1() const {
        return m_operators[0][0x10].get();
    }
    Operator* highHatOperator() const {
        return m_operators[0][0x11].get();
    }
    Operator* tomTomOperator() const {
        return m_operators[0][0x12].get();
    }
    Operator* bassDrumOp2() const {
        return m_operators[0][0x13].get();
    }
    Operator* snareDrumOperator() const {
        return m_operators[0][0x14].get();
    }
    Operator* topCymbalOperator() const {
        return m_operators[0][0x15].get();
    }
    bool dvb() const {
        return m_dvb;
    }
    uint16_t vibratoIndex() const {
        return m_vibratoIndex;
    }
    bool dam() const {
        return m_dam;
    }
    bool ryt() const {
        return m_ryt;
    }
    uint16_t tremoloIndex() const {
        return m_tremoloIndex;
    }

    void read( std::array< int16_t, 4 >* dest ) ;

    Opl3();

    AbstractArchive& serialize( AbstractArchive* archive );
private:
    void update_DAM1_DVB1_RYT1_BD1_SD1_TOM1_TC1_HH1();
    void setEnabledChannels();
    void set4opConnections();
    void write( int array, int address, uint8_t data );
};
}

#endif
