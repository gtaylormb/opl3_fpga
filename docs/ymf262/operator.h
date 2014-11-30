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

#ifndef PPP_OPL_OPERATOR_H
#define PPP_OPL_OPERATOR_H

#include <memory>

#include <stuff/utils.h>

#include "phasegenerator.h"
#include "envelopegenerator.h"

#include <stream/iserializable.h>

namespace opl
{

class Opl3;
class Operator : public ISerializable
{
    DISABLE_COPY( Operator )
public:
    typedef std::shared_ptr<Operator> Ptr;

    static constexpr int
    AM1_VIB1_EGT1_KSR1_MULT4_Offset = 0x20,
    KSL2_TL6_Offset = 0x40,
    AR4_DR4_Offset = 0x60,
    SL4_RR4_Offset = 0x80,
    _5_WS3_Offset = 0xE0;

private:
    Opl3* m_opl;
    int m_operatorBaseAddress;

    PhaseGenerator m_phaseGenerator;
    EnvelopeGenerator m_envelopeGenerator;

    uint16_t m_phase = 0;

    //! @brief Amplitude Modulation a.k.a. Tremolo
    bool m_am = false;
    //! @brief Vibrato
    bool m_vib = false;
    //! @brief Key Scale Rate. Sets the actual envelope rate together with rate and keyScaleNumber
    bool m_ksr = false;
    //! @brief Envelope Generator Type
    bool m_egt = false;
    //! @brief Multiple. Multiplies the Channel.baseFrequency to get the Operator.operatorFrequency
    uint8_t m_mult = 0;
    //! @brief Key Scale Level. Sets the attenuation in accordance with the octave.
    uint8_t m_ksl = 0;
    //! @brief Total Level. Sets the overall damping for the envelope.
    uint8_t m_tl = 0;
    //! @brief Attack Rate.
    uint8_t m_ar = 0;
    //! @brief Decay Rate.
    uint8_t m_dr = 0;
    //! @brief Sustain Level.
    uint8_t m_sl = 0;
    //! @brief Release Rate.
    uint8_t m_rr = 0;
    //! @brief Waveform selector
    uint8_t m_ws = 0;
    // 0..1023
    uint16_t m_f_number = 0;
    // 0..7
    uint8_t m_block = 0;

    int16_t handleTopCymbal( uint8_t ws );
    int16_t handleHighHat( uint8_t ws );
    int16_t handleSnareDrum( uint8_t ws );

public:
    /**
     * @post m_ar<16
     */
    void setAr( uint8_t val ) {
        m_ar = val & 0x0f;
    }
    const EnvelopeGenerator* envelopeGenerator() const {
        return &m_envelopeGenerator;
    }
    EnvelopeGenerator* envelopeGenerator() {
        return &m_envelopeGenerator;
    }
    const PhaseGenerator* phaseGenerator() const {
        return &m_phaseGenerator;
    }
    PhaseGenerator* phaseGenerator() {
        return &m_phaseGenerator;
    }

    Operator( Opl3* opl, int baseAddress );

    /**
     * @post m_mult<16
     */
    void update_AM1_VIB1_EGT1_KSR1_MULT4();

    /**
     * @post m_ksl<4 && m_tl<64
     */
    void update_KSL2_TL6();

    /**
     * @post m_ar<16 && m_dr<16
     */
    void update_AR4_DR4();

    /**
     * @post m_sl<16 && m_rr<16
     */
    void update_SL4_RR4();

    /**
     * @post m_ws<8
     */
    void update_5_WS3();

    /**
     * @param[in] modulator Fractional phase modulation, max. 10 bits used
     * @return 13 bit sample value
     * @see AbstractChannel::avgFeedback()
     */
    int16_t nextSample( uint16_t modulator = 0 );

    /**
     * @brief Calculate operator output
     * @param[in] outputPhase Waveform phase, max. 10 bit used
     * @param[in] ws Waveform selector
     * @return Waveform sample, amplitude is -4085..4084
     */
    int16_t getOutput( uint16_t outputPhase, uint8_t ws );

    void keyOn();
    void keyOff();
    void updateOperator( uint16_t f_num, uint8_t blk );

    virtual AbstractArchive& serialize( AbstractArchive* archive );
};
}

#endif
