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

#include "phasegenerator.h"
#include "opl3.h"

namespace opl
{
void PhaseGenerator::setFrequency( uint16_t f_number, uint8_t block, uint8_t mult )
{
    m_fNum = f_number & 0x3ff;
    m_block = block & 0x07;
    m_mult = mult & 0x0f;
}

uint16_t PhaseGenerator::advance( bool vib )
{
    /*
     * According to the YMF262 manual:
     * FNUM = (frq<<(20-BLOCK)) / Opl3::SampleRate
     * -> frq = (FNUM*Opl3::SampleRate) >> (20-BLOCK)
     *
     * The sine wave length is 1<<10, so if sinFrq is the number of sine samples per second:
     * sinFrq = (FNUM*Opl3::SampleRate) >> (10-BLOCK)
     * Thus, the number of sine samples per output sample is:
     * sinOutFrq = FNUM >> (10-BLOCK)
     *           = (FNUM<<BLOCK)>>10
     */
    uint32_t inc = m_fNum;
    inc <<= m_block;
    inc >>= 1;

	static constexpr int multTable[16] = {1, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 20, 24, 24, 30, 30};
	inc = ( inc * multTable[m_mult] ) >> 1;

    if( vib ) {
        uint16_t delta = m_fNum >> 7;
        const auto vib = m_opl->vibratoIndex()>>10;
        if( ( vib & 3 ) == 3 ) {
            delta >>= 1;
        }
        if( !m_opl->dvb() ) {
            // 14 -> 7 percent
            delta >>= 1;
        }
        if( vib & 4 ) {
            inc += ~delta;
        }
        else {
            inc += delta;
        }
    }

    m_phase += inc;

    return ( m_phase >> 9 ) & 0x3ff;
}
}
