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
`default_nettype none

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
    input wire [REG_ENV_WIDTH-1:0] requested_rate_p0,
    input wire key_on_pulse_p0,
    output logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_counter_overflow_p1 = 0
);
    localparam COUNTER_WIDTH = 15;
    localparam OVERFLOW_TMP_MAX_VALUE = 7<<15;
    localparam PIPELINE_DELAY = 2;

    logic rate_tmp0_p0;
    logic [REG_BLOCK_WIDTH+1-1:0] rate_tmp1_p0;
    logic [REG_BLOCK_WIDTH+1-1:0] rate_tmp2_p0;
    logic [$clog2(60)-1:0] effective_rate_p1 = 0;
    logic [$clog2(60)-2-1:0] rate_value_p1;
    logic [REG_ENV_WIDTH+2-1:0] requested_rate_shifted_p0;
    logic [1:0] rof_p1;
    logic [COUNTER_WIDTH-1:0] counter_fifo_out_p1;
    logic [COUNTER_WIDTH-1:0] counter_p1;
    logic [COUNTER_WIDTH-1:0] counter_new_p2;
    logic [$clog2(OVERFLOW_TMP_MAX_VALUE)-1:0] overflow_tmp_p1;
    logic [PIPELINE_DELAY:1] requested_rate_not_zero_p;
    logic [PIPELINE_DELAY:1] sample_clk_en_p;
    logic [PIPELINE_DELAY:1] [BANK_NUM_WIDTH-1:0] bank_num_p;
    logic [PIPELINE_DELAY:1] [OP_NUM_WIDTH-1:0] op_num_p;
    logic key_on_pulse_p1 = 0;

    pipeline_sr #(
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) sample_clk_en_sr (
        .clk,
        .in(sample_clk_en),
        .out(sample_clk_en_p)
    );

    pipeline_sr #(
        .DATA_WIDTH(BANK_NUM_WIDTH),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) bank_num_sr (
        .clk,
        .in(bank_num),
        .out(bank_num_p)
    );

    pipeline_sr #(
        .DATA_WIDTH(OP_NUM_WIDTH),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) op_num_sr (
        .clk,
        .in(op_num),
        .out(op_num_p)
    );

    pipeline_sr #(
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) requested_rate_not_zero_sr (
        .clk,
        .in(requested_rate_p0 != 0),
        .out(requested_rate_not_zero_p)
    );

    always_comb rate_tmp0_p0 = nts ? fnum[8] : fnum[9];
    always_comb rate_tmp1_p0 = rate_tmp0_p0 | (block << 1);
    always_comb rate_tmp2_p0 = ksr ? rate_tmp1_p0 : rate_tmp1_p0 >> 2;
    always_comb requested_rate_shifted_p0 = requested_rate_p0 << 2;

    always_ff @(posedge clk)
        if (rate_tmp2_p0 + requested_rate_shifted_p0 > 60)
            effective_rate_p1 <= 60;
        else
            effective_rate_p1 <= rate_tmp2_p0 + requested_rate_shifted_p0;

    always_comb rate_value_p1 = effective_rate_p1 >> 2;
    always_comb rof_p1 = effective_rate_p1[1:0];

    mem_multi_bank #(
        .DATA_WIDTH(COUNTER_WIDTH),
        .DEPTH(NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(1),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) counter_mem (
        .clk,
        .wea(sample_clk_en_p[2] && requested_rate_not_zero_p[2]),
        .reb(sample_clk_en),
        .banka(bank_num_p[2]),
        .addra(op_num_p[2]),
        .bankb(bank_num),
        .addrb(op_num),
        .dia(counter_new_p2),
        .dob(counter_fifo_out_p1)
    );

    always_ff @(posedge clk)
        key_on_pulse_p1 <= key_on_pulse_p0;

    always_comb begin
        counter_p1 = key_on_pulse_p1 ? 0 : counter_fifo_out_p1;
        overflow_tmp_p1 = counter_p1 + ((4 | rof_p1) << rate_value_p1);
        rate_counter_overflow_p1 = overflow_tmp_p1 >> 15;
    end

    always_ff @(posedge clk)
        counter_new_p2 <= overflow_tmp_p1;
endmodule
`default_nettype wire
