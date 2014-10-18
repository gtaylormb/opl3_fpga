/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: exp_lut.sv
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

module exp_lut (
    input wire clk,
    input wire [9:0] theta,
    output logic [15:0] out = 0
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
        8'h0: sine <= 16'h80c9;
        8'h1: sine <= 16'h8192;
        8'h2: sine <= 16'h825b;
        8'h3: sine <= 16'h8324;
        8'h4: sine <= 16'h83ed;
        8'h5: sine <= 16'h84b6;
        8'h6: sine <= 16'h857e;
        8'h7: sine <= 16'h8647;
        8'h8: sine <= 16'h8710;
        8'h9: sine <= 16'h87d9;
        8'ha: sine <= 16'h88a1;
        8'hb: sine <= 16'h896a;
        8'hc: sine <= 16'h8a32;
        8'hd: sine <= 16'h8afb;
        8'he: sine <= 16'h8bc3;
        8'hf: sine <= 16'h8c8b;
        8'h10: sine <= 16'h8d53;
        8'h11: sine <= 16'h8e1b;
        8'h12: sine <= 16'h8ee3;
        8'h13: sine <= 16'h8fab;
        8'h14: sine <= 16'h9072;
        8'h15: sine <= 16'h9139;
        8'h16: sine <= 16'h9201;
        8'h17: sine <= 16'h92c7;
        8'h18: sine <= 16'h938e;
        8'h19: sine <= 16'h9455;
        8'h1a: sine <= 16'h951b;
        8'h1b: sine <= 16'h95e1;
        8'h1c: sine <= 16'h96a7;
        8'h1d: sine <= 16'h976d;
        8'h1e: sine <= 16'h9833;
        8'h1f: sine <= 16'h98f8;
        8'h20: sine <= 16'h99bd;
        8'h21: sine <= 16'h9a82;
        8'h22: sine <= 16'h9b47;
        8'h23: sine <= 16'h9c0b;
        8'h24: sine <= 16'h9ccf;
        8'h25: sine <= 16'h9d93;
        8'h26: sine <= 16'h9e56;
        8'h27: sine <= 16'h9f19;
        8'h28: sine <= 16'h9fdc;
        8'h29: sine <= 16'ha09f;
        8'h2a: sine <= 16'ha161;
        8'h2b: sine <= 16'ha223;
        8'h2c: sine <= 16'ha2e5;
        8'h2d: sine <= 16'ha3a6;
        8'h2e: sine <= 16'ha467;
        8'h2f: sine <= 16'ha527;
        8'h30: sine <= 16'ha5e8;
        8'h31: sine <= 16'ha6a7;
        8'h32: sine <= 16'ha767;
        8'h33: sine <= 16'ha826;
        8'h34: sine <= 16'ha8e5;
        8'h35: sine <= 16'ha9a3;
        8'h36: sine <= 16'haa61;
        8'h37: sine <= 16'hab1f;
        8'h38: sine <= 16'habdc;
        8'h39: sine <= 16'hac98;
        8'h3a: sine <= 16'had55;
        8'h3b: sine <= 16'hae10;
        8'h3c: sine <= 16'haecc;
        8'h3d: sine <= 16'haf87;
        8'h3e: sine <= 16'hb041;
        8'h3f: sine <= 16'hb0fb;
        8'h40: sine <= 16'hb1b5;
        8'h41: sine <= 16'hb26e;
        8'h42: sine <= 16'hb326;
        8'h43: sine <= 16'hb3de;
        8'h44: sine <= 16'hb496;
        8'h45: sine <= 16'hb54d;
        8'h46: sine <= 16'hb603;
        8'h47: sine <= 16'hb6b9;
        8'h48: sine <= 16'hb76f;
        8'h49: sine <= 16'hb824;
        8'h4a: sine <= 16'hb8d8;
        8'h4b: sine <= 16'hb98c;
        8'h4c: sine <= 16'hba3f;
        8'h4d: sine <= 16'hbaf2;
        8'h4e: sine <= 16'hbba4;
        8'h4f: sine <= 16'hbc56;
        8'h50: sine <= 16'hbd07;
        8'h51: sine <= 16'hbdb7;
        8'h52: sine <= 16'hbe67;
        8'h53: sine <= 16'hbf17;
        8'h54: sine <= 16'hbfc5;
        8'h55: sine <= 16'hc073;
        8'h56: sine <= 16'hc121;
        8'h57: sine <= 16'hc1cd;
        8'h58: sine <= 16'hc279;
        8'h59: sine <= 16'hc325;
        8'h5a: sine <= 16'hc3d0;
        8'h5b: sine <= 16'hc47a;
        8'h5c: sine <= 16'hc524;
        8'h5d: sine <= 16'hc5cc;
        8'h5e: sine <= 16'hc675;
        8'h5f: sine <= 16'hc71c;
        8'h60: sine <= 16'hc7c3;
        8'h61: sine <= 16'hc869;
        8'h62: sine <= 16'hc90f;
        8'h63: sine <= 16'hc9b3;
        8'h64: sine <= 16'hca57;
        8'h65: sine <= 16'hcafb;
        8'h66: sine <= 16'hcb9d;
        8'h67: sine <= 16'hcc3f;
        8'h68: sine <= 16'hcce0;
        8'h69: sine <= 16'hcd81;
        8'h6a: sine <= 16'hce20;
        8'h6b: sine <= 16'hcebf;
        8'h6c: sine <= 16'hcf5d;
        8'h6d: sine <= 16'hcffb;
        8'h6e: sine <= 16'hd097;
        8'h6f: sine <= 16'hd133;
        8'h70: sine <= 16'hd1ce;
        8'h71: sine <= 16'hd268;
        8'h72: sine <= 16'hd302;
        8'h73: sine <= 16'hd39a;
        8'h74: sine <= 16'hd432;
        8'h75: sine <= 16'hd4c9;
        8'h76: sine <= 16'hd55f;
        8'h77: sine <= 16'hd5f5;
        8'h78: sine <= 16'hd689;
        8'h79: sine <= 16'hd71d;
        8'h7a: sine <= 16'hd7b0;
        8'h7b: sine <= 16'hd842;
        8'h7c: sine <= 16'hd8d3;
        8'h7d: sine <= 16'hd964;
        8'h7e: sine <= 16'hd9f3;
        8'h7f: sine <= 16'hda82;
        8'h80: sine <= 16'hdb0f;
        8'h81: sine <= 16'hdb9c;
        8'h82: sine <= 16'hdc28;
        8'h83: sine <= 16'hdcb3;
        8'h84: sine <= 16'hdd3d;
        8'h85: sine <= 16'hddc7;
        8'h86: sine <= 16'hde4f;
        8'h87: sine <= 16'hded7;
        8'h88: sine <= 16'hdf5d;
        8'h89: sine <= 16'hdfe3;
        8'h8a: sine <= 16'he068;
        8'h8b: sine <= 16'he0eb;
        8'h8c: sine <= 16'he16e;
        8'h8d: sine <= 16'he1f0;
        8'h8e: sine <= 16'he271;
        8'h8f: sine <= 16'he2f1;
        8'h90: sine <= 16'he370;
        8'h91: sine <= 16'he3ee;
        8'h92: sine <= 16'he46b;
        8'h93: sine <= 16'he4e8;
        8'h94: sine <= 16'he563;
        8'h95: sine <= 16'he5dd;
        8'h96: sine <= 16'he656;
        8'h97: sine <= 16'he6cf;
        8'h98: sine <= 16'he746;
        8'h99: sine <= 16'he7bc;
        8'h9a: sine <= 16'he831;
        8'h9b: sine <= 16'he8a6;
        8'h9c: sine <= 16'he919;
        8'h9d: sine <= 16'he98b;
        8'h9e: sine <= 16'he9fc;
        8'h9f: sine <= 16'hea6d;
        8'ha0: sine <= 16'headc;
        8'ha1: sine <= 16'heb4a;
        8'ha2: sine <= 16'hebb7;
        8'ha3: sine <= 16'hec23;
        8'ha4: sine <= 16'hec8e;
        8'ha5: sine <= 16'hecf8;
        8'ha6: sine <= 16'hed61;
        8'ha7: sine <= 16'hedc9;
        8'ha8: sine <= 16'hee30;
        8'ha9: sine <= 16'hee96;
        8'haa: sine <= 16'heefa;
        8'hab: sine <= 16'hef5e;
        8'hac: sine <= 16'hefc1;
        8'had: sine <= 16'hf022;
        8'hae: sine <= 16'hf083;
        8'haf: sine <= 16'hf0e2;
        8'hb0: sine <= 16'hf140;
        8'hb1: sine <= 16'hf19d;
        8'hb2: sine <= 16'hf1f9;
        8'hb3: sine <= 16'hf254;
        8'hb4: sine <= 16'hf2ae;
        8'hb5: sine <= 16'hf307;
        8'hb6: sine <= 16'hf35e;
        8'hb7: sine <= 16'hf3b5;
        8'hb8: sine <= 16'hf40a;
        8'hb9: sine <= 16'hf45f;
        8'hba: sine <= 16'hf4b2;
        8'hbb: sine <= 16'hf504;
        8'hbc: sine <= 16'hf555;
        8'hbd: sine <= 16'hf5a5;
        8'hbe: sine <= 16'hf5f3;
        8'hbf: sine <= 16'hf641;
        8'hc0: sine <= 16'hf68d;
        8'hc1: sine <= 16'hf6d8;
        8'hc2: sine <= 16'hf722;
        8'hc3: sine <= 16'hf76b;
        8'hc4: sine <= 16'hf7b3;
        8'hc5: sine <= 16'hf7fa;
        8'hc6: sine <= 16'hf83f;
        8'hc7: sine <= 16'hf884;
        8'hc8: sine <= 16'hf8c7;
        8'hc9: sine <= 16'hf909;
        8'hca: sine <= 16'hf94a;
        8'hcb: sine <= 16'hf989;
        8'hcc: sine <= 16'hf9c8;
        8'hcd: sine <= 16'hfa05;
        8'hce: sine <= 16'hfa41;
        8'hcf: sine <= 16'hfa7c;
        8'hd0: sine <= 16'hfab6;
        8'hd1: sine <= 16'hfaee;
        8'hd2: sine <= 16'hfb26;
        8'hd3: sine <= 16'hfb5c;
        8'hd4: sine <= 16'hfb91;
        8'hd5: sine <= 16'hfbc5;
        8'hd6: sine <= 16'hfbf8;
        8'hd7: sine <= 16'hfc29;
        8'hd8: sine <= 16'hfc59;
        8'hd9: sine <= 16'hfc88;
        8'hda: sine <= 16'hfcb6;
        8'hdb: sine <= 16'hfce3;
        8'hdc: sine <= 16'hfd0e;
        8'hdd: sine <= 16'hfd39;
        8'hde: sine <= 16'hfd62;
        8'hdf: sine <= 16'hfd89;
        8'he0: sine <= 16'hfdb0;
        8'he1: sine <= 16'hfdd5;
        8'he2: sine <= 16'hfdfa;
        8'he3: sine <= 16'hfe1d;
        8'he4: sine <= 16'hfe3e;
        8'he5: sine <= 16'hfe5f;
        8'he6: sine <= 16'hfe7e;
        8'he7: sine <= 16'hfe9c;
        8'he8: sine <= 16'hfeb9;
        8'he9: sine <= 16'hfed5;
        8'hea: sine <= 16'hfeef;
        8'heb: sine <= 16'hff09;
        8'hec: sine <= 16'hff21;
        8'hed: sine <= 16'hff37;
        8'hee: sine <= 16'hff4d;
        8'hef: sine <= 16'hff61;
        8'hf0: sine <= 16'hff74;
        8'hf1: sine <= 16'hff86;
        8'hf2: sine <= 16'hff97;
        8'hf3: sine <= 16'hffa6;
        8'hf4: sine <= 16'hffb4;
        8'hf5: sine <= 16'hffc1;
        8'hf6: sine <= 16'hffcd;
        8'hf7: sine <= 16'hffd8;
        8'hf8: sine <= 16'hffe1;
        8'hf9: sine <= 16'hffe9;
        8'hfa: sine <= 16'hfff0;
        8'hfb: sine <= 16'hfff5;
        8'hfc: sine <= 16'hfff9;
        8'hfd: sine <= 16'hfffd;
        8'hfe: sine <= 16'hfffe;
        8'hff: sine <= 16'hffff;
        endcase
endmodule
`default_nettype wire  // re-enable implicit net type declarations