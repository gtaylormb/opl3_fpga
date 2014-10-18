/*
 * File: OPL3.java
 * Software implementation of the Yamaha YMF262 sound generator.
 * Copyright (C) 2008 Robson Cozendey <robson@cozendey.com>
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 * 
 * One of the objectives of this emulator is to stimulate further research in the
 * OPL3 chip emulation. There was an explicit effort in making no optimizations, 
 * and making the code as legible as possible, so that a new programmer 
 * interested in modify and improve upon it could do so more easily. 
 * This emulator's main body of information was taken from reverse engineering of 
 * the OPL3 chip, from the YMF262 Datasheet and from the OPL3 section in the 
 * YMF278b Application's Manual,
 * together with the vibrato table information, eighth waveform parameter 
 * information and feedback averaging information provided in MAME's YMF262 and	
 * YM3812 emulators, by Jarek Burczynski and Tatsuyuki Satoh.
 * This emulator has a high degree of accuracy, and most of music files sound 
 * almost identical, exception made in some games which uses specific parts of 
 * the rhythm section. In this respect, some parts of the rhythm mode are still 
 * only an approximation of the real chip.
 * The other thing to note is that this emulator was done through recordings of 
 * the SB16 DAC, so it has not bitwise precision. Additional equipment should be 
 * used to verify the samples directly from the chip, and allow this exact 
 * per-sample correspondence. As a good side-effect, since this emulator uses 
 * floating point and has a more fine-grained envelope generator, it can produce 
 * sometimes a crystal-clear, denser kind of OPL3 sound that, because of that, 
 * may be useful for creating new music. 
 * 
 * Version 1.0.6
 * 
 */

package com.cozendey.opl3;

public final class OPL3 {
    static int registers[] = new int[0x200];
    
    static Operator[][] operators;
    static Channel2op[][] channels2op;
    static Channel4op[][] channels4op;
    static Channel[][] channels; 
    static DisabledChannel disabledChannel;
    
    static BassDrumChannel bassDrumChannel;
    static HighHatSnareDrumChannel highHatSnareDrumChannel;
    static TomTomTopCymbalChannel tomTomTopCymbalChannel;
    static HighHatOperator highHatOperator;
    static SnareDrumOperator snareDrumOperator;
    static TomTomOperator tomTomOperator;
    static TopCymbalOperator topCymbalOperator;
    static Operator highHatOperatorInNonRhythmMode;
    static Operator snareDrumOperatorInNonRhythmMode;
    static Operator tomTomOperatorInNonRhythmMode;
    static Operator topCymbalOperatorInNonRhythmMode;
            
    static int nts, dam, dvb, ryt, bd, sd, tom, tc, hh, _new, connectionsel;
    static int vibratoIndex, tremoloIndex;
    
    // The methods read() and write() are the only 
    // ones needed by the user to interface with the emulator.
    // read() returns one frame at a time, to be played at 49700 Hz, 
    // with each frame being four 16-bit samples,
    // corresponding to the OPL3 four output channels CHA...CHD.
    public short[] read() {
        short[] output = new short[4];
        double[] outputBuffer = new double[4];
        double[] channelOutput;

        for(int outputChannelNumber=0; outputChannelNumber<4; outputChannelNumber++) 
            outputBuffer[outputChannelNumber] = 0;

        // If _new = 0, use OPL2 mode with 9 channels. If _new = 1, use OPL3 18 channels;
        for(int array=0; array < (_new + 1); array++)
        for(int channelNumber=0; channelNumber < 9; channelNumber++) {
            // Reads output from each OPL3 channel, and accumulates it in the output buffer:
            channelOutput = channels[array][channelNumber].getChannelOutput();
            for(int outputChannelNumber=0; outputChannelNumber<4; outputChannelNumber++)
                outputBuffer[outputChannelNumber] += channelOutput[outputChannelNumber];
        }
        
        // Normalizes the output buffer after all channels have been added,
        // with a maximum of 18 channels,
        // and multiplies it to get the 16 bit signed output.
        for(int outputChannelNumber=0; outputChannelNumber<4; outputChannelNumber++)
            output[outputChannelNumber] = 
                (short)(outputBuffer[outputChannelNumber] / 18 * 0x7FFF);

        // Advances the OPL3-wide vibrato index, which is used by 
        // PhaseGenerator.getPhase() in each Operator.
        vibratoIndex++;
        if(vibratoIndex >= OPL3Data.vibratoTable[dvb].length) vibratoIndex = 0;
        // Advances the OPL3-wide tremolo index, which is used by 
        // EnvelopeGenerator.getEnvelope() in each Operator.
        tremoloIndex++;
        if(tremoloIndex >= OPL3Data.tremoloTable[dam].length) tremoloIndex = 0;         
        
        return output;
    }
    
    public void write(int array, int address, int data) {
        // The OPL3 has two registers arrays, each with adresses ranging
        // from 0x00 to 0xF5.
        // This emulator uses one array, with the two original register arrays
        // starting at 0x00 and at 0x100.
        int registerAddress = (array<<8) | address;        
        // If the address is out of the OPL3 memory map, returns.
        if(registerAddress<0 || registerAddress>=0x200) return;

        registers[registerAddress] = data;
        switch(address&0xE0) {
            // The first 3 bits masking gives the type of the register by using its base address:
            // 0x00, 0x20, 0x40, 0x60, 0x80, 0xA0, 0xC0, 0xE0 
            // When it is needed, we further separate the register type inside each base address,
            // which is the case of 0x00 and 0xA0.
            
            // Through out this emulator we will use the same name convention to
            // reference a byte with several bit registers.
            // The name of each bit register will be followed by the number of bits
            // it occupies inside the byte. 
            // Numbers without accompanying names are unused bits.
            case 0x00:
                // Unique registers for the entire OPL3:                
               if(array==1) {
                    if(address==0x04) 
                        update_2_CONNECTIONSEL6();
                    else if(address==0x05) 
                        update_7_NEW1();
                }
                else if(address==0x08) update_1_NTS1_6();
                break;
                
            case 0xA0:
                // 0xBD is a control register for the entire OPL3:
                if(address==0xBD) {
                    if(array==0) 
                        update_DAM1_DVB1_RYT1_BD1_SD1_TOM1_TC1_HH1();
                    break;
                }
                // Registers for each channel are in A0-A8, B0-B8, C0-C8, in both register arrays.
                // 0xB0...0xB8 keeps kon,block,fnum(h) for each channel.
                if( (address&0xF0) == 0xB0 && address <= 0xB8) {
                    // If the address is in the second register array, adds 9 to the channel number.
                    // The channel number is given by the last four bits, like in A0,...,A8.
                    channels[array][address&0x0F].update_2_KON1_BLOCK3_FNUMH2();
                    break;                    
                }
                // 0xA0...0xA8 keeps fnum(l) for each channel.
                if( (address&0xF0) == 0xA0 && address <= 0xA8)
                    channels[array][address&0x0F].update_FNUML8();
                break;                    
            // 0xC0...0xC8 keeps cha,chb,chc,chd,fb,cnt for each channel:
            case 0xC0:
                if(address <= 0xC8)
                    channels[array][address&0x0F].update_CHD1_CHC1_CHB1_CHA1_FB3_CNT1();
                break;
                
            // Registers for each of the 36 Operators:
            default:
                int operatorOffset = address&0x1F;
                if(operators[array][operatorOffset] == null) break;
                switch(address&0xE0) {
                    // 0x20...0x35 keeps am,vib,egt,ksr,mult for each operator:                
                    case 0x20:
                        operators[array][operatorOffset].update_AM1_VIB1_EGT1_KSR1_MULT4();
                        break;
                    // 0x40...0x55 keeps ksl,tl for each operator: 
                    case 0x40:
                        operators[array][operatorOffset].update_KSL2_TL6();
                        break;
                    // 0x60...0x75 keeps ar,dr for each operator: 
                    case 0x60:
                        operators[array][operatorOffset].update_AR4_DR4();
                        break;
                    // 0x80...0x95 keeps sl,rr for each operator:
                    case 0x80:
                        operators[array][operatorOffset].update_SL4_RR4();
                        break;
                    // 0xE0...0xF5 keeps ws for each operator:
                    case 0xE0:     
                        operators[array][operatorOffset].update_5_WS3();
                }
        }
    }

    public OPL3() {        
        nts = dam = dvb = ryt = bd = sd = tom = tc = hh = _new = connectionsel = 0;        
        vibratoIndex = tremoloIndex = 0; 
        channels = new Channel[2][9];

        initOperators();
        initChannels2op();
        initChannels4op();
        initRhythmChannels();
        initChannels();
    }
    
