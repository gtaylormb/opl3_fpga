/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: channels.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 7 Nov 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   7 Nov 2014    Greg Taylor
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

module channels
    import opl3_pkg::*;
(
    input wire clk,
    input wire sample_clk_en,
    input wire [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel,
    input wire is_new,
    input wire nts,                     // keyboard split selection
    input wire [REG_FNUM_WIDTH-1:0] fnum [2][9],
    input wire [REG_MULT_WIDTH-1:0] mult [2][18],
    input wire [REG_BLOCK_WIDTH-1:0] block [2][9],
    input wire [REG_WS_WIDTH-1:0] ws [2][18],
    input wire vib [2][18],
    input wire dvb,
    input wire kon [2][9],
    input wire [REG_ENV_WIDTH-1:0] ar [2][18], // attack rate
    input wire [REG_ENV_WIDTH-1:0] dr [2][18], // decay rate
    input wire [REG_ENV_WIDTH-1:0] sl [2][18], // sustain level
    input wire [REG_ENV_WIDTH-1:0] rr [2][18], // release rate
    input wire [REG_TL_WIDTH-1:0] tl [2][18],  // total level
    input wire ksr [2][18],                    // key scale rate
    input wire [REG_KSL_WIDTH-1:0] ksl [2][18], // key scale level
    input wire egt [2][18],                     // envelope type
    input wire am [2][18],                      // amplitude modulation (tremolo)
    input wire dam,                             // depth of tremolo
    input wire ryt,
    input wire bd,
    input wire sd,
    input wire tom,
    input wire tc,
    input wire hh,
    input wire cha [2][9],
    input wire chb [2][9],
    input wire chc [2][9],
    input wire chd [2][9],
    input wire [REG_FB_WIDTH-1:0] fb [2][9],
    input wire cnt [2][9],
    output logic signed [SAMPLE_WIDTH-1:0] channel_a = 0,
    output logic signed [SAMPLE_WIDTH-1:0] channel_b = 0,
    output logic signed [SAMPLE_WIDTH-1:0] channel_c = 0,
    output logic signed [SAMPLE_WIDTH-1:0] channel_d = 0
);
    localparam CHAN_2_OP_WIDTH = OP_OUT_WIDTH + 1;
    localparam CHAN_4_OP_WIDTH = OP_OUT_WIDTH + 2;
    localparam CHANNEL_ACCUMULATOR_WIDTH = CHAN_4_OP_WIDTH + 8*2 - 1;

    logic signed [CHAN_2_OP_WIDTH-1:0] channel_2_op [2][9];
    logic signed [CHAN_4_OP_WIDTH-1:0] channel_4_op [2][3];
    logic signed [OP_OUT_WIDTH-1:0] operator_out [NUM_BANKS][NUM_OPERATORS_PER_BANK];

    /*
     * Each channel is accumulated and then clamped to 16-bits.
     */
    logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_a_acc_pre_clamp = 0;
    logic signed [CHAN_4_OP_WIDTH-1:0] channel_a_ops [2][9] = '{default: 0};
    logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_b_acc_pre_clamp = 0;
    logic signed [CHAN_4_OP_WIDTH-1:0] channel_b_ops [2][9] = '{default: 0};
    logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_c_acc_pre_clamp = 0;
    logic signed [CHAN_4_OP_WIDTH-1:0] channel_c_ops [2][9] = '{default: 0};
    logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_d_acc_pre_clamp = 0;
    logic signed [CHAN_4_OP_WIDTH-1:0] channel_d_ops [2][9] = '{default: 0};
    logic latch_channels = 0;

    enum {
        IDLE,
        CALC_OUTPUTS
    } state = IDLE, next_state;

    logic [$clog2(9)-1:0] channel = 0;
    logic bank = 0;

    always_ff @(posedge clk)
        state <= next_state;

    always_comb
        unique case (state)
        IDLE: next_state = sample_clk_en ? CALC_OUTPUTS : IDLE;
        CALC_OUTPUTS: next_state = bank == 1 && channel == 8 ? IDLE : CALC_OUTPUTS;
        endcase

    always_ff @(posedge clk)
        if (state == IDLE || channel == 8)
            channel <= 0;
        else
            channel <= channel + 1;

    always_ff @(posedge clk)
        if (state == IDLE)
            bank <= 0;
        else if (channel == 8)
            bank <= 1;

    always_ff @(posedge clk)
        latch_channels = state == CALC_OUTPUTS && next_state == IDLE;

    /*
     * One operator is instantiated; it replicates the necessary registers for
     * all operator slots (phase accumulation, envelope state and value, etc).
     */
    control_operators control_operators (
        .*
    );

    for (genvar i = 0; i < NUM_BANKS; i++) begin
        /*
         * 2 operator channel output connections
         */
        always_comb begin
            channel_2_op[i][0] = cnt[i][0] ? operator_out[i][0] + operator_out[i][3]
             : operator_out[i][3];
            channel_2_op[i][1] = cnt[i][1] ? operator_out[i][1] + operator_out[i][4]
             : operator_out[i][4];
            channel_2_op[i][2] = cnt[i][2] ? operator_out[i][2] + operator_out[i][5]
             : operator_out[i][5];
            channel_2_op[i][3] = cnt[i][3] ? operator_out[i][6] + operator_out[i][9]
             : operator_out[i][9];
            channel_2_op[i][4] = cnt[i][4] ? operator_out[i][7] + operator_out[i][10]
             : operator_out[i][10];
            channel_2_op[i][5] = cnt[i][5] ? operator_out[i][8] + operator_out[i][11]
             : operator_out[i][11];

            if (ryt && i == 0)
                // bass drum is special (bank 0)
                channel_2_op[i][6] = cnt[i][6] ? operator_out[i][15] : operator_out[i][12];
            else
                channel_2_op[i][6] = cnt[i][6] ? operator_out[i][12] + operator_out[i][15]
                 : operator_out[i][15];

            // aka hi hat and snare drum in bank 0
            channel_2_op[i][7] = cnt[i][7] || (ryt && i == 0) ? operator_out[i][13] + operator_out[i][16]
             : operator_out[i][16];

            // aka tom tom and top cymbal in bank 0
            channel_2_op[i][8] = cnt[i][8] || (ryt && i == 0)  ? operator_out[i][14] + operator_out[i][17]
             : operator_out[i][17];
        end

        /*
         * 4 operator channel output connections
         */
        always_comb begin
            unique case ({cnt[i][0], cnt[i][3]})
            'b00: channel_4_op[i][0] = operator_out[i][9];
            'b01: channel_4_op[i][0] = operator_out[i][3] + operator_out[i][9];
            'b10: channel_4_op[i][0] = operator_out[i][0] + operator_out[i][9];
            'b11: channel_4_op[i][0] = operator_out[i][0] + operator_out[i][6] + operator_out[i][9];
            endcase

            unique case ({cnt[i][1], cnt[i][4]})
            'b00: channel_4_op[i][1] = operator_out[i][10];
            'b01: channel_4_op[i][1] = operator_out[i][4] + operator_out[i][10];
            'b10: channel_4_op[i][1] = operator_out[i][1] + operator_out[i][10];
            'b11: channel_4_op[i][1] = operator_out[i][1] + operator_out[i][7] + operator_out[i][10];
            endcase

            unique case ({cnt[i][2], cnt[i][5]})
            'b00: channel_4_op[i][2] = operator_out[i][11];
            'b01: channel_4_op[i][2] = operator_out[i][5] + operator_out[i][11];
            'b10: channel_4_op[i][2] = operator_out[i][2] + operator_out[i][11];
            'b11: channel_4_op[i][2] = operator_out[i][2] + operator_out[i][8] + operator_out[i][11];
            endcase
        end
    end

    for (genvar i = 0; i < 3; i++)
        always_ff @(posedge clk)
            if (cha[0][i] || !is_new)
                channel_a_ops[0][i] <= connection_sel[i] && is_new ? channel_4_op[0][i] : channel_2_op[0][i];
            else
                channel_a_ops[0][i] <= 0;

    for (genvar i = 3; i < 6; i++)
        always_ff @(posedge clk)
            if (cha[0][i] || !is_new)
                channel_a_ops[0][i] <= channel_2_op[0][i];
            else
                channel_a_ops[0][i] <= 0;

    for (genvar i = 6; i < 9; i++)
        always_ff @(posedge clk)
            if (cha[0][i] || !is_new)
                channel_a_ops[0][i] <= channel_2_op[0][i];
            else
                channel_a_ops[0][i] <= 0;

    for (genvar i = 0; i < 3; i++)
        always_ff @(posedge clk)
            if (cha[1][i])
                channel_a_ops[1][i] <= connection_sel[i+3] && is_new ? channel_4_op[1][i] : channel_2_op[1][i];
            else
                channel_a_ops[1][i] <= 0;

    for (genvar i = 3; i < 6; i++)
        always_ff @(posedge clk)
            if (cha[1][i])
                channel_a_ops[1][i] <= channel_2_op[1][i];
            else
                channel_a_ops[1][i] <= 0;

    for (genvar i = 6; i < 9; i++)
        always_ff @(posedge clk)
            if (cha[1][i])
                channel_a_ops[1][i] <= channel_2_op[1][i];
            else
                channel_a_ops[1][i] <= 0;

    always_ff @(posedge clk)
        if (sample_clk_en)
            channel_a_acc_pre_clamp <= 0;
        else if (state == CALC_OUTPUTS)
            channel_a_acc_pre_clamp <= channel_a_acc_pre_clamp + channel_a_ops[bank][channel];

    for (genvar i = 0; i < 3; i++)
        always_ff @(posedge clk)
            if (chb[0][i] || !is_new)
                channel_b_ops[0][i] <= connection_sel[i] && is_new ? channel_4_op[0][i] : channel_2_op[0][i];
            else
                channel_b_ops[0][i] <= 0;

    for (genvar i = 3; i < 6; i++)
        always_ff @(posedge clk)
            if (chb[0][i] || !is_new)
                channel_b_ops[0][i] <= channel_2_op[0][i];
            else
                channel_b_ops[0][i] <= 0;

    for (genvar i = 6; i < 9; i++)
        always_ff @(posedge clk)
            if (chb[0][i] || !is_new)
                channel_b_ops[0][i] <= channel_2_op[0][i];
            else
                channel_b_ops[0][i] <= 0;

    for (genvar i = 0; i < 3; i++)
        always_ff @(posedge clk)
            if (chb[1][i])
                channel_b_ops[1][i] <= connection_sel[i+3] && is_new ? channel_4_op[1][i] : channel_2_op[1][i];
            else
                channel_b_ops[1][i] <= 0;

    for (genvar i = 3; i < 6; i++)
        always_ff @(posedge clk)
            if (chb[1][i])
                channel_b_ops[1][i] <= channel_2_op[1][i];
            else
                channel_b_ops[1][i] <= 0;

    for (genvar i = 6; i < 9; i++)
        always_ff @(posedge clk)
            if (chb[1][i])
                channel_b_ops[1][i] <= channel_2_op[1][i];
            else
                channel_b_ops[1][i] <= 0;

    always_ff @(posedge clk)
        if (sample_clk_en)
            channel_b_acc_pre_clamp <= 0;
        else if (state == CALC_OUTPUTS)
            channel_b_acc_pre_clamp <= channel_b_acc_pre_clamp + channel_b_ops[bank][channel];

    for (genvar i = 0; i < 3; i++)
        always_ff @(posedge clk)
            if (chc[0][i] || !is_new)
                channel_c_ops[0][i] <= connection_sel[i] && is_new ? channel_4_op[0][i] : channel_2_op[0][i];
            else
                channel_c_ops[0][i] <= 0;

    for (genvar i = 3; i < 6; i++)
        always_ff @(posedge clk)
            if (chc[0][i] || !is_new)
                channel_c_ops[0][i] <= channel_2_op[0][i];
            else
                channel_c_ops[0][i] <= 0;

    for (genvar i = 6; i < 9; i++)
        always_ff @(posedge clk)
            if (chc[0][i] || !is_new)
                channel_c_ops[0][i] <= channel_2_op[0][i];
            else
                channel_c_ops[0][i] <= 0;

    for (genvar i = 0; i < 3; i++)
        always_ff @(posedge clk)
            if (chc[1][i])
                channel_c_ops[1][i] <= connection_sel[i+3] && is_new ? channel_4_op[1][i] : channel_2_op[1][i];
            else
                channel_c_ops[1][i] <= 0;

    for (genvar i = 3; i < 6; i++)
        always_ff @(posedge clk)
            if (chc[1][i])
                channel_c_ops[1][i] <= channel_2_op[1][i];
            else
                channel_c_ops[1][i] <= 0;

    for (genvar i = 6; i < 9; i++)
        always_ff @(posedge clk)
            if (chc[1][i])
                channel_c_ops[1][i] <= channel_2_op[1][i];
            else
                channel_c_ops[1][i] <= 0;

    always_ff @(posedge clk)
        if (sample_clk_en)
            channel_c_acc_pre_clamp <= 0;
        else if (state == CALC_OUTPUTS)
            channel_c_acc_pre_clamp <= channel_c_acc_pre_clamp + channel_c_ops[bank][channel];

    for (genvar i = 0; i < 3; i++)
        always_ff @(posedge clk)
            if (chd[0][i] || !is_new)
                channel_d_ops[0][i] <= connection_sel[i] && is_new ? channel_4_op[0][i] : channel_2_op[0][i];
            else
                channel_d_ops[0][i] <= 0;

    for (genvar i = 3; i < 6; i++)
        always_ff @(posedge clk)
            if (chd[0][i] || !is_new)
                channel_d_ops[0][i] <= channel_2_op[0][i];
            else
                channel_d_ops[0][i] <= 0;

    for (genvar i = 6; i < 9; i++)
        always_ff @(posedge clk)
            if (chd[0][i] || !is_new)
                channel_d_ops[0][i] <= channel_2_op[0][i];
            else
                channel_d_ops[0][i] <= 0;

    for (genvar i = 0; i < 3; i++)
        always_ff @(posedge clk)
            if (chd[1][i])
                channel_d_ops[1][i] <= connection_sel[i+3] && is_new ? channel_4_op[1][i] : channel_2_op[1][i];
            else
                channel_d_ops[1][i] <= 0;

    for (genvar i = 3; i < 6; i++)
        always_ff @(posedge clk)
            if (chd[1][i])
                channel_d_ops[1][i] <= channel_2_op[1][i];
            else
                channel_d_ops[1][i] <= 0;

    for (genvar i = 6; i < 9; i++)
        always_ff @(posedge clk)
            if (chd[1][i])
                channel_d_ops[1][i] <= channel_2_op[1][i];
            else
                channel_d_ops[1][i] <= 0;

    always_ff @(posedge clk)
        if (sample_clk_en)
            channel_d_acc_pre_clamp <= 0;
        else if (state == CALC_OUTPUTS)
            channel_d_acc_pre_clamp <= channel_d_acc_pre_clamp + channel_d_ops[bank][channel];

    /*
     * Clamp output channels
     */
    always_ff @(posedge clk)
        if (latch_channels) begin
            if (channel_a_acc_pre_clamp > 2**(SAMPLE_WIDTH - 1) - 1)
                channel_a <= 2**(SAMPLE_WIDTH - 1) - 1;
            else if (channel_a_acc_pre_clamp < -2**(SAMPLE_WIDTH - 1))
                channel_a <= -2**(SAMPLE_WIDTH - 1);
            else
                channel_a <= channel_a_acc_pre_clamp;

            if (channel_b_acc_pre_clamp > 2**(SAMPLE_WIDTH - 1) - 1)
                channel_b <= 2**(SAMPLE_WIDTH - 1) - 1;
            else if (channel_b_acc_pre_clamp < -2**(SAMPLE_WIDTH - 1))
                channel_b <= -2**(SAMPLE_WIDTH - 1);
            else
                channel_b <= channel_b_acc_pre_clamp;

            if (channel_c_acc_pre_clamp > 2**(SAMPLE_WIDTH - 1) - 1)
                channel_c <= 2**(SAMPLE_WIDTH - 1) - 1;
            else if (channel_c_acc_pre_clamp < -2**(SAMPLE_WIDTH - 1))
                channel_c <= -2**(SAMPLE_WIDTH - 1);
            else
                channel_c <= channel_c_acc_pre_clamp;

            if (channel_d_acc_pre_clamp > 2**(SAMPLE_WIDTH - 1) - 1)
                channel_d <= 2**(SAMPLE_WIDTH - 1) - 1;
            else if (channel_d_acc_pre_clamp < -2**(SAMPLE_WIDTH - 1))
                channel_d <= -2**(SAMPLE_WIDTH - 1);
            else
                channel_d <= channel_d_acc_pre_clamp;
        end

endmodule
`default_nettype wire