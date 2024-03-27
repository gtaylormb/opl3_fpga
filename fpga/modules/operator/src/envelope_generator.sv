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

module envelope_generator
    import opl3_pkg::*;
#(
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
    output logic [ENV_WIDTH-1:0] env_p4 = SILENCE
);
    localparam KSL_ADD_WIDTH = 8;
    localparam PIPELINE_DELAY = 4;

    /*
     * Because of the 2D array of state_p1 registers, this state_p1 machine isn't
     * picked up by Vivado synthesis, therefore is not optimized. Manually
     * optimize encoding to 1-hot
     */
    enum logic [3:0] {
        ATTACK    = 4'b0001,
        DECAY     = 4'b0010,
        SUSTAIN   = 4'b0100,
        RELEASE   = 4'b1000
    } state_p0, next_state_p0, state_p1, state_p2;

    logic [KSL_ADD_WIDTH-1:0] ksl_add_p2;
    logic [KSL_ADD_WIDTH-1:0] ksl_add_p3;
    logic [ENV_WIDTH-1:0] env_int_p0;
    logic [ENV_WIDTH-1:0] env_int_p1;
    logic [ENV_WIDTH-1:0] env_int_p2;
    logic [ENV_WIDTH-1:0] env_int_p3;
    logic [AM_VAL_WIDTH-1:0] am_val_p2;
    logic [AM_VAL_WIDTH-1:0] am_val_p3;
    logic [REG_ENV_WIDTH-1:0] requested_rate_p1;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_counter_overflow_p2;
    logic signed [ENV_WIDTH+1:0] env_tmp_p3; // two more bits wide than env for >, < comparison
    logic [PIPELINE_DELAY-1:1] sample_clk_en_p;

    ksl_add_rom ksl_add_rom (
        .*
    );

    mem_simple_dual_port_auto #(
        .DATA_WIDTH(4),
        .DEPTH(NUM_BANKS*NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(RELEASE)
    ) state_mem (
        .clka(clk),
        .clkb(clk),
        .wea(sample_clk_en_p[2] && requested_rate_p1 != 0),
        .reb(sample_clk_en),
        .addra({bank_num, op_num}),
        .addrb({bank_num, op_num}),
        .dia(env_int_p2),
        .dob(state_p0)
    );

    always_ff @(posedge clk) begin
        if (key_on_pulse)
            state_p1 <= ATTACK;
        else if (key_off_pulse)
            state_p1 <= RELEASE;
        else if (sample_clk_en)
            state_p1 <= next_state_p0;

        state_p2 <= state_p1;
    end

    always_comb
        unique case (state_p0)
        ATTACK: next_state_p0 = env_int_p0 == 0 ? DECAY : ATTACK;
        DECAY: next_state_p0 = (env_int_p0 >> 4) >= sl ? SUSTAIN : DECAY;
        SUSTAIN: next_state_p0 = !egt ? RELEASE : SUSTAIN;
        RELEASE: next_state_p0 = RELEASE;
        endcase

    always_comb
        unique case (state_p1)
        ATTACK: requested_rate_p1 = ar;
        DECAY: requested_rate_p1 = dr;
        SUSTAIN: requested_rate_p1 = 0;
        RELEASE: requested_rate_p1 = rr;
        endcase

    /*
     * Calculate rate_counter_overflow_p2
     */
    env_rate_counter env_rate_counter (
        .*
    );

    always_ff @(posedge clk) begin
        sample_clk_en_p <= sample_clk_en_p << 1;
        sample_clk_en_p[1] <= sample_clk_en;
    end

    mem_simple_dual_port_auto #(
        .DATA_WIDTH(ENV_WIDTH),
        .DEPTH(NUM_BANKS*NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(SILENCE)
    ) env_int_mem (
        .clka(clk),
        .clkb(clk),
        .wea(sample_clk_en_p[2] && requested_rate_p1 != 0),
        .reb(sample_clk_en),
        .addra({bank_num, op_num}),
        .addrb({bank_num, op_num}),
        .dia(env_int_p2),
        .dob(env_int_p0)
    );

    always_ff @(posedge clk) begin
        env_int_p1 <= env_int_p0;
        env_int_p2 <= env_int_p1;

        if (sample_clk_en_p[2]) begin
            if (state_p2 == ATTACK && rate_counter_overflow_p2 != 0 && env_int_p2 != 0)
                env_int_p3 <= env_int_p2 - (((env_int_p2*rate_counter_overflow_p2) >> 3) + 1);
            else if (state_p2 == DECAY || state_p2 == RELEASE) begin
                if (env_int_p2 + rate_counter_overflow_p2 > SILENCE)
                    // env_int would overflow
                    env_int_p3 <= SILENCE;
                else
                    env_int_p3 <= env_int_p2 + rate_counter_overflow_p2;
            end
        end
    end

    /*
     * Calculate am_val
     */
    tremolo tremolo (
        .*
    );

    always_ff @(posedge clk) begin
        ksl_add_p3 <= ksl_add_p2;
        am_val_p3 <= am_val_p2;
    end

    always_comb
        if (am)
            env_tmp_p3 = env_int_p3 + (tl << 2) + ksl_add_p3 + am_val_p3;
        else
            env_tmp_p3 = env_int_p3 + (tl << 2) + ksl_add_p3;

    always_ff @(posedge clk)
        if (env_tmp_p3 < 0)
            env_p4 <= 0;
        else if (env_tmp_p3 > SILENCE)
            env_p4 <= SILENCE;
        else
            env_p4 <= env_tmp_p3;
endmodule
`default_nettype wire  // re-enable implicit net type declarations
