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

#ifndef PPP_OPL_ENVELOPEGENERATOR_H
#define PPP_OPL_ENVELOPEGENERATOR_H

#include <cmath>
#include <cstdint>

namespace opl
{

class Opl3;

/**
 * @class EnvelopeGenerator
 * @brief Envelope generator
 *
 * @details
 * This is a 9-bit envelope generator. It has a range of 0 to 96 dB,
 * which means that 16 units are 3 dB which halves the output.
 */
class EnvelopeGenerator
{
private:
    enum class Stage
    {
        Attack, Decay, Sustain, Release
    };

    Opl3* m_opl;
    Stage m_stage = Stage::Release;
    /**
     * @brief Attack rate
     * @invariant m_ar<16
     * @note m_ar==0 disables the attack, m_ar==15 sets m_env=0.
     */
    uint8_t m_ar = 0;
    /**
     * @brief Decay rate
     * @invariant m_dr<16
     */
    uint8_t m_dr = 0;
    /**
     * @brief Sustain level
     * @invariant m_sl<16
     */
    uint8_t m_sl = 0;
    /**
     * @brief Release rate
     * @invariant m_rr<16
     */
    uint8_t m_rr = 0;
    /**
     * @brief F-Number
     * @invariant m_fnum<1024
     */
    uint16_t m_fnum = 0;
    /**
     * @brief Block
     * @invariant m_block<8
     */
    uint8_t m_block = 0;
    /**
     * @brief Envelope value
     * @invariant m_env<512
     */
    uint16_t m_env = Silence;
    //! @brief Key scale rate
    bool m_ksr = false;
    /**
     * @brief Total level
     * @invariant m_tl<64
     * @remark The attenuation is 0.75dB * m_tl.
     */
    uint8_t m_tl = 0;
    /**
     * @brief Key scale level
     * @invariant m_ksl<4
     */
    uint8_t m_ksl = 0;
    /**
     * @brief Key scale level (adjusted)
     * @invariant m_kslAdd<4*56
     * @remark This is the combined value of m_ksl, m_fnum and m_block.
     */
    uint8_t m_kslAdd = 0;
    /**
     * @brief Final envelope value
     * @invariant m_total<512
     * @remark This combines m_env, m_tl, m_kslAdd, the OPL DAM flag
     *         and the AM and EGT flags passed to advance().
     */
    uint16_t m_total = Silence;
    /**
     * @brief Clock counter
     * @invariant m_counter<(1<<15)
     */
    uint32_t m_counter = 0;

    static constexpr uint16_t Silence = 511;

    /**
     * @brief Calculates the effectively used rates
     * @return Effectively used rate for envelope calculation
     * @invariant rate<16
     * @note This method is nearly frozen.
     */
    uint8_t calculateRate( uint8_t delta ) const;
    /**
     * @brief Advances the counter and returns the overflow
     * @param[in] rate Attack/decay/release rate
     * @return Counter overflow (0..7)
     * @pre rate<16
     * @post Result<8
     * @note This method is nearly frozen.
     */
    inline uint8_t advanceCounter( uint8_t rate );
    /**
     * @brief Handles decay/release phases
     * @param[in] rate Decay/release rate register value
     * @pre rate<64
     * @note This method is nearly frozen.
     */
    void attenuate( uint8_t rate );
    /**
     * @brief Handles attack phase
     * @pre m_env>0
     * @note This method is nearly frozen.
     */
    void attack();

public:
    constexpr EnvelopeGenerator( Opl3* opl )
        : m_opl( opl ) {
    }

    constexpr bool isSilent() const {
        return m_total == Silence;
    }
    /**
     * @brief Sets the sustain level
     * @param[in] sl Sustain level
     * @note @a sl will be bit-masked.
     */
    void setSustainLevel( uint8_t sl ) {
        m_sl = sl & 0x0f;
        if( m_sl == 0x0f )
            m_sl = 0x1f;
    }

    /**
     * @brief Sets the total level (not m_total)
     * @param[in] tl Total level, 6 bits
     * @note @a tl will be bit-masked.
     */
    void setTotalLevel( uint8_t tl ) {
        // The datasheet states that the TL formula is:
        // TL = (24*d5 + 12*d4 + 6*d3 + 3*d2 + 1.5*d1 + 0.75*d0),
        // 10^(0.075*tl) ~= 2^(tl/4)
        m_tl = tl & 0x3f;
    }

    /**
     * @brief Sets m_fnum, m_block, m_ksl and calculates m_kslAdd
     * @note No pre-conditions for the parameters, as they will be
     *       bit-masked to match the invariants.
     * @note This method is frozen; it has been verified from real
     *       chip output.
     */
    void setAttennuation( uint16_t f_number, uint8_t block, uint8_t ksl );

    /**
     * @brief Sets the attack rate
     * @param[in] attackRate New attack rate
     * @note @a attackRate will be bit-masked.
     */
    void setAttackRate( uint8_t attackRate ) {
        m_ar = attackRate & 0x0f;
    }


    /**
     * @brief Sets the decay rate
     * @param[in] decayRate New decay rate
     * @note @a decayRate will be bit-masked.
     */
    void setDecayRate( uint8_t decayRate ) {
        m_dr = decayRate & 0x0f;
    }

    /**
     * @brief Sets the release rate
     * @param[in] releaseRate New release rate
     * @note @a releaseRate will be bit-masked.
     */
    void setReleaseRate( uint8_t releaseRate ) {
        m_rr = releaseRate & 0x0f;
    }

    void setKsr( bool ksr ) {
        m_ksr = ksr;
    }

    /**
     * @brief Calculate the next envelope step
     * @param[in] egt Envelope generator type
     * @param[in] am Amplitude modulation
     * @return Envelope, 0..511 for 0..96dB attenuation
     */
    uint16_t advance( bool egt, bool am );

    constexpr uint16_t value() const {
        return m_total;
    }

    /**
     * @post m_stage==Stage::ATTACK
     */
    void keyOn() {
        m_stage = Stage::Attack;
    }

    /**
     * @post m_stage==Stage::RELEASE
     */
    void keyOff() {
        m_stage = Stage::Release;
    }
};
}

#endif
