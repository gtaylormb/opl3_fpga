/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: operator_tb.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 2 Nov 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   2 Nov 2014        Greg Taylor
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
`default_nettype none
`timescale 1ns / 1ps

module operator_tb
    import opl3_pkg::*;
();
    localparam CLK_HALF_PERIOD = 1/real'(CLK_FREQ)*1000e6/2;
    localparam GATE_DELAY = 2; // in ns

    bit clk;
    bit reset = 0;
    logic sample_clk_en;
    logic signed [OP_OUT_WIDTH-1:0] out_p6;
    logic signed [15:0] dac_input;

    bit [REG_FNUM_WIDTH-1:0] fnum = 512;
    bit [REG_MULT_WIDTH-1:0] mult = 5;
    bit [REG_BLOCK_WIDTH-1:0] block = 4;

    bit [REG_WS_WIDTH-1:0] ws = 0;
    bit vib = 0;
    bit dvb = 0;
    bit kon = 0;
    bit [REG_ENV_WIDTH-1:0] ar = 0; // attack rate
    bit [REG_ENV_WIDTH-1:0] dr = 0; // decay rate
    bit [REG_ENV_WIDTH-1:0] sl = 0; // sustain level
    bit [REG_ENV_WIDTH-1:0] rr = 0; // release rate
    bit [REG_TL_WIDTH-1:0] tl = 0;  // total level
    bit ksr = 0;                    // key scale rate
    bit [REG_KSL_WIDTH-1:0] ksl = 0; // key scale level
    bit egt = 0;                     // envelope type
    bit am = 0;                      // amplitude modulation (tremolo)
    bit dam = 0;                     // depth of tremolo
    bit nts = 0;                     // keyboard split selection
    bit use_feedback = 0;
    bit [REG_FB_WIDTH-1:0] fb = 0;
    bit [OP_OUT_WIDTH-1:0] modulation = 0;
    bit bd = 0;
    bit sd = 0;
    bit tom = 0;
    bit tc = 0;
    bit hh = 0;
    bit is_new = 1;
    bit ryt = 0;
    bit use_feedback_p1 = 0;
    bit [REG_FB_WIDTH-1:0] fb_p1 = 0;
    bit signed [OP_OUT_WIDTH-1:0] modulation_p1 = 0;

    bit [BANK_NUM_WIDTH-1:0] bank_num = 1;
    bit [OP_NUM_WIDTH-1:0] op_num = 17;

    always begin
        #CLK_HALF_PERIOD clk = 0;
        #CLK_HALF_PERIOD clk = 1;
    end

    default clocking mclk @(posedge clk);
        default input #1step;
        default output #GATE_DELAY;
        input out_p6;
        output fnum;
        output mult;
        output block;
        output ws;
        output vib;
        output dvb;
        output kon;
        output ar;
        output dr;
        output sl;
        output rr;
        output tl;
        output ksr;
        output ksl;
        output egt;
        output am;
        output dam;
        output nts;
        output fb;
    endclocking

    clk_div #(
        .CLK_DIV_COUNT(CLK_DIV_COUNT)
    ) sample_clk_gen (
        .clk_en(sample_clk_en),
        .*
    );

    operator operator (
        .*
    );

    save_dac_input #(
        .DAC_WIDTH(SAMPLE_WIDTH),
        .NUM_SAMPLES(32*1024),
        .FILENAME("analysis/dac_data.bin")
    ) save_dac_input (
        .dac_input(dac_input),
        .reset(1'b0),
        .clk_en(sample_clk_en),
        .*
    );
    always_comb dac_input = out_p6; // this will sign extend out

    initial begin
        ##10;
        mclk.ar <= 5;
        mclk.dr <= 7;
        mclk.sl <= 2;
        mclk.rr <= 7;
        mclk.tl <= 0;
        mclk.egt <= 1;
        mclk.am <= 0;
        mclk.dam <= 1;
        mclk.fb <= 7;
        ##1000;
        mclk.kon <= 1;
        ##(CLK_FREQ/3);
        mclk.kon <= 0;
        ##12e6;

        mclk.fnum <= 128;
        mclk.mult <= 2;
        mclk.block <= 2;
        mclk.kon <= 1;
        mclk.ar <= 3; // attack rate
        mclk.dr <= 5; // decay rate
        mclk.sl <= 1; // sustain level
        mclk.rr <= 3; // release rate
        mclk.tl <= 1;  // total level
        ##(CLK_FREQ/3);
        mclk.kon <= 0;
        ##12e6;
    end

endmodule
`default_nettype wire
