/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: i2s.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 17 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   3 Oct 2015         Greg Taylor
#       Converted to 24-bit DAC output
#
#   17 Oct 2014        Greg Taylor
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

import opl3_pkg::*;

module i2s (
    input wire clk,
    input wire sample_valid,
    input wire [DAC_OUTPUT_WIDTH-1:0] left_channel,
    input wire [DAC_OUTPUT_WIDTH-1:0] right_channel,
    output logic i2s_sclk = 0,
    output logic i2s_ws = 0,
    output logic i2s_sd = 0
);
    localparam BITS_PER_FRAME = 64;
    localparam SCLK_FREQ = ACTUAL_SAMPLE_FREQ*BITS_PER_FRAME;
    localparam int SCLK_DIV = CLK_FREQ/SCLK_FREQ/2;

    logic i2s_sclk_en;
    logic [$clog2(SCLK_DIV)-1:0] i2s_sclk_counter = 0;
    logic [$clog2(BITS_PER_FRAME)-1:0] bit_counter = 0;
    logic [1:0][DAC_OUTPUT_WIDTH-1:0] left_channel_r = 0;
    logic [1:0][DAC_OUTPUT_WIDTH-1:0] right_channel_r = 0;
    logic i2s_sclk_p0 = 0;

    /*
     * Double buffer so output doesn't get corrupted in the middle of outputting
     * a sample
     */
    always_ff @(posedge clk)
        if (sample_valid) begin
            left_channel_r[0] <= left_channel;
            right_channel_r[0] <= right_channel;
        end
        else if (bit_counter == BITS_PER_FRAME - 2 && i2s_sclk_en) begin
            left_channel_r[1] <= left_channel_r[0];
            right_channel_r[1] <= right_channel_r[0];
        end

    always_ff @(posedge clk)
        if (i2s_sclk_counter == SCLK_DIV - 1)
            i2s_sclk_counter <= 0;
        else
            i2s_sclk_counter <= i2s_sclk_counter + 1;

    always_ff @(posedge clk)
        if (i2s_sclk_counter == SCLK_DIV - 1)
            i2s_sclk_p0 <= !i2s_sclk_p0;

    always_ff @(posedge clk)
        i2s_sclk <= !i2s_sclk_p0;

    always_comb i2s_sclk_en = i2s_sclk_counter == SCLK_DIV - 1 && !i2s_sclk_p0;

    always_ff @(posedge clk)
        if (i2s_sclk_en)
            if (bit_counter == BITS_PER_FRAME - 1)
                bit_counter <= 0;
            else
                bit_counter <= bit_counter + 1;

        /*
         * Data transitions of i2s_ws and i2s_sd happen to occur on falling edge of i2s_sclk,
         * which is what we want
         */
    always_ff @(posedge clk)
        i2s_ws <= bit_counter >= 31 && bit_counter != 63;

    always_ff @(posedge clk)
        unique case (bit_counter)
        0: i2s_sd <= left_channel_r[1][23];
        1: i2s_sd <= left_channel_r[1][22];
        2: i2s_sd <= left_channel_r[1][21];
        3: i2s_sd <= left_channel_r[1][20];
        4: i2s_sd <= left_channel_r[1][19];
        5: i2s_sd <= left_channel_r[1][18];
        6: i2s_sd <= left_channel_r[1][17];
        7: i2s_sd <= left_channel_r[1][16];
        8: i2s_sd <= left_channel_r[1][15];
        9: i2s_sd <= left_channel_r[1][14];
        10: i2s_sd <= left_channel_r[1][13];
        11: i2s_sd <= left_channel_r[1][12];
        12: i2s_sd <= left_channel_r[1][11];
        13: i2s_sd <= left_channel_r[1][10];
        14: i2s_sd <= left_channel_r[1][9];
        15: i2s_sd <= left_channel_r[1][8];
        16: i2s_sd <= left_channel_r[1][7];
        17: i2s_sd <= left_channel_r[1][6];
        18: i2s_sd <= left_channel_r[1][5];
        19: i2s_sd <= left_channel_r[1][4];
        20: i2s_sd <= left_channel_r[1][3];
        21: i2s_sd <= left_channel_r[1][2];
        22: i2s_sd <= left_channel_r[1][1];
        23: i2s_sd <= left_channel_r[1][0];
        32: i2s_sd <= right_channel_r[1][23];
        33: i2s_sd <= right_channel_r[1][22];
        34: i2s_sd <= right_channel_r[1][21];
        35: i2s_sd <= right_channel_r[1][20];
        36: i2s_sd <= right_channel_r[1][19];
        37: i2s_sd <= right_channel_r[1][18];
        38: i2s_sd <= right_channel_r[1][17];
        39: i2s_sd <= right_channel_r[1][16];
        40: i2s_sd <= right_channel_r[1][15];
        41: i2s_sd <= right_channel_r[1][14];
        42: i2s_sd <= right_channel_r[1][13];
        43: i2s_sd <= right_channel_r[1][12];
        44: i2s_sd <= right_channel_r[1][11];
        45: i2s_sd <= right_channel_r[1][10];
        46: i2s_sd <= right_channel_r[1][9];
        47: i2s_sd <= right_channel_r[1][8];
        48: i2s_sd <= right_channel_r[1][7];
        49: i2s_sd <= right_channel_r[1][6];
        50: i2s_sd <= right_channel_r[1][5];
        51: i2s_sd <= right_channel_r[1][4];
        52: i2s_sd <= right_channel_r[1][3];
        53: i2s_sd <= right_channel_r[1][2];
        54: i2s_sd <= right_channel_r[1][1];
        55: i2s_sd <= right_channel_r[1][0];
        default: i2s_sd <= 0;
        endcase
endmodule
`default_nettype wire
