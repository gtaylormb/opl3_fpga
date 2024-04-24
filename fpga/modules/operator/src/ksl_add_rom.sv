/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: ksl_add_rom.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 31 Oct 2014
#
#   DESCRIPTION:
#   Values extracted from real chip ROM
#
#   CHANGE HISTORY:
#   31 Oct 2014    Greg Taylor
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

module ksl_add_rom
    import opl3_pkg::*;
(
    input wire clk,
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire [REG_BLOCK_WIDTH-1:0] block,
    input wire [REG_KSL_WIDTH-1:0] ksl,
    output logic [KSL_ADD_WIDTH-1:0] ksl_add_p2 = 0
);
    logic [$clog2(64+1)-1:0] rom_out_p1 = 0;
    logic [REG_BLOCK_WIDTH+3-1:0] tmp0_p1 = 0;
    logic signed [KSL_ADD_WIDTH-1:0] tmp1_p1;
    logic [REG_FNUM_WIDTH-6-1:0] fnum_shifted_p0;
    logic [REG_KSL_WIDTH-1:0] ksl_p1 = 0;

    always_comb fnum_shifted_p0 = fnum >> 6;

    always_ff @(posedge clk)
        unique case (fnum_shifted_p0)
        0: rom_out_p1 <= 0;
        1: rom_out_p1 <= 32;
        2: rom_out_p1 <= 40;
        3: rom_out_p1 <= 45;
        4: rom_out_p1 <= 48;
        5: rom_out_p1 <= 51;
        6: rom_out_p1 <= 53;
        7: rom_out_p1 <= 55;
        8: rom_out_p1 <= 56;
        9: rom_out_p1 <= 58;
        10: rom_out_p1 <= 59;
        11: rom_out_p1 <= 60;
        12: rom_out_p1 <= 61;
        13: rom_out_p1 <= 62;
        14: rom_out_p1 <= 63;
        15: rom_out_p1 <= 64;
        endcase

    always_ff @(posedge clk)
        tmp0_p1 <= block - 8;

    always_comb tmp1_p1 = signed'(rom_out_p1 + (tmp0_p1 << 3));

    always_ff @(posedge clk) begin
        ksl_p1 <= ksl;

        unique case (ksl_p1)
        0: ksl_add_p2 <= 0;
        1: ksl_add_p2 <= tmp1_p1 <= 0 ? 0 : tmp1_p1 << 1;
        2: ksl_add_p2 <= tmp1_p1 <= 0 ? 0 : tmp1_p1;
        3: ksl_add_p2 <= tmp1_p1 <= 0 ? 0 : tmp1_p1 << 2;
        endcase
    end
endmodule
`default_nettype wire