    private void initOperators() {
        int baseAddress;
        // The YMF262 has 36 operators:
        operators = new Operator[2][0x20];
        for(int array=0; array<2; array++)
            for(int group = 0; group<=0x10; group+=8)
                for(int offset=0; offset<6; offset++) {
                    baseAddress = (array<<8) | (group+offset);
                    operators[array][group+offset] = new Operator(baseAddress);
                }
        
        // Create specific operators to switch when in rhythm mode:
        highHatOperator = new HighHatOperator();
        snareDrumOperator = new SnareDrumOperator();
        tomTomOperator = new TomTomOperator();
        topCymbalOperator = new TopCymbalOperator();
    
        // Save operators when they are in non-rhythm mode:
        // Channel 7:
        highHatOperatorInNonRhythmMode = operators[0][0x11];
        snareDrumOperatorInNonRhythmMode = operators[0][0x14];
        // Channel 8:
        tomTomOperatorInNonRhythmMode = operators[0][0x12];
        topCymbalOperatorInNonRhythmMode = operators[0][0x15];
        
    }
    
    private void initChannels2op() {
        // The YMF262 has 18 2-op channels.
        // Each 2-op channel can be at a serial or parallel operator configuration:
        channels2op = new Channel2op[2][9];
        
        for(int array=0; array<2; array++)
            for(int channelNumber=0; channelNumber<3; channelNumber++) {
                int baseAddress = (array<<8) | channelNumber;
                // Channels 1, 2, 3 -> Operator offsets 0x0,0x3; 0x1,0x4; 0x2,0x5
                channels2op[array][channelNumber]   = new Channel2op(baseAddress, operators[array][channelNumber], operators[array][channelNumber+0x3]);
                // Channels 4, 5, 6 -> Operator offsets 0x8,0xB; 0x9,0xC; 0xA,0xD
                channels2op[array][channelNumber+3] = new Channel2op(baseAddress+3, operators[array][channelNumber+0x8], operators[array][channelNumber+0xB]);
                // Channels 7, 8, 9 -> Operators 0x10,0x13; 0x11,0x14; 0x12,0x15
                channels2op[array][channelNumber+6] = new Channel2op(baseAddress+6, operators[array][channelNumber+0x10], operators[array][channelNumber+0x13]);
            }   
    }
    
    private void initChannels4op() {
        // The YMF262 has 3 4-op channels in each array:
        channels4op = new Channel4op[2][3];
        for(int array=0; array<2; array++)
            for(int channelNumber=0; channelNumber<3; channelNumber++) {
                int baseAddress = (array<<8) | channelNumber;
                // Channels 1, 2, 3 -> Operators 0x0,0x3,0x8,0xB; 0x1,0x4,0x9,0xC; 0x2,0x5,0xA,0xD;
                channels4op[array][channelNumber]   = new Channel4op(baseAddress, operators[array][channelNumber], operators[array][channelNumber+0x3], operators[array][channelNumber+0x8], operators[array][channelNumber+0xB]);
            }   
    }

    private void initRhythmChannels() {
        bassDrumChannel = new BassDrumChannel();
        highHatSnareDrumChannel = new HighHatSnareDrumChannel();
        tomTomTopCymbalChannel = new TomTomTopCymbalChannel();
    }
    
    private void initChannels() {
        // Channel is an abstract class that can be a 2-op, 4-op, rhythm or disabled channel, 
        // depending on the OPL3 configuration at the time.
        // channels[] inits as a 2-op serial channel array:
        for(int array=0; array<2; array++)
            for(int i=0; i<9; i++) channels[array][i] = channels2op[array][i];
        
        // Unique instance to fill future gaps in the Channel array,
        // when there will be switches between 2op and 4op mode.
        disabledChannel = new DisabledChannel();
    }

    private void update_1_NTS1_6() {
        int _1_nts1_6 = OPL3.registers[OPL3Data._1_NTS1_6_Offset];
        // Note Selection. This register is used in Channel.updateOperators() implementations,
        // to calculate the channel´s Key Scale Number.
        // The value of the actual envelope rate follows the value of
        // OPL3.nts,Operator.keyScaleNumber and Operator.ksr
        nts = (_1_nts1_6 & 0x40) >> 6;
    }
    
    private void update_DAM1_DVB1_RYT1_BD1_SD1_TOM1_TC1_HH1() {
        int dam1_dvb1_ryt1_bd1_sd1_tom1_tc1_hh1 = OPL3.registers[OPL3Data.DAM1_DVB1_RYT1_BD1_SD1_TOM1_TC1_HH1_Offset];
        // Depth of amplitude. This register is used in EnvelopeGenerator.getEnvelope();
        dam = (dam1_dvb1_ryt1_bd1_sd1_tom1_tc1_hh1 & 0x80) >> 7;
        
        // Depth of vibrato. This register is used in PhaseGenerator.getPhase();
        dvb = (dam1_dvb1_ryt1_bd1_sd1_tom1_tc1_hh1 & 0x40) >> 6;
        
        int new_ryt = (dam1_dvb1_ryt1_bd1_sd1_tom1_tc1_hh1 & 0x20) >> 5;
        if(new_ryt != ryt) {
            ryt = new_ryt;
            setRhythmMode();               
        }
        
        int new_bd  = (dam1_dvb1_ryt1_bd1_sd1_tom1_tc1_hh1 & 0x10) >> 4;
        if(new_bd != bd) {
            bd = new_bd;
            if(bd==1) {
                bassDrumChannel.op1.keyOn();
                bassDrumChannel.op2.keyOn();
            }
        }
        
        int new_sd  = (dam1_dvb1_ryt1_bd1_sd1_tom1_tc1_hh1 & 0x08) >> 3;
        if(new_sd != sd) {
            sd = new_sd;
            if(sd==1) snareDrumOperator.keyOn();
        }
        
        int new_tom = (dam1_dvb1_ryt1_bd1_sd1_tom1_tc1_hh1 & 0x04) >> 2;
        if(new_tom != tom) {
            tom = new_tom;
            if(tom==1) tomTomOperator.keyOn();
        }
        
        int new_tc  = (dam1_dvb1_ryt1_bd1_sd1_tom1_tc1_hh1 & 0x02) >> 1;
        if(new_tc != tc) {
            tc = new_tc;
            if(tc==1) topCymbalOperator.keyOn();
        }
        
        int new_hh  = dam1_dvb1_ryt1_bd1_sd1_tom1_tc1_hh1 & 0x01;
        if(new_hh != hh) {
            hh = new_hh;
            if(hh==1) highHatOperator.keyOn();
        }
        
    }

    private void update_7_NEW1() {
        int _7_new1 = OPL3.registers[OPL3Data._7_NEW1_Offset];
        // OPL2/OPL3 mode selection. This register is used in 
        // OPL3.read(), OPL3.write() and Operator.getOperatorOutput();
        _new = (_7_new1 & 0x01);
        if(_new==1) setEnabledChannels();
        set4opConnections();                    
    }

    private void setEnabledChannels() {
        for(int array=0; array<2; array++)
            for(int i=0; i<9; i++) {
                int baseAddress = channels[array][i].channelBaseAddress;
                registers[baseAddress+ChannelData.CHD1_CHC1_CHB1_CHA1_FB3_CNT1_Offset] |= 0xF0;
                channels[array][i].update_CHD1_CHC1_CHB1_CHA1_FB3_CNT1();
            }        
    }
    
    private void update_2_CONNECTIONSEL6() {
        // This method is called only if _new is set.
        int _2_connectionsel6 = OPL3.registers[OPL3Data._2_CONNECTIONSEL6_Offset];
        // 2-op/4-op channel selection. This register is used here to configure the OPL3.channels[] array.
        connectionsel = (_2_connectionsel6 & 0x3F);
        set4opConnections();
    }
    
    private void set4opConnections() {
        
        // bits 0, 1, 2 sets respectively 2-op channels (1,4), (2,5), (3,6) to 4-op operation.
        // bits 3, 4, 5 sets respectively 2-op channels (10,13), (11,14), (12,15) to 4-op operation.
        for(int array=0; array<2; array++)
            for(int i=0; i<3; i++) {
                if(_new == 1) {
                    int shift = array*3 + i;
                    int connectionBit = (connectionsel >> shift) & 0x01;
                    if(connectionBit == 1) {
                        channels[array][i] = channels4op[array][i];
                        channels[array][i+3] = disabledChannel;
                        channels[array][i].updateChannel();
                        continue;    
                    }
                }
                channels[array][i] = channels2op[array][i];
                channels[array][i+3] = channels2op[array][i+3];
                channels[array][i].updateChannel();
                channels[array][i+3].updateChannel();
            }
    } 
    
