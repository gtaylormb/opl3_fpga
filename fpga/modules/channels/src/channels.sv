/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: channels.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 7 Nov 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   7 Nov 2014    Greg Taylor
#       Initial version
#
#   Copyright (C) 2014 Greg Taylor <gtaylor@sonic.net>
#    
#   This file is part of OPL3 FPGA.
#    
#   OPL3 FPGA is free software: you can redistribute it and/or modify
#   it under the terms of the GNU Lesser General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#   
#   OPL3 FPGA is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU Lesser General Public License for more details.
#   
#   You should have received a copy of the GNU Lesser General Public License
#   along with OPL3 FPGA.  If not, see <http://www.gnu.org/licenses/>.
#   
#   Original Java Code: 
#   Copyright (C) 2008 Robson Cozendey <robson@cozendey.com>
#   
#   Original C++ Code: 
#   Copyright (C) 2012  Steffen Ohrendorf <steffen.ohrendorf@gmx.de>
#   
#   Some code based on forum posts in: 
#   http://forums.submarine.org.uk/phpBB/viewforum.php?f=9,
#   Copyright (C) 2010-2013 by carbon14 and opl3    
#   
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none  // disable implicit net type declarations

import opl3_pkg::*;

module channels (
    input wire clk,
    input wire sample_clk_en,
    input wire [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel,
    input wire is_new,
    input wire nts,                     // keyboard split selection     
    input wire [REG_FNUM_WIDTH-1:0] fnum [2][9],
    input wire [REG_MULT_WIDTH-1:0] mult [2][18],
    input wire [REG_BLOCK_WIDTH-1:0] block [2][9],
    input wire [REG_WS_WIDTH-1:0] ws [2][18],
    input wire vib [2][18],
    input wire dvb,
    input wire kon [2][9],  
    input wire [REG_ENV_WIDTH-1:0] ar [2][18], // attack rate
    input wire [REG_ENV_WIDTH-1:0] dr [2][18], // decay rate
    input wire [REG_ENV_WIDTH-1:0] sl [2][18], // sustain level
    input wire [REG_ENV_WIDTH-1:0] rr [2][18], // release rate
    input wire [REG_TL_WIDTH-1:0] tl [2][18],  // total level
    input wire ksr [2][18],                    // key scale rate
    input wire [REG_KSL_WIDTH-1:0] ksl [2][18], // key scale level
    input wire egt [2][18],                     // envelope type
    input wire am [2][18],                      // amplitude modulation (tremolo)
    input wire dam,                             // depth of tremolo
    input wire ryt,
    input wire bd,
    input wire sd,
    input wire tom,
    input wire tc,
    input wire hh,
    input wire cha [2][9],
    input wire chb [2][9],
    input wire chc [2][9],
    input wire chd [2][9],
    input wire [REG_FB_WIDTH-1:0] fb [2][9],
    input wire cnt [2][9],
    output logic signed [SAMPLE_WIDTH-1:0] channel_a = 0,
    output logic signed [SAMPLE_WIDTH-1:0] channel_b = 0,
    output logic signed [SAMPLE_WIDTH-1:0] channel_c = 0,
    output logic signed [SAMPLE_WIDTH-1:0] channel_d = 0
);      
    logic signed [SAMPLE_WIDTH-1:0] channel_2_op;
    logic signed [SAMPLE_WIDTH-1:0] channel_4_op;
    logic signed [OP_OUT_WIDTH-1:0] operator_out [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    
    /*
     * Each channel is accumulated (can be up to 19 bits) and then clamped to
     * 16-bits.
     */
    logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_a_acc_pre_clamp = 0;
    logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_b_acc_pre_clamp = 0; 
    logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_c_acc_pre_clamp = 0;      
    logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_d_acc_pre_clamp = 0;
    
    typedef enum {
        IDLE,
        CALC_OUTPUTS
    } state_t;
    
    state_t state = IDLE;
    state_t next_state;
    
    logic [$clog2(9)-1:0] channel = 0;
    logic bank = 0;

    /*
     * One operator is instantiated; it replicates the necessary registers for
     * all operator slots (phase accumulation, envelope state and value, etc).
     */    
    control_operators control_operators (
        .*
    );    
    
    always_ff @(posedge clk)
        state <= next_state;
        
    always_comb
        unique case (state)
        IDLE: next_state = sample_clk_en ? CALC_OUTPUTS : IDLE;
        CALC_OUTPUTS: next_state = bank == 1 && channel == 8 ? IDLE : CALC_OUTPUTS;
        endcase
            
    always_ff @(posedge clk)
        if (state == IDLE || channel == 8)
            channel <= 0;
        else
            channel <= channel + 1;
            
    always_ff @(posedge clk)
        if (state == IDLE)
            bank <= 0;
        else if (channel == 8)
            bank <= 1;
            
    always_comb
        unique case (channel)
        0, 1, 2: channel_2_op = cnt[bank][channel] ? operator_out[bank][channel]
         + operator_out[bank][channel + 3] : operator_out[bank][channel + 3];
        3, 4, 5: channel_2_op = cnt[bank][channel] ? operator_out[bank][channel + 3]
         + operator_out[bank][channel + 6] : operator_out[bank][channel + 6];
        6: // bass drum is special
            if (ryt && bank == 0)               
                channel_2_op = cnt[bank][channel] ? operator_out[bank][channel + 9]
                 : operator_out[bank][channel + 6];
            else
                channel_2_op = cnt[bank][channel] ? operator_out[bank][channel + 6]
                 + operator_out[bank][channel + 9] : operator_out[bank][15];
        7, 8: // 7 aka hi hat and snare drum in bank 0, 8 aka tom tom and top cymbal in bank 0
            channel_2_op = cnt[bank][channel] || (ryt && bank == 0) ? operator_out[bank][channel]
             + operator_out[bank][channel + 6] : operator_out[bank][channel + 9];
        endcase
            
    always_comb
        unique case ({cnt[bank][channel], cnt[bank][channel + 3]})
        'b00: channel_4_op = operator_out[bank][channel + 9];
        'b01: channel_4_op = operator_out[bank][channel + 3] + operator_out[bank][channel + 9];
        'b10: channel_4_op = operator_out[bank][channel] + operator_out[bank][channel + 9];
        'b11: channel_4_op = operator_out[bank][channel] + operator_out[bank][channel + 6]
         + operator_out[bank][channel + 9];
        endcase 
    
    always_ff @(posedge clk)
        if (sample_clk_en)
            channel_a_acc_pre_clamp <= 0;
        else if (state == CALC_OUTPUTS)
            unique case (channel)
            0, 1, 2:
                if (cha[bank][channel] || (bank == 0 && !is_new))
                    channel_a_acc_pre_clamp <= channel_a_acc_pre_clamp +
                     (connection_sel[channel] && is_new ? channel_4_op : channel_2_op);
            3, 4, 5:
                if (cha[bank][channel] || (bank == 0 && !is_new))
                    channel_a_acc_pre_clamp <= channel_a_acc_pre_clamp +
                     (connection_sel[channel-3] && is_new ? channel_4_op : channel_2_op);
            6, 7, 8:
                if (cha[bank][channel] || (bank == 0 && !is_new))
                    channel_a_acc_pre_clamp <= channel_a_acc_pre_clamp + channel_2_op;
            endcase
                
    always_ff @(posedge clk)
        if (sample_clk_en)
            channel_b_acc_pre_clamp <= 0;
        else if (state == CALC_OUTPUTS)
            unique case (channel)
            0, 1, 2:
                if (chb[bank][channel] || (bank == 0 && !is_new))
                    channel_b_acc_pre_clamp <= channel_b_acc_pre_clamp +
                     (connection_sel[channel] && is_new ? channel_4_op : channel_2_op);
            3, 4, 5:
                if (chb[bank][channel] || (bank == 0 && !is_new))
                    channel_b_acc_pre_clamp <= channel_b_acc_pre_clamp +
                     (connection_sel[channel-3] && is_new ? channel_4_op : channel_2_op);
            6, 7, 8:
                if (chb[bank][channel] || (bank == 0 && !is_new))
                    channel_b_acc_pre_clamp <= channel_b_acc_pre_clamp + channel_2_op;
            endcase                
                
    always_ff @(posedge clk)
        if (sample_clk_en)
            channel_c_acc_pre_clamp <= 0;
        else if (state == CALC_OUTPUTS)
            unique case (channel)
            0, 1, 2:
                if (chc[bank][channel] || (bank == 0 && !is_new))
                    channel_c_acc_pre_clamp <= channel_c_acc_pre_clamp +
                     (connection_sel[channel] && is_new ? channel_4_op : channel_2_op);
            3, 4, 5:
                if (chc[bank][channel] || (bank == 0 && !is_new))
                    channel_c_acc_pre_clamp <= channel_c_acc_pre_clamp +
                     (connection_sel[channel-3] && is_new ? channel_4_op : channel_2_op);
            6, 7, 8:
                if (chc[bank][channel] || (bank == 0 && !is_new))
                    channel_c_acc_pre_clamp <= channel_c_acc_pre_clamp + channel_2_op;
            endcase
                
    always_ff @(posedge clk)
        if (sample_clk_en)
            channel_d_acc_pre_clamp <= 0;
        else if (state == CALC_OUTPUTS)
            unique case (channel)
            0, 1, 2:
                if (chd[bank][channel] || (bank == 0 && !is_new))
                    channel_d_acc_pre_clamp <= channel_d_acc_pre_clamp +
                     (connection_sel[channel] && is_new ? channel_4_op : channel_2_op);
            3, 4, 5:
                if (chd[bank][channel] || (bank == 0 && !is_new))
                    channel_d_acc_pre_clamp <= channel_d_acc_pre_clamp +
                     (connection_sel[channel-3] && is_new ? channel_4_op : channel_2_op);
            6, 7, 8:
                if (chd[bank][channel] || (bank == 0 && !is_new))
                    channel_d_acc_pre_clamp <= channel_d_acc_pre_clamp + channel_2_op;
            endcase
    
    /*
     * Clamp output channels
     */
    always_ff @(posedge clk) begin
        if (channel_a_acc_pre_clamp > 2**15 - 1)
            channel_a <= 2**15 - 1;
        else if (channel_a_acc_pre_clamp < -2**15)
            channel_a <= -2**15;
        else
            channel_a <= channel_a_acc_pre_clamp;

        if (channel_b_acc_pre_clamp > 2**15 - 1)
            channel_b <= 2**15 - 1;
        else if (channel_b_acc_pre_clamp < -2**15)
            channel_b <= -2**15;
        else
            channel_b <= channel_b_acc_pre_clamp;              

        if (channel_c_acc_pre_clamp > 2**15 - 1)
            channel_c <= 2**15 - 1;
        else if (channel_c_acc_pre_clamp < -2**15)
            channel_c <= -2**15;
        else
            channel_c <= channel_c_acc_pre_clamp;              

        if (channel_d_acc_pre_clamp > 2**15 - 1)
            channel_d <= 2**15 - 1;
        else if (channel_d_acc_pre_clamp < -2**15)
            channel_d <= -2**15;
        else
            channel_d <= channel_d_acc_pre_clamp; 
    end        
        
endmodule
`default_nettype wire  // re-enable implicit net type declarations