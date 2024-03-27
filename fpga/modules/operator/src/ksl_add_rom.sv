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

import opl3_pkg::*;

module ksl_add_rom # (
    KSL_ADD_WIDTH = 8 // do not override
) (
    input wire clk,
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire [REG_BLOCK_WIDTH-1:0] block,
    input wire [REG_KSL_WIDTH-1:0] ksl,
    output logic [KSL_ADD_WIDTH-1:0] ksl_add = 0
);
    logic [6:0] rom_out = 0;
    logic signed [KSL_ADD_WIDTH-1:0] tmp0;
    logic signed [KSL_ADD_WIDTH-1:0] tmp1;
    logic [REG_FNUM_WIDTH-6-1:0] fnum_shifted;
    
    always_comb fnum_shifted = fnum >> 6;
    
    always_ff @(posedge clk)
        unique case (fnum_shifted)
        0: rom_out <= 0;
        1: rom_out <= 32;
        2: rom_out <= 40;
        3: rom_out <= 45;
        4: rom_out <= 48;
        5: rom_out <= 51;
        6: rom_out <= 53;
        7: rom_out <= 55;
        8: rom_out <= 56;
        9: rom_out <= 58;
        10: rom_out <= 59;
        11: rom_out <= 60;
        12: rom_out <= 61;
        13: rom_out <= 62;
        14: rom_out <= 63;
        15: rom_out <= 64;
        endcase
    
    always_comb tmp0 = block - 8;            
    always_comb tmp1 = rom_out + (tmp0 << 3);
    
    always_ff @(posedge clk)
        unique case (ksl)
        0: ksl_add <= 0;
        1: ksl_add <= tmp1 <= 0 ? 0 : tmp1 << 1;
        2: ksl_add <= tmp1 <= 0 ? 0 : tmp1;
        3: ksl_add <= tmp1 <= 0 ? 0 : tmp1 << 2;
        endcase
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	