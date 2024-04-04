/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: opl3_log_out_lut.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 26 Oct 2014
#
#   DESCRIPTION:
#   This is an auto-generated module using a C++ program.
#   It creates a synchronous ROM to store the LUT. It stores a
#	quarter period of a log out wave according to the following formula from
#	"OPLx decapsulated" by Matthew Gambrell and Olli Niemitalo:
#	x <= 0..255, y <= round(-log(sin((x+0.5)*pi/256/2))/log(2)*256)
#
#   CHANGE HISTORY:
#   26 Oct 2014        Greg Taylor
#       Initial version
#
#   Copyright (C) 2014 Greg Taylor <gtaylor@sonic.net>
#
#   This file is part of OPL3 FPGA.
#
#   OPL3 FPGA is free software: you can redistribute it and/or modify
#   it under the terms of the GNU Lesser General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   OPL3 FPGA is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU Lesser General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public License
#   along with OPL3 FPGA.  If not, see <http://www.gnu.org/licenses/>.
#
#   Original Java Code:
#   Copyright (C) 2008 Robson Cozendey <robson@cozendey.com>
#
#   Original C++ Code:
#   Copyright (C) 2012  Steffen Ohrendorf <steffen.ohrendorf@gmx.de>
#
#   Some code based on forum posts in:
#   http://forums.submarine.org.uk/phpBB/viewforum.php?f=9,
#   Copyright (C) 2010-2013 by carbon14 and opl3
#
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none

