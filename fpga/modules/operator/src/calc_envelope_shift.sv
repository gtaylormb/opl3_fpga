/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: calc_envelope_shift.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 2 Nov 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   3 June 2024     Greg Taylor
#       Renamed from env_rate_counter.sv and refactored to match implementation in
#       https://github.com/nukeykt/Nuked-OPL3
#
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
#   Copyright (C) 2013-2020 Nuke.YKT
#
#   Some code based on forum posts in:
#   http://forums.submarine.org.uk/phpBB/viewforum.php?f=9,
#   Copyright (C) 2010-2013 by carbon14 and opl3
#
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none

module calc_envelope_shift
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
    output logic [REG_ENV_WIDTH-1:0] rate_hi_p2 = 0,
    output logic [ENV_SHIFT_WIDTH-1:0] env_shift_p2 = 0
);
    localparam EG_TIMER_WIDTH = 13;
    localparam PIPELINE_DELAY = 3;
    localparam EG_ADD_WIDTH = $clog2(13);
    localparam logic [3:0][3:0] EG_INC_STEP = {
        4'b0000,
        4'b1000,
        4'b1010,
        4'b1110
    };

    logic [EG_TIMER_WIDTH-1:0] eg_timer = 0;
    logic eg_state = 0;
    logic [EG_ADD_WIDTH-1:0] eg_add = 0;
    logic [REG_BLOCK_WIDTH:0] block_shifted;
    logic [REG_BLOCK_WIDTH:0] ksv_p0;
    logic [REG_BLOCK_WIDTH:0] ks_p0;
    logic [REG_ENV_WIDTH+2-1:0] requested_rate_shifted_p0;
    logic [REG_ENV_WIDTH+3-1:0] rate_p1 = 0;
    logic [REG_ENV_WIDTH+1-1:0] rate_hi_pre_p1;
    logic [REG_ENV_WIDTH-1:0] rate_hi_p1;
    logic [1:0] rate_lo_p1;
    logic [1:0] eg_timer_lo = 0;
    logic [REG_ENV_WIDTH+2-1:0] eg_shift_p1;
    logic requested_rate_not_zero_p1;
    logic [ENV_SHIFT_WIDTH:0] env_shift_pre_p1;
    logic [PIPELINE_DELAY:1] sample_clk_en_p;
    logic [PIPELINE_DELAY:1] [BANK_NUM_WIDTH-1:0] bank_num_p;
    logic [PIPELINE_DELAY:1] [OP_NUM_WIDTH-1:0] op_num_p;

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

    always_comb begin
        block_shifted = block << 1;
        ksv_p0 = block_shifted | (nts ? fnum[8] : fnum[9]);
        ks_p0 = ksr ? ksv_p0 : ksv_p0 >> 2;
        requested_rate_shifted_p0 = requested_rate_p0 << 2;
    end

    always_ff @(posedge clk)
        rate_p1 <= ks_p0 + requested_rate_shifted_p0;

    always_comb begin
        rate_hi_pre_p1 = rate_p1 >> 2;
        rate_hi_p1 = rate_hi_pre_p1[4] ? 'hf : rate_hi_pre_p1;
        rate_lo_p1 = rate_p1[1:0];
        eg_shift_p1 = rate_hi_p1 + eg_add;

        env_shift_pre_p1 = rate_hi_p1[1:0] + EG_INC_STEP[rate_lo_p1][eg_timer_lo];
    end

    always_ff @(posedge clk) begin
        requested_rate_not_zero_p1 <= requested_rate_p0 != 0;
        env_shift_p2 <= 0;
        rate_hi_p2 <= rate_hi_p1;

        if (requested_rate_not_zero_p1) begin
            if (rate_hi_p1 < 12) begin
                if (eg_state)
                    unique case (eg_shift_p1)
                    12: env_shift_p2 <= 1;
                    13: env_shift_p2 <= rate_lo_p1[1];
                    14: env_shift_p2 <= rate_lo_p1[0];
                    default:;
                    endcase
            end
            else begin
                env_shift_p2 <= env_shift_pre_p1;
                if (env_shift_pre_p1[2])
                    env_shift_p2 <= 'h3;
                if (env_shift_pre_p1 == 0)
                    env_shift_p2 <= eg_state;
            end
        end
    end

    always_ff @(posedge clk)
        // once per sample, after operators are done
        if (sample_clk_en_p[3] && bank_num_p[3] == 1 && op_num_p[3] == 17) begin
            if (eg_state) begin
                unique casez (eg_timer)
                'b0_0000_0000_0000: eg_add <= 0;
                'b1_0000_0000_0000: eg_add <= 13;
                'b?_1000_0000_0000: eg_add <= 12;
                'b?_?100_0000_0000: eg_add <= 11;
                'b?_??10_0000_0000: eg_add <= 10;
                'b?_???1_0000_0000: eg_add <= 9;
                'b?_????_1000_0000: eg_add <= 8;
                'b?_????_?100_0000: eg_add <= 7;
                'b?_????_??10_0000: eg_add <= 6;
                'b?_????_???1_0000: eg_add <= 5;
                'b?_????_????_1000: eg_add <= 4;
                'b?_????_????_?100: eg_add <= 3;
                'b?_????_????_??10: eg_add <= 2;
                'b?_????_????_???1: eg_add <= 1;
                endcase

                eg_timer <= eg_timer + 1;
                eg_timer_lo <= eg_timer[1:0];
            end

            eg_state <= !eg_state;
        end
endmodule
`default_nettype wire