    private void setRhythmMode() {
            if(ryt==1) {
                channels[0][6] = bassDrumChannel;
                channels[0][7] = highHatSnareDrumChannel;
                channels[0][8] = tomTomTopCymbalChannel;
                operators[0][0x11] = highHatOperator;
                operators[0][0x14] = snareDrumOperator;
                operators[0][0x12] = tomTomOperator;
                operators[0][0x15] = topCymbalOperator;
            }
            else {
                for(int i=6; i<=8; i++) channels[0][i] = channels2op[0][i];
                operators[0][0x11] = highHatOperatorInNonRhythmMode;
                operators[0][0x14] = snareDrumOperatorInNonRhythmMode;
                operators[0][0x12] = tomTomOperatorInNonRhythmMode;
                operators[0][0x15] = topCymbalOperatorInNonRhythmMode;                
            }
            for(int i=6; i<=8; i++) channels[0][i].updateChannel();
    }
}


//
// Channels
//


abstract class Channel {
    int channelBaseAddress;
    
    double[] feedback;
    
    int fnuml, fnumh, kon, block, cha, chb, chc, chd, fb, cnt;     

    // Factor to convert between normalized amplitude to normalized
    // radians. The amplitude maximum is equivalent to 8*Pi radians.
    final static double toPhase = 4; 
    
    Channel (int baseAddress) {
        channelBaseAddress = baseAddress;
        fnuml = fnumh = kon = block = cha = chb = chc = chd = fb = cnt = 0;
        feedback = new double[2];
        feedback[0] = feedback[1] = 0;
    }
    
    void update_2_KON1_BLOCK3_FNUMH2() {
        
        int _2_kon1_block3_fnumh2 = OPL3.registers[channelBaseAddress+ChannelData._2_KON1_BLOCK3_FNUMH2_Offset];
        
        // Frequency Number (hi-register) and Block. These two registers, together with fnuml, 
        // sets the Channel´s base frequency;
        block = (_2_kon1_block3_fnumh2 & 0x1C) >> 2;
        fnumh = _2_kon1_block3_fnumh2 & 0x03;        
        updateOperators();
        
        // Key On. If changed, calls Channel.keyOn() / keyOff().
        int newKon   = (_2_kon1_block3_fnumh2 & 0x20) >> 5;
        if(newKon != kon) {
            if(newKon == 1) keyOn();
            else keyOff();
            kon = newKon;
        }
    }
    
    void update_FNUML8() {
        int fnuml8 = OPL3.registers[channelBaseAddress+ChannelData.FNUML8_Offset];
        // Frequency Number, low register.
        fnuml = fnuml8&0xFF;        
        updateOperators();
    }

    void update_CHD1_CHC1_CHB1_CHA1_FB3_CNT1() {
        int chd1_chc1_chb1_cha1_fb3_cnt1 = OPL3.registers[channelBaseAddress+ChannelData.CHD1_CHC1_CHB1_CHA1_FB3_CNT1_Offset];
        chd   = (chd1_chc1_chb1_cha1_fb3_cnt1 & 0x80) >> 7;
        chc   = (chd1_chc1_chb1_cha1_fb3_cnt1 & 0x40) >> 6;
        chb   = (chd1_chc1_chb1_cha1_fb3_cnt1 & 0x20) >> 5;
        cha   = (chd1_chc1_chb1_cha1_fb3_cnt1 & 0x10) >> 4;
        fb    = (chd1_chc1_chb1_cha1_fb3_cnt1 & 0x0E) >> 1;
        cnt   = chd1_chc1_chb1_cha1_fb3_cnt1 & 0x01;
        updateOperators();
    }
    
    void updateChannel() {
        update_2_KON1_BLOCK3_FNUMH2();
        update_FNUML8();
        update_CHD1_CHC1_CHB1_CHA1_FB3_CNT1();
    }
    
    protected double[] getInFourChannels(double channelOutput) {
        double[] output = new double[4];
        
        if( OPL3._new==0) 
            output[0] = output[1] = output[2] = output[3] = channelOutput;    
        else {
            output[0] = (cha==1) ? channelOutput : 0;
            output[1] = (chb==1) ? channelOutput : 0;
            output[2] = (chc==1) ? channelOutput : 0;
            output[3] = (chd==1) ? channelOutput : 0;
        }
        
        return output;        
    }

    abstract double[] getChannelOutput();
    protected abstract void keyOn();
    protected abstract void keyOff();
    protected abstract void updateOperators();
}


class Channel2op extends Channel {
    Operator op1, op2;
    
    Channel2op (int baseAddress, Operator o1, Operator o2) {
        super(baseAddress);
        op1 = o1;
        op2 = o2;
    }

    double[] getChannelOutput() {
        double channelOutput = 0, op1Output = 0, op2Output = 0;
        double[] output; 
        // The feedback uses the last two outputs from
        // the first operator, instead of just the last one. 
        double feedbackOutput = (feedback[0] + feedback[1]) / 2;

        
        switch(cnt) {
            // CNT = 0, the operators are in series, with the first in feedback.
            case 0:
                if(op2.envelopeGenerator.stage==EnvelopeGenerator.Stage.OFF) 
                    return getInFourChannels(0);
                op1Output = op1.getOperatorOutput(feedbackOutput);
                channelOutput = op2.getOperatorOutput(op1Output*toPhase);
                break;
            // CNT = 1, the operators are in parallel, with the first in feedback.    
            case 1:
                if(op1.envelopeGenerator.stage==EnvelopeGenerator.Stage.OFF && 
                    op2.envelopeGenerator.stage==EnvelopeGenerator.Stage.OFF) 
                        return getInFourChannels(0);                
                op1Output = op1.getOperatorOutput(feedbackOutput);
                op2Output = op2.getOperatorOutput(Operator.noModulator);
                channelOutput = (op1Output + op2Output) / 2;
        }
        
        feedback[0] = feedback[1];
        feedback[1] = (op1Output * ChannelData.feedback[fb])%1;        
        output = getInFourChannels(channelOutput);
        return output;
    }
    
    protected void keyOn() {        
        op1.keyOn();
        op2.keyOn();
        feedback[0] = feedback[1] = 0;        
    }
    
    protected void keyOff() {
        op1.keyOff();
        op2.keyOff();
    }
    
    protected void updateOperators() {
        // Key Scale Number, used in EnvelopeGenerator.setActualRates().
        int keyScaleNumber = block*2 + ((fnumh>>OPL3.nts)&0x01);
        int f_number = (fnumh<<8) | fnuml;           
        op1.updateOperator(keyScaleNumber, f_number, block);        
        op2.updateOperator(keyScaleNumber, f_number, block);        
    }
    
    @Override
    public String toString() {
        StringBuffer str = new StringBuffer();
        
        int f_number = (fnumh<<8)+fnuml;

        str.append(String.format("channelBaseAddress: %d\n", channelBaseAddress));
        str.append(String.format("f_number: %d, block: %d\n", f_number, block));
        str.append(String.format("cnt: %d, feedback: %d\n", cnt, fb));
        str.append(String.format("op1:\n%s", op1.toString()));
        str.append(String.format("op2:\n%s", op2.toString()));
        
        return str.toString();
    }
}


class Channel4op extends Channel {
    Operator op1, op2, op3, op4;
    
    Channel4op (int baseAddress, Operator o1, Operator o2, Operator o3, Operator o4) {
        super(baseAddress);
        op1 = o1;
        op2 = o2;
        op3 = o3;
        op4 = o4;
    }

