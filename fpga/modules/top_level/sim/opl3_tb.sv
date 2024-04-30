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
    localparam OPL3_CLK_FREQ = CLK_FREQ;
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
        .clk_dac('0),
        .*
    );

    program top_level_testbench;
        default clocking cb @(posedge clk_host);
            default input #1step;
            default output #GATE_DELAY;
            input dout;
            output ic_n; // clk_host reset
            output cs_n;
            output rd_n;
            output wr_n;
            output address;
            output din;
        endclocking

        task opl3_read_addr (
            input [1:0] address,
            output [REG_FILE_DATA_WIDTH-1:0] value
        );
            bit [1:0] opl3_address;

            cb.address <= address;
            cb.cs_n <= 0;
            cb.rd_n <= 0;
            ##3; // reads are held for multiple cycles on ao486 MiSTer
            value <= cb.dout;
            cb.cs_n <= 1;
            cb.rd_n <= 1;
            ##1;
        endtask

        task opl3_read (
            output [REG_FILE_DATA_WIDTH-1:0] value
        );
            static bit [1:0] address = 'b00;

            opl3_read_addr (
                address,
                value
            );
        endtask

        task opl3_write (
            input [REG_FILE_DATA_WIDTH-1:0] register,
            input [REG_FILE_DATA_WIDTH-1:0] data_in,
            input bank
        );
            bit [1:0] opl3_address;
            bit [REG_FILE_DATA_WIDTH-1:0] data;

            // write OPL3 address
            opl3_address = bank ? 'b10 : 'b00;
            data = register;
            cb.address <= opl3_address;
            cb.din <= data;
            cb.cs_n <= 0;
            cb.wr_n <= 0;
            ##1;
            cb.cs_n <= 1;
            cb.wr_n <= 1;
            cb.din <= 0;
            ##1;
            for (int i = 0; i < 6; ++i)
                opl3_read(data);

            // write OPL3 data
            opl3_address = 'b01;
            data = data_in;
            cb.address <= opl3_address;
            cb.din <= data;
            cb.cs_n <= 0;
            cb.wr_n <= 0;
            ##1;
            cb.cs_n <= 1;
            cb.wr_n <= 1;
            cb.din <= 0;
            ##1;
            for (int i = 0; i < 36; ++i)
                opl3_read(data);

            $display("Wrote 0x%0x to register 0x%0x, bank %0x", data_in, register, bank);
        endtask

        task detect_opl3(); // requires core to be built with INSTANTIATE_TIMERS=1
            bit [REG_FILE_DATA_WIDTH-1:0] stat1, stat2, dummy;

            opl3_write('h04, 'h60, 'b0); // mask timers 1 and 2
            opl3_write('h04, 'h80, 'b0); // rst_irq, unmask timers
            opl3_read(stat1);
            opl3_write('h02, 'hff, 'b0); // set timer 1 to max value
            opl3_write('h04, 'h21, 'b0); // mask timer 2, start timer 1
            for (int i = 0; i < 4000; ++i)
                opl3_read(dummy);
            opl3_read(stat2);
            opl3_write('h04, 'h60, 'b0);
            opl3_write('h04, 'h80, 'b0);
            if ((stat1 & 'he0) == 0 && (stat2 & 'he0) == 'hc0)
                $display("OPL3 detected!");
            else
                $error("OPL3 not detected...");
            opl3_read_addr(2, stat1);
            if (stat1 == 'hff)
                $display("Doom OPL3 detected!");
        endtask

        task reset_opl3();
            for (int i = 'h20; i < 'hff; ++i) begin
                if ((i & 'he0) == 'h80)
                    opl3_write(i, 'h0f, 0);
                else
                    opl3_write(i, 'h00, 0);
            end
        endtask

        initial begin
            cb.ic_n <= 0;
            ##100;
            cb.ic_n <= 1;
            ##100;
            detect_opl3();
            reset_opl3();
            detect_opl3();
        end
    endprogram
endmodule
`default_nettype wire