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
`default_nettype none

module opl3
    import opl3_pkg::*;
(
    input wire clk, // opl3 clk
    input wire clk_host,
    input wire clk_dac, // only used if INSTANTIATE_SAMPLE_SYNC_TO_DAC_CLK is set
    input wire ic_n, // clk_host reset
    input wire cs_n,
    input wire rd_n,
    input wire wr_n,
    input wire [1:0] address,
    input wire [REG_FILE_DATA_WIDTH-1:0] din,
    output logic [REG_FILE_DATA_WIDTH-1:0] dout,
    output logic sample_valid,
    output logic signed [DAC_OUTPUT_WIDTH-1:0] sample_l,
    output logic signed [DAC_OUTPUT_WIDTH-1:0] sample_r,
    output logic [NUM_LEDS-1:0] led,
    output logic irq_n
);
    logic reset;
    logic sample_clk_en;
    opl3_reg_wr_t opl3_reg_wr;
    logic [REG_FILE_DATA_WIDTH-1:0] status;
    logic force_timer_overflow;

    reset_sync reset_sync (
        .clk,
        .arst_n(ic_n),
        .reset
    );

    host_if host_if (
        .*
    );

    // pulse once per sample period
    clk_div #(
        .CLK_DIV_COUNT(CLK_DIV_COUNT)
    ) sample_clk_gen (
        .clk_en(sample_clk_en),
        .*
    );

    channels channels (
        .*
    );

    leds leds (
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
    else
        always_comb
            irq_n = 1;
    endgenerate
endmodule
`default_nettype wire
