/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: sin_lut.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 7 Dec 2012
#
#   DESCRIPTION:
#   This is an auto-generated module using the Sine LUT Verilog generator
#   C++ program. It creates a synchronous ROM to store the LUT. It uses a
#   pseudo-random bias rounding strategy. It stores a quarter period of a sine
#   wave and is pipelined--out has 3 pipeline delays from theta. Since all
#   registers are simply pipeline registers they do not require resets.
#
#   CHANGE HISTORY:
#   7 Dec 2012        Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none  // disable implicit net type declarations

module sine_lut (
    input wire clk,
    input wire [9:0] theta,
    output logic signed [15:0] out = 0
);
	logic [15:0] sine = 0;
	logic [7:0] lut_input = 0;
	logic theta9_d0 = 0;
	logic theta9_d1 = 0;

	// sine is 2 pipeline delays behind theta
	always_ff @(posedge clk) begin
		theta9_d0 <= theta[9];
		theta9_d1 <= theta9_d0;
	end

	always_ff @(posedge clk)
		lut_input <= theta[8] ? ~theta[7:0] : theta[7:0];

	always_ff @(posedge clk)
		out <= theta9_d1 ? -sine : sine;

    always_ff @(posedge clk)
        unique case(lut_input)
        8'h0: sine <= 16'h00c9;
        8'h1: sine <= 16'h0192;
        8'h2: sine <= 16'h025b;
        8'h3: sine <= 16'h0324;
        8'h4: sine <= 16'h03ed;
        8'h5: sine <= 16'h04b6;
        8'h6: sine <= 16'h057e;
        8'h7: sine <= 16'h0647;
        8'h8: sine <= 16'h0710;
        8'h9: sine <= 16'h07d9;
        8'ha: sine <= 16'h08a1;
        8'hb: sine <= 16'h096a;
        8'hc: sine <= 16'h0a32;
        8'hd: sine <= 16'h0afb;
        8'he: sine <= 16'h0bc3;
        8'hf: sine <= 16'h0c8b;
        8'h10: sine <= 16'h0d53;
        8'h11: sine <= 16'h0e1b;
        8'h12: sine <= 16'h0ee3;
        8'h13: sine <= 16'h0fab;
        8'h14: sine <= 16'h1072;
        8'h15: sine <= 16'h1139;
        8'h16: sine <= 16'h1201;
        8'h17: sine <= 16'h12c7;
        8'h18: sine <= 16'h138e;
        8'h19: sine <= 16'h1455;
        8'h1a: sine <= 16'h151b;
        8'h1b: sine <= 16'h15e1;
        8'h1c: sine <= 16'h16a7;
        8'h1d: sine <= 16'h176d;
        8'h1e: sine <= 16'h1833;
        8'h1f: sine <= 16'h18f8;
        8'h20: sine <= 16'h19bd;
        8'h21: sine <= 16'h1a82;
        8'h22: sine <= 16'h1b47;
        8'h23: sine <= 16'h1c0b;
        8'h24: sine <= 16'h1ccf;
        8'h25: sine <= 16'h1d93;
        8'h26: sine <= 16'h1e56;
        8'h27: sine <= 16'h1f19;
        8'h28: sine <= 16'h1fdc;
        8'h29: sine <= 16'h209f;
        8'h2a: sine <= 16'h2161;
        8'h2b: sine <= 16'h2223;
        8'h2c: sine <= 16'h22e5;
        8'h2d: sine <= 16'h23a6;
        8'h2e: sine <= 16'h2467;
        8'h2f: sine <= 16'h2527;
        8'h30: sine <= 16'h25e8;
        8'h31: sine <= 16'h26a7;
        8'h32: sine <= 16'h2767;
        8'h33: sine <= 16'h2826;
        8'h34: sine <= 16'h28e5;
        8'h35: sine <= 16'h29a3;
        8'h36: sine <= 16'h2a61;
        8'h37: sine <= 16'h2b1f;
        8'h38: sine <= 16'h2bdc;
        8'h39: sine <= 16'h2c98;
        8'h3a: sine <= 16'h2d55;
        8'h3b: sine <= 16'h2e10;
        8'h3c: sine <= 16'h2ecc;
        8'h3d: sine <= 16'h2f87;
        8'h3e: sine <= 16'h3041;
        8'h3f: sine <= 16'h30fb;
        8'h40: sine <= 16'h31b5;
        8'h41: sine <= 16'h326e;
        8'h42: sine <= 16'h3326;
        8'h43: sine <= 16'h33de;
        8'h44: sine <= 16'h3496;
        8'h45: sine <= 16'h354d;
        8'h46: sine <= 16'h3603;
        8'h47: sine <= 16'h36b9;
        8'h48: sine <= 16'h376f;
        8'h49: sine <= 16'h3824;
        8'h4a: sine <= 16'h38d8;
        8'h4b: sine <= 16'h398c;
        8'h4c: sine <= 16'h3a3f;
        8'h4d: sine <= 16'h3af2;
        8'h4e: sine <= 16'h3ba4;
        8'h4f: sine <= 16'h3c56;
        8'h50: sine <= 16'h3d07;
        8'h51: sine <= 16'h3db7;
        8'h52: sine <= 16'h3e67;
        8'h53: sine <= 16'h3f17;
        8'h54: sine <= 16'h3fc5;
        8'h55: sine <= 16'h4073;
        8'h56: sine <= 16'h4121;
        8'h57: sine <= 16'h41cd;
        8'h58: sine <= 16'h4279;
        8'h59: sine <= 16'h4325;
        8'h5a: sine <= 16'h43d0;
        8'h5b: sine <= 16'h447a;
        8'h5c: sine <= 16'h4524;
        8'h5d: sine <= 16'h45cc;
        8'h5e: sine <= 16'h4675;
        8'h5f: sine <= 16'h471c;
        8'h60: sine <= 16'h47c3;
        8'h61: sine <= 16'h4869;
        8'h62: sine <= 16'h490f;
        8'h63: sine <= 16'h49b3;
        8'h64: sine <= 16'h4a57;
        8'h65: sine <= 16'h4afb;
        8'h66: sine <= 16'h4b9d;
        8'h67: sine <= 16'h4c3f;
        8'h68: sine <= 16'h4ce0;
        8'h69: sine <= 16'h4d81;
        8'h6a: sine <= 16'h4e20;
        8'h6b: sine <= 16'h4ebf;
        8'h6c: sine <= 16'h4f5d;
        8'h6d: sine <= 16'h4ffb;
        8'h6e: sine <= 16'h5097;
        8'h6f: sine <= 16'h5133;
        8'h70: sine <= 16'h51ce;
        8'h71: sine <= 16'h5268;
        8'h72: sine <= 16'h5302;
        8'h73: sine <= 16'h539a;
        8'h74: sine <= 16'h5432;
        8'h75: sine <= 16'h54c9;
        8'h76: sine <= 16'h555f;
        8'h77: sine <= 16'h55f5;
        8'h78: sine <= 16'h5689;
        8'h79: sine <= 16'h571d;
        8'h7a: sine <= 16'h57b0;
        8'h7b: sine <= 16'h5842;
        8'h7c: sine <= 16'h58d3;
        8'h7d: sine <= 16'h5964;
        8'h7e: sine <= 16'h59f3;
        8'h7f: sine <= 16'h5a82;
        8'h80: sine <= 16'h5b0f;
        8'h81: sine <= 16'h5b9c;
        8'h82: sine <= 16'h5c28;
        8'h83: sine <= 16'h5cb3;
        8'h84: sine <= 16'h5d3d;
        8'h85: sine <= 16'h5dc7;
        8'h86: sine <= 16'h5e4f;
        8'h87: sine <= 16'h5ed7;
        8'h88: sine <= 16'h5f5d;
        8'h89: sine <= 16'h5fe3;
        8'h8a: sine <= 16'h6068;
        8'h8b: sine <= 16'h60eb;
        8'h8c: sine <= 16'h616e;
        8'h8d: sine <= 16'h61f0;
        8'h8e: sine <= 16'h6271;
        8'h8f: sine <= 16'h62f1;
        8'h90: sine <= 16'h6370;
        8'h91: sine <= 16'h63ee;
        8'h92: sine <= 16'h646b;
        8'h93: sine <= 16'h64e8;
        8'h94: sine <= 16'h6563;
        8'h95: sine <= 16'h65dd;
        8'h96: sine <= 16'h6656;
        8'h97: sine <= 16'h66cf;
        8'h98: sine <= 16'h6746;
        8'h99: sine <= 16'h67bc;
        8'h9a: sine <= 16'h6831;
        8'h9b: sine <= 16'h68a6;
        8'h9c: sine <= 16'h6919;
        8'h9d: sine <= 16'h698b;
        8'h9e: sine <= 16'h69fc;
        8'h9f: sine <= 16'h6a6d;
        8'ha0: sine <= 16'h6adc;
        8'ha1: sine <= 16'h6b4a;
        8'ha2: sine <= 16'h6bb7;
        8'ha3: sine <= 16'h6c23;
        8'ha4: sine <= 16'h6c8e;
        8'ha5: sine <= 16'h6cf8;
        8'ha6: sine <= 16'h6d61;
        8'ha7: sine <= 16'h6dc9;
        8'ha8: sine <= 16'h6e30;
        8'ha9: sine <= 16'h6e96;
        8'haa: sine <= 16'h6efa;
        8'hab: sine <= 16'h6f5e;
        8'hac: sine <= 16'h6fc1;
        8'had: sine <= 16'h7022;
        8'hae: sine <= 16'h7083;
        8'haf: sine <= 16'h70e2;
        8'hb0: sine <= 16'h7140;
        8'hb1: sine <= 16'h719d;
        8'hb2: sine <= 16'h71f9;
        8'hb3: sine <= 16'h7254;
        8'hb4: sine <= 16'h72ae;
        8'hb5: sine <= 16'h7307;
        8'hb6: sine <= 16'h735e;
        8'hb7: sine <= 16'h73b5;
        8'hb8: sine <= 16'h740a;
        8'hb9: sine <= 16'h745f;
        8'hba: sine <= 16'h74b2;
        8'hbb: sine <= 16'h7504;
        8'hbc: sine <= 16'h7555;
        8'hbd: sine <= 16'h75a5;
        8'hbe: sine <= 16'h75f3;
        8'hbf: sine <= 16'h7641;
        8'hc0: sine <= 16'h768d;
        8'hc1: sine <= 16'h76d8;
        8'hc2: sine <= 16'h7722;
        8'hc3: sine <= 16'h776b;
        8'hc4: sine <= 16'h77b3;
        8'hc5: sine <= 16'h77fa;
        8'hc6: sine <= 16'h783f;
        8'hc7: sine <= 16'h7884;
        8'hc8: sine <= 16'h78c7;
        8'hc9: sine <= 16'h7909;
        8'hca: sine <= 16'h794a;
        8'hcb: sine <= 16'h7989;
        8'hcc: sine <= 16'h79c8;
        8'hcd: sine <= 16'h7a05;
        8'hce: sine <= 16'h7a41;
        8'hcf: sine <= 16'h7a7c;
        8'hd0: sine <= 16'h7ab6;
        8'hd1: sine <= 16'h7aee;
        8'hd2: sine <= 16'h7b26;
        8'hd3: sine <= 16'h7b5c;
        8'hd4: sine <= 16'h7b91;
        8'hd5: sine <= 16'h7bc5;
        8'hd6: sine <= 16'h7bf8;
        8'hd7: sine <= 16'h7c29;
        8'hd8: sine <= 16'h7c59;
        8'hd9: sine <= 16'h7c88;
        8'hda: sine <= 16'h7cb6;
        8'hdb: sine <= 16'h7ce3;
        8'hdc: sine <= 16'h7d0e;
        8'hdd: sine <= 16'h7d39;
        8'hde: sine <= 16'h7d62;
        8'hdf: sine <= 16'h7d89;
        8'he0: sine <= 16'h7db0;
        8'he1: sine <= 16'h7dd5;
        8'he2: sine <= 16'h7dfa;
        8'he3: sine <= 16'h7e1d;
        8'he4: sine <= 16'h7e3e;
        8'he5: sine <= 16'h7e5f;
        8'he6: sine <= 16'h7e7e;
        8'he7: sine <= 16'h7e9c;
        8'he8: sine <= 16'h7eb9;
        8'he9: sine <= 16'h7ed5;
        8'hea: sine <= 16'h7eef;
        8'heb: sine <= 16'h7f09;
        8'hec: sine <= 16'h7f21;
        8'hed: sine <= 16'h7f37;
        8'hee: sine <= 16'h7f4d;
        8'hef: sine <= 16'h7f61;
        8'hf0: sine <= 16'h7f74;
        8'hf1: sine <= 16'h7f86;
        8'hf2: sine <= 16'h7f97;
        8'hf3: sine <= 16'h7fa6;
        8'hf4: sine <= 16'h7fb4;
        8'hf5: sine <= 16'h7fc1;
        8'hf6: sine <= 16'h7fcd;
        8'hf7: sine <= 16'h7fd8;
        8'hf8: sine <= 16'h7fe1;
        8'hf9: sine <= 16'h7fe9;
        8'hfa: sine <= 16'h7ff0;
        8'hfb: sine <= 16'h7ff5;
        8'hfc: sine <= 16'h7ff9;
        8'hfd: sine <= 16'h7ffd;
        8'hfe: sine <= 16'h7ffe;
        8'hff: sine <= 16'h7fff;
        endcase
endmodule
`default_nettype wire  // re-enable implicit net type declarations