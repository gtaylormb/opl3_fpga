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

    logic [5:0] sub_count = 0;
    logic [7:0] trem_pos = 0; // 0..209
    logic [6:0] trem_tri;     // 0..105
    logic dam_p1 = 0;

    /*
     * Low-Frequency Oscillator (LFO)
     * 210 step triangle advanced every 64 samples: period 13440 samples,
     * 3.7 Hz, as in the YMF262 (see Nuked-OPL3 tremolopos)
     */
    always_ff @(posedge clk)
        if (sample_clk_en && bank_num == 0 && op_num == 0) begin
            sub_count <= sub_count + 1;
            if (sub_count == 63)
                trem_pos <= trem_pos == 209 ? 0 : trem_pos + 1;
        end

    always_comb trem_tri = trem_pos < 105 ? 7'(trem_pos) : 7'(210 - trem_pos);

    always_ff @(posedge clk) begin
        dam_p1 <= dam;
        am_val_p2 <= dam_p1 ? AM_VAL_WIDTH'(trem_tri >> 2) : AM_VAL_WIDTH'(trem_tri >> 4);
    end
endmodule
`default_nettype wire
