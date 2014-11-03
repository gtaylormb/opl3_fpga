/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: phase_generator.sv
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
`default_nettype none // disable implicit net type declarations

import opl3_pkg::*;

module phase_generator (
    input wire clk,
	input wire sample_clk_en,
	input wire [PHASE_ACC_WIDTH-1:0] phase_inc,
    input wire [REG_WS_WIDTH-1:0] ws,
    input wire [ENV_WIDTH-1:0] env,
    input wire key_on_pulse,
	output logic signed [OP_OUT_WIDTH-1:0] out
);	
    localparam LOG_SIN_OUT_WIDTH = 12;
    localparam EXP_IN_WIDTH = 8;
    localparam EXP_OUT_WIDTH = 10;
    localparam LOG_SIN_PLUS_GAIN_WIDTH = 13;
	logic [PHASE_ACC_WIDTH-1:0] phase_acc = 0;
    
    logic is_odd_period = 0;
    logic phase_acc_msb_pos_edge_pulse;
    wire [LOG_SIN_OUT_WIDTH-1:0] log_sin_out; 
    logic [LOG_SIN_PLUS_GAIN_WIDTH-1:0] log_sin_plus_gain = 0;     
    wire [EXP_OUT_WIDTH-1:0] exp_out;
	logic [OP_OUT_WIDTH-1:0] tmp_out0;
    logic signed [OP_OUT_WIDTH-1:0] tmp_out1;
    logic signed [OP_OUT_WIDTH-1:0] tmp_ws2;
    logic signed [OP_OUT_WIDTH-1:0] tmp_ws4;  
    logic [LOG_SIN_OUT_WIDTH-1:0] tmp_ws7; 
        
    /*
     * Phase Accumulator
     */
	always_ff @(posedge clk)
		if (sample_clk_en)
            if (key_on_pulse)
                phase_acc <= 0;
            else if (ws == 4 || ws == 5)
                // double the frequency
		        phase_acc <= phase_acc + (phase_inc << 1);
            else
                phase_acc <= phase_acc + phase_inc;           
        
    always_comb tmp_ws2 = tmp_out1 < 0 ? ~tmp_out1 : tmp_out1;
    always_comb tmp_ws4 = is_odd_period ? tmp_out1 : 0;
    
    edge_detector #(
        .EDGE_LEVEL(0),
        .CLK_DLY(0)
    ) phase_acc_msb_edge_detect (
        .clk_en(1'b1),
        .in(phase_acc[19]),
        .edge_detected(phase_acc_msb_pos_edge_pulse),
        .*
    );
    
    always_ff @(posedge clk)
        if (phase_acc_msb_pos_edge_pulse)
            is_odd_period <= !is_odd_period;  
        
    /*
     * Select waveform, do proper transformations to the wave
     */
    always_ff @(posedge clk)
        unique case (ws)
        0: out <= tmp_out1;
        1: out <= tmp_out1 < 0 ? 0 : tmp_out1;
        2: out <= tmp_ws2;
        3: out <= phase_acc[PHASE_ACC_WIDTH-2] ? 0 : tmp_ws2;
        4: out <= tmp_ws4;
        5: out <= tmp_ws4 < 0 ? ~tmp_ws4 : tmp_ws4;
        6: out <= tmp_out1 > 0 ? 2**(OP_OUT_WIDTH-1) - 1 : -2**(OP_OUT_WIDTH-1);
        7: out <= tmp_out1;
        endcase
	
    opl3_log_sine_lut log_sine_lut_inst (
        .theta(phase_acc[18] ? ~phase_acc[17:10] : phase_acc[17:10]),
        .out(log_sin_out),
    	.*
    );
    
    /*
     * Setting the msb effectively mutes. Mute 2nd and 3rd quadrant.
     */
    always_comb
        unique case (phase_acc[19:18])
        0: tmp_ws7[11] = 0;
        1: tmp_ws7[11] = 1;
        2: tmp_ws7[11] = 1;
        3: tmp_ws7[11] = 0;
        endcase
        
    always_comb tmp_ws7[10:0] = phase_acc[19] ? ~phase_acc[17:10] << 3 : phase_acc[17:10] << 3;        
    
    always_ff @(posedge clk)
        log_sin_plus_gain <= (ws == 7 ? tmp_ws7 : log_sin_out) + (env << 3);
        
    opl3_exp_lut exp_lut_inst (
        .in(~log_sin_plus_gain[7:0]),
        .out(exp_out),
        .*
    );
    
    always_ff @(posedge clk)
        tmp_out0 <= (2**10 + exp_out) << 1;
        
    always_ff @(posedge clk)
        if (phase_acc[19])
            tmp_out1 <= ~(tmp_out0 >> log_sin_plus_gain[LOG_SIN_PLUS_GAIN_WIDTH-1:8]);
        else
            tmp_out1 <= tmp_out0 >> log_sin_plus_gain[LOG_SIN_PLUS_GAIN_WIDTH-1:8]; 
    
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	