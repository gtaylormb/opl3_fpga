/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: opl3_exp_lut.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 26 Oct 2014
#
#   DESCRIPTION:
#   This is an auto-generated module using a C++ program.
#   It creates a synchronous ROM to store the LUT. It stores a
#	quarter period of a log sine wave according to the following formula from
#	"OPLx decapsulated" by Matthew Gambrell and Olli Niemitalo:
#	x <= 0..255, y <= round((power(2, x/256)-1)*1024)
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

module opl3_exp_lut (
    input wire clk,
    input wire [7:0] in,
    output logic [9:0] out = 0
);
    always_ff @(posedge clk)
        unique case(in)
        8'h0: out <= 0;
        8'h1: out <= 3;
        8'h2: out <= 6;
        8'h3: out <= 8;
        8'h4: out <= 11;
        8'h5: out <= 14;
        8'h6: out <= 17;
        8'h7: out <= 20;
        8'h8: out <= 22;
        8'h9: out <= 25;
        8'ha: out <= 28;
        8'hb: out <= 31;
        8'hc: out <= 34;
        8'hd: out <= 37;
        8'he: out <= 40;
        8'hf: out <= 42;
        8'h10: out <= 45;
        8'h11: out <= 48;
        8'h12: out <= 51;
        8'h13: out <= 54;
        8'h14: out <= 57;
        8'h15: out <= 60;
        8'h16: out <= 63;
        8'h17: out <= 66;
        8'h18: out <= 69;
        8'h19: out <= 72;
        8'h1a: out <= 75;
        8'h1b: out <= 78;
        8'h1c: out <= 81;
        8'h1d: out <= 84;
        8'h1e: out <= 87;
        8'h1f: out <= 90;
        8'h20: out <= 93;
        8'h21: out <= 96;
        8'h22: out <= 99;
        8'h23: out <= 102;
        8'h24: out <= 105;
        8'h25: out <= 108;
        8'h26: out <= 111;
        8'h27: out <= 114;
        8'h28: out <= 117;
        8'h29: out <= 120;
        8'h2a: out <= 123;
        8'h2b: out <= 126;
        8'h2c: out <= 130;
        8'h2d: out <= 133;
        8'h2e: out <= 136;
        8'h2f: out <= 139;
        8'h30: out <= 142;
        8'h31: out <= 145;
        8'h32: out <= 148;
        8'h33: out <= 152;
        8'h34: out <= 155;
        8'h35: out <= 158;
        8'h36: out <= 161;
        8'h37: out <= 164;
        8'h38: out <= 168;
        8'h39: out <= 171;
        8'h3a: out <= 174;
        8'h3b: out <= 177;
        8'h3c: out <= 181;
        8'h3d: out <= 184;
        8'h3e: out <= 187;
        8'h3f: out <= 190;
        8'h40: out <= 194;
        8'h41: out <= 197;
        8'h42: out <= 200;
        8'h43: out <= 204;
        8'h44: out <= 207;
        8'h45: out <= 210;
        8'h46: out <= 214;
        8'h47: out <= 217;
        8'h48: out <= 220;
        8'h49: out <= 224;
        8'h4a: out <= 227;
        8'h4b: out <= 231;
        8'h4c: out <= 234;
        8'h4d: out <= 237;
        8'h4e: out <= 241;
        8'h4f: out <= 244;
        8'h50: out <= 248;
        8'h51: out <= 251;
        8'h52: out <= 255;
        8'h53: out <= 258;
        8'h54: out <= 262;
        8'h55: out <= 265;
        8'h56: out <= 268;
        8'h57: out <= 272;
        8'h58: out <= 276;
        8'h59: out <= 279;
        8'h5a: out <= 283;
        8'h5b: out <= 286;
        8'h5c: out <= 290;
        8'h5d: out <= 293;
        8'h5e: out <= 297;
        8'h5f: out <= 300;
        8'h60: out <= 304;
        8'h61: out <= 308;
        8'h62: out <= 311;
        8'h63: out <= 315;
        8'h64: out <= 318;
        8'h65: out <= 322;
        8'h66: out <= 326;
        8'h67: out <= 329;
        8'h68: out <= 333;
        8'h69: out <= 337;
        8'h6a: out <= 340;
        8'h6b: out <= 344;
        8'h6c: out <= 348;
        8'h6d: out <= 352;
        8'h6e: out <= 355;
        8'h6f: out <= 359;
        8'h70: out <= 363;
        8'h71: out <= 367;
        8'h72: out <= 370;
        8'h73: out <= 374;
        8'h74: out <= 378;
        8'h75: out <= 382;
        8'h76: out <= 385;
        8'h77: out <= 389;
        8'h78: out <= 393;
        8'h79: out <= 397;
        8'h7a: out <= 401;
        8'h7b: out <= 405;
        8'h7c: out <= 409;
        8'h7d: out <= 412;
        8'h7e: out <= 416;
        8'h7f: out <= 420;
        8'h80: out <= 424;
        8'h81: out <= 428;
        8'h82: out <= 432;
        8'h83: out <= 436;
        8'h84: out <= 440;
        8'h85: out <= 444;
        8'h86: out <= 448;
        8'h87: out <= 452;
        8'h88: out <= 456;
        8'h89: out <= 460;
        8'h8a: out <= 464;
        8'h8b: out <= 468;
        8'h8c: out <= 472;
        8'h8d: out <= 476;
        8'h8e: out <= 480;
        8'h8f: out <= 484;
        8'h90: out <= 488;
        8'h91: out <= 492;
        8'h92: out <= 496;
        8'h93: out <= 501;
        8'h94: out <= 505;
        8'h95: out <= 509;
        8'h96: out <= 513;
        8'h97: out <= 517;
        8'h98: out <= 521;
        8'h99: out <= 526;
        8'h9a: out <= 530;
        8'h9b: out <= 534;
        8'h9c: out <= 538;
        8'h9d: out <= 542;
        8'h9e: out <= 547;
        8'h9f: out <= 551;
        8'ha0: out <= 555;
        8'ha1: out <= 560;
        8'ha2: out <= 564;
        8'ha3: out <= 568;
        8'ha4: out <= 572;
        8'ha5: out <= 577;
        8'ha6: out <= 581;
        8'ha7: out <= 585;
        8'ha8: out <= 590;
        8'ha9: out <= 594;
        8'haa: out <= 599;
        8'hab: out <= 603;
        8'hac: out <= 607;
        8'had: out <= 612;
        8'hae: out <= 616;
        8'haf: out <= 621;
        8'hb0: out <= 625;
        8'hb1: out <= 630;
        8'hb2: out <= 634;
        8'hb3: out <= 639;
        8'hb4: out <= 643;
        8'hb5: out <= 648;
        8'hb6: out <= 652;
        8'hb7: out <= 657;
        8'hb8: out <= 661;
        8'hb9: out <= 666;
        8'hba: out <= 670;
        8'hbb: out <= 675;
        8'hbc: out <= 680;
        8'hbd: out <= 684;
        8'hbe: out <= 689;
        8'hbf: out <= 693;
        8'hc0: out <= 698;
        8'hc1: out <= 703;
        8'hc2: out <= 708;
        8'hc3: out <= 712;
        8'hc4: out <= 717;
        8'hc5: out <= 722;
        8'hc6: out <= 726;
        8'hc7: out <= 731;
        8'hc8: out <= 736;
        8'hc9: out <= 741;
        8'hca: out <= 745;
        8'hcb: out <= 750;
        8'hcc: out <= 755;
        8'hcd: out <= 760;
        8'hce: out <= 765;
        8'hcf: out <= 770;
        8'hd0: out <= 774;
        8'hd1: out <= 779;
        8'hd2: out <= 784;
        8'hd3: out <= 789;
        8'hd4: out <= 794;
        8'hd5: out <= 799;
        8'hd6: out <= 804;
        8'hd7: out <= 809;
        8'hd8: out <= 814;
        8'hd9: out <= 819;
        8'hda: out <= 824;
        8'hdb: out <= 829;
        8'hdc: out <= 834;
        8'hdd: out <= 839;
        8'hde: out <= 844;
        8'hdf: out <= 849;
        8'he0: out <= 854;
        8'he1: out <= 859;
        8'he2: out <= 864;
        8'he3: out <= 869;
        8'he4: out <= 874;
        8'he5: out <= 880;
        8'he6: out <= 885;
        8'he7: out <= 890;
        8'he8: out <= 895;
        8'he9: out <= 900;
        8'hea: out <= 906;
        8'heb: out <= 911;
        8'hec: out <= 916;
        8'hed: out <= 921;
        8'hee: out <= 927;
        8'hef: out <= 932;
        8'hf0: out <= 937;
        8'hf1: out <= 942;
        8'hf2: out <= 948;
        8'hf3: out <= 953;
        8'hf4: out <= 959;
        8'hf5: out <= 964;
        8'hf6: out <= 969;
        8'hf7: out <= 975;
        8'hf8: out <= 980;
        8'hf9: out <= 986;
        8'hfa: out <= 991;
        8'hfb: out <= 996;
        8'hfc: out <= 1002;
        8'hfd: out <= 1007;
        8'hfe: out <= 1013;
        8'hff: out <= 1018;
        endcase
endmodule
`default_nettype wire
