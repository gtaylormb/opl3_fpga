/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: vibrato.sv
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

module vibrato
    import opl3_pkg::*;
(
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire dvb,
    output logic signed [VIB_VAL_WIDTH:0] vib_val_p0 // signed offset to add to fnum
);
    localparam VIBRATO_INDEX_WIDTH = 13;

    logic [VIBRATO_INDEX_WIDTH-1:0] vibrato_index = 0;
    logic [2:0] vibrato_pos;
    logic [VIB_VAL_WIDTH-1:0] range;

    /*
     * Low-Frequency Oscillator (LFO)
     * 6.07Hz (Sample Freq/2**13), 8 steps of 1024 samples each. Advance once
     * per sample, not once per operator slot.
     */
    always_ff @(posedge clk)
        if (sample_clk_en && bank_num == 0 && op_num == 0)
            vibrato_index <= vibrato_index + 1;

    always_comb vibrato_pos = vibrato_index[VIBRATO_INDEX_WIDTH-1 -: 3];

    /*
     * Triangle 0, +1/2, +1, +1/2, 0, -1/2, -1, -1/2 of the upper 3 bits of
     * fnum, halved again when the vibrato depth bit is clear
     */
    always_comb begin
        range = fnum >> 7;
        if (vibrato_pos[1:0] == 0)
            range = 0;
        else if (vibrato_pos[0])
            range = range >> 1;
        if (!dvb)
            range = range >> 1;
        vib_val_p0 = vibrato_pos[2] ? -$signed({1'b0, range}) : $signed({1'b0, range});
    end
endmodule
`default_nettype wire