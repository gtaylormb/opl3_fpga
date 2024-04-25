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
    input wire [PHASE_ACC_WIDTH-1:0] phase_acc_p3,
    input var operator_t op_type,
    output logic [PHASE_ACC_WIDTH-1:0] rhythm_phase_p3
);
    localparam PIPELINE_DELAY = 3;
    localparam RAND_POLYNOMIAL = 'h800302; // verified on real opl3
    localparam RAND_NUM_WIDTH = $clog2(RAND_POLYNOMIAL);

    logic [PHASE_ACC_WIDTH-1:0] hh_phase_friend = 0;
    logic [PHASE_ACC_WIDTH-1:0] hh_phase_p3;
    logic [PHASE_ACC_WIDTH-1:0] phase_bit_p3;
    logic [PHASE_ACC_WIDTH-1:0] noise_bit_p3;
    logic [RAND_NUM_WIDTH-1:0] rand_num = 1;
    logic [PIPELINE_DELAY:1] sample_clk_en_p;
    logic [PIPELINE_DELAY:1] [$bits(operator_t)-1:0] op_type_p;

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
        .in(op_type),
        .out(op_type_p)
    );

    // Store the hi hat phase when it comes by. It's used in the top symbol and snare drum operators
    always_ff @(posedge clk)
        if (sample_clk_en_p[3] && bank_num == 0 && op_num == 13)
            hh_phase_friend <= phase_acc_p3;

    always_comb begin
        // used in hi hat, top cymbal, and snare drum
        unique case (op_type_p[3])
        OP_SNARE_DRUM: hh_phase_p3 = (hh_phase_friend & 'h100) ? 'h200 : 'h100;
        OP_TOP_CYMBAL: hh_phase_p3 = hh_phase_friend;
        default:       hh_phase_p3 = phase_acc_p3; // hi hat
        endcase

        // used in hi hat and top cymbal
        phase_bit_p3 = (((hh_phase_p3 & 'h88) ^ ((hh_phase_p3 << 5) & 'h80)) |
         ((hh_phase_p3 ^ (hh_phase_p3 << 2)) & 'h20)) ? 'h02 : 'h00;

        // used in hi hat and snare drum
        noise_bit_p3 = op_type_p[3] == OP_HI_HAT ? rand_num[0] << 1 : rand_num[0] << 8;
    end

    always_comb
        unique case (op_type_p[3])
        OP_NORMAL:     rhythm_phase_p3 = phase_acc_p3;
        OP_BASS_DRUM:  rhythm_phase_p3 = phase_acc_p3;
        OP_HI_HAT:     rhythm_phase_p3 = (phase_bit_p3 << 8) | ('h34 << (phase_bit_p3 ^ noise_bit_p3));
        OP_TOM_TOM:    rhythm_phase_p3 = phase_acc_p3;
        OP_SNARE_DRUM: rhythm_phase_p3 = hh_phase_p3 ^ noise_bit_p3;
        OP_TOP_CYMBAL: rhythm_phase_p3 = (1 + phase_bit_p3) << 8;
        endcase

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
