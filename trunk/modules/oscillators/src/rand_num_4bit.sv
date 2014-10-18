/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: rand_num_4bit.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 12 Dec 2012
#
#   DESCRIPTION:
#   Psuedo random 4-bit number generator using linear feedback shift registers
#
#   CHANGE HISTORY:
#   12 Dec 2012        Greg Taylor
#       Initial version--taken from a design by Ken Andrei2s_ws
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none  // disable implicit net type declarations

module rand_num_4bit (
    input wire clk,
    input wire en,
    output logic [3:0] out
);
	reg [40:0] lfsr0 = 41'b11101000011111010000101011111001010001001;
	reg [41:0] lfsr1 = 42'b100011101101101111111111101100101010001000;
	reg [42:0] lfsr2 = 43'b1110101001001101000111011101110111101100001;
	reg [43:0] lfsr3 = 44'b01010010000111110001001111010111010001011110;
	
	always_ff @(posedge clk)
		if (en) begin
			lfsr0 <= {lfsr0[39:0], lfsr0[40]^lfsr0[5]^lfsr0[4]^lfsr0[3]};
			lfsr1 <= {lfsr1[40:0], lfsr1[41]^lfsr1[3]};
			lfsr2 <= {lfsr2[41:0], lfsr2[42]^lfsr2[5]^lfsr2[4]^lfsr2[3]^lfsr2[2]^lfsr2[1]};
			lfsr3 <= {lfsr3[42:0], lfsr3[43]^lfsr3[6]^lfsr3[4]^lfsr3[3]};
		end

	always_comb out = {lfsr3[0], lfsr2[0], lfsr1[0], lfsr0[0]};
endmodule
`default_nettype wire  // re-enable implicit net type declarations
