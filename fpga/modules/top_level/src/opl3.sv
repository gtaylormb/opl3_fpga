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
(
    input wire clk, // opl3 clk
    input wire clk_host,
    input wire ic_n, // clk_host reset
    input wire cs_n,
    input wire rd_n,
    input wire wr_n,
    input wire [1:0] address,
    input wire [REG_FILE_DATA_WIDTH-1:0] din,
    output logic [REG_FILE_DATA_WIDTH-1:0] dout,
    output logic ack_host_wr, // host needs to hold writes for clock domain crossing
    output logic sample_valid,
    output logic signed [DAC_OUTPUT_WIDTH-1:0] sample_l,
    output logic signed [DAC_OUTPUT_WIDTH-1:0] sample_r,
    output logic [NUM_LEDS-1:0] led = 0,
    output logic irq_n
);
    logic reset;
    logic sample_clk_en;

    opl3_reg_wr_t opl3_reg_wr;
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
    logic dvb;
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
    logic cnt [NUM_BANKS][NUM_CHANNELS_PER_BANK];
    logic signed [SAMPLE_WIDTH-1:0] channel_a;
    logic signed [SAMPLE_WIDTH-1:0] channel_b;
    logic signed [SAMPLE_WIDTH-1:0] channel_c;
    logic signed [SAMPLE_WIDTH-1:0] channel_d;
    logic ft1;
    logic ft2;
    logic irq;
    logic [REG_FILE_DATA_WIDTH-1:0] status;
    logic channel_valid;

    reset_sync reset_sync (
        .clk,
        .arst_n(ic_n),
        .reset
    );

    clk_div #(
        .CLK_DIV_COUNT(CLK_DIV_COUNT)
    ) sample_clk_gen (
        .clk_en(sample_clk_en),
        .*
    );

    channels channels (
        .*
    );

    // for (genvar i = 0; i < NUM_LEDS; ++i)
    //     always_ff @(posedge clk)
    //         led[i] <= kon[0][i];

    host_if host_if (
        .*
    );

    register_file register_file (
        .*
    );

    /*
     * If we don't need timers, don't instantiate to save area
     */
    if (INSTANTIATE_TIMERS)
        timers timers (
            .*
        );
    else
        always_comb begin
            ft1 = 0;
            ft2 = 0;
            irq = 0;
            irq_n = 1;
        end
endmodule
`default_nettype wire
