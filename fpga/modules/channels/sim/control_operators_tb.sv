/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: control_operators_tb.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 30 Nov 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   30 Nov 2014        Greg Taylor
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

`include "../../top_level/pkg/opl3_pkg.sv"
import opl3_pkg::*;

module control_operators_tb;
    localparam CLK_HALF_PERIOD = 1/real'(CLK_FREQ)*1000e6/2;
    localparam GATE_DELAY = 2; // in ns

    logic clk = 1;
    wire sample_clk_en;

    logic [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel = '{default: '0};
    logic is_new = 0;
    logic nts = 0;                     // keyboard split selection
    logic [REG_FNUM_WIDTH-1:0] fnum [NUM_BANKS][NUM_CHANNELS_PER_BANK] = '{default: '0};
    logic [REG_MULT_WIDTH-1:0] mult [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0};
    logic [REG_BLOCK_WIDTH-1:0] block [NUM_BANKS][NUM_CHANNELS_PER_BANK] = '{default: '0};
    logic [REG_WS_WIDTH-1:0] ws [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0};
    logic vib [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0};
    logic dvb = 0;
    logic kon [NUM_BANKS][NUM_CHANNELS_PER_BANK] = '{default: '0};
    logic [REG_ENV_WIDTH-1:0] ar [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0}; // attack rate
    logic [REG_ENV_WIDTH-1:0] dr [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0}; // decay rate
    logic [REG_ENV_WIDTH-1:0] sl [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0}; // sustain level
    logic [REG_ENV_WIDTH-1:0] rr [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0}; // release rate
    logic [REG_TL_WIDTH-1:0] tl [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0};  // total level
    logic ksr [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0};                    // key scale rate
    logic [REG_KSL_WIDTH-1:0] ksl [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0}; // key scale level
    logic egt [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0};                     // envelope type
    logic am [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0};                      // amplitude modulation (tremolo)
    logic dam = 0;                             // depth of tremolo
    logic ryt = 0;
    logic bd = 0;
    logic sd = 0;
    logic tom = 0;
    logic tc = 0;
    logic hh = 0;
    logic [REG_FB_WIDTH-1:0] fb [NUM_BANKS][NUM_CHANNELS_PER_BANK] = '{default: '0};
    logic cnt [NUM_BANKS][NUM_CHANNELS_PER_BANK] = '{default: '0};
    wire signed [OP_OUT_WIDTH-1:0] operator_out [NUM_BANKS][NUM_OPERATORS_PER_BANK];

    logic signed [SAMPLE_WIDTH-1:0] dac_input [2];
    integer sample_number = 0;

    always begin
        #CLK_HALF_PERIOD clk = 0;
        #CLK_HALF_PERIOD clk = 1;
    end

    default clocking mclk @(posedge clk);
        default input #1step;
        default output #GATE_DELAY;
        /*
         * The clocking block doesn't seem to work so well with multi-dimensional
         * arrays at least in my version of QuestaSim.
         */
    endclocking

    clk_div #(
        .INPUT_CLK_FREQ(CLK_FREQ),
        .OUTPUT_CLK_EN_FREQ(ACTUAL_SAMPLE_FREQ)
    ) sample_clk_gen_inst (
        .clk_en(sample_clk_en),
        .*
    );

    control_operators dut (
        .*
    );

    save_dac_input #(
        .DAC_WIDTH(SAMPLE_WIDTH),
        .NUM_SAMPLES(32*1024),
        .FILENAME("analysis/dac_data0.bin")
    ) save_dac_input0 (
        .dac_input(dac_input[0]),
        .reset(1'b0),
        .clk_en(sample_clk_en),
        .*
    );
    save_dac_input #(
        .DAC_WIDTH(SAMPLE_WIDTH),
        .NUM_SAMPLES(32*1024),
        .FILENAME("analysis/dac_data1.bin")
    ) save_dac_input1 (
        .dac_input(dac_input[1]),
        .reset(1'b0),
        .clk_en(sample_clk_en),
        .*
    );

    always_ff @(posedge clk)
        if (sample_clk_en)
            sample_number <= sample_number + 1;

    always_comb dac_input[0] = operator_out[0][0]; // this will sign extend out
    always_comb dac_input[1] = operator_out[0][3]; // this will sign extend out

    initial begin
        ##10;
        fnum[0][0] = 255;
        mult[0][3] = 10;
        block[0][0] = 3;
        ar[0][3] = 5;
        dr[0][3] = 7;
        sl[0][3] = 2;
        rr[0][3] = 7;
        tl[0][3] = 0;
        egt[0][3] = 1;
        am[0][3] = 0;
        dam = 0;
        ##1000;
        kon[0][0] = 1;
        ##(CLK_FREQ/3);
        kon[0][0] = 0;
        ##12e6;
    end

endmodule
`default_nettype wire
