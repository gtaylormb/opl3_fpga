/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: i2s.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 17 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
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
`default_nettype none  // disable implicit net type declarations

import opl3_pkg::*;

module i2s (
    input wire clk, 
    input wire reset,
    input wire sample_clk_en,
    input wire [SAMPLE_WIDTH-1:0] left_channel,
    input wire [SAMPLE_WIDTH-1:0] right_channel,
    output logic i2s_sclk = 0,
    output logic i2s_ws = 0,
    output logic i2s_sd = 0
);
    localparam BITS_PER_FRAME = 64;
    localparam SCLK_FREQ = SAMPLE_FREQ*BITS_PER_FRAME;
    localparam int SCLK_DIV = CLK_FREQ/SCLK_FREQ/2;
    
    logic i2s_sclk_en;
    logic [$clog2(SCLK_DIV)-1:0] i2s_sclk_counter = 0;
    logic [$clog2(BITS_PER_FRAME)-1:0] bit_counter = 0;
    logic [1:0][SAMPLE_WIDTH-1:0] left_channel_r = 0;
    logic [1:0][SAMPLE_WIDTH-1:0] right_channel_r = 0; 
    logic i2s_sclk_p0 = 0;
    
    always_ff @(posedge clk)
        if (sample_clk_en) begin
            left_channel_r[0] <= left_channel;
            right_channel_r[0] <= right_channel;
        end
        else if (bit_counter == BITS_PER_FRAME - 1 && i2s_sclk_en) begin
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
        0: i2s_sd <= left_channel_r[1][15];
        1: i2s_sd <= left_channel_r[1][14];
        2: i2s_sd <= left_channel_r[1][13];
        3: i2s_sd <= left_channel_r[1][12];
        4: i2s_sd <= left_channel_r[1][11];
        5: i2s_sd <= left_channel_r[1][10];
        6: i2s_sd <= left_channel_r[1][9];
        7: i2s_sd <= left_channel_r[1][8];
        8: i2s_sd <= left_channel_r[1][7];
        9: i2s_sd <= left_channel_r[1][6];
        10: i2s_sd <= left_channel_r[1][5];
        11: i2s_sd <= left_channel_r[1][4];
        12: i2s_sd <= left_channel_r[1][3];
        13: i2s_sd <= left_channel_r[1][2];
        14: i2s_sd <= left_channel_r[1][1];
        15: i2s_sd <= left_channel_r[1][0];
        32: i2s_sd <= right_channel_r[1][15];
        33: i2s_sd <= right_channel_r[1][14];
        34: i2s_sd <= right_channel_r[1][13];
        35: i2s_sd <= right_channel_r[1][12];
        36: i2s_sd <= right_channel_r[1][11];
        37: i2s_sd <= right_channel_r[1][10];
        38: i2s_sd <= right_channel_r[1][9];
        39: i2s_sd <= right_channel_r[1][8];
        40: i2s_sd <= right_channel_r[1][7];
        41: i2s_sd <= right_channel_r[1][6];
        42: i2s_sd <= right_channel_r[1][5];
        43: i2s_sd <= right_channel_r[1][4];
        44: i2s_sd <= right_channel_r[1][3];
        45: i2s_sd <= right_channel_r[1][2];
        46: i2s_sd <= right_channel_r[1][1];
        47: i2s_sd <= right_channel_r[1][0];
        default: i2s_sd <= 0;
        endcase
endmodule
`default_nettype wire  // re-enable implicit net type declarations
