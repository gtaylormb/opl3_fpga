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
	parameter PHASE_ACC_WIDTH = 0, //$ceil($ln(CLK_FREQ/FREQ_RES)/$ln(2)),
	parameter ACTUAL_FREQ_RES = CLK_FREQ/2**PHASE_ACC_WIDTH,
	parameter OUTPUT_WIDTH = 1	
)(
	input wire clk,
	input wire en,
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire [REG_MULT_WIDTH-1:0] mult,
    input wire [REG_BLOCK_WIDTH-1:0] block,
    input wire [REG_WS_WIDTH-1:0] ws,
	output logic signed [OUTPUT_WIDTH-1:0] out
);
    logic [PHASE_ACC_WIDTH-1:0] phase_inc = 0;
    logic [PHASE_ACC_WIDTH-1:0] pre_mult = 0;
    logic [PHASE_ACC_WIDTH-1:0] post_mult = 0;
    
    wire signed [OUTPUT_WIDTH-1:0] nco_out;
    
    always_ff @(posedge clk)
        pre_mult <= fnum << block;
    
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
    
    /*
     * Select waveform
     */
    always_ff @(posedge clk)
        unique case (ws)
        0: out <= nco_out;
        1: out <= nco_out < 0 ? 0 : nco_out;
        2: begin
            out[OUTPUT_WIDTH-1] <= 0;
            out[OUTPUT_WIDTH-2:0] <= nco_out[OUTPUT_WIDTH-2:0];
        end
        3: begin
            out[OUTPUT_WIDTH-1] <= 0;
            out[OUTPUT_WIDTH-2] <= nco_out[OUTPUT_WIDTH-2] == 1'b1 ? 0 : nco_out[OUTPUT_WIDTH-2];
        end
        4: out <= nco_out; // TODO
        5: out <= nco_out; // TODO
        6: out <= nco_out[OUTPUT_WIDTH-1] == 1'b1 ? {1{OUTPUT_WIDTH}} : {0,{1{OUTPUT_WIDTH-1}}};
        7: out <= nco_out; // TODO
        endcase    
    
    nco #(
    	.CLK_FREQ(CLK_FREQ),
    	.FREQ_RES(FREQ_RES),
    	.PHASE_ACC_WIDTH(PHASE_ACC_WIDTH),
    	.OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) nco_inst (
        .out(nco_out),
        .*
    );
endmodule
`default_nettype wire  // re-enable implicit net type declarations