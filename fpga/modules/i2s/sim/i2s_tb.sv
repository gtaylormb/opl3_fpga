/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: i2s_tb.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 17 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   17 Oct 2014        Greg Taylor
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
`default_nettype none
`timescale 1ns / 1ps

`include "../top_level/pkg/opl3_pkg.sv"
import opl3_pkg::*;

module i2s_tb;
    localparam CLK_HALF_PERIOD = 1/real'(CLK_FREQ)*1000e6/2;
    localparam GATE_DELAY = 2; // in ns

    bit clk;
    wire sample_clk_en;
    bit [DAC_OUTPUT_WIDTH-1:0] left_channel = 0;
    bit [DAC_OUTPUT_WIDTH-1:0] right_channel = 2**16/2;
    wire i2s_sclk;
    wire i2s_ws;
    wire i2s_sd;

    always begin
        #CLK_HALF_PERIOD clk = 0;
        #CLK_HALF_PERIOD clk = 1;
    end

    clk_div #(
        .INPUT_CLK_FREQ(CLK_FREQ),
        .OUTPUT_CLK_EN_FREQ(ACTUAL_SAMPLE_FREQ)
    ) sample_clk_gen_inst (
        .clk_en(sample_clk_en),
        .*
    );

    i2s i2s_inst (
        .*
    );

    always_ff @(posedge clk)
        if (sample_clk_en) begin
            left_channel <= left_channel + 1;
            right_channel <= right_channel + 1;
        end
endmodule
`default_nettype wire
