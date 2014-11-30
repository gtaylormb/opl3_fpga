/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: envelope_generator.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 30 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   30 Oct 2014    Greg Taylor
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
`default_nettype none // disable implicit net type declarations

import opl3_pkg::*;

module envelope_generator #(
    parameter SILENCE = 511
)(
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,        
    input wire [REG_ENV_WIDTH-1:0] ar, // attack rate
    input wire [REG_ENV_WIDTH-1:0] dr, // decay rate
    input wire [REG_ENV_WIDTH-1:0] sl, // sustain level
    input wire [REG_ENV_WIDTH-1:0] rr, // release rate
    input wire [REG_TL_WIDTH-1:0] tl,  // total level
    input wire ksr,                    // key scale rate
    input wire [REG_KSL_WIDTH-1:0] ksl, // key scale level
    input wire egt,                     // envelope type
    input wire am,                      // amplitude modulation (tremolo)
    input wire dam,                     // depth of tremolo
    input wire nts,                     // keyboard split selection
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire [REG_MULT_WIDTH-1:0] mult,
    input wire [REG_BLOCK_WIDTH-1:0] block,
    input wire key_on_pulse,
    input wire key_off_pulse,
    output logic [ENV_WIDTH-1:0] env = SILENCE
);
    localparam KSL_ADD_WIDTH = 8;
    
    /*
     * Because of the 2D array of state registers, this state machine isn't
     * picked up by Vivado synthesis, therefore is not optimized. Manually
     * optimize encoding to 1-hot
     */
    typedef enum logic [3:0]{
        ATTACK    = 4'b0000,
        DECAY     = 4'b0010,
        SUSTAIN   = 4'b0100,
        RELEASE   = 4'b1000
    } state_t;
    
    state_t state [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{ default: RELEASE };
    state_t next_state;    
    
    wire [KSL_ADD_WIDTH-1:0] ksl_add;
    logic [ENV_WIDTH-1:0] env_int [NUM_BANKS][NUM_OPERATORS_PER_BANK] =
     '{ default: SILENCE};
    wire [AM_VAL_WIDTH-1:0] am_val;
    logic [REG_ENV_WIDTH-1:0] requested_rate;
    wire [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_counter_overflow;
    logic [ENV_WIDTH:0] env_tmp; // one more bit wide than env for >, < comparison
    
    ksl_add_rom ksl_add_rom (
        .*
    );
    
    always_ff @(posedge clk)
        if (key_on_pulse)
            state[bank_num][op_num] <= ATTACK;
        else if (key_off_pulse)
            state[bank_num][op_num] <= RELEASE;
        else if (sample_clk_en)
            state[bank_num][op_num] <= next_state;
        
    always_comb
        unique case (state[bank_num][op_num])
        ATTACK: next_state = env_int[bank_num][op_num] == 0 ? DECAY : ATTACK;
        DECAY: next_state = (env_int[bank_num][op_num] >> 4) >= sl ? SUSTAIN : DECAY;
        SUSTAIN: next_state = !egt ? RELEASE : SUSTAIN;
        RELEASE: next_state = RELEASE;
        endcase
            
    always_comb
        unique case (state[bank_num][op_num])
        ATTACK: requested_rate = ar;
        DECAY: requested_rate = dr;
        SUSTAIN: requested_rate = 0;
        RELEASE: requested_rate = rr;
        endcase
            
    /*
     * Calculate rate_counter_overflow
     */            
    env_rate_counter env_rate_counter (
        .*
    );
    
    always_ff @(posedge clk)
        if (sample_clk_en)
            if (state[bank_num][op_num] == ATTACK && rate_counter_overflow != 0 && env_int[bank_num][op_num] != 0)
                env_int[bank_num][op_num] <= env_int[bank_num][op_num] - (((env_int[bank_num][op_num]*rate_counter_overflow) >> 3) + 1);
            else if (state[bank_num][op_num] == DECAY || state[bank_num][op_num] == RELEASE)
                if (env_int[bank_num][op_num] + rate_counter_overflow > SILENCE)
                    // env_int would overflow
                    env_int[bank_num][op_num] <= SILENCE;
                else
                    env_int[bank_num][op_num] <= env_int[bank_num][op_num] + rate_counter_overflow;     
    
    /*
     * Calculate am_val
     */
    tremolo tremolo (
        .*
    );
    
    always_comb
        if (am)
            env_tmp = env_int[bank_num][op_num] + (tl << 2) + ksl_add + am_val;
        else
            env_tmp = env_int[bank_num][op_num] + (tl << 2) + ksl_add;
            
    always_ff @(posedge clk)
        if (env_tmp < 0)
            env <= 0;
        else if (env_tmp > SILENCE) 
            env <= SILENCE;
        else
            env <= env_tmp;
    
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	