/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: mem_simple_dual_port_async_read.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 19 May 2024
#
#   DESCRIPTION:
#   Quartus needs special syn_ramstyle = "MLAB, no_rw_check"
#   directive on RAM to place in MLAB (LUT RAM), otherwise registers get used for async read. Was not able
#   to successfully include this in mem_simple_dual_port even with generate statements
#   so created a separate module. Discovered this directive at https://community.intel.com/t5/Programmable-Devices/Synthesis-ramstyle/m-p/74079
#
#   CHANGE HISTORY:
#   19 May 2024    Greg Taylor
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

module mem_simple_dual_port_async_read #(
    parameter DATA_WIDTH = 0,
    parameter DEPTH = 0,
    parameter logic [DATA_WIDTH-1:0] DEFAULT_VALUE = 0
) (
    input wire clka,
    input wire wea,
    input wire [$clog2(DEPTH)-1:0] addra,
    input wire [$clog2(DEPTH)-1:0] addrb,
    input wire [DATA_WIDTH-1:0] dia,
    output logic [DATA_WIDTH-1:0] dob
);
    /* synthesis syn_ramstyle = "MLAB, no_rw_check" */
    logic [DATA_WIDTH-1:0] ram [DEPTH-1:0] = '{default: DEFAULT_VALUE};

    always_ff @(posedge clka)
        if (wea)
            ram[addra] <= dia;

    always_comb dob = ram[addrb];
endmodule
`default_nettype wire