    double[] getChannelOutput() {
        double channelOutput = 0, 
               op1Output = 0, op2Output = 0, op3Output = 0, op4Output = 0;
        
        double[] output; 
        
        int secondChannelBaseAddress = channelBaseAddress+3;
        int secondCnt = OPL3.registers[secondChannelBaseAddress+ChannelData.CHD1_CHC1_CHB1_CHA1_FB3_CNT1_Offset] & 0x1;
        int cnt4op = (cnt << 1) | secondCnt;
        
        double feedbackOutput = (feedback[0] + feedback[1]) / 2;
        
        switch(cnt4op) {
            case 0:
                if(op4.envelopeGenerator.stage==EnvelopeGenerator.Stage.OFF) 
                    return getInFourChannels(0);                
                
                op1Output = op1.getOperatorOutput(feedbackOutput);
                op2Output = op2.getOperatorOutput(op1Output*toPhase);
                op3Output = op3.getOperatorOutput(op2Output*toPhase);
                channelOutput = op4.getOperatorOutput(op3Output*toPhase);
                
                break;
            case 1:
                if(op2.envelopeGenerator.stage==EnvelopeGenerator.Stage.OFF && 
                    op4.envelopeGenerator.stage==EnvelopeGenerator.Stage.OFF) 
                       return getInFourChannels(0);                
                
                op1Output = op1.getOperatorOutput(feedbackOutput);
                op2Output = op2.getOperatorOutput(op1Output*toPhase);
                
                op3Output = op3.getOperatorOutput(Operator.noModulator);
                op4Output = op4.getOperatorOutput(op3Output*toPhase);

                channelOutput = (op2Output + op4Output) / 2;
                break;
            case 2:
                if(op1.envelopeGenerator.stage==EnvelopeGenerator.Stage.OFF && 
                    op4.envelopeGenerator.stage==EnvelopeGenerator.Stage.OFF) 
                       return getInFourChannels(0);                
                
                op1Output = op1.getOperatorOutput(feedbackOutput);
                
                op2Output = op2.getOperatorOutput(Operator.noModulator);
                op3Output = op3.getOperatorOutput(op2Output*toPhase);
                op4Output = op4.getOperatorOutput(op3Output*toPhase);

                channelOutput = (op1Output + op4Output) / 2;
                break;
            case 3:
                if(op1.envelopeGenerator.stage==EnvelopeGenerator.Stage.OFF && 
                    op3.envelopeGenerator.stage==EnvelopeGenerator.Stage.OFF && 
                    op4.envelopeGenerator.stage==EnvelopeGenerator.Stage.OFF) 
                       return getInFourChannels(0);                
                
                op1Output = op1.getOperatorOutput(feedbackOutput);
                
                op2Output = op2.getOperatorOutput(Operator.noModulator);
                op3Output = op3.getOperatorOutput(op2Output*toPhase);
                
                op4Output = op4.getOperatorOutput(Operator.noModulator);

                channelOutput = (op1Output + op3Output + op4Output) / 3;
        }
        
        feedback[0] = feedback[1];
        feedback[1] = (op1Output * ChannelData.feedback[fb])%1;
        
        output = getInFourChannels(channelOutput);
        return output;
    }

    protected void keyOn() {
        op1.keyOn();
        op2.keyOn();
        op3.keyOn();
        op4.keyOn();
        feedback[0] = feedback[1] = 0;           
    }
    
    protected void keyOff() {
        op1.keyOff();
        op2.keyOff();
        op3.keyOff();
        op4.keyOff();
    }
    
    protected void updateOperators() {
        // Key Scale Number, used in EnvelopeGenerator.setActualRates().
        int keyScaleNumber = block*2 + ((fnumh>>OPL3.nts)&0x01);
        int f_number = (fnumh<<8) | fnuml;        
        op1.updateOperator(keyScaleNumber, f_number, block);        
        op2.updateOperator(keyScaleNumber, f_number, block);        
        op3.updateOperator(keyScaleNumber, f_number, block);        
        op4.updateOperator(keyScaleNumber, f_number, block);        
    }
    
    @Override
    public String toString() {
        StringBuffer str = new StringBuffer();
        
        int f_number = (fnumh<<8)+fnuml;

        str.append(String.format("channelBaseAddress: %d\n", channelBaseAddress));
        str.append(String.format("f_number: %d, block: %d\n", f_number, block));
        str.append(String.format("cnt: %d, feedback: %d\n", cnt, fb));
        str.append(String.format("op1:\n%s", op1.toString()));
        str.append(String.format("op2:\n%s", op2.toString()));
        str.append(String.format("op3:\n%s", op3.toString()));
        str.append(String.format("op4:\n%s", op4.toString()));
        
        return str.toString();
    }    
}

// There's just one instance of this class, that fills the eventual gaps in the Channel array;
class DisabledChannel extends Channel {
    DisabledChannel() {
        super(0);
    }
    double[] getChannelOutput() { return getInFourChannels(0); }    
    protected void keyOn() { }
    protected void keyOff() { }
    protected void updateOperators() { }    
}


//
// Operators
//


class Operator {
    PhaseGenerator phaseGenerator;
    EnvelopeGenerator envelopeGenerator;
    
    double envelope, phase;
    
    int operatorBaseAddress;
    int am, vib, ksr, egt, mult, ksl, tl, ar, dr, sl, rr, ws; 
    int keyScaleNumber, f_number, block;
    
    final static double noModulator = 0;
    
    Operator(int baseAddress) {
        operatorBaseAddress = baseAddress;
        phaseGenerator = new PhaseGenerator();
        envelopeGenerator = new EnvelopeGenerator();

        envelope = 0;
        am = vib = ksr = egt = mult = ksl = tl = ar = dr = sl = rr = ws = 0;
        keyScaleNumber = f_number = block = 0;
    }
    
    void update_AM1_VIB1_EGT1_KSR1_MULT4() {
        
        int am1_vib1_egt1_ksr1_mult4 = OPL3.registers[operatorBaseAddress+OperatorData.AM1_VIB1_EGT1_KSR1_MULT4_Offset];
        
        // Amplitude Modulation. This register is used int EnvelopeGenerator.getEnvelope();
        am  = (am1_vib1_egt1_ksr1_mult4 & 0x80) >> 7;
        // Vibrato. This register is used in PhaseGenerator.getPhase();
        vib = (am1_vib1_egt1_ksr1_mult4 & 0x40) >> 6;
        // Envelope Generator Type. This register is used in EnvelopeGenerator.getEnvelope();
        egt = (am1_vib1_egt1_ksr1_mult4 & 0x20) >> 5;
        // Key Scale Rate. Sets the actual envelope rate together with rate and keyScaleNumber.
        // This register os used in EnvelopeGenerator.setActualAttackRate().
        ksr = (am1_vib1_egt1_ksr1_mult4 & 0x10) >> 4;
        // Multiple. Multiplies the Channel.baseFrequency to get the Operator.operatorFrequency.
        // This register is used in PhaseGenerator.setFrequency().
        mult = am1_vib1_egt1_ksr1_mult4 & 0x0F;
        
        phaseGenerator.setFrequency(f_number, block, mult);
        envelopeGenerator.setActualAttackRate(ar, ksr, keyScaleNumber);        
        envelopeGenerator.setActualDecayRate(dr, ksr, keyScaleNumber); 
        envelopeGenerator.setActualReleaseRate(rr, ksr, keyScaleNumber);        
    }
    
    void update_KSL2_TL6() {
        
        int ksl2_tl6 = OPL3.registers[operatorBaseAddress+OperatorData.KSL2_TL6_Offset];
        
        // Key Scale Level. Sets the attenuation in accordance with the octave.
        ksl = (ksl2_tl6 & 0xC0) >> 6;
        // Total Level. Sets the overall damping for the envelope.
        tl  =  ksl2_tl6 & 0x3F;
        
        envelopeGenerator.setAtennuation(f_number, block, ksl);
        envelopeGenerator.setTotalLevel(tl);
    }
    
    void update_AR4_DR4() {
        
        int ar4_dr4 = OPL3.registers[operatorBaseAddress+OperatorData.AR4_DR4_Offset];
        
        // Attack Rate.
        ar = (ar4_dr4 & 0xF0) >> 4;
        // Decay Rate.
        dr =  ar4_dr4 & 0x0F;

        envelopeGenerator.setActualAttackRate(ar, ksr, keyScaleNumber);        
        envelopeGenerator.setActualDecayRate(dr, ksr, keyScaleNumber); 
    }
    
    void update_SL4_RR4() {     
        
        int sl4_rr4 = OPL3.registers[operatorBaseAddress+OperatorData.SL4_RR4_Offset];
        
        // Sustain Level.
        sl = (sl4_rr4 & 0xF0) >> 4;
        // Release Rate.
        rr =  sl4_rr4 & 0x0F;
        
        envelopeGenerator.setActualSustainLevel(sl);        
        envelopeGenerator.setActualReleaseRate(rr, ksr, keyScaleNumber);        
    }
    
    void update_5_WS3() {     
        int _5_ws3 = OPL3.registers[operatorBaseAddress+OperatorData._5_WS3_Offset];
        ws =  _5_ws3 & 0x07;
    }
    
    double getOperatorOutput(double modulator) {
        if(envelopeGenerator.stage == EnvelopeGenerator.Stage.OFF) return 0;
        
        double envelopeInDB = envelopeGenerator.getEnvelope(egt, am);
        envelope = Math.pow(10, envelopeInDB/10.0);
        
        // If it is in OPL2 mode, use first four waveforms only:
        ws &= ((OPL3._new<<2) + 3); 
        double[] waveform = OperatorData.waveforms[ws];
        
        phase = phaseGenerator.getPhase(vib);
        
        double operatorOutput = getOutput(modulator, phase, waveform);
        return operatorOutput;
    }
    
