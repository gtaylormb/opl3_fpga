/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: timer.sv
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

module timer
    import opl3_pkg::*;
#(
    parameter real TIMER_TICK_INTERVAL = 0 // time in seconds
) (
    input wire clk,
    input wire [REG_TIMER_WIDTH-1:0] timer_reg,
    input wire start_timer,
    output logic timer_overflow_pulse = 0
);
    localparam int TICK_TIMER_COUNT_VALUE = CLK_FREQ*TIMER_TICK_INTERVAL;

    logic [$clog2(TICK_TIMER_COUNT_VALUE)-1:0] tick_counter = 0;
    logic tick_pulse = 0;
    logic [REG_TIMER_WIDTH-1:0] timer = 0;
    logic start_timer_set_pulse;

    /*
     * Detect when start_timer is initially set, use it to reset the timer value
     * back to timer_reg. Also if start_timer is not set clock will not run.
     */
    edge_detector #(
        .EDGE_LEVEL(1),
        .CLK_DLY(0)
    ) start_timer_edge_detect (
        .clk(clk),
        .clk_en(1'b1),
        .in(start_timer),
        .edge_detected(start_timer_set_pulse)
    );

    always_comb tick_pulse = tick_counter == TICK_TIMER_COUNT_VALUE - 1;

    always_ff @(posedge clk)
        if (start_timer) begin
            if (tick_pulse || start_timer_set_pulse)
                tick_counter <= 0;
            else
                tick_counter <= tick_counter + 1;
        end

    /*
     * Timer gets set to timer_reg upon overflow
     */
    always_ff @(posedge clk)
        if (start_timer_set_pulse)
            timer <= timer_reg;
        else if (tick_pulse) begin
            if (timer == 2**REG_TIMER_WIDTH - 1)
                timer <= timer_reg;
            else
                timer <= timer + 1;
        end

    always_ff @(posedge clk)
        timer_overflow_pulse <= (timer == 2**REG_TIMER_WIDTH - 1) && tick_pulse;

endmodule
`default_nettype wire