module opl3_log_sine_lut (
    input wire clk,
    input wire [7:0] theta,
    output logic [11:0] out = 0
);
    always_ff @(posedge clk)
        unique case(theta)
        8'h0: out <= 2137;
        8'h1: out <= 1731;
        8'h2: out <= 1543;
        8'h3: out <= 1419;
        8'h4: out <= 1326;
        8'h5: out <= 1252;
        8'h6: out <= 1190;
        8'h7: out <= 1137;
        8'h8: out <= 1091;
        8'h9: out <= 1050;
        8'ha: out <= 1013;
        8'hb: out <= 979;
        8'hc: out <= 949;
        8'hd: out <= 920;
        8'he: out <= 894;
        8'hf: out <= 869;
        8'h10: out <= 846;
        8'h11: out <= 825;
        8'h12: out <= 804;
        8'h13: out <= 785;
        8'h14: out <= 767;
        8'h15: out <= 749;
        8'h16: out <= 732;
        8'h17: out <= 717;
        8'h18: out <= 701;
        8'h19: out <= 687;
        8'h1a: out <= 672;
        8'h1b: out <= 659;
        8'h1c: out <= 646;
        8'h1d: out <= 633;
        8'h1e: out <= 621;
        8'h1f: out <= 609;
        8'h20: out <= 598;
        8'h21: out <= 587;
        8'h22: out <= 576;
        8'h23: out <= 566;
        8'h24: out <= 556;
        8'h25: out <= 546;
        8'h26: out <= 536;
        8'h27: out <= 527;
        8'h28: out <= 518;
        8'h29: out <= 509;
        8'h2a: out <= 501;
        8'h2b: out <= 492;
        8'h2c: out <= 484;
        8'h2d: out <= 476;
        8'h2e: out <= 468;
        8'h2f: out <= 461;
        8'h30: out <= 453;
        8'h31: out <= 446;
        8'h32: out <= 439;
        8'h33: out <= 432;
        8'h34: out <= 425;
        8'h35: out <= 418;
        8'h36: out <= 411;
        8'h37: out <= 405;
        8'h38: out <= 399;
        8'h39: out <= 392;
        8'h3a: out <= 386;
        8'h3b: out <= 380;
        8'h3c: out <= 375;
        8'h3d: out <= 369;
        8'h3e: out <= 363;
        8'h3f: out <= 358;
        8'h40: out <= 352;
        8'h41: out <= 347;
        8'h42: out <= 341;
        8'h43: out <= 336;
        8'h44: out <= 331;
        8'h45: out <= 326;
        8'h46: out <= 321;
        8'h47: out <= 316;
        8'h48: out <= 311;
        8'h49: out <= 307;
        8'h4a: out <= 302;
        8'h4b: out <= 297;
        8'h4c: out <= 293;
        8'h4d: out <= 289;
        8'h4e: out <= 284;
        8'h4f: out <= 280;
        8'h50: out <= 276;
        8'h51: out <= 271;
        8'h52: out <= 267;
        8'h53: out <= 263;
        8'h54: out <= 259;
        8'h55: out <= 255;
        8'h56: out <= 251;
        8'h57: out <= 248;
        8'h58: out <= 244;
        8'h59: out <= 240;
        8'h5a: out <= 236;
        8'h5b: out <= 233;
        8'h5c: out <= 229;
        8'h5d: out <= 226;
        8'h5e: out <= 222;
        8'h5f: out <= 219;
        8'h60: out <= 215;
        8'h61: out <= 212;
        8'h62: out <= 209;
        8'h63: out <= 205;
        8'h64: out <= 202;
        8'h65: out <= 199;
        8'h66: out <= 196;
        8'h67: out <= 193;
        8'h68: out <= 190;
        8'h69: out <= 187;
        8'h6a: out <= 184;
        8'h6b: out <= 181;
        8'h6c: out <= 178;
        8'h6d: out <= 175;
        8'h6e: out <= 172;
        8'h6f: out <= 169;
        8'h70: out <= 167;
        8'h71: out <= 164;
        8'h72: out <= 161;
        8'h73: out <= 159;
        8'h74: out <= 156;
        8'h75: out <= 153;
        8'h76: out <= 151;
        8'h77: out <= 148;
        8'h78: out <= 146;
        8'h79: out <= 143;
        8'h7a: out <= 141;
        8'h7b: out <= 138;
        8'h7c: out <= 136;
        8'h7d: out <= 134;
        8'h7e: out <= 131;
        8'h7f: out <= 129;
        8'h80: out <= 127;
        8'h81: out <= 125;
        8'h82: out <= 122;
        8'h83: out <= 120;
        8'h84: out <= 118;
        8'h85: out <= 116;
        8'h86: out <= 114;
        8'h87: out <= 112;
        8'h88: out <= 110;
        8'h89: out <= 108;
        8'h8a: out <= 106;
        8'h8b: out <= 104;
        8'h8c: out <= 102;
        8'h8d: out <= 100;
        8'h8e: out <= 98;
        8'h8f: out <= 96;
        8'h90: out <= 94;
        8'h91: out <= 92;
        8'h92: out <= 91;
        8'h93: out <= 89;
        8'h94: out <= 87;
        8'h95: out <= 85;
        8'h96: out <= 83;
        8'h97: out <= 82;
        8'h98: out <= 80;
        8'h99: out <= 78;
        8'h9a: out <= 77;
        8'h9b: out <= 75;
        8'h9c: out <= 74;
        8'h9d: out <= 72;
        8'h9e: out <= 70;
        8'h9f: out <= 69;
        8'ha0: out <= 67;
        8'ha1: out <= 66;
        8'ha2: out <= 64;
        8'ha3: out <= 63;
        8'ha4: out <= 62;
        8'ha5: out <= 60;
        8'ha6: out <= 59;
        8'ha7: out <= 57;
        8'ha8: out <= 56;
        8'ha9: out <= 55;
        8'haa: out <= 53;
        8'hab: out <= 52;
        8'hac: out <= 51;
        8'had: out <= 49;
        8'hae: out <= 48;
        8'haf: out <= 47;
        8'hb0: out <= 46;
        8'hb1: out <= 45;
        8'hb2: out <= 43;
        8'hb3: out <= 42;
        8'hb4: out <= 41;
        8'hb5: out <= 40;
        8'hb6: out <= 39;
        8'hb7: out <= 38;
        8'hb8: out <= 37;
        8'hb9: out <= 36;
        8'hba: out <= 35;
        8'hbb: out <= 34;
        8'hbc: out <= 33;
        8'hbd: out <= 32;
        8'hbe: out <= 31;
        8'hbf: out <= 30;
        8'hc0: out <= 29;
        8'hc1: out <= 28;
        8'hc2: out <= 27;
        8'hc3: out <= 26;
        8'hc4: out <= 25;
        8'hc5: out <= 24;
        8'hc6: out <= 23;
        8'hc7: out <= 23;
        8'hc8: out <= 22;
        8'hc9: out <= 21;
        8'hca: out <= 20;
        8'hcb: out <= 20;
        8'hcc: out <= 19;
        8'hcd: out <= 18;
        8'hce: out <= 17;
        8'hcf: out <= 17;
        8'hd0: out <= 16;
        8'hd1: out <= 15;
        8'hd2: out <= 15;
        8'hd3: out <= 14;
        8'hd4: out <= 13;
        8'hd5: out <= 13;
        8'hd6: out <= 12;
        8'hd7: out <= 12;
        8'hd8: out <= 11;
        8'hd9: out <= 10;
        8'hda: out <= 10;
        8'hdb: out <= 9;
        8'hdc: out <= 9;
        8'hdd: out <= 8;
        8'hde: out <= 8;
        8'hdf: out <= 7;
        8'he0: out <= 7;
        8'he1: out <= 7;
        8'he2: out <= 6;
        8'he3: out <= 6;
        8'he4: out <= 5;
        8'he5: out <= 5;
        8'he6: out <= 5;
        8'he7: out <= 4;
        8'he8: out <= 4;
        8'he9: out <= 4;
        8'hea: out <= 3;
        8'heb: out <= 3;
        8'hec: out <= 3;
        8'hed: out <= 2;
        8'hee: out <= 2;
        8'hef: out <= 2;
        8'hf0: out <= 2;
        8'hf1: out <= 1;
        8'hf2: out <= 1;
        8'hf3: out <= 1;
        8'hf4: out <= 1;
        8'hf5: out <= 1;
        8'hf6: out <= 1;
        8'hf7: out <= 1;
        8'hf8: out <= 0;
        8'hf9: out <= 0;
        8'hfa: out <= 0;
        8'hfb: out <= 0;
        8'hfc: out <= 0;
        8'hfd: out <= 0;
        8'hfe: out <= 0;
        8'hff: out <= 0;
        endcase
endmodule
`default_nettype wire
