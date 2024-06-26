/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: operator.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 13 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   13 Oct 2014    Greg Taylor
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

module operator
    import opl3_pkg::*;
(
    input wire clk,
    input wire reset,
    input wire sample_clk_en,
    input wire is_new,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire [REG_MULT_WIDTH-1:0] mult,
    input wire [REG_BLOCK_WIDTH-1:0] block,
    input wire [REG_WS_WIDTH-1:0] ws,
    input wire vib,
    input wire dvb,
    input wire kon,
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
    input wire bd,
    input wire sd,
    input wire tom,
    input wire tc,
    input wire hh,
    input wire ryt,
    input wire use_feedback_p1,
    input wire [REG_FB_WIDTH-1:0] fb_p1,
    input wire signed [OP_OUT_WIDTH-1:0] modulation_p1,
    output logic signed [OP_OUT_WIDTH-1:0] out_p6
);
    localparam PIPELINE_DELAY = 6;

    logic [PIPELINE_DELAY:1] sample_clk_en_p;
    logic [PIPELINE_DELAY:1] [BANK_NUM_WIDTH-1:0] bank_num_p;
    logic [PIPELINE_DELAY:1] [OP_NUM_WIDTH-1:0] op_num_p;
    logic [PHASE_ACC_WIDTH-1:0] phase_inc_p2;
    logic key_on_p0_pulse_p0;
    logic key_off_pulse_p0;
    logic [FINAL_ENV_WIDTH-1:0] env_p3;
    logic signed [OP_OUT_WIDTH-1:0] feedback_result_p1;
    logic signed [OP_OUT_WIDTH+1+2**REG_FB_WIDTH-1:0] feedback_result_tmp_p1;
    logic [1:0] [OP_OUT_WIDTH-1:0] feedback_p1;
    logic [1:0] [OP_OUT_WIDTH-1:0] feedback_p6;
    logic [PIPELINE_DELAY:2] [1:0] [OP_OUT_WIDTH-1:0] feedback_p;
    operator_t op_type_p0;
    logic key_on_p0;
    logic pg_reset_p2;

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

    always_comb begin
        op_type_p0 = OP_NORMAL;
        key_on_p0 = kon;

        if (bank_num == 0 && ryt)
            unique case (op_num)
            12, 15:  begin
                op_type_p0 = OP_BASS_DRUM;
                key_on_p0 = bd;
            end
            13: begin
                op_type_p0 = OP_HI_HAT;
                key_on_p0 = hh;
            end
            14: begin
                op_type_p0 = OP_TOM_TOM;
                key_on_p0 = tom;
            end
            16: begin
                op_type_p0 = OP_SNARE_DRUM;
                key_on_p0 = sd;
            end
            17: begin
                op_type_p0 = OP_TOP_CYMBAL;
                key_on_p0 = tc;
            end
            default:;
            endcase
    end

    calc_phase_inc calc_phase_inc (
        .*
    );

    envelope_generator envelope_generator (
        .*
    );

    /*
     * An operator that implements feedback does not take any modulation
     * input (it is always operator 1 in any channel scheme)
     */
    phase_generator phase_generator (
        .modulation_p1(use_feedback_p1 ? feedback_result_p1 : modulation_p1),
        .*
    );

    always_comb begin
        feedback_p6[0] = out_p6;
        feedback_p6[1] = feedback_p[6][0];
    end

    mem_multi_bank #(
        .DATA_WIDTH(OP_OUT_WIDTH*2),
        .DEPTH(NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(1),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) feedback_mem (
        .clk,
        .wea(sample_clk_en_p[6]),
        .reb(sample_clk_en),
        .banka(bank_num_p[6]),
        .addra(op_num_p[6]),
        .bankb(bank_num),
        .addrb(op_num),
        .dia(feedback_p6),
        .dob(feedback_p1)
    );

    pipeline_sr #(
        .DATA_WIDTH(OP_OUT_WIDTH*2),
        .STARTING_CYCLE(2),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) feedback_sr (
        .clk,
        .in(feedback_p1),
        .out(feedback_p)
    );

    always_comb begin
        // used signed casts because signed on packed 2D array in Verilog doesn't apply individually to inner array, only the outer array
        feedback_result_tmp_p1 = fb_p1 == 0 ? 0 : (signed'(feedback_p1[0]) + signed'(feedback_p1[1])) <<< fb_p1;
        feedback_result_p1 = feedback_result_tmp_p1 >>> 9;
    end
endmodule
`default_nettype wire