    protected double getOutput(double modulator, double outputPhase, double[] waveform) {
        outputPhase = (outputPhase + modulator) % 1;
        if(outputPhase<0) {
            outputPhase++;
            // If the double could not afford to be less than 1:
            outputPhase %= 1;
        }
        int sampleIndex = (int) (outputPhase * OperatorData.waveLength);
        return waveform[sampleIndex] * envelope;
    }    

    protected void keyOn() {
        if(ar > 0) {
            envelopeGenerator.keyOn();
            phaseGenerator.keyOn();
        }
        else envelopeGenerator.stage = EnvelopeGenerator.Stage.OFF;
    }
    
    protected void keyOff() {
        envelopeGenerator.keyOff();
    }
 
    protected void updateOperator(int ksn, int f_num, int blk) {
        keyScaleNumber = ksn;
        f_number = f_num;
        block = blk;
        update_AM1_VIB1_EGT1_KSR1_MULT4();
        update_KSL2_TL6();
        update_AR4_DR4();
        update_SL4_RR4();     
        update_5_WS3();    
    }
    
    @Override
    public String toString() {
        StringBuffer str = new StringBuffer();
        
        double operatorFrequency = f_number * Math.pow(2, block-1) * OPL3Data.sampleRate / Math.pow(2,19)*OperatorData.multTable[mult];

        str.append(String.format("operatorBaseAddress: %d\n", operatorBaseAddress));
        str.append(String.format("operatorFrequency: %f\n", operatorFrequency));        
        str.append(String.format("mult: %d, ar: %d, dr: %d, sl: %d, rr: %d, ws: %d\n", mult, ar, dr, sl, rr, ws));
        str.append(String.format("am: %d, vib: %d, ksr: %d, egt: %d, ksl: %d, tl: %d\n", am, vib, ksr, egt, ksl, tl));
                
        return str.toString();
    }    
    
}


//
// Envelope Generator
//


class EnvelopeGenerator {
    final static double[] INFINITY = null;    
    enum Stage {ATTACK,DECAY,SUSTAIN,RELEASE,OFF};
    Stage stage;    
    int actualAttackRate, actualDecayRate, actualReleaseRate;        
    double xAttackIncrement, xMinimumInAttack;             
    double dBdecayIncrement; 
    double dBreleaseIncrement;        
    double attenuation, totalLevel, sustainLevel;    
    double x, envelope;
    
    EnvelopeGenerator() {
        stage = Stage.OFF;
        actualAttackRate = actualDecayRate = actualReleaseRate = 0;        
        xAttackIncrement = xMinimumInAttack = 0;          
        dBdecayIncrement = 0;
        dBreleaseIncrement = 0;     
        attenuation = totalLevel = sustainLevel = 0;
        x = dBtoX(-96);
        envelope = -96;        
    }
    
    void setActualSustainLevel(int sl) {
        // If all SL bits are 1, sustain level is set to -93 dB:
       if(sl == 0x0F) {
           sustainLevel = -93;
           return;
       } 
       // The datasheet states that the SL formula is
       // sustainLevel = -24*d7 -12*d6 -6*d5 -3*d4,
       // translated as:
       sustainLevel = -3*sl;
    }

    void setTotalLevel(int tl) {
       // The datasheet states that the TL formula is
       // TL = -(24*d5 + 12*d4 + 6*d3 + 3*d2 + 1.5*d1 + 0.75*d0),
       // translated as:
       totalLevel = tl*-0.75;
    }
    
    void setAtennuation(int f_number, int block, int ksl) {
        int hi4bits = (f_number>>6)&0x0F;
        switch(ksl) {
            case 0:
                attenuation = 0;
                break;
            case 1:
                // ~3 dB/Octave
                attenuation = OperatorData.ksl3dBtable[hi4bits][block];
                break;
            case 2:
                // ~1.5 dB/Octave
                attenuation = OperatorData.ksl3dBtable[hi4bits][block]/2;
                break;
            case 3:
                // ~6 dB/Octave
                attenuation = OperatorData.ksl3dBtable[hi4bits][block]*2;
        }
    }

    void setActualAttackRate(int attackRate, int ksr, int keyScaleNumber) {
        // According to the YMF278B manual's OPL3 section, the attack curve is exponential,
        // with a dynamic range from -96 dB to 0 dB and a resolution of 0.1875 dB 
        // per level.
        //
        // This method sets an attack increment and attack minimum value 
        // that creates a exponential dB curve with 'period0to100' seconds in length
        // and 'period10to90' seconds between 10% and 90% of the curve total level.
        actualAttackRate = calculateActualRate(attackRate, ksr, keyScaleNumber);
        double period0to100inSeconds = EnvelopeGeneratorData.attackTimeValuesTable[actualAttackRate][0]/1000d;
        int period0to100inSamples = (int)(period0to100inSeconds*OPL3Data.sampleRate);       
        double period10to90inSeconds = EnvelopeGeneratorData.attackTimeValuesTable[actualAttackRate][1]/1000d;
        int period10to90inSamples = (int)(period10to90inSeconds*OPL3Data.sampleRate);
        // The x increment is dictated by the period between 10% and 90%:
        xAttackIncrement = OPL3Data.calculateIncrement(percentageToX(0.1), percentageToX(0.9), period10to90inSeconds);
        // Discover how many samples are still from the top.
        // It cannot reach 0 dB, since x is a logarithmic parameter and would be
        // negative infinity. So we will use -0.1875 dB as the resolution
        // maximum.
        //
        // percentageToX(0.9) + samplesToTheTop*xAttackIncrement = dBToX(-0.1875); ->
        // samplesToTheTop = (dBtoX(-0.1875) - percentageToX(0.9)) / xAttackIncrement); ->
        // period10to100InSamples = period10to90InSamples + samplesToTheTop; ->
        int period10to100inSamples = (int) (period10to90inSamples + (dBtoX(-0.1875) - percentageToX(0.9)) / xAttackIncrement);
        // Discover the minimum x that, through the attackIncrement value, keeps 
        // the 10%-90% period, and reaches 0 dB at the total period:
        xMinimumInAttack = percentageToX(0.1) - (period0to100inSamples-period10to100inSamples)*xAttackIncrement;
    } 
    
    
    void setActualDecayRate(int decayRate, int ksr, int keyScaleNumber) {
        actualDecayRate = calculateActualRate(decayRate, ksr, keyScaleNumber);
        double period10to90inSeconds = EnvelopeGeneratorData.decayAndReleaseTimeValuesTable[actualDecayRate][1]/1000d;
        // Differently from the attack curve, the decay/release curve is linear.        
        // The dB increment is dictated by the period between 10% and 90%:
        dBdecayIncrement = OPL3Data.calculateIncrement(percentageToDB(0.1), percentageToDB(0.9), period10to90inSeconds);
    }
    
    void setActualReleaseRate(int releaseRate, int ksr, int keyScaleNumber) {
        actualReleaseRate =  calculateActualRate(releaseRate, ksr, keyScaleNumber);
        double period10to90inSeconds = EnvelopeGeneratorData.decayAndReleaseTimeValuesTable[actualReleaseRate][1]/1000d;
        dBreleaseIncrement = OPL3Data.calculateIncrement(percentageToDB(0.1), percentageToDB(0.9), period10to90inSeconds);
    } 
    
    private int calculateActualRate(int rate, int ksr, int keyScaleNumber) {
        int rof = EnvelopeGeneratorData.rateOffset[ksr][keyScaleNumber];
        int actualRate = rate*4 + rof;
        // If, as an example at the maximum, rate is 15 and the rate offset is 15, 
        // the value would
        // be 75, but the maximum allowed is 63:
        if(actualRate > 63) actualRate = 63;
        return actualRate;
    }
    
