/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: reset_sync.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 21 July 2009
#
#   DESCRIPTION:
#   To be used as the source for a local reset; takes global asynchronous reset
#   as input. Ensures that deassertion of the local reset signal is synchronous
#   to the local clock signal. Assertion of local reset remains asynchronous.
#   Local reset remains asserted for 2 clock cycles after global asynchronous
#   reset is deasserted. Taken from Xilinx Whitepaper 272.
#   http://www.xilinx.com/support/documentation/white_papers/wp272.pdf
#
#   CHANGE HISTORY:
#   21 July 2009        Greg Taylor
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

module reset_sync (
    input wire clk, // clock domain of the local logic
    input wire arst_n, // global asynchronous active-low reset signal
    output logic reset   // synchronous active-high local reset
);
    (* ASYNC_REG = "true" *)
    logic r0 = 1, r1 = 1, r2 = 1;

    always_ff @(posedge clk or negedge arst_n)
        if (!arst_n) begin
            r0 <= 1;
            r1 <= 1;
            r2 <= 1;
        end
        else begin
            r0 <= 0;
            r1 <= r0;
            r2 <= r1;
        end

    always_comb reset = r2;
endmodule
`default_nettype wire
