/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: opl3_tb.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 18 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   18 Oct 2014        Greg Taylor
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

module opl3_tb
    import opl3_pkg::*;
();
    localparam HOST_CLK_FREQ = 100e6;
    localparam HOST_CLK_HALF_PERIOD = 1/real'(HOST_CLK_FREQ)*1000e6/2;
    localparam OPL3_CLK_FREQ = 12.727e6;
    localparam OPL3_CLK_HALF_PERIOD = 1/real'(OPL3_CLK_FREQ)*1000e6/2;

    localparam GATE_DELAY = 1; // in ns

    bit clk; // opl3 clk
    bit clk_host;
    bit ic_n = 1; // clk_host reset
    bit cs_n = 1;
    bit rd_n = 1;
    bit wr_n = 1;
    bit [1:0] address = 0;
    bit [REG_FILE_DATA_WIDTH-1:0] din = 0;
    logic [REG_FILE_DATA_WIDTH-1:0] dout;
    logic ack_host_wr; // host needs to hold writes for clock domain crossing
    logic sample_valid;
    logic signed [DAC_OUTPUT_WIDTH-1:0] sample_l;
    logic signed [DAC_OUTPUT_WIDTH-1:0] sample_r;
    logic [NUM_LEDS-1:0] led;
    logic irq_n;

    always begin
        #HOST_CLK_HALF_PERIOD clk_host = 0;
        #HOST_CLK_HALF_PERIOD clk_host = 1;
    end

    always begin
        #OPL3_CLK_HALF_PERIOD clk = 0;
        #OPL3_CLK_HALF_PERIOD clk = 1;
    end

    opl3 opl3 (
        .*
    );

    program top_level_testbench;
        default clocking cb @(posedge clk_host);
            default input #1step;
            default output #GATE_DELAY;
            input dout;
            input ack_host_wr; // host needs to hold writes for clock domain crossing
            output ic_n; // clk_host reset
            output cs_n;
            output rd_n;
            output wr_n;
            output address;
            output din;
        endclocking

        task opl3_write (
            input [REG_FILE_DATA_WIDTH-1:0] register,
            input [REG_FILE_DATA_WIDTH-1:0] data_in,
            input bank
        );
            bit [1:0] opl3_address;
            bit [REG_FILE_DATA_WIDTH-1:0] data;

            // write OPL3 address
            address = bank ? 'b10 : 'b00;
            data = register;
            cb.address <= address;
            cb.din <= data;
            cb.cs_n <= 0;
            cb.wr_n <= 0;
            while (!cb.ack_host_wr)
                ##1;
            cb.cs_n <= 1;
            cb.wr_n <= 1;
            ##15; // need time for opl3 cs to deassert internally due to slow clock speed and synchronizer delay

            // write OPL3 data
            address = 'b01;
            data = data_in;
            cb.address <= address;
            cb.din <= data;
            cb.cs_n <= 0;
            cb.wr_n <= 0;
            while (!cb.ack_host_wr)
                ##1;
            cb.cs_n <= 1;
            cb.wr_n <= 1;
            ##15;
        endtask

        initial begin
            cb.ic_n <= 0;
            ##100;
            cb.ic_n <= 1;
            ##10;
            opl3_write('h2, 245, 0); // set timer1 reg
            opl3_write('h4, 8'b01000001, 0); // start and unmask timer1
            #805000; // wait
            assert(!irq_n);
            opl3_write('h4, 8'b11000000, 0); // rst irq, stop timer1
            opl3_write('h4, 8'b01000001, 0); // start and unmask timer1
            #10000;
        end
    endprogram
endmodule
`default_nettype wire