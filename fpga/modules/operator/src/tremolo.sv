/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: tremolo.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 2 Nov 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   2 Nov 2014    Greg Taylor
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

module tremolo
    import opl3_pkg::*;
(
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,
    input wire dam, // depth of tremolo
    output logic [AM_VAL_WIDTH-1:0] am_val_p2 = 0
);
    localparam PIPELINE_DELAY = 2;

    logic [TREMOLO_INDEX_WIDTH-1:0] tremolo_index_p1 = '0;
    logic [TREMOLO_INDEX_WIDTH-8-1:0] am_val_tmp0_p1;
    logic [AM_VAL_WIDTH-1:0] am_val_tmp1_p1;
    logic dam_p1 = 0;

    /*
     * Low-Frequency Oscillator (LFO)
     * 3.7 Hz (Sample Freq/2**14)
     */
    always_ff @(posedge clk)
        if (sample_clk_en && bank_num == 0 && op_num == 0)
            if (tremolo_index_p1 == TREMOLO_MAX_COUNT - 1)
                tremolo_index_p1 <= 0;
            else
                tremolo_index_p1 <= tremolo_index_p1 + 1;

    always_comb am_val_tmp0_p1 = tremolo_index_p1 >> 8;

    always_comb
        if (am_val_tmp0_p1 > 26)
            am_val_tmp1_p1 = 2*26 + ~am_val_tmp0_p1;
        else
            am_val_tmp1_p1 = am_val_tmp0_p1;

    always_ff @(posedge clk) begin
        dam_p1 <= dam;

        if (dam_p1)
            am_val_p2 <= am_val_tmp1_p1;
        else
            am_val_p2 <= am_val_tmp1_p1 >> 2;
    end
endmodule
`default_nettype wire
