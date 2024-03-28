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
`default_nettype none  // disable implicit net type declarations

module operator
    import opl3_pkg::*;
(
    input wire clk,
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
    input wire kon [NUM_BANKS][NUM_OPERATORS_PER_BANK],
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
    input wire use_feedback,
    input wire [REG_FB_WIDTH-1:0] fb,
    input wire [OP_OUT_WIDTH-1:0] modulation,
    input wire latch_feedback_pulse,
    input var operator_t op_type,
    output logic signed [OP_OUT_WIDTH-1:0] out_p6
);
    logic [PHASE_ACC_WIDTH-1:0] phase_inc_p2;
    logic key_on_pulse_p0;
    logic key_off_pulse_p0;
    logic [ENV_WIDTH-1:0] env_p3;
    logic signed [OP_OUT_WIDTH-1:0] feedback [NUM_BANKS][NUM_OPERATORS_PER_BANK][2] =
     '{default: 0};
    logic signed [OP_OUT_WIDTH-1:0] feedback_result;
    logic signed [OP_OUT_WIDTH+1+2**REG_FB_WIDTH-1:0] feedback_result_p0;
    logic bd_on_pulse;
    logic sd_on_pulse;
    logic tom_on_pulse;
    logic tc_on_pulse;
    logic hh_on_pulse;
    logic rhythm_kon_pulse;
    logic sample_clk_en_p1;
    logic [BANK_NUM_WIDTH-1:0] bank_num_p1;
    logic [OP_NUM_WIDTH-1:0] op_num_p1;
    logic prev_kon;
    logic kon_p1 [NUM_BANKS][NUM_OPERATORS_PER_BANK];

    always_ff @(posedge clk) begin
        sample_clk_en_p1 <= sample_clk_en;
        bank_num_p1 <= bank_num;
        op_num_p1 <= op_num;
        kon_p1 <= kon;
    end

    mem_multi_bank #(
        .type_t(logic),
        .DEPTH(NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) kon_mem (
        .clk,
        .wea(sample_clk_en_p1),
        .reb(sample_clk_en),
        .banka(bank_num_p1),
        .addra(op_num_p1),
        .bankb(bank_num),
        .addrb(op_num),
        .dia(kon_p1[bank_num_p1][op_num_p1]),
        .dob(prev_kon)
    );

    edge_detector #(
        .EDGE_LEVEL(1),
        .CLK_DLY(0)
    ) bd_edge_detect (
        .clk_en(op_type == OP_BASS_DRUM && sample_clk_en),
        .in(bd),
        .edge_detected(bd_on_pulse),
        .*
    );
    edge_detector #(
        .EDGE_LEVEL(1),
        .CLK_DLY(0)
    ) sd_edge_detect (
        .clk_en(op_type == OP_SNARE_DRUM && sample_clk_en),
        .in(sd),
        .edge_detected(sd_on_pulse),
        .*
    );
    edge_detector #(
        .EDGE_LEVEL(1),
        .CLK_DLY(0)
    ) tom_edge_detect (
        .clk_en(op_type == OP_TOM_TOM && sample_clk_en),
        .in(tom),
        .edge_detected(tom_on_pulse),
        .*
    );
    edge_detector #(
        .EDGE_LEVEL(1),
        .CLK_DLY(0)
    ) tc_edge_detect (
        .clk_en(op_type == OP_TOP_CYMBAL && sample_clk_en),
        .in(tc),
        .edge_detected(tc_on_pulse),
        .*
    );
    edge_detector #(
        .EDGE_LEVEL(1),
        .CLK_DLY(0)
    ) hh_edge_detect (
        .clk_en(op_type == OP_HI_HAT && sample_clk_en),
        .in(hh),
        .edge_detected(hh_on_pulse),
        .*
    );

    always_comb rhythm_kon_pulse =
     (op_type == OP_BASS_DRUM && bd_on_pulse) ||
     (op_type == OP_SNARE_DRUM && sd_on_pulse) ||
     (op_type == OP_TOM_TOM && tom_on_pulse) ||
     (op_type == OP_TOP_CYMBAL && tc_on_pulse) ||
     (op_type == OP_HI_HAT && hh_on_pulse);

    always_comb key_on_pulse_p0 = ((!prev_kon && kon[bank_num][op_num]) || rhythm_kon_pulse) && sample_clk_en;
    always_comb key_off_pulse_p0 = prev_kon && !kon[bank_num][op_num] && sample_clk_en;

    /*
     * latch_feedback_pulse comes in the last cycle of the time slot so out has had a
     * chance to propagate through
     */
    always_ff @(posedge clk)
        if (latch_feedback_pulse) begin
            feedback[bank_num][op_num][0] <= out_p6;
            feedback[bank_num][op_num][1] <= feedback[bank_num][op_num][0];
        end

    always_comb
        if (fb == 0)
            feedback_result_p0 = 0;
        else
            feedback_result_p0 = ((feedback[bank_num][op_num][0] +
             feedback[bank_num][op_num][1]) <<< fb);

    always_comb feedback_result = feedback_result_p0 >>> 9;

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
        .modulation(use_feedback ? feedback_result : modulation),
        .*
    );
endmodule
`default_nettype wire  // re-enable implicit net type declarations