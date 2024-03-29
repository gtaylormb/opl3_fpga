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

import opl3_pkg::*;

module calc_rhythm_phase (
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,
    input wire [PHASE_ACC_WIDTH-1:0] phase_acc_p2,
    input var operator_t op_type,
    output logic [PHASE_ACC_WIDTH-1:0] rhythm_phase_p2
);
    localparam PIPELINE_DELAY = 2;
    localparam RAND_POLYNOMIAL = 'h800302; // verified on real opl3
    localparam RAND_NUM_WIDTH = $clog2(RAND_POLYNOMIAL);

    /*
     * The hi hat and top cymbal use each other's phase
     */
    logic [PHASE_ACC_WIDTH-10-1:0] cymbal_phase = 0;
    logic [PHASE_ACC_WIDTH-10-1:0] hi_hat_phase = 0;
    logic [PHASE_ACC_WIDTH-10-1:0] friend_phase_p2;
    logic [PHASE_ACC_WIDTH-10-1:0] phase_bit_p2;
    logic [PHASE_ACC_WIDTH-10-1:0] upper_current_phase_p2;
    logic [PHASE_ACC_WIDTH-10-1:0] noise_bit_p2;
    logic [RAND_NUM_WIDTH-1:0] rand_num = 1;
    logic [PIPELINE_DELAY:1] sample_clk_en_p;
    operator_t [PIPELINE_DELAY:1] op_type_p;

    pipeline_sr #(
        .type_t(logic),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) sample_clk_en_sr (
        .clk,
        .in(sample_clk_en),
        .out(sample_clk_en_p)
    );

    pipeline_sr #(
        .type_t(operator_t),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) op_type_sr (
        .clk,
        .in(op_type),
        .out(op_type_p)
    );

    /*
     * Do operations in upper 10 bits, shift back returned value
     */
    always_comb upper_current_phase_p2 = phase_acc_p2 >> 10;

    // store the friend_phase when the relevant phase_acc comes by for later
    always_ff @(posedge clk)
        if (sample_clk_en_p[2]) begin
            if (bank_num == 0 && op_num == 17)
                cymbal_phase <= phase_acc_p2 >> 10;
            if (bank_num == 0 && op_num == 13)
                hi_hat_phase <= phase_acc_p2 >> 10;
        end

    // used in hi hat and top cymbal
    always_comb begin
        friend_phase_p2 = op_type_p[2] == OP_HI_HAT ? cymbal_phase : hi_hat_phase;
        phase_bit_p2 = (((upper_current_phase_p2 & 'h88) ^ ((upper_current_phase_p2 << 5) & 'h80)) |
            ((friend_phase_p2 ^ (friend_phase_p2 << 2)) & 'h20)) ? 'h02 : 'h00;
    end

    // used in hi hat and snare drum
    always_comb noise_bit_p2 = op_type_p[2] == OP_HI_HAT ? rand_num[0] << 1 : rand_num[0] << 8;

    always_comb
        unique case (op_type_p[2])
        OP_NORMAL:     rhythm_phase_p2 = phase_acc_p2;
        OP_BASS_DRUM:  rhythm_phase_p2 = phase_acc_p2;
        OP_HI_HAT:     rhythm_phase_p2 = ((phase_bit_p2 << 8) | ('h34 << (phase_bit_p2 ^ noise_bit_p2))) << 10;
        OP_TOM_TOM:    rhythm_phase_p2 = phase_acc_p2;
        OP_SNARE_DRUM: rhythm_phase_p2 = (('h100 + (upper_current_phase_p2 & 'h100)) ^ noise_bit_p2) << 10;
        OP_TOP_CYMBAL: rhythm_phase_p2 = ((1 + phase_bit_p2) << 8) << 10;
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
`default_nettype wire  // re-enable implicit net type declarations
