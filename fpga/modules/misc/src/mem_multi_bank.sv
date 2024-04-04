/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: mem_multi_bank.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 1 April 2024
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   1 April 2024    Greg Taylor
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

module mem_multi_bank #(
    parameter type type_t = logic,
    parameter DEPTH = 0,
    parameter OUTPUT_DELAY = 0, // 0, 1, or 2
    parameter DEFAULT_VALUE = 0,
    parameter NUM_BANKS = 0,
    parameter BANK_WIDTH = $clog2(NUM_BANKS)
) (
    input wire clk,
    input wire wea,
    input wire reb, // only used if OUTPUT_DELAY >0
    input wire [BANK_WIDTH-1:0] banka,
    input wire [$clog2(DEPTH)-1:0] addra,
    input wire [BANK_WIDTH-1:0] bankb,
    input wire [$clog2(DEPTH)-1:0] addrb,
    input var type_t dia,
    output type_t dob
);
    localparam PIPELINE_DELAY = 2;

    logic [NUM_BANKS-1:0] wea_array;
    logic [NUM_BANKS-1:0] reb_array;
    type_t dob_array [NUM_BANKS];
    logic [PIPELINE_DELAY:1] [BANK_WIDTH-1:0] bankb_p;

    pipeline_sr #(
        .DATA_WIDTH(BANK_WIDTH),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) bankb_sr (
        .clk,
        .in(bankb),
        .out(bankb_p)
    );

    for (genvar i = 0; i < NUM_BANKS; ++i) begin
        always_comb begin
            wea_array[i] = wea && banka == i;
            reb_array[i] = reb && bankb == i;
        end

        mem_simple_dual_port #(
            .type_t(type_t),
            .DEPTH(DEPTH),
            .OUTPUT_DELAY(OUTPUT_DELAY),
            .DEFAULT_VALUE(DEFAULT_VALUE)
        ) mem_bank (
            .clka(clk),
            .clkb(clk),
            .wea(wea_array[i]),
            .reb(reb_array[i]),
            .addra,
            .addrb,
            .dia,
            .dob(dob_array[i])
        );
    end

    if (OUTPUT_DELAY == 0)
        always_comb dob = dob_array[bankb];
    else
        always_comb dob = dob_array[bankb_p[OUTPUT_DELAY]];
endmodule
`default_nettype wire