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
    input wire [REG_TIMER_WIDTH-1:0] timer1,
    input wire [REG_TIMER_WIDTH-1:0] timer2,
    input wire irq_rst,
    input wire mt1, // mask timer
    input wire mt2,
    input wire st1, // start timer
    input wire st2,
    output logic ft1 = 0,
    output logic ft2 = 0,
    output logic irq,
    output logic irq_n = 0
);
    logic timer1_overflow_pulse;
    logic timer2_overflow_pulse;

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
        if (timer1_overflow_pulse && mt1)
            ft1 <= 1;

        if (timer2_overflow_pulse && mt2)
            ft2 <= 1;

        if (reset || irq_rst) begin
            ft1 <= 0;
            ft2 <= 0;
        end
    end

    always_comb irq = ft1 || ft2;

    always_ff @(posedge clk)
        irq_n <= !irq;

endmodule
`default_nettype wire