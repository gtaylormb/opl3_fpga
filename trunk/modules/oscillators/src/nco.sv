/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: nco.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 22 June 2012
#
#   DESCRIPTION:
#	Frequency resolution is given by: Fmin = Fclk/2^phase_acc_width.
#   Phase increment may be calculated by: 
#   Pinc = (Fout * 2^phase_acc_width)/Fclk + 0.5
#
#   CHANGE HISTORY:
#   22 June 2012    Greg Taylor
#       Initial version
#
#   24 Oct 2014     Greg Taylor
#       Added Waveform Select (ws) stuff to choose waveform output (for OPL3)
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none // disable implicit net type declarations

import opl3_pkg::*;

module nco #(
	parameter CLK_FREQ = 0, // in Hz
	parameter FREQ_RES = 0,   // required frequency resolution in Hz
	parameter PHASE_ACC_WIDTH = 0,
	parameter OUTPUT_WIDTH = 1,
	parameter LUT_INPUT_WIDTH = 10
)(
	input wire clk,
	input wire en,
	input wire [PHASE_ACC_WIDTH-1:0] phase_inc,
    input wire [REG_WS_WIDTH-1:0] ws,
	output logic signed [OUTPUT_WIDTH-1:0] out
);	
	logic unsigned [PHASE_ACC_WIDTH-1:0] phase_acc = 0;
    
    logic signed [OUTPUT_WIDTH-1:0] lut_out;
    logic signed [OUTPUT_WIDTH-1:0] tmp_ws2;
    logic signed [OUTPUT_WIDTH-1:0] tmp_ws4;
    logic is_odd_period = 0;
    logic lut_msb_pos_edge_pulse;
	
	always_ff @(posedge clk)
		if (en) 
            if (ws == 4 || ws == 5)
                // double the frequency
		        phase_acc <= phase_acc + (phase_inc << 1);
            else
                phase_acc <= phase_acc + phase_inc;
            
        
    always_comb tmp_ws2 = lut_out < 0 ? ~lut_out : lut_out;
    always_comb tmp_ws4 = is_odd_period ? lut_out : 0;
    
    edge_detector #(
        .EDGE_LEVEL(0),
        .CLK_DLY(0)
    ) lut_msg_edge_detect_inst (
        .in(lut_out[OUTPUT_WIDTH-1]),
        .edge_detected(lut_msb_pos_edge_pulse),
        .*
    );    
    
    always_ff @(posedge clk)
        if (lut_msb_pos_edge_pulse)
            is_odd_period <= !is_odd_period;  
        
    /*
     * Select waveform, do proper transformations to the wave
     */
    always_ff @(posedge clk)
        unique case (ws)
        0: out <= lut_out;
        1: out <= lut_out < 0 ? 0 : lut_out;
        2: out <= tmp_ws2;
        3: out <= phase_acc[PHASE_ACC_WIDTH-2] ? 0 : tmp_ws2;
        4: out <= tmp_ws4;
        5: out <= tmp_ws4 < 0 ? ~tmp_ws4 : tmp_ws4;
        6: out <= lut_out > 0 ? 2**(OUTPUT_WIDTH-1) - 1 : -2**(OUTPUT_WIDTH-1);
        7: out <= lut_out; // TODO
        endcase
	
    sine_lut sine_lut_inst (
        .theta(phase_acc[PHASE_ACC_WIDTH-1:PHASE_ACC_WIDTH-LUT_INPUT_WIDTH]),
        .out(lut_out),
    	.*
    );    
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	