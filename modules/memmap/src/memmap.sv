/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: nco_control.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 13 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   13 Oct 2014    Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none  // disable implicit net type declarations

import opl3_pkg::*;

module nco_control #(
	parameter real CLK_FREQ = 0,
	parameter FREQ_RES = 0,
	parameter PHASE_ACC_WIDTH = 20, //$ceil($ln(CLK_FREQ/FREQ_RES)/$ln(2)),
	parameter ACTUAL_FREQ_RES = CLK_FREQ/2**PHASE_ACC_WIDTH,
	parameter OUTPUT_WIDTH = 1	
)(
	input wire clk,	
	input wire reset,
	input wire en,
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire [REG_MULT_WIDTH-1:0] mult,
    input wire [REG_BLOCK_WIDTH-1:0] block,
	output wire [OUTPUT_WIDTH-1:0] out
);
    logic [PHASE_ACC_WIDTH-1:0] phase_inc = 0;
    logic [PHASE_ACC_WIDTH-1:0] pre_mult = 0;
    logic [PHASE_ACC_WIDTH-1:0] post_mult = 0;
    logic [PHASE_ACC_WIDTH-1:0] fnum_shifted = fnum << (PHASE_ACC_WIDTH - REG_FNUM_WIDTH);
    
    always_ff @(posedge clk)
        if (block == 0)
            pre_mult <= fnum_shifted >> block;
        else
            pre_mult <= (fnum_shifted << block - 1) >> 19;
    
	always_ff @(posedge clk)
		unique case (mult)
		'h0: post_mult <= pre_mult >> 1;
        'h1: post_mult <= pre_mult;
        'h2: post_mult <= pre_mult*2;
        'h3: post_mult <= pre_mult*3;
        'h4: post_mult <= pre_mult*4;
        'h5: post_mult <= pre_mult*5;
        'h6: post_mult <= pre_mult*6;
        'h7: post_mult <= pre_mult*7;
        'h8: post_mult <= pre_mult*8;
        'h9: post_mult <= pre_mult*9;
        'hA: post_mult <= pre_mult*10;
        'hB: post_mult <= pre_mult*10;
        'hC: post_mult <= pre_mult*12;
        'hD: post_mult <= pre_mult*12;
        'hE: post_mult <= pre_mult*15;
        'hF: post_mult <= pre_mult*15;
        endcase
            
    always_ff @(posedge clk)
        phase_inc <= post_mult;
    
    nco #(
    	.CLK_FREQ(CLK_FREQ),
    	.FREQ_RES(FREQ_RES),
    	.PHASE_ACC_WIDTH(PHASE_ACC_WIDTH),
    	.OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) nco_inst (.*);
endmodule
`default_nettype wire  // re-enable implicit net type declarations