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
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none // disable implicit net type declarations

import opl3_pkg::*;

module envelope_generator #(
    parameter SILENCE = 511
)(
	input wire clk,
	input wire sample_clk_en,
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
    
    typedef enum {
        ATTACK,
        DECAY,
        SUSTAIN,
        RELEASE
    } state_t;
    
    state_t state = RELEASE;
    state_t next_state;    
    
    wire [KSL_ADD_WIDTH-1:0] ksl_add;
    logic [ENV_WIDTH-1:0] env_int = SILENCE;
    wire [AM_VAL_WIDTH-1:0] am_val;
    logic [REG_ENV_WIDTH-1:0] requested_rate;
    wire [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_counter_overflow;
    logic [ENV_WIDTH:0] env_tmp; // one more bit wide than env for >, < comparison
    
    ksl_add_rom ksl_add_rom (
        .*
    );
    
    always_ff @(posedge clk)
        if (key_on_pulse)
            state <= ATTACK;
        else if (key_off_pulse)
            state <= RELEASE;
        else if (sample_clk_en)
            state <= next_state;
        
    always_comb
        unique case (state)
        ATTACK: next_state = env_int == 0 ? DECAY : ATTACK;
        DECAY: next_state = (env_int >> 4) >= sl ? SUSTAIN : DECAY;
        SUSTAIN: next_state = !egt ? RELEASE : SUSTAIN;
        RELEASE: next_state = RELEASE;
        endcase
            
    always_comb
        unique case (state)
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
            if (state == ATTACK && rate_counter_overflow != 0 && env_int != 0)
                env_int <= env_int - (((env_int*rate_counter_overflow) >> 3) + 1);
            else if (state == DECAY || state == RELEASE)
                if (env_int + rate_counter_overflow > SILENCE)
                    // env_int would overflow
                    env_int <= SILENCE;
                else
                    env_int <= env_int + rate_counter_overflow;     
    
    /*
     * Calculate am_val
     */
    tremolo tremolo (
        .*
    );
    
    always_comb
        if (am)
            env_tmp = env_int + (tl << 2) + ksl_add + am_val;
        else
            env_tmp = env_int + (tl << 2) + ksl_add;
            
    always_ff @(posedge clk)
        if (env_tmp < 0)
            env <= 0;
        else if (env_tmp > SILENCE) 
            env <= SILENCE;
        else
            env <= env_tmp;
    
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	