    double getEnvelope(int egt, int am) {
        // The datasheets attenuation values
        // must be halved to match the real OPL3 output.
        double envelopeSustainLevel = sustainLevel / 2;
        double envelopeTremolo = 
                OPL3Data.tremoloTable[OPL3.dam][OPL3.tremoloIndex] / 2;
        double envelopeAttenuation = attenuation / 2;
        double envelopeTotalLevel = totalLevel / 2;
        
        double envelopeMinimum = -96;
        double envelopeResolution = 0.1875;

        double outputEnvelope;
        //
        // Envelope Generation
        //
        switch(stage) {
            case ATTACK:
                // Since the attack is exponential, it will never reach 0 dB, so
                // we´ll work with the next to maximum in the envelope resolution.
                if(envelope<-envelopeResolution && xAttackIncrement != -EnvelopeGeneratorData.INFINITY) {
                    // The attack is exponential.
                    envelope = -Math.pow(2,x);
                    x += xAttackIncrement;
                    break;
                }
                else {
                    // It is needed here to explicitly set envelope = 0, since
                    // only the attack can have a period of
                    // 0 seconds and produce an infinity envelope increment.
                    envelope = 0;
                    stage = Stage.DECAY;
                }
            case DECAY:   
                // The decay and release are linear.                
                if(envelope>envelopeSustainLevel) {
                    envelope -= dBdecayIncrement;
                    break;
                }
                else 
                    stage = Stage.SUSTAIN;
            case SUSTAIN:
                // The Sustain stage is mantained all the time of the Key ON,
                // even if we are in non-sustaining mode.
                // This is necessary because, if the key is still pressed, we can
                // change back and forth the state of EGT, and it will release and
                // hold again accordingly.
                if(egt==1) break;                
                else {
                    if(envelope > envelopeMinimum)
                        envelope -= dBreleaseIncrement;
                    else stage = Stage.OFF;
                }
                break;
            case RELEASE:
                // If we have Key OFF, only here we are in the Release stage.
                // Now, we can turn EGT back and forth and it will have no effect,i.e.,
                // it will release inexorably to the Off stage.
                if(envelope > envelopeMinimum) 
                    envelope -= dBreleaseIncrement;
                else stage = Stage.OFF;
        }
        
        // Ongoing original envelope
        outputEnvelope = envelope;    
        
        //Tremolo
        if(am == 1) outputEnvelope += envelopeTremolo;

        //Attenuation
        outputEnvelope += envelopeAttenuation;

        //Total Level
        outputEnvelope += envelopeTotalLevel;

        return outputEnvelope;
    }

    void keyOn() {
        // If we are taking it in the middle of a previous envelope, 
        // start to rise from the current level:
        // envelope = - (2 ^ x); ->
        // 2 ^ x = -envelope ->
        // x = log2(-envelope); ->
        double xCurrent = OperatorData.log2(-envelope);
        x = xCurrent < xMinimumInAttack ? xCurrent : xMinimumInAttack;
        stage = Stage.ATTACK;
    }
    
    void keyOff() {
        if(stage != Stage.OFF) stage = Stage.RELEASE;
    }
    
    private static double dBtoX(double dB) {
        return OperatorData.log2(-dB);
    }

    private static double percentageToDB(double percentage) {
        return Math.log10(percentage)*10d;
    }    
    
    private static double percentageToX(double percentage) {
        return dBtoX(percentageToDB(percentage));
    }  
    
    @Override
    public String toString() {
        StringBuffer str = new StringBuffer();
        str.append("Envelope Generator: \n");
        double attackPeriodInSeconds = EnvelopeGeneratorData.attackTimeValuesTable[actualAttackRate][0]/1000d;
        str.append(String.format("\tATTACK  %f s, rate %d. \n", attackPeriodInSeconds, actualAttackRate));
        double decayPeriodInSeconds = EnvelopeGeneratorData.decayAndReleaseTimeValuesTable[actualDecayRate][0]/1000d;
        str.append(String.format("\tDECAY   %f s, rate %d. \n",decayPeriodInSeconds, actualDecayRate));
        str.append(String.format("\tSL      %f dB. \n", sustainLevel));
        double releasePeriodInSeconds = EnvelopeGeneratorData.decayAndReleaseTimeValuesTable[actualReleaseRate][0]/1000d;
        str.append(String.format("\tRELEASE %f s, rate %d. \n", releasePeriodInSeconds,actualReleaseRate));
        str.append("\n");
        
        return str.toString();
    }     
}


//
// Phase Generator
//


class PhaseGenerator {
    double phase, phaseIncrement;
    
    PhaseGenerator() {
        phase = phaseIncrement = 0;
    }
    
    void setFrequency(int f_number, int block, int mult) {
        // This frequency formula is derived from the following equation:
        // f_number = baseFrequency * pow(2,19) / sampleRate / pow(2,block-1);        
        double baseFrequency = 
            f_number * Math.pow(2, block-1) * OPL3Data.sampleRate / Math.pow(2,19);
        double operatorFrequency = baseFrequency*OperatorData.multTable[mult];
        
        // phase goes from 0 to 1 at 
        // period = (1/frequency) seconds ->
        // Samples in each period is (1/frequency)*sampleRate =
        // = sampleRate/frequency ->
        // So the increment in each sample, to go from 0 to 1, is:
        // increment = (1-0) / samples in the period -> 
        // increment = 1 / (OPL3Data.sampleRate/operatorFrequency) ->
        phaseIncrement = operatorFrequency/OPL3Data.sampleRate;
    }
    
    double getPhase(int vib) {
        if(vib==1) 
            // phaseIncrement = (operatorFrequency * vibrato) / sampleRate
            phase += phaseIncrement*OPL3Data.vibratoTable[OPL3.dvb][OPL3.vibratoIndex];
        else 
            // phaseIncrement = operatorFrequency / sampleRate
            phase += phaseIncrement;
        phase %= 1;
        return phase;
    }
    
    void keyOn() {
        phase = 0;
    }
    
    @Override    
    public String toString() {
         return String.format("Operator frequency: %f Hz.\n", OPL3Data.sampleRate*phaseIncrement);
    }
}


//
// Rhythm
//

// The getOperatorOutput() method in TopCymbalOperator, HighHatOperator and SnareDrumOperator 
// were made through purely empyrical reverse engineering of the OPL3 output.

abstract class RhythmChannel extends Channel2op {
    
    RhythmChannel(int baseAddress, Operator o1, Operator o2) {
        super(baseAddress, o1, o2);        
    }
    
    @Override
    double[] getChannelOutput() { 
        double channelOutput = 0, op1Output = 0, op2Output = 0;
        double[] output; 
        
        // Note that, different from the common channel,
        // we do not check to see if the Operator's envelopes are Off.
        // Instead, we always do the calculations, 
        // to update the publicly available phase.
        op1Output = op1.getOperatorOutput(Operator.noModulator);
        op2Output = op2.getOperatorOutput(Operator.noModulator);        
        channelOutput = (op1Output + op2Output) / 2;
        
        output = getInFourChannels(channelOutput);        
        return output;
    };
    
    // Rhythm channels are always running, 
    // only the envelope is activated by the user.
    @Override
    protected void keyOn() { };
    @Override
    protected void keyOff() { };    
}

class HighHatSnareDrumChannel extends RhythmChannel {
    final static int highHatSnareDrumChannelBaseAddress = 7;
    
    HighHatSnareDrumChannel() {
        super(highHatSnareDrumChannelBaseAddress,
                                OPL3.highHatOperator, 
                                OPL3.snareDrumOperator);
    }    
}

class TomTomTopCymbalChannel extends RhythmChannel {
    final static int tomTomTopCymbalChannelBaseAddress = 8;    
    
    TomTomTopCymbalChannel() {
        super(tomTomTopCymbalChannelBaseAddress,
                                OPL3.tomTomOperator, 
                                OPL3.topCymbalOperator);
    }
}
 
class TopCymbalOperator extends Operator {
    final static int topCymbalOperatorBaseAddress = 0x15;
    
    TopCymbalOperator(int baseAddress) {
        super(baseAddress);
    }
    
    TopCymbalOperator() {
        this(topCymbalOperatorBaseAddress);
    }
    
    @Override
    double getOperatorOutput(double modulator) {
        double highHatOperatorPhase = 
            OPL3.highHatOperator.phase * OperatorData.multTable[OPL3.highHatOperator.mult];
        // The Top Cymbal operator uses his own phase together with the High Hat phase.
        return getOperatorOutput(modulator, highHatOperatorPhase);
    }

    // This method is used here with the HighHatOperator phase
    // as the externalPhase. 
    // Conversely, this method is also used through inheritance by the HighHatOperator, 
    // now with the TopCymbalOperator phase as the externalPhase.
    protected double getOperatorOutput(double modulator, double externalPhase) {
        double envelopeInDB = envelopeGenerator.getEnvelope(egt, am);
        envelope = Math.pow(10, envelopeInDB/10.0);
        
        phase = phaseGenerator.getPhase(vib);
        
        int waveIndex = ws & ((OPL3._new<<2) + 3); 
        double[] waveform = OperatorData.waveforms[waveIndex];
        
        // Empirically tested multiplied phase for the Top Cymbal:
        double carrierPhase = (8 * phase)%1;
        double modulatorPhase = externalPhase;
        double modulatorOutput = getOutput(Operator.noModulator,modulatorPhase, waveform);
        double carrierOutput = getOutput(modulatorOutput,carrierPhase, waveform);
        
        int cycles = 4; 
        if( (carrierPhase*cycles)%cycles > 0.1) carrierOutput = 0;
        
        return carrierOutput*2;  
    }    
}

