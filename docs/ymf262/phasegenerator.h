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

#ifndef PPP_OPL_PHASEGENERATOR_H
#define PPP_OPL_PHASEGENERATOR_H

#include <boost/assert.hpp>
#include <cstdint>

namespace opl
{

class Opl3;

/**
 * @class PhaseGenerator
 * @brief OPL 3 Phase generator
 */
class PhaseGenerator
{
    //! @brief Owning chip
    Opl3* m_opl;
    /**
     * @brief Wave phase
     * @invariant m_phase < 1024
     */
    uint32_t m_phase = 0;
    /**
     * @brief F-Number
     * @invariant m_fNum < 1024
     */
    uint16_t m_fNum = 0;
    /**
     * @brief Block/octave
     * @invariant m_block < 8
     */
    uint8_t m_block = 0;
    /**
     * @brief Speed multiplier
     * @invariant m_mult < 16
     */
    uint8_t m_mult = 0;
public:
    PhaseGenerator( Opl3* opl ) : m_opl( opl ) {
        BOOST_ASSERT( opl != nullptr );
    }

    /**
     * @post m_fNum<1024 && m_block<8 && m_mult<16
     */
    void setFrequency( uint16_t f_number, uint8_t block, uint8_t mult );

    /**
     * @brief Advance phase
     * @param[in] vib Use vibrato
     * @return 10 bit phase
     */
    uint16_t advance( bool vib );

    void keyOn() {
        m_phase = 0;
    }
};
}

#endif
