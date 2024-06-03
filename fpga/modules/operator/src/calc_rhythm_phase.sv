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
#   3 June 2024     Greg Taylor
#       Refactored to match implementation in https://github.com/nukeykt/Nuked-OPL3
#
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
#   Copyright (C) 2013-2020 Nuke.YKT
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
    input wire [PHASE_FINAL_WIDTH-1:0] phase_p2,
    input var operator_t op_type_p0,
    output logic [PHASE_FINAL_WIDTH-1:0] rhythm_phase_p3 = 0
);
    localparam PIPELINE_DELAY = 3;
    localparam RAND_POLYNOMIAL = 'h800302; // verified on real opl3
    localparam RAND_NUM_WIDTH = $clog2(RAND_POLYNOMIAL);

    logic [PHASE_FINAL_WIDTH-1:0] hh_phase_friend = 0;
    logic [PHASE_FINAL_WIDTH-1:0] tc_phase_friend = 0;
    logic [PHASE_FINAL_WIDTH-1:0] hh_phase_p2;
    logic [PHASE_FINAL_WIDTH-1:0] tc_phase_p2;
    logic rm_xor_p2;
    logic [RAND_NUM_WIDTH-1:0] rand_num = 1;
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
        if (sample_clk_en_p[2] && bank_num_p[2] == 0 && op_num_p[2] == 13)
            hh_phase_friend <= phase_p2;

        // Store the top cymbal phase when it comes by
        if (sample_clk_en_p[2] && bank_num_p[2] == 0 && op_num_p[2] == 17)
            tc_phase_friend <= phase_p2;
    end

    always_comb begin
        hh_phase_p2 = op_type_p[2] == OP_HI_HAT ? phase_p2 : hh_phase_friend;
        tc_phase_p2 = op_type_p[2] == OP_TOP_CYMBAL ? phase_p2 : tc_phase_friend;
        rm_xor_p2 = (hh_phase_p2[2] ^ hh_phase_p2[7]) ||
                    (hh_phase_p2[3] ^ tc_phase_p2[5]) ||
                    (tc_phase_p2[3] ^ tc_phase_p2[5]);
    end

    always_ff @(posedge clk) begin
        unique case (op_type_p[2])
        OP_HI_HAT:     rhythm_phase_p3 <= (rm_xor_p2 << 9) | ((rm_xor_p2 ^ rand_num[0]) ? 'hd0 : 'h34);
        OP_SNARE_DRUM: rhythm_phase_p3 <= (hh_phase_p2[8] << 9) | ((hh_phase_p2[8] ^ rand_num[0]) << 8);
        OP_TOP_CYMBAL: rhythm_phase_p3 <= (rm_xor_p2 << 9) | 'h80;
        default:       rhythm_phase_p3 <= phase_p2; // all others pass through
        endcase
    end

    always_ff @(posedge clk)
        /*
         * Only update once per sample, not every operator time slot
         */
        if (sample_clk_en && bank_num == 0 && op_num == 0)
            if (rand_num & 1)
                rand_num <= (rand_num ^ RAND_POLYNOMIAL) >> 1;
            else
                rand_num <= rand_num >> 1;
endmodule
`default_nettype wire
