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
`default_nettype none

module envelope_generator
    import opl3_pkg::*;
#(
    parameter SILENCE = 511
)(
    input wire clk,
    input wire reset,
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
    input wire key_on_pulse_p0,
    input wire key_off_pulse_p0,
    output logic [ENV_WIDTH-1:0] env_p3 = SILENCE
);
    localparam PIPELINE_DELAY = 3;

    // state_t goes on a memory--explicitly define width/values
    typedef enum logic [3:0] {
        ATTACK    = 4'b0001,
        DECAY     = 4'b0010,
        SUSTAIN   = 4'b0100,
        RELEASE   = 4'b1000
    } state_t;

    state_t state_p0, next_state_p0, state_p1 = RELEASE;

    logic [KSL_ADD_WIDTH-1:0] ksl_add_p2;
    logic [ENV_WIDTH-1:0] env_int_p0;
    logic [ENV_WIDTH-1:0] env_int_p1 = 0;
    logic [ENV_WIDTH-1:0] env_int_p2 = 0;
    logic [ENV_WIDTH:0] env_add_p1; // one more bit for overflow check
    logic [AM_VAL_WIDTH-1:0] am_val_p2;
    logic [REG_ENV_WIDTH-1:0] requested_rate_p0;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_counter_overflow_p1;
    logic [ENV_WIDTH+1:0] env_tmp_p2; // two more bits wide than env for overflow check
    logic [PIPELINE_DELAY:1] sample_clk_en_p;
    logic [PIPELINE_DELAY:1] [BANK_NUM_WIDTH-1:0] bank_num_p;
    logic [PIPELINE_DELAY:1] [OP_NUM_WIDTH-1:0] op_num_p;
    logic [PIPELINE_DELAY:1] [REG_TL_WIDTH-1:0] tl_p;

    pipeline_sr #(
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) sample_clk_en_sr (
        .clk,
        .in(sample_clk_en),
        .out(sample_clk_en_p)
    );

    pipeline_sr #(
        .DATA_WIDTH(BANK_NUM_WIDTH),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) bank_num_sr (
        .clk,
        .in(bank_num),
        .out(bank_num_p)
    );

    pipeline_sr #(
        .DATA_WIDTH(OP_NUM_WIDTH),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) op_num_sr (
        .clk,
        .in(op_num),
        .out(op_num_p)
    );

    pipeline_sr #(
        .DATA_WIDTH(REG_TL_WIDTH),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) tl_sr (
        .clk,
        .in(tl),
        .out(tl_p)
    );

    ksl_add_rom ksl_add_rom (
        .*
    );

    // on reset all operators will go into RELEASE state
    mem_multi_bank_reset #(
        .DATA_WIDTH($bits(state_t)),
        .DEPTH(NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(RELEASE),
        .NUM_BANKS(NUM_BANKS)
    ) state_mem (
        .clk,
        .reset('0),
        .reset_mem(reset),
        .wea(sample_clk_en_p[1]),
        .reb(sample_clk_en),
        .banka(bank_num_p[1]),
        .addra(op_num_p[1]),
        .bankb(bank_num),
        .addrb(op_num),
        .dia({state_p1}),
        .dob({state_p0}),
        .reset_mem_done_pulse()
    );

    always_ff @(posedge clk)
        if (sample_clk_en)
            state_p1 <= next_state_p0;

    always_comb begin
        unique case (state_p0)
        ATTACK: next_state_p0 = env_int_p0 == 0 ? DECAY : ATTACK;
        DECAY: next_state_p0 = (env_int_p0 >> 4) >= sl ? SUSTAIN : DECAY;
        SUSTAIN: next_state_p0 = !egt ? RELEASE : SUSTAIN;
        RELEASE: next_state_p0 = RELEASE;
        endcase

        if (key_on_pulse_p0)
            next_state_p0 = env_int_p0 == 0 ? DECAY : ATTACK;
        else if (key_off_pulse_p0)
            next_state_p0 = RELEASE;
    end

    always_comb
        unique case (next_state_p0)
        ATTACK: requested_rate_p0 = ar;
        DECAY: requested_rate_p0 = dr;
        SUSTAIN: requested_rate_p0 = 0;
        RELEASE: requested_rate_p0 = rr;
        endcase

    /*
     * Calculate rate_counter_overflow
     */
    env_rate_counter env_rate_counter (
        .*
    );

    mem_multi_bank #(
        .DATA_WIDTH(ENV_WIDTH),
        .DEPTH(NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(SILENCE),
        .NUM_BANKS(NUM_BANKS)
    ) env_int_mem (
        .clk,
        .wea(sample_clk_en_p[2]),
        .reb(sample_clk_en),
        .banka(bank_num_p[2]),
        .addra(op_num_p[2]),
        .bankb(bank_num),
        .addrb(op_num),
        .dia(env_int_p2),
        .dob(env_int_p0)
    );

    always_comb env_add_p1 = env_int_p1 + rate_counter_overflow_p1;

    always_ff @(posedge clk) begin
        env_int_p1 <= env_int_p0;
        env_int_p2 <= env_int_p1;

        if (sample_clk_en_p[1]) begin
            if (state_p1 == ATTACK && rate_counter_overflow_p1 != 0)
                // The maximum value of overflow is 7. An overflow can only occur
                // if m_env < floor(m_env/8)*7 + 1. Let's substitute m_env by 8*x:
                // 8*x < 1 + x*7
                // <=> 8*x - 7*x < 1
                // <=> x < 1
                // But the attack only occurs if m_env>0, so an overflow cannot occur
                // here.
                // +1 for one's complement.
                env_int_p2 <= env_int_p1 - (((env_int_p1*rate_counter_overflow_p1) >> 3) + 1);
            else if (state_p1 == DECAY || state_p1 == RELEASE) begin
                if (env_add_p1[ENV_WIDTH])
                    // env_int would overflow
                    env_int_p2 <= SILENCE;
                else
                    env_int_p2 <= env_add_p1;
            end
        end
    end

    /*
     * Calculate am_val
     */
    tremolo tremolo (
        .*
    );

    always_comb
        if (am)
            env_tmp_p2 = env_int_p2 + (tl_p[2] << 2) + ksl_add_p2 + am_val_p2; // max val 1044
        else
            env_tmp_p2 = env_int_p2 + (tl_p[2] << 2) + ksl_add_p2;

    // clamp envelope
    always_ff @(posedge clk)
        if (env_tmp_p2[ENV_WIDTH+1:ENV_WIDTH] != 0) // overflow
            env_p3 <= SILENCE;
        else
            env_p3 <= env_tmp_p2;
endmodule
`default_nettype wire