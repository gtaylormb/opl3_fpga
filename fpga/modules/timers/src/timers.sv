/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: timers.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 11 Jan 2015
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   11 Jan 2015    Greg Taylor
#       Initial version
#
#   Copyright (C) 2015 Greg Taylor <gtaylor@sonic.net>
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

module timers
    import opl3_pkg::*;
(
    input wire clk,
    input wire reset,
    input var opl3_reg_wr_t opl3_reg_wr,
    output logic irq_n = 0,
    output logic [REG_FILE_DATA_WIDTH-1:0] status,
    input wire force_timer_overflow // comes from trick_sw_detection logic
);
    logic [REG_TIMER_WIDTH-1:0] timer1 = 0;
    logic [REG_TIMER_WIDTH-1:0] timer2 = 0;
    logic irq_rst = 0;
    logic mt1 = 0; // mask timer
    logic mt2 = 0;
    logic st1 = 0; // start timer
    logic st2 = 0;
    logic timer1_overflow_pulse;
    logic timer2_overflow_pulse;
    logic ft1 = 0;
    logic ft2 = 0;
    logic irq;

    always_ff @(posedge clk) begin
        if (opl3_reg_wr.valid) begin
            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 2)
                timer1 <= opl3_reg_wr.data;

            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 3)
                timer2 <= opl3_reg_wr.data;

            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 4) begin
                irq_rst <= opl3_reg_wr.data[7];
                mt1 <= opl3_reg_wr.data[6];
                mt2 <= opl3_reg_wr.data[5];
                st2 <= opl3_reg_wr.data[1];
                st1 <= opl3_reg_wr.data[0];
            end
        end

        if (reset) begin
            timer1 <= 0;
            timer2 <= 0;
            irq_rst <= 0;
            mt1 <= 0;
            mt2 <= 0;
            st2 <= 0;
            st1 <= 0;
        end
    end

    timer #(
        .TIMER_TICK_INTERVAL(TIMER1_TICK_INTERVAL)
    ) timer1_inst (
        .clk,
        .timer_reg(timer1),
        .start_timer(st1),
        .timer_overflow_pulse(timer1_overflow_pulse)
    );

    timer #(
        .TIMER_TICK_INTERVAL(TIMER2_TICK_INTERVAL)
    ) timer2_inst (
        .clk,
        .timer_reg(timer2),
        .start_timer(st2),
        .timer_overflow_pulse(timer2_overflow_pulse)
    );

    always_ff @(posedge clk) begin
        if ((timer1_overflow_pulse || force_timer_overflow) && !mt1)
            ft1 <= 1;

        if (timer2_overflow_pulse && !mt2)
            ft2 <= 1;

        if (reset || irq_rst) begin
            ft1 <= 0;
            ft2 <= 0;
        end
    end

    always_comb irq = ft1 || ft2;

    always_ff @(posedge clk)
        irq_n <= !irq;

    always_comb begin
        status = 0;
        status[7] = irq;
        status[6] = ft1;
        status[5] = ft2;
    end
endmodule
`default_nettype wire