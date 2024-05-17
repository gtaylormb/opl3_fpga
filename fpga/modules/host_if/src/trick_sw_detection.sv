/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: trick_sw_detection.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 12 April 2024
#
#   DESCRIPTION:
#   OPL detection logic trick. Some games will simply use reads to introduce a 80us delay. The problem is
#   these reads may finish before 80us in a fast system, and the timer overflow would not have occured yet,
#   thus failing the detection. Count the reads after a write to set the st1 register and trigger an overflow
#   if a certain number have occured. Counter in clk_host domain, signal to timer is synchronized to OPL3 clk.
#
#   The detection method I've seen is something like this:
#
#        opl3_write('h04, 'h60, 'b0); // mask timers 1 and 2
#        opl3_write('h04, 'h80, 'b0); // rst_irq, unmask timers
#        opl3_read(stat1);
#        opl3_write('h02, 'hff, 'b0); // set timer 1 to max value
#        opl3_write('h04, 'h21, 'b0); // mask timer 2, start timer 1
#        for (int i = 0; i < 200; ++i) // this is has to wait at least 80us, but reads may finish sooner
#            opl3_read(dummy);
#        opl3_read(stat2);
#        opl3_write('h04, 'h60, 'b0);
#        opl3_write('h04, 'h80, 'b0);
#        if ((stat1 & 'he0) == 0 && (stat2 & 'he0) == 'hc0)
#            $display("OPL3 detected!");
#        else
#            $error("OPL3 not detected...");
#
#   Think Volkswagon cheating on the diesel emmisions test by detecting they're under test, except this is to
#   accomplish good. This works for Doom OPL detection under ao486MiSTer.
#
#   CHANGE HISTORY:
#   12 April 2024    Greg Taylor
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

module trick_sw_detection
    import opl3_pkg::*;
(
    input wire clk,
    input wire clk_host,
    input wire ic_n,
    input wire cs_n,
    input wire rd_n,
    input wire wr_n,
    input wire [1:0] address,
    input wire [REG_FILE_DATA_WIDTH-1:0] din,
    output logic force_timer_overflow
);
    localparam NUM_READS_TO_TRIGGER_OVERFLOW = 50;

    logic cs_p1_n = 1;
    logic wr_p1_n = 1;
    logic rd_p1_n = 1;
    logic [1:0] address_p1 = 0;
    logic [REG_FILE_DATA_WIDTH-1:0] din_p1 = 0;
    logic wr_p1;
    logic wr_p2 = 0;
    logic [$clog2(NUM_READS_TO_TRIGGER_OVERFLOW)-1:0] host_rd_counter = 0;
    opl3_reg_wr_t host_reg_wr;
    logic rd_p1;
    logic rd_p2 = 0;
    logic host_force_timer_overflow = 0;
    logic start_counter = 0;
    logic [REG_TIMER_WIDTH-1:0] timer1 = 0;

    always_ff @(posedge clk_host) begin
        cs_p1_n <= cs_n;
        wr_p1_n <= wr_n;
        rd_p1_n <= rd_n;
        address_p1 <= address;
        din_p1 <= din;
        wr_p2 <= wr_p1;
    end

    always_comb wr_p1 = !cs_p1_n && !wr_p1_n;

    always_ff @(posedge clk_host) begin
        host_reg_wr.valid <= 0;

        if (wr_p1 && !wr_p2)
            if (!address_p1[0]) begin // address write mode
                host_reg_wr.bank_num <= address_p1[1];
                host_reg_wr.address <= din_p1;
            end
            else begin             // data write mode
                host_reg_wr.valid <= 1;
                host_reg_wr.data <= din_p1;
            end

        if (host_reg_wr.valid && host_reg_wr.bank_num == 0 && host_reg_wr.address == 'h2)
            timer1 <= host_reg_wr.data;

        if (!ic_n) begin
            host_reg_wr <= 0;
            timer1 <= 0;
        end
    end

    always_comb rd_p1 = !cs_p1_n && !rd_p1_n;

    always_ff @(posedge clk_host) begin
        rd_p2 <= rd_p1;

        if (host_reg_wr.valid && host_reg_wr.bank_num == 0 && host_reg_wr.address == 'h4 && host_reg_wr.data[0] && timer1 == 'hff) begin
            start_counter <= 1;
            host_rd_counter <= 0;
            host_force_timer_overflow <= 0;
        end

        if (start_counter && rd_p1 && !rd_p2)
            host_rd_counter <= host_rd_counter + 1;

        if (host_rd_counter == NUM_READS_TO_TRIGGER_OVERFLOW)
            host_force_timer_overflow <= 1; // signal is held for synchronizer

        if (!ic_n || (host_reg_wr.valid && !(host_reg_wr.bank_num == 0 && host_reg_wr.address == 'h4 && host_reg_wr.data[0]))) begin
            start_counter <= 0;
            host_rd_counter <= 0;
            host_force_timer_overflow <= 0;
        end
    end

    synchronizer force_timer_overflow_sync (
        .clk,
        .in(host_force_timer_overflow),
        .out(force_timer_overflow)
    );

endmodule
`default_nettype wire