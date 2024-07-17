/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: envelope_generator.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 30 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   19 June 2024     Greg Taylor
#       Refactored to match implementation in https://github.com/nukeykt/Nuked-OPL3
#
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
#   Copyright (C) 2013-2020 Nuke.YKT
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
    input wire key_on_p0,
    output logic [FINAL_ENV_WIDTH-1:0] env_p3 = SILENCE,
    output logic pg_reset_p2
);
    localparam PIPELINE_DELAY = 3;
    localparam ENV_WIDTH = 9;

    // state_t goes on a memory--explicitly define width/values
    typedef enum logic [3:0] {
        ATTACK    = 4'b0001,
        DECAY     = 4'b0010,
        SUSTAIN   = 4'b0100,
        RELEASE   = 4'b1000
    } state_t;

    state_t state_p0, state_p1 = RELEASE, state_p2 = RELEASE, next_state_p2, state_p3 = RELEASE;

    logic [KSL_ADD_WIDTH-1:0] ksl_add_p2;
    logic [ENV_WIDTH-1:0] env_int_p0;
    logic [ENV_WIDTH-1:0] env_int_pre_p2;
    logic [ENV_WIDTH-1:0] eg_inc_p2;
    logic eg_off_p2;
    logic [ENV_WIDTH+3-1:0] env_int_extra_bits_p2;
    logic [ENV_WIDTH-1:0] env_int_new_p3 = 0;
    logic [AM_VAL_WIDTH-1:0] am_val_p2;
    logic [REG_ENV_WIDTH-1:0] requested_rate_p0;
    logic [ENV_SHIFT_WIDTH-1:0] env_shift_p2;
    logic [REG_ENV_WIDTH-1:0] rate_hi_p2;
    logic eg_reset_p0;
    logic [REG_TL_WIDTH+2-1:0] tl_shifted_p2;
    logic [REG_ENV_WIDTH:0] sl_increased_p2;
    logic [PIPELINE_DELAY:1] sample_clk_en_p;
    logic [PIPELINE_DELAY:1] [BANK_NUM_WIDTH-1:0] bank_num_p;
    logic [PIPELINE_DELAY:1] [OP_NUM_WIDTH-1:0] op_num_p;
    logic [PIPELINE_DELAY:1] [REG_TL_WIDTH-1:0] tl_p;
    logic [PIPELINE_DELAY:1] [REG_ENV_WIDTH-1:0] sl_p;
    logic [PIPELINE_DELAY:1] [ENV_WIDTH-1:0] env_int_p;
    logic [PIPELINE_DELAY:1] key_on_p;
    logic [PIPELINE_DELAY:1] eg_reset_p;

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

    pipeline_sr #(
        .DATA_WIDTH(REG_ENV_WIDTH),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) sl_sr (
        .clk,
        .in(sl),
        .out(sl_p)
    );

    pipeline_sr #(
        .DATA_WIDTH(ENV_WIDTH),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) env_int_sr (
        .clk,
        .in(env_int_p0),
        .out(env_int_p)
    );

    pipeline_sr #(
        .DATA_WIDTH(1),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) key_on_sr (
        .clk,
        .in(key_on_p0),
        .out(key_on_p)
    );

    pipeline_sr #(
        .DATA_WIDTH(1),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) eg_reset_sr (
        .clk,
        .in(eg_reset_p0),
        .out(eg_reset_p)
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
        .wea(sample_clk_en_p[3]),
        .reb(sample_clk_en),
        .banka(bank_num_p[3]),
        .addra(op_num_p[3]),
        .bankb(bank_num),
        .addrb(op_num),
        .dia({state_p3}),
        .dob({state_p0}),
        .reset_mem_done_pulse()
    );

    always_comb begin
        eg_reset_p0 = 0;
        requested_rate_p0 = 0;

        if (key_on_p0 && state_p0 == RELEASE) begin
            eg_reset_p0 = 1;
            requested_rate_p0 = ar;
        end
        else
            unique case (state_p0)
            ATTACK: requested_rate_p0 = ar;
            DECAY: requested_rate_p0 = dr;
            SUSTAIN: requested_rate_p0 = !egt ? rr : 0;
            RELEASE: requested_rate_p0 = rr;
            endcase
    end

    /*
     * Calculate envelope shift
     */
    calc_envelope_shift calc_envelope_shift (
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
        .wea(sample_clk_en_p[3]),
        .reb(sample_clk_en),
        .banka(bank_num_p[3]),
        .addra(op_num_p[3]),
        .bankb(bank_num),
        .addrb(op_num),
        .dia(env_int_new_p3),
        .dob(env_int_p0)
    );

    /*
     * Calculate am_val
     */
    tremolo tremolo (
        .*
    );

    always_comb begin
        pg_reset_p2 = eg_reset_p[2];
        env_int_pre_p2 = env_int_p[2];
        eg_inc_p2 = 0;
        eg_off_p2 = 0;
        next_state_p2 = state_p2;
        env_int_extra_bits_p2 = env_int_p[2]; // need extra bits to shift in 1s when inverted
        sl_increased_p2 = sl_p[2] == 'hf ? 'h1f : sl_p[2];

        // instant attack
        if (eg_reset_p[2] && rate_hi_p2 == 'hf)
            env_int_pre_p2 = 0;

        // envelope off
        if ((env_int_p[2] & 'h1f8) == 'h1f8)
            eg_off_p2 = 1;
        if (state_p2 != ATTACK && !eg_reset_p[2] && eg_off_p2)
            env_int_pre_p2 = SILENCE;

        unique case (state_p2)
        ATTACK: begin
            if (env_int_p[2] == 0)
                next_state_p2 = DECAY;
            else if (key_on_p[2] && env_shift_p2 > 0 && rate_hi_p2 != 'hf)
                eg_inc_p2 = ~env_int_extra_bits_p2 >> (4 - env_shift_p2);
        end
        DECAY: begin
            if ((env_int_p[2] >> 4) == sl_increased_p2)
                next_state_p2 = SUSTAIN;
            else if (!eg_off_p2 && !eg_reset_p[2] && env_shift_p2 > 0)
                eg_inc_p2 = 1 << (env_shift_p2 - 1);
        end
        SUSTAIN, RELEASE: begin
            if (!eg_off_p2 && !eg_reset_p[2] && env_shift_p2 > 0)
                eg_inc_p2 = 1 << (env_shift_p2 - 1);
        end
        endcase

        if (eg_reset_p[2])
            next_state_p2 = ATTACK;
        if (!key_on_p[2])
            next_state_p2 = RELEASE;
    end

    always_ff @(posedge clk) begin
        state_p1 <= state_p0;
        state_p2 <= state_p1;
        state_p3 <= next_state_p2;
        env_int_new_p3 <= env_int_pre_p2 + eg_inc_p2;
    end

    always_comb tl_shifted_p2 = tl_p[2] << 2;

    always_ff @(posedge clk)
        env_p3 <= env_int_p[2] + tl_shifted_p2 + ksl_add_p2 + (am ? am_val_p2 : 0); // max val 1044
endmodule
`default_nettype wire
