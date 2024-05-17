/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: phase_generator.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 13 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   13 Oct 2014    Greg Taylor
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

module phase_generator
    import opl3_pkg::*;
(
    input wire clk,
    input wire sample_clk_en,
    input wire is_new,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,
    input wire [PHASE_ACC_WIDTH-1:0] phase_inc_p2,
    input wire [REG_WS_WIDTH-1:0] ws,
    input wire [ENV_WIDTH-1:0] env_p3,
    input wire key_on_pulse_p0,
    input wire [OP_OUT_WIDTH-1:0] modulation_p1,
    input var operator_t op_type,
    output logic signed [OP_OUT_WIDTH-1:0] out_p6 = 0
);
    localparam LOG_SIN_OUT_WIDTH = 12;
    localparam EXP_IN_WIDTH = 8;
    localparam EXP_OUT_WIDTH = 10;
    localparam LOG_SIN_PLUS_GAIN_WIDTH = 13;
    localparam PIPELINE_DELAY = 6;

    logic [PIPELINE_DELAY:1] sample_clk_en_p;
    logic [PIPELINE_DELAY:1] key_on_pulse_p;
    logic [PHASE_ACC_WIDTH-1:0] phase_acc_p2;
    logic [PHASE_ACC_WIDTH-1:0] phase_acc_p3 = 0;
    logic [PHASE_ACC_WIDTH-1:0] final_phase_p4 = 0;
    logic [PHASE_ACC_WIDTH-1:0] final_phase_p5 = 0;
    logic prev_final_phase_msb_p2;
    logic prev_final_phase_msb_p3 = 0;
    logic prev_final_phase_msb_p4 = 0;
    logic is_odd_period_p2;
    logic is_odd_period_p3 = 0;
    logic is_odd_period_p4 = 0;
    logic is_odd_period_p5 = 0;
    logic is_odd_period_p6 = 0;
    logic [PHASE_ACC_WIDTH-1:0] rhythm_phase_p3;
    logic [LOG_SIN_OUT_WIDTH-1:0] log_sin_out_p5;
    logic [LOG_SIN_PLUS_GAIN_WIDTH-1:0] log_sin_plus_gain_p5 = 0;
    logic [LOG_SIN_PLUS_GAIN_WIDTH-1:0] log_sin_plus_gain_p6 = 0;
    logic [EXP_OUT_WIDTH-1:0] exp_out_p6;
    logic [OP_OUT_WIDTH-1:0] tmp_out0_p6;
    logic signed [OP_OUT_WIDTH-1:0] tmp_out1_p6;
    logic signed [OP_OUT_WIDTH-1:0] tmp_out2_p6;
    logic signed [OP_OUT_WIDTH-1:0] tmp_ws2_p6;
    logic signed [OP_OUT_WIDTH-1:0] tmp_ws4_p6;
    logic [LOG_SIN_OUT_WIDTH-1:0] tmp_ws7_p5 = 0;
    logic [REG_WS_WIDTH-1:0] ws_post_opl_p0;
    logic [PIPELINE_DELAY:1] [REG_WS_WIDTH-1:0] ws_post_opl_p;
    logic [ENV_WIDTH-1:0] env_p4 = 0;
    logic [ENV_WIDTH-1:0] env_p5 = 0;
    logic [PIPELINE_DELAY:1] [BANK_NUM_WIDTH-1:0] bank_num_p;
    logic [PIPELINE_DELAY:1] [OP_NUM_WIDTH-1:0] op_num_p;
    logic [OP_OUT_WIDTH-1:0] modulation_p2 = 0;
    logic [OP_OUT_WIDTH+10-1:0] modulation_shifted_p3 = 0;
    logic [PIPELINE_DELAY:1] [$bits(operator_t)-1:0] op_type_p;

    pipeline_sr #(
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) sample_clk_en_sr (
        .clk,
        .in(key_on_pulse_p0),
        .out(key_on_pulse_p)
    );

    pipeline_sr #(
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) key_on_pulse_sr (
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
        .DATA_WIDTH($bits(operator_t)),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) op_type_sr (
        .clk,
        .in(op_type),
        .out(op_type_p)
    );

    /*
     * OPL2 only supports first 4 waveforms
     */
    always_comb ws_post_opl_p0 = ws & (is_new ? 'h7 : 'h3);

    pipeline_sr #(
        .DATA_WIDTH(REG_WS_WIDTH),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) ws_post_opl_sr (
        .clk,
        .in(ws_post_opl_p0),
        .out(ws_post_opl_p)
    );

    always_ff @(posedge clk) begin
        env_p4 <= env_p3;
        env_p5 <= env_p4;
    end

    mem_multi_bank #(
        .DATA_WIDTH(PHASE_ACC_WIDTH),
        .DEPTH(NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(2),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) phase_acc_mem (
        .clk,
        .wea(sample_clk_en_p[3]),
        .reb(sample_clk_en),
        .banka(bank_num_p[3]),
        .addra(op_num_p[3]),
        .bankb(bank_num),
        .addrb(op_num),
        .dia(phase_acc_p3),
        .dob(phase_acc_p2)
    );

    /*
     * Some rhythm instruments require further transformations to the phase.
     * Pass through phase_acc[bank_num][op_num] normally.
     */
    calc_rhythm_phase calc_rhythm_phase (
        .*
    );

    always_ff @(posedge clk) begin
        modulation_p2 <= modulation_p1;
        modulation_shifted_p3 <= modulation_p2 << 10;
    end

    /*
     * Phase Accumulator. Modulation and rhythm get added to the final phase but not
     * back into the accumulator.
     */
    always_ff @(posedge clk)
        if (sample_clk_en_p[2])
            if (key_on_pulse_p[2])
                phase_acc_p3 <= 0;
            else if (ws_post_opl_p[2] == 4 || ws_post_opl_p[2] == 5)
                // double the frequency
                phase_acc_p3 <= phase_acc_p2 + (phase_inc_p2 << 1);
            else
                phase_acc_p3 <= phase_acc_p2 + phase_inc_p2;

    always_ff @(posedge clk)
        if (sample_clk_en_p[3])
            if (key_on_pulse_p[3])
                final_phase_p4 <= 0;
            else
                final_phase_p4 <= rhythm_phase_p3 + modulation_shifted_p3;

    mem_multi_bank #(
        .DATA_WIDTH(1),
        .DEPTH(NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(2),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) final_phase_msb_mem (
        .clk,
        .wea(sample_clk_en_p[4]),
        .reb(sample_clk_en),
        .banka(bank_num_p[4]),
        .addra(op_num_p[4]),
        .bankb(bank_num),
        .addrb(op_num),
        .dia(final_phase_p4[19]),
        .dob(prev_final_phase_msb_p2)
    );

    mem_multi_bank #(
        .DATA_WIDTH(1),
        .DEPTH(NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(2),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) is_odd_period_msb_mem (
        .clk,
        .wea(sample_clk_en_p[5]),
        .reb(sample_clk_en),
        .banka(bank_num_p[5]),
        .addra(op_num_p[5]),
        .bankb(bank_num),
        .addrb(op_num),
        .dia(is_odd_period_p5),
        .dob(is_odd_period_p2)
    );

    always_ff @(posedge clk) begin
        prev_final_phase_msb_p3 <= prev_final_phase_msb_p2;
        prev_final_phase_msb_p4 <= prev_final_phase_msb_p3;
        is_odd_period_p3 <= is_odd_period_p2;
        is_odd_period_p4 <= is_odd_period_p3;
        is_odd_period_p5 <= prev_final_phase_msb_p4 && !final_phase_p4[19] ? !is_odd_period_p4 : is_odd_period_p4;
        is_odd_period_p6 <= is_odd_period_p5;
    end

    opl3_log_sine_lut log_sine_lut_inst (
        .theta(final_phase_p4[18] ? ~final_phase_p4[17:10]
         : final_phase_p4[17:10]),
        .out(log_sin_out_p5),
    	.*
    );

    /*
     * Setting the msb effectively mutes. Mute 2nd and 3rd quadrant.
     */
    always_ff @(posedge clk) begin
        unique case (final_phase_p4[19:18])
        0: tmp_ws7_p5[11] <= 0;
        1: tmp_ws7_p5[11] <= 1;
        2: tmp_ws7_p5[11] <= 1;
        3: tmp_ws7_p5[11] <= 0;
        endcase

        tmp_ws7_p5[10:0] <= final_phase_p4[19] ? ~final_phase_p4[17:10] << 3 : final_phase_p4[17:10] << 3;
    end

    always_comb
        unique case (ws_post_opl_p[5])
        6: log_sin_plus_gain_p5 = env_p5 << 3;
        7: log_sin_plus_gain_p5 = tmp_ws7_p5 + (env_p5 << 3);
        default: log_sin_plus_gain_p5 = log_sin_out_p5 + (env_p5 << 3);
        endcase

    always_ff @(posedge clk) begin
        final_phase_p5 <= final_phase_p4;
        log_sin_plus_gain_p6 <= log_sin_plus_gain_p5;
    end

    opl3_exp_lut exp_lut_inst (
        .in(~log_sin_plus_gain_p5[7:0]),
        .out(exp_out_p6),
        .*
    );

    always_comb tmp_out0_p6 = (2**10 + exp_out_p6) << 1;

    always_comb
        if (final_phase_p5[19])
            tmp_out1_p6 = ~(tmp_out0_p6 >> log_sin_plus_gain_p6[LOG_SIN_PLUS_GAIN_WIDTH-1:8]);
        else
            tmp_out1_p6 = tmp_out0_p6 >> log_sin_plus_gain_p6[LOG_SIN_PLUS_GAIN_WIDTH-1:8];

    always_comb tmp_ws2_p6 = tmp_out1_p6 < 0 ? ~tmp_out1_p6 : tmp_out1_p6;
    always_comb tmp_ws4_p6 = is_odd_period_p6 ? tmp_out1_p6 : 0;

    /*
     * Select waveform, do proper transformations to the wave
     */
    always_comb
        unique case (ws_post_opl_p[6])
        0: tmp_out2_p6 = tmp_out1_p6;
        1: tmp_out2_p6 = tmp_out1_p6 < 0 ? 0 : tmp_out1_p6;
        2: tmp_out2_p6 = tmp_ws2_p6;
        3: tmp_out2_p6 = final_phase_p5[PHASE_ACC_WIDTH-2] ? 0 : tmp_ws2_p6;
        4: tmp_out2_p6 = tmp_ws4_p6;
        5: tmp_out2_p6 = tmp_ws4_p6 < 0 ? ~tmp_ws4_p6 : tmp_ws4_p6;
        6: tmp_out2_p6 = tmp_out1_p6;
        7: tmp_out2_p6 = tmp_out1_p6;
        endcase

    always_comb
        unique case (op_type_p[6])
        OP_NORMAL:    out_p6 = tmp_out2_p6;
        OP_BASS_DRUM: out_p6 = tmp_out2_p6;
        default:      out_p6 = tmp_out2_p6 << 1;
        endcase
endmodule
`default_nettype wire

