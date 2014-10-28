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
	parameter PHASE_ACC_WIDTH = 0,
	parameter LUT_INPUT_WIDTH = 10
)(
	input wire clk,
	input wire en,
	input wire [PHASE_ACC_WIDTH-1:0] phase_inc,
    input wire [REG_WS_WIDTH-1:0] ws,
    input wire [ENV_WIDTH-1:0] env,
	output logic signed [SAMPLE_WIDTH-1:0] out
);	
    localparam LOG_SIN_OUT_WIDTH = 12;
    localparam EXP_IN_WIDTH = 8;
    localparam EXP_OUT_WIDTH = 10;
    localparam LOG_SIN_PLUS_GAIN_WIDTH = 13;
	logic [PHASE_ACC_WIDTH-1:0] phase_acc = 0;
    
    logic signed [LOG_SIN_OUT_WIDTH-1:0] tmp_ws2;
    logic signed [LOG_SIN_OUT_WIDTH-1:0] tmp_ws4;
    logic is_odd_period = 0;
    logic lut_sign_bit_pos_edge_pulse;
    wire [LOG_SIN_OUT_WIDTH-1:0] log_sin_out;
    logic [ENV_WIDTH+3-1:0] env_shifted;
    logic [LOG_SIN_OUT_WIDTH-1:0] post_trans = 0;       
    logic [LOG_SIN_PLUS_GAIN_WIDTH-1:0] log_sin_plus_gain = 0;     
    wire [EXP_OUT_WIDTH-1:0] exp_out;
	logic [SAMPLE_WIDTH-1:0] tmp_out0;
        
    /*
     * Main NCO
     */
	always_ff @(posedge clk)
		if (en) 
            if (ws == 4 || ws == 5)
                // double the frequency
		        phase_acc <= phase_acc + (phase_inc << 1);
            else
                phase_acc <= phase_acc + phase_inc;
            
        
    always_comb tmp_ws2 = log_sin_out < 0 ? ~log_sin_out : log_sin_out;
    always_comb tmp_ws4 = is_odd_period ? log_sin_out : 0;
    
    edge_detector #(
        .EDGE_LEVEL(0),
        .CLK_DLY(0)
    ) lut_msg_edge_detect_inst (
        .in(log_sin_out[LOG_SIN_OUT_WIDTH-1]),
        .edge_detected(lut_sign_bit_pos_edge_pulse),
        .*
    );    
    
    always_ff @(posedge clk)
        if (lut_sign_bit_pos_edge_pulse)
            is_odd_period <= !is_odd_period;  
        
    /*
     * Select waveform, do proper transformations to the wave
     */
    always_ff @(posedge clk)
        unique case (ws)
        0: post_trans <= log_sin_out;
        1: post_trans <= log_sin_out < 0 ? 0 : log_sin_out;
        2: post_trans <= tmp_ws2;
        3: post_trans <= phase_acc[PHASE_ACC_WIDTH-2] ? 0 : tmp_ws2;
        4: post_trans <= tmp_ws4;
        5: post_trans <= tmp_ws4 < 0 ? ~tmp_ws4 : tmp_ws4;
        6: post_trans <= log_sin_out > 0 ? 2**(LOG_SIN_OUT_WIDTH-1) - 1 : -2**(LOG_SIN_OUT_WIDTH-1);
        7: post_trans <= log_sin_out; // TODO
        endcase
	
    opl3_log_sine_lut log_sine_lut_inst (
        .theta(phase_acc[18] ? ~phase_acc[17:10] : phase_acc[17:10]),
        .out(log_sin_out),
    	.*
    );
    
    always_ff @(posedge clk)
        log_sin_plus_gain <= log_sin_out + (env << 3);
        
    opl3_exp_lut exp_lut_inst (
        .in(~log_sin_plus_gain[7:0]),
        .out(exp_out),
        .*
    );
    
    always_ff @(posedge clk)
        tmp_out0 <= (2**10 + exp_out) << 1;
        
    always_ff @(posedge clk)
        if (phase_acc[19])
            out <= ~(tmp_out0 >> log_sin_plus_gain[LOG_SIN_PLUS_GAIN_WIDTH-1:8]);
        else
            out <= tmp_out0 >> log_sin_plus_gain[LOG_SIN_PLUS_GAIN_WIDTH-1:8]; 
    
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	