class HighHatOperator extends TopCymbalOperator {
    final static int highHatOperatorBaseAddress = 0x11;     
    
    HighHatOperator() {
        super(highHatOperatorBaseAddress);
    }
    
    @Override
    double getOperatorOutput(double modulator) {
        double topCymbalOperatorPhase = 
            OPL3.topCymbalOperator.phase * OperatorData.multTable[OPL3.topCymbalOperator.mult];
        // The sound output from the High Hat resembles the one from
        // Top Cymbal, so we use the parent method and modifies his output
        // accordingly afterwards.
        double operatorOutput = super.getOperatorOutput(modulator, topCymbalOperatorPhase);
        if(operatorOutput == 0) operatorOutput = Math.random()*envelope;
        return operatorOutput;
    }
    
}

class SnareDrumOperator extends Operator {
    final static int snareDrumOperatorBaseAddress = 0x14;
    
    SnareDrumOperator() {
        super(snareDrumOperatorBaseAddress);
    }
    
    @Override
    double getOperatorOutput(double modulator) {
        if(envelopeGenerator.stage == EnvelopeGenerator.Stage.OFF) return 0;
        
        double envelopeInDB = envelopeGenerator.getEnvelope(egt, am);
        envelope = Math.pow(10, envelopeInDB/10.0);
        
        // If it is in OPL2 mode, use first four waveforms only:
        int waveIndex = ws & ((OPL3._new<<2) + 3); 
        double[] waveform = OperatorData.waveforms[waveIndex];
        
        phase = OPL3.highHatOperator.phase * 2;
        
        double operatorOutput = getOutput(modulator, phase, waveform);

        double noise = Math.random() * envelope;        
        
        if(operatorOutput/envelope != 1 && operatorOutput/envelope != -1) {
            if(operatorOutput > 0)  operatorOutput = noise;
            else if(operatorOutput < 0) operatorOutput = -noise;
            else operatorOutput = 0;            
        }
        
        return operatorOutput*2;
    }    
}

class TomTomOperator extends Operator {
    final static int tomTomOperatorBaseAddress = 0x12;    
    TomTomOperator() {
        super(tomTomOperatorBaseAddress);
    }
}

class BassDrumChannel extends Channel2op {
    final static int bassDrumChannelBaseAddress = 6;
    final static int op1BaseAddress = 0x10; 
    final static int op2BaseAddress = 0x13;
    
    BassDrumChannel () {
        super(bassDrumChannelBaseAddress, new Operator(op1BaseAddress), new Operator(op2BaseAddress));
    }

    @Override
    double[] getChannelOutput() {
        // Bass Drum ignores first operator, when it is in series.
        if(cnt == 1) op1.ar=0;
        return super.getChannelOutput();
    }    
    
    // Key ON and OFF are unused in rhythm channels.
    @Override
    protected void keyOn() {    }    
    @Override
    protected void keyOff() {    }    
}


//
// OPl3 Data
//


class OPL3Data {
    
    // OPL3-wide registers offsets:
    final static int 
         _1_NTS1_6_Offset = 0x08, 
         DAM1_DVB1_RYT1_BD1_SD1_TOM1_TC1_HH1_Offset = 0xBD, 
         _7_NEW1_Offset = 0x105, 
         _2_CONNECTIONSEL6_Offset = 0x104;        

    final static double sampleRate = 49700;
    
    static {
        loadVibratoTable();
        loadTremoloTable();
    }
   
    static double[][] vibratoTable;    
    private static void loadVibratoTable() {

        // According to the YMF262 datasheet, the OPL3 vibrato repetition rate is 6.1 Hz.
        // According to the YMF278B manual, it is 6.0 Hz. 
        // The information that the vibrato table has 8 levels standing 1024 samples each
        // was taken from the emulator by Jarek Burczynski and Tatsuyuki Satoh,
        // with a frequency of 6,06689453125 Hz, what  makes sense with the difference 
        // in the information on the datasheets.
        
        // The first array is used when DVB=0 and the second array is used when DVB=1.
        vibratoTable = new double[2][8192];
        
        final double semitone = Math.pow(2,1/12d);
        // A cent is 1/100 of a semitone:
        final double cent = Math.pow(semitone, 1/100d);
        
        // When dvb=0, the depth is 7 cents, when it is 1, the depth is 14 cents.
        final double DVB0 = Math.pow(cent,7);
        final double DVB1 = Math.pow(cent,14);        
        int i;
        for(i = 0; i<1024; i++) 
            vibratoTable[0][i] = vibratoTable[1][i] = 1;        
        for(;i<2048; i++) {
            vibratoTable[0][i] = Math.sqrt(DVB0);
            vibratoTable[1][i] = Math.sqrt(DVB1);
        }
        for(;i<3072; i++) {
            vibratoTable[0][i] = DVB0;
            vibratoTable[1][i] = DVB1;
        }
        for(;i<4096; i++) {
            vibratoTable[0][i] = Math.sqrt(DVB0);
            vibratoTable[1][i] = Math.sqrt(DVB1);
        }
        for(; i<5120; i++) 
            vibratoTable[0][i] = vibratoTable[1][i] = 1;        
        for(;i<6144; i++) {
            vibratoTable[0][i] = 1/Math.sqrt(DVB0);
            vibratoTable[1][i] = 1/Math.sqrt(DVB1);
        }
        for(;i<7168; i++) {
            vibratoTable[0][i] = 1/DVB0;
            vibratoTable[1][i] = 1/DVB1;
        }
        for(;i<8192; i++) {
            vibratoTable[0][i] = 1/Math.sqrt(DVB0);
            vibratoTable[1][i] = 1/Math.sqrt(DVB1);
        }
        
    }

    static double[][] tremoloTable;
    private static void loadTremoloTable() {

        // The OPL3 tremolo repetition rate is 3.7 Hz.  
        final double tremoloFrequency = 3.7;
        
        // The tremolo depth is -1 dB when DAM = 0, and -4.8 dB when DAM = 1.
        final double tremoloDepth[] = {-1, -4.8};
        
        //  According to the YMF278B manual's OPL3 section graph, 
        //              the tremolo waveform is not 
        //   \      /   a sine wave, but a single triangle waveform.
        //    \    /    Thus, the period to achieve the tremolo depth is T/2, and      
        //     \  /     the increment in each T/2 section uses a frequency of 2*f.
        //      \/      Tremolo varies from 0 dB to depth, to 0 dB again, at frequency*2:
        final double tremoloIncrement[] = {
            calculateIncrement(tremoloDepth[0],0,1/(2*tremoloFrequency)),
            calculateIncrement(tremoloDepth[1],0,1/(2*tremoloFrequency))
        };
        
        int tremoloTableLength = (int)(sampleRate/tremoloFrequency);
        
        // First array used when AM = 0 and second array used when AM = 1.
        tremoloTable = new double[2][tremoloTableLength];
        
        // This is undocumented. The tremolo starts at the maximum attenuation,
        // instead of at 0 dB:
        tremoloTable[0][0] = tremoloDepth[0];
        tremoloTable[1][0] = tremoloDepth[1];
        int counter = 0;
        // The first half of the triangle waveform:
        while(tremoloTable[0][counter]<0) {
            counter++;
            tremoloTable[0][counter] = tremoloTable[0][counter-1] + tremoloIncrement[0];
            tremoloTable[1][counter] = tremoloTable[1][counter-1] + tremoloIncrement[1];
        }
        // The second half of the triangle waveform:
        while(tremoloTable[0][counter]>tremoloDepth[0] && counter<tremoloTableLength-1) {
            counter++;
            tremoloTable[0][counter] = tremoloTable[0][counter-1] - tremoloIncrement[0];
            tremoloTable[1][counter] = tremoloTable[1][counter-1] - tremoloIncrement[1];
        }

    }
    
    static double calculateIncrement(double begin, double end, double period) {
        return (end-begin)/sampleRate * (1/period);
    }
    
}


//
// Channel Data
// 


class ChannelData {
    
    final static int
                _2_KON1_BLOCK3_FNUMH2_Offset = 0xB0,
                FNUML8_Offset = 0xA0,
                CHD1_CHC1_CHB1_CHA1_FB3_CNT1_Offset = 0xC0;
    
