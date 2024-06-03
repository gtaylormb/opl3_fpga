/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: calc_rhythm_phase.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 25 July 2015
#
#   DESCRIPTION:
#   Does additional transformations to the phase for certain rhythm instruments.
#   Simply passes through the unmodified phase otherwise.
#
#   CHANGE HISTORY:
#   25 July 2015    Greg Taylor
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

module calc_rhythm_phase
    import opl3_pkg::*;
(
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,
    input wire [PHASE_FINAL_WIDTH-1:0] phase_acc_p3,
    input var operator_t op_type_p0,
    output logic [PHASE_FINAL_WIDTH-1:0] rhythm_phase_p3
);
    localparam PIPELINE_DELAY = 3;
    localparam NOISE_WIDTH = 23;

    logic [PHASE_FINAL_WIDTH-1:0] hh_phase_friend = 0;
    logic [PHASE_FINAL_WIDTH-1:0] tc_phase_friend = 0;
    logic [PHASE_FINAL_WIDTH-1:0] hh_phase_p3;
    logic [PHASE_FINAL_WIDTH-1:0] tc_phase_p3;
    logic [PHASE_FINAL_WIDTH-1:0] noise_bit_p3;
    logic [NOISE_WIDTH-1:0] noise = 1;
    logic n_bit;
    logic rm_xor_p3;
    logic [PIPELINE_DELAY:1] sample_clk_en_p;
    logic [PIPELINE_DELAY:1] [$bits(operator_t)-1:0] op_type_p;
    logic [PIPELINE_DELAY:1] [BANK_NUM_WIDTH-1:0] bank_num_p;
    logic [PIPELINE_DELAY:1] [OP_NUM_WIDTH-1:0] op_num_p;

    pipeline_sr #(
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) sample_clk_en_sr (
        .clk,
        .in(sample_clk_en),
        .out(sample_clk_en_p)
    );

    pipeline_sr #(
        .DATA_WIDTH($bits(operator_t)),
        .ENDING_CYCLE(PIPELINE_DELAY),
        .POR_VALUE(OP_NORMAL)
    ) op_type_sr (
        .clk,
        .in(op_type_p0),
        .out(op_type_p)
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

    always_ff @(posedge clk) begin
        // Store the hi hat phase when it comes by
        if (sample_clk_en_p[3] && bank_num_p[3] == 0 && op_num_p[3] == 13)
            hh_phase_friend <= phase_acc_p3;

        // Store the top cymbal phase when it comes by
        if (sample_clk_en_p[3] && bank_num_p[3] == 0 && op_num_p[3] == 17)
            tc_phase_friend <= phase_acc_p3;
    end

    always_comb begin
        hh_phase_p3 = op_type_p0 == OP_HI_HAT ? phase_acc_p3 : hh_phase_friend;
        tc_phase_p3 = op_type_p0 == OP_TOP_CYMBAL ? phase_acc_p3 : tc_phase_friend;
        rm_xor_p3 = (hh_phase_p3[2] ^ hh_phase_p3[7]) ||
                    (hh_phase_p3[3] ^ hh_phase_p3[5]) ||
                    (tc_phase_p3[3] ^ tc_phase_p3[5]);

        rhythm_phase_p3 = phase_acc_p3; // all operators except hi hat, snare drum, and top cymbal pass through

        unique case (op_type_p[3])
        OP_HI_HAT:     rhythm_phase_p3 = (rm_xor_p3 << 9) | ((rm_xor_p3 ^ noise[0]) ? 'hd0 : 'h34);
        OP_SNARE_DRUM: rhythm_phase_p3 = (hh_phase_p3[8] << 9) | ((hh_phase_p3[8] ^ noise[0]) << 8);
        OP_TOP_CYMBAL: rhythm_phase_p3 = (rm_xor_p3 << 9) | 'h80;
        default:;
        endcase

        n_bit = (noise >> 14) ^ noise;
    end

    always_ff @(posedge clk)
        if (sample_clk_en)
            noise <= (noise >> 1) | (n_bit << 22);
endmodule
`default_nettype wire
