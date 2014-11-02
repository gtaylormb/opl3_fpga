/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: operator.sv
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

module operator (
	input wire clk,
	input wire sample_clk_en,
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire [REG_MULT_WIDTH-1:0] mult,
    input wire [REG_BLOCK_WIDTH-1:0] block,
    input wire [REG_WS_WIDTH-1:0] ws,
    input wire vib,
    input wire dvb,
    input wire [ENV_WIDTH-1:0] env,
    input wire kon,    
	output logic signed [OP_OUT_WIDTH-1:0] out
);   
    wire [PHASE_ACC_WIDTH-1:0] phase_inc;
    wire key_on_pulse;
    wire key_off_pulse;
    
    /*
     * Detect key on and key off
     */
    edge_detector #(
        .EDGE_LEVEL(1), 
        .CLK_DLY(1)
    ) key_on_edge_detect (
        .in(kon), 
        .edge_detected(key_on_pulse),
        .*
    );
    edge_detector #(
        .EDGE_LEVEL(0), 
        .CLK_DLY(1)
    ) key_off_edge_detect (
        .in(kon), 
        .edge_detected(key_off_pulse),
        .*
    );      
    
    calc_phase_inc calc_phase_inc (
        .*
    );
        
    phase_generator #(
    	.PHASE_ACC_WIDTH(PHASE_ACC_WIDTH)
    ) phase_generator (
        .*
    );
endmodule
`default_nettype wire  // re-enable implicit net type declarations