/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: pipeline_sr.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 1 April 2024
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   1 April 2024    Greg Taylor
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

module pipeline_sr #(
    parameter DATA_WIDTH = 1,
    parameter STARTING_CYCLE = 1,
    parameter ENDING_CYCLE = 1,
    parameter POR_VALUE = 0 // power on reset value of pipeline registers
) (
    input wire clk,
    input wire [DATA_WIDTH-1:0] in,
    output logic [ENDING_CYCLE:STARTING_CYCLE] [DATA_WIDTH-1:0] out = '{default: POR_VALUE}
);
    always_ff @(posedge clk) begin
        out <= out << DATA_WIDTH;
        out[STARTING_CYCLE] <= in;
    end
endmodule
`default_nettype wire