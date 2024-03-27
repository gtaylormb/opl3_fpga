/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: env_rate_counter.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 2 Nov 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   2 Nov 2014    Greg Taylor
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

module env_rate_counter
    import opl3_pkg::*;
(
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,
    input wire ksr, // key scale rate
    input wire nts, // keyboard split selection
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire [REG_BLOCK_WIDTH-1:0] block,
    input wire [REG_ENV_WIDTH-1:0] requested_rate_p1,
    output logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_counter_overflow_p1 = 0
);
    localparam COUNTER_WIDTH = 15;
    localparam OVERFLOW_TMP_MAX_VALUE = 7<<15;
    localparam PIPELINE_DELAY = 2;

    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_tmp0;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_tmp1;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_tmp2;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] effective_rate_p1 = 0;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_value_p1;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] requested_rate_shifted_p1;
    logic [1:0] rof_p1;
    logic [COUNTER_WIDTH-1:0] counter_p1;
    logic [COUNTER_WIDTH-1:0] counter_new_p2;
    logic [$clog2(OVERFLOW_TMP_MAX_VALUE)-1:0] overflow_tmp_p1;
    logic sample_clk_en_p1 = 0;
    logic sample_clk_en_p2 = 0;
    logic [REG_ENV_WIDTH-1:0] requested_rate_p2 = 0;
    logic [BANK_NUM_WIDTH-1:0] bank_num_p1;
    logic [BANK_NUM_WIDTH-1:0] bank_num_p2;
    logic [OP_NUM_WIDTH-1:0] op_num_p1;
    logic [OP_NUM_WIDTH-1:0] op_num_p2;

    always_comb rate_tmp0 = nts ? fnum[8] : fnum[9];
    always_comb rate_tmp1 = rate_tmp0 | (block << 1);
    always_comb rate_tmp2 = ksr ? rate_tmp1 : rate_tmp1 >> 2;
    always_comb requested_rate_shifted_p1 = requested_rate_p1 << 2;

    always_comb
        if (rate_tmp2 + requested_rate_shifted_p1 > 60)
            effective_rate_p1 = 60;
        else
            effective_rate_p1 = rate_tmp2 + requested_rate_shifted_p1;

    always_comb rate_value_p1 = effective_rate_p1 >> 2;
    always_comb rof_p1 = effective_rate_p1[1:0];

    mem_simple_dual_port_auto #(
        .DATA_WIDTH(COUNTER_WIDTH),
        .DEPTH(NUM_BANKS*NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(1)
    ) counter_mem (
        .clka(clk),
        .clkb(clk),
        .wea(sample_clk_en_p2 && requested_rate_p2 != 0),
        .reb(sample_clk_en),
        .addra({bank_num_p2, op_num_p2}),
        .addrb({bank_num, op_num}),
        .dia(counter_new_p2),
        .dob(counter_p1)
    );

    always_comb overflow_tmp_p1 = counter_p1 + ((4 | rof_p1) << rate_value_p1);

    always_ff @(posedge clk) begin
        bank_num_p1 <= bank_num;
        bank_num_p2 <= bank_num_p1;
        op_num_p1 <= op_num;
        op_num_p2 <= op_num_p1;
        sample_clk_en_p1 <= sample_clk_en;
        sample_clk_en_p2 <= sample_clk_en_p1;
        requested_rate_p2 <= requested_rate_p1;
        counter_new_p2 <= overflow_tmp_p1;
    end

    always_comb
        rate_counter_overflow_p1 = overflow_tmp_p1 >> 15;
endmodule
`default_nettype wire  // re-enable implicit net type declarations
