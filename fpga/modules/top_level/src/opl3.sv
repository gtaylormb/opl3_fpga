/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: opl3.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 24 Feb 2015
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   24 Feb 2015        Greg Taylor
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
`default_nettype none // disable implicit net type declarations

module opl3
    import opl3_pkg::*;
#(
    parameter integer C_S_AXI_DATA_WIDTH = 0,
    parameter NUM_AXI_REGISTERS = 0
) (
    input wire clk125,
    output wire clk,
    output wire i2s_sclk,
    output wire i2s_ws,
    output wire i2s_sd,
    output logic ac_mute_n,
    output logic [3:0] led,
    output logic clk_locked,
    input wire [7:0] slv8_reg[NUM_AXI_REGISTERS*4]
);
    logic reset;
    logic sample_clk_en;

    logic [REG_TIMER_WIDTH-1:0] timer1;
    logic [REG_TIMER_WIDTH-1:0] timer2;
    logic irq_rst;
    logic mt1;
    logic mt2;
    logic st1;
    logic st2;
    logic [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel;
    logic is_new;
    logic nts;                     // keyboard split selection
    logic [REG_FNUM_WIDTH-1:0] fnum [NUM_BANKS][NUM_CHANNELS_PER_BANK];
    logic [REG_MULT_WIDTH-1:0] mult [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    logic [REG_BLOCK_WIDTH-1:0] block [NUM_BANKS][NUM_CHANNELS_PER_BANK];
    logic [REG_WS_WIDTH-1:0] ws [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    logic vib [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    logic dvb;
    logic kon [NUM_BANKS][NUM_CHANNELS_PER_BANK];
    logic [REG_ENV_WIDTH-1:0] ar [NUM_BANKS][NUM_OPERATORS_PER_BANK]; // attack rate
    logic [REG_ENV_WIDTH-1:0] dr [NUM_BANKS][NUM_OPERATORS_PER_BANK]; // decay rate
    logic [REG_ENV_WIDTH-1:0] sl [NUM_BANKS][NUM_OPERATORS_PER_BANK]; // sustain level
    logic [REG_ENV_WIDTH-1:0] rr [NUM_BANKS][NUM_OPERATORS_PER_BANK]; // release rate
    logic [REG_TL_WIDTH-1:0] tl [NUM_BANKS][NUM_OPERATORS_PER_BANK];  // total level
    logic ksr [NUM_BANKS][NUM_OPERATORS_PER_BANK];                    // key scale rate
    logic [REG_KSL_WIDTH-1:0] ksl [NUM_BANKS][NUM_OPERATORS_PER_BANK]; // key scale level
    logic egt [NUM_BANKS][NUM_OPERATORS_PER_BANK];                     // envelope type
    logic am [NUM_BANKS][NUM_OPERATORS_PER_BANK];                      // amplitude modulation (tremolo)
    logic dam;                             // depth of tremolo
    logic ryt;
    logic bd;
    logic sd;
    logic tom;
    logic tc;
    logic hh;
    logic cha [NUM_BANKS][NUM_CHANNELS_PER_BANK];
    logic chb [NUM_BANKS][NUM_CHANNELS_PER_BANK];
    logic chc [NUM_BANKS][NUM_CHANNELS_PER_BANK];
    logic chd [NUM_BANKS][NUM_CHANNELS_PER_BANK];
    logic [REG_FB_WIDTH-1:0] fb [NUM_BANKS][NUM_CHANNELS_PER_BANK];
    logic cnt [NUM_BANKS][NUM_CHANNELS_PER_BANK];
    logic irq;

    logic signed [DAC_OUTPUT_WIDTH-1:0] sample_l = 0;
    logic signed [DAC_OUTPUT_WIDTH-1:0] sample_r = 0;
    logic signed [SAMPLE_WIDTH-1:0] channel_a;
    logic signed [SAMPLE_WIDTH-1:0] channel_b;
    logic signed [SAMPLE_WIDTH-1:0] channel_c;
    logic signed [SAMPLE_WIDTH-1:0] channel_d;

    /*
     * Generate the 12.727MHz clock
     */
    clk_gen clk_gen (
        .*
    );
    always_comb reset = !clk_locked;

    /*
     * Generate the 12.727MHz/256 sample clock enable
     */
    clk_div #(
        .INPUT_CLK_FREQ(CLK_FREQ),
        .OUTPUT_CLK_EN_FREQ(SAMPLE_FREQ)
    ) sample_clk_gen (
        .clk_en(sample_clk_en),
        .*
    );

    channels channels (
        .*
    );

    /*
     * The 4 16-bit output channels are normally combined in the analog domain
     * after the YAC512 DAC outputs. Here we'll just add and output to our DAC
     * in 24-bit mode.
     */
    always_ff @(posedge clk) begin
        sample_l <= (channel_a + channel_c) <<< 6;
        sample_r <= (channel_b + channel_d) <<< 6;
    end

    i2s i2s (
        .left_channel(sample_l),
        .right_channel(sample_r),
        .*
    );

    always_comb led[0] = kon[0][0];
    always_comb led[1] = kon[0][1];
    always_comb led[2] = kon[0][2];
    always_comb led[3] = kon[0][3];

    always_comb ac_mute_n = 1;

    register_file_axi #(
        .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
        .NUM_AXI_REGISTERS(NUM_AXI_REGISTERS)
    ) register_file_axi (
        .*
    );

    /*
     * If we don't need timers, don't instantiate to save area
     */
    generate
    if (INSTANTIATE_TIMERS)
        timers timers (
            .*
        );
    endgenerate
endmodule
`default_nettype wire  // re-enable implicit net type declarations
