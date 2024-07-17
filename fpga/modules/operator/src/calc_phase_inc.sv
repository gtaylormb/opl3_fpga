/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: calc_phase_inc.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 13 Oct 2014
#
#   DESCRIPTION:
#   Prepare the phase increment for the NCO (calc multiplier and vibrato)
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

module calc_phase_inc
    import opl3_pkg::*;
(
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire [REG_MULT_WIDTH-1:0] mult,
    input wire [REG_BLOCK_WIDTH-1:0] block,
    input wire vib,
    input wire dvb,
    output logic [PHASE_ACC_WIDTH-1:0] phase_inc_p2
);
    localparam PIPELINE_DELAY = 2;

    logic signed [REG_FNUM_WIDTH+2**REG_BLOCK_WIDTH-1-1:0] pre_mult_p0;
    logic signed [REG_FNUM_WIDTH+2**REG_BLOCK_WIDTH-1-1:0] pre_mult_p1 = 0;
    logic signed [PHASE_ACC_WIDTH-1:0] post_mult_p2 = 0;
    logic [VIB_VAL_WIDTH-1:0] vib_val_p2;
    logic [PIPELINE_DELAY:1] vib_p;
    logic [$clog2(30)-1:0] multiplier_p1 = 0;

    always_comb pre_mult_p0 = (fnum << block) >> 1;

    always_ff @(posedge clk)
        unique case (mult)
        'h0: multiplier_p1 <= 1;
        'h1: multiplier_p1 <= 2;
        'h2: multiplier_p1 <= 4;
        'h3: multiplier_p1 <= 6;
        'h4: multiplier_p1 <= 8;
        'h5: multiplier_p1 <= 10;
        'h6: multiplier_p1 <= 12;
        'h7: multiplier_p1 <= 14;
        'h8: multiplier_p1 <= 16;
        'h9: multiplier_p1 <= 18;
        'hA: multiplier_p1 <= 20;
        'hB: multiplier_p1 <= 20;
        'hC: multiplier_p1 <= 24;
        'hD: multiplier_p1 <= 24;
        'hE: multiplier_p1 <= 30;
        'hF: multiplier_p1 <= 30;
        endcase

    always_ff @(posedge clk) begin
        pre_mult_p1 <= pre_mult_p0;
        post_mult_p2 <= (pre_mult_p1*multiplier_p1) >> 1;
    end

    pipeline_sr #(
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) vib_sr (
        .clk,
        .in(vib),
        .out(vib_p)
    );

    always_comb
        if (vib_p[2])
            phase_inc_p2 = post_mult_p2 + vib_val_p2;
        else
            phase_inc_p2 = post_mult_p2;

    /*
     * Calculate vib_val
     */
    vibrato vibrato (
        .*
    );
endmodule
`default_nettype wire