    // Feedback rate in fractions of 2*Pi, normalized to (0,1): 
    // 0, Pi/16, Pi/8, Pi/4, Pi/2, Pi, 2*Pi, 4*Pi turns to be:
    final static double[] feedback = {0,1/32d,1/16d,1/8d,1/4d,1/2d,1,2};
}


//
// Operator Data
//


class OperatorData {
            
    final static int
        AM1_VIB1_EGT1_KSR1_MULT4_Offset = 0x20,
        KSL2_TL6_Offset = 0x40,
        AR4_DR4_Offset = 0x60,
        SL4_RR4_Offset = 0x80,
        _5_WS3_Offset = 0xE0;        
    
    enum type {NO_MODULATION, CARRIER, FEEDBACK};
    
    final static int waveLength = 1024;
    
    final static double[] multTable = {0.5,1,2,3,4,5,6,7,8,9,10,10,12,12,15,15};
    
    final static double[][] ksl3dBtable = {
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,-3,-6,-9},
        {0,0,0,0,-3,-6,-9,-12},
        {0,0,0, -1.875, -4.875, -7.875, -10.875, -13.875},
        
        {0,0,0,-3,-6,-9,-12,-15},
        {0,0, -1.125, -4.125, -7.125, -10.125, -13.125, -16.125}, 
        {0,0, -1.875, -4.875, -7.875, -10.875, -13.875, -16.875},
        {0,0, -2.625, -5.625, -8.625, -11.625, -14.625, -17.625},
        
        {0,0,-3,-6,-9,-12,-15,-18},
        {0, -0.750, -3.750, -6.750, -9.750, -12.750, -15.750, -18.750},
        {0, -1.125, -4.125, -7.125, -10.125, -13.125, -16.125, -19.125},
        {0, -1.500, -4.500, -7.500, -10.500, -13.500, -16.500, -19.500},
        
        {0, -1.875, -4.875, -7.875, -10.875, -13.875, -16.875, -19.875},
        {0, -2.250, -5.250, -8.250, -11.250, -14.250, -17.250, -20.250},
        {0, -2.625, -5.625, -8.625, -11.625, -14.625, -17.625, -20.625},
        {0,-3,-6,-9,-12,-15,-18,-21}
    };
    
    static double[][] waveforms;
    
    static {
        OperatorData.loadWaveforms();        
    }
    
    private static void loadWaveforms() {
        //OPL3 has eight waveforms:
        waveforms = new double[8][waveLength];
        
        int i;
        // 1st waveform: sinusoid.
        double theta = 0, thetaIncrement = 2*Math.PI / 1024;
        
        for(i=0, theta=0; i<1024; i++, theta += thetaIncrement)
            waveforms[0][i] = Math.sin(theta);
        
        double[] sineTable = waveforms[0];
        // 2nd: first half of a sinusoid.
        for(i=0; i<512; i++) {
            waveforms[1][i] = sineTable[i];
            waveforms[1][512+i] = 0;
        } 
        // 3rd: double positive sinusoid.
        for(i=0; i<512; i++) 
            waveforms[2][i] = waveforms[2][512+i] = sineTable[i];         
        // 4th: first and third quarter of double positive sinusoid.
        for(i=0; i<256; i++) {
            waveforms[3][i] = waveforms[3][512+i] = sineTable[i];
            waveforms[3][256+i] = waveforms[3][768+i] = 0;
        }
        // 5th: first half with double frequency sinusoid.
        for(i=0; i<512; i++) {
            waveforms[4][i] = sineTable[i*2];
            waveforms[4][512+i] = 0;
        } 
        // 6th: first half with double frequency positive sinusoid.
        for(i=0; i<256; i++) {
            waveforms[5][i] = waveforms[5][256+i] = sineTable[i*2];
            waveforms[5][512+i] = waveforms[5][768+i] = 0;
        }
        // 7th: square wave
        for(i=0; i<512; i++) {
            waveforms[6][i] = 1;
            waveforms[6][512+i] = -1;
        }                
        // 8th: exponential
        double x;
        double xIncrement = 1 * 16d / 256d;
        for(i=0, x=0; i<512; i++, x+=xIncrement) {
            waveforms[7][i] = Math.pow(2,-x);
            waveforms[7][1023-i] = -Math.pow(2,-(x + 1/16d));
        }
        
    }  
    
    static double log2(double x) {
        return Math.log(x)/Math.log(2);
    }    
}


//
// Envelope Generator Data
//


class EnvelopeGeneratorData {
    
    final static double INFINITY = 1f/0f;
    // This table is indexed by the value of Operator.ksr 
    // and the value of ChannelRegister.keyScaleNumber.
    final static int[][] rateOffset = {
        {0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3},
        {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
    };    
    // These attack periods in miliseconds were taken from the YMF278B manual. 
    // The attack actual rates range from 0 to 63, with different data for 
    // 0%-100% and for 10%-90%: 
    final static double[][] attackTimeValuesTable = {
            {INFINITY,INFINITY},    {INFINITY,INFINITY},    {INFINITY,INFINITY},    {INFINITY,INFINITY},
            {2826.24,1482.75}, {2252.80,1155.07}, {1884.16,991.23}, {1597.44,868.35},
            {1413.12,741.38}, {1126.40,577.54}, {942.08,495.62}, {798.72,434.18},
            {706.56,370.69}, {563.20,288.77}, {471.04,247.81}, {399.36,217.09},
            
            {353.28,185.34}, {281.60,144.38}, {235.52,123.90}, {199.68,108.54},
            {176.76,92.67}, {140.80,72.19}, {117.76,61.95}, {99.84,54.27},
            {88.32,46.34}, {70.40,36.10}, {58.88,30.98}, {49.92,27.14},
            {44.16,23.17}, {35.20,18.05}, {29.44,15.49}, {24.96,13.57},
            
            {22.08,11.58}, {17.60,9.02}, {14.72,7.74}, {12.48,6.78},
            {11.04,5.79}, {8.80,4.51}, {7.36,3.87}, {6.24,3.39},
            {5.52,2.90}, {4.40,2.26}, {3.68,1.94}, {3.12,1.70},
            {2.76,1.45}, {2.20,1.13}, {1.84,0.97}, {1.56,0.85},
            
            {1.40,0.73}, {1.12,0.61}, {0.92,0.49}, {0.80,0.43},
            {0.70,0.37}, {0.56,0.31}, {0.46,0.26}, {0.42,0.22},
            {0.38,0.19}, {0.30,0.14}, {0.24,0.11}, {0.20,0.11},
            {0.00,0.00}, {0.00,0.00}, {0.00,0.00}, {0.00,0.00}
    };

    // These decay and release periods in miliseconds were taken from the YMF278B manual. 
    // The rate index range from 0 to 63, with different data for 
    // 0%-100% and for 10%-90%: 
    final static double[][] decayAndReleaseTimeValuesTable = {
            {INFINITY,INFINITY},    {INFINITY,INFINITY},    {INFINITY,INFINITY},    {INFINITY,INFINITY},
            {39280.64,8212.48}, {31416.32,6574.08}, {26173.44,5509.12}, {22446.08,4730.88},
            {19640.32,4106.24}, {15708.16,3287.04}, {13086.72,2754.56}, {11223.04,2365.44},
            {9820.16,2053.12}, {7854.08,1643.52}, {6543.36,1377.28}, {5611.52,1182.72},
            
            {4910.08,1026.56}, {3927.04,821.76}, {3271.68,688.64}, {2805.76,591.36},
            {2455.04,513.28}, {1936.52,410.88}, {1635.84,344.34}, {1402.88,295.68},
            {1227.52,256.64}, {981.76,205.44}, {817.92,172.16}, {701.44,147.84},
            {613.76,128.32}, {490.88,102.72}, {488.96,86.08}, {350.72,73.92},
            
            {306.88,64.16}, {245.44,51.36}, {204.48,43.04}, {175.36,36.96},
            {153.44,32.08}, {122.72,25.68}, {102.24,21.52}, {87.68,18.48},
            {76.72,16.04}, {61.36,12.84}, {51.12,10.76}, {43.84,9.24},
            {38.36,8.02}, {30.68,6.42}, {25.56,5.38}, {21.92,4.62},
            
            {19.20,4.02}, {15.36,3.22}, {12.80,2.68}, {10.96,2.32},
            {9.60,2.02}, {7.68,1.62}, {6.40,1.35}, {5.48,1.15},
            {4.80,1.01}, {3.84,0.81}, {3.20,0.69}, {2.74,0.58},
            {2.40,0.51}, {2.40,0.51}, {2.40,0.51}, {2.40,0.51}
    };
    
}
