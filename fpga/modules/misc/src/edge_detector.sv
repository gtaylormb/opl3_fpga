/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: edge_detector.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 1 April 2009
#
#   DESCRIPTION:
#       Detect edge on i_in. Create single pulse on o_edge_detected upon edge
#       detection. i_in must be synchronous to i_sys_clk (this is not an
#       asynchronous edge detector!). Use 1 clock delay for glitch free output
#       (output registered).
#
#   CHANGE HISTORY:
#   1 April 2009        Greg Taylor
#       Initial version
#   14 Sept 2009        Greg Taylor
#       Added clock delay configuration parameter
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

module edge_detector #(
    parameter EDGE_LEVEL = 1, // 1 = positive edge, 0 = negative edge
    parameter CLK_DLY = 0, // 0 = no clock delay, 1 = 1 clock delay
    parameter INITIAL_INPUT_LEVEL = 0
) (
    input wire clk,
    input wire clk_en,
    input wire in,
    output logic edge_detected = 0
);
    logic in_r0 = INITIAL_INPUT_LEVEL;
    logic in_r1 = INITIAL_INPUT_LEVEL;

    always_ff @(posedge clk)
        if (clk_en) begin
            if (!CLK_DLY)
                in_r0 <= in;
            else begin
                in_r0 <= in;
                in_r1 <= in_r0;
            end
        end

    always_comb
        if (EDGE_LEVEL) begin
            if (!CLK_DLY)
                edge_detected = clk_en && in && !in_r0;
            else
                edge_detected = in_r0 && !in_r1;
        end
        else begin
            if (!CLK_DLY)
                edge_detected = clk_en && !in && in_r0;
            else
                edge_detected = !in_r0 && in_r1;
        end
endmodule
`default_nettype wire
