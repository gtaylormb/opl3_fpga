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
#   SVN Identification
#   $Id$
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
    logic [KSL_ADD_WIDTH-1:0] tmp;
    
    always_ff @(posedge clk)
        unique case (fnum >> 6)
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
            
    always_comb tmp = rom_out + ((block - 8) << 3);
    
    always_ff @(posedge clk)
        unique case (ksl)
        0: ksl_add <= 0;
        1: ksl_add <= tmp << 1;
        2: ksl_add <= tmp;
        3: ksl_add <= tmp << 2;
        endcase
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	