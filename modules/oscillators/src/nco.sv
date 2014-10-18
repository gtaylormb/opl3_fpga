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
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none // disable implicit net type declarations

module nco #(
	parameter CLK_FREQ = 0, // in Hz
	parameter FREQ_RES = 0,   // required frequency resolution in Hz
	parameter PHASE_ACC_WIDTH = 0,
	parameter OUTPUT_WIDTH = 1,
	parameter LUT_INPUT_WIDTH = 10,
	parameter DITHER = 1,
	parameter DITHER_LEVEL = 6
)(
	input wire clk,
	input wire en,
	input wire [PHASE_ACC_WIDTH-1:0] phase_inc,
	output wire [OUTPUT_WIDTH-1:0] out
);
	localparam DITHER_WIDTH = 4;
	
	logic unsigned [PHASE_ACC_WIDTH-1:0] phase_acc = 0;
	wire [DITHER_WIDTH-1:0] noise;
	
	always_ff @(posedge clk)
		if (en)
		    phase_acc <= phase_acc + phase_inc;
	
	generate
	if (OUTPUT_WIDTH == 1)	    
		assign out = en ? phase_acc[PHASE_ACC_WIDTH-1] : 0;
	else if (DITHER) begin
	    // Add noise to the phase acc before entering sine LUT. This
	    // dithers the phase to increase SFDR. Set dither level to balance
	    // noise floor and SFDR requirements (increasing dither level increases
	    // noise floor, decreases spurs.)
		reg unsigned [PHASE_ACC_WIDTH-1:0] dither = 0;
		
		always_ff @(posedge clk)
			dither <= phase_acc + (noise << DITHER_LEVEL);
			    
        rand_num_4bit rand_num_inst (
            .out(noise),
            .*
        );
			       
        sine_lut sine_lut_inst (
            .theta(dither[PHASE_ACC_WIDTH-1:PHASE_ACC_WIDTH-LUT_INPUT_WIDTH]),
        	.*
        );
	end
	else 
        sine_lut sine_lut_inst (
            .theta(phase_acc[PHASE_ACC_WIDTH-1:PHASE_ACC_WIDTH-LUT_INPUT_WIDTH]),
        	.*
        );    
	endgenerate
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	