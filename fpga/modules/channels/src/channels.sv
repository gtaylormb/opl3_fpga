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
    input wire clk_host,
    input var opl3_reg_wr_t opl3_reg_wr,
    input wire sample_clk_en,
    output logic sample_valid,
    output logic signed [DAC_OUTPUT_WIDTH-1:0] sample_l,
    output logic signed [DAC_OUTPUT_WIDTH-1:0] sample_r
);
    localparam CHAN_2_OP_WIDTH = OP_OUT_WIDTH + 1;
    localparam CHAN_4_OP_WIDTH = OP_OUT_WIDTH + 2;
    localparam CHANNEL_ACCUMULATOR_WIDTH = CHAN_4_OP_WIDTH + 8*2 - 1;

    operator_out_t operator_out;
    logic signed [OP_OUT_WIDTH-1:0] operator_mem_out;
    logic signed [SAMPLE_WIDTH-1:0] channel_a = 0;
    logic signed [SAMPLE_WIDTH-1:0] channel_b = 0;
    logic signed [SAMPLE_WIDTH-1:0] channel_c = 0;
    logic signed [SAMPLE_WIDTH-1:0] channel_d = 0;
    logic channel_valid = 0;
    logic ops_done_pulse;
    logic [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel = 0;
    logic is_new = 0;
    logic cha;
    logic chb;
    logic chc;
    logic chd;
    logic ryt = 0; // rhythm mode on/off
    logic cnt;
    logic [REG_FB_WIDTH-1:0] fb_dummy;

    always_ff @(posedge clk)
        if (opl3_reg_wr.valid) begin
            if (opl3_reg_wr.bank_num == 1 && opl3_reg_wr.address == 4)
                connection_sel <= opl3_reg_wr.data[REG_CONNECTION_SEL_WIDTH-1:0];

            if (opl3_reg_wr.bank_num == 1 && opl3_reg_wr.address == 5)
                is_new <= opl3_reg_wr.data[0];

            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 'hBD)
                ryt <= opl3_reg_wr.data[5];
        end

    logic [$clog2('h9)-1:0] ch_abcd_cnt_mem_wr_address = opl3_reg_wr.address - 'hC0;

    mem_multi_bank #(
        .DATA_WIDTH(REG_FILE_DATA_WIDTH),
        .DEPTH('h9),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) ch_abcd_cnt_mem (
        .clk,
        .wea(opl3_reg_wr.valid && opl3_reg_wr.address >= 'hC0 && opl3_reg_wr.address <= 'hC8),
        .reb('1),
        .banka(opl3_reg_wr.bank_num),
        .addra(ch_abcd_cnt_mem_wr_address),
        .bankb(self.bank_num),
        .addrb(signals.ch_abcd_cnt_mem_channel_num),
        .dia(opl3_reg_wr.data),
        .dob({chd, chc, chb, cha, fb_dummy, cnt})
    );

    /*
     * One operator is instantiated; it replicates the necessary registers for
     * all operator slots (phase accumulation, envelope state and value, etc).
     */
    control_operators control_operators (
        .*
    );

    mem_multi_bank #(
        .DATA_WIDTH(OP_OUT_WIDTH),
        .DEPTH(NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) operator_out_mem (
        .clk,
        .wea(operator_out.valid),
        .reb('1),
        .banka(operator_out.bank_num),
        .addra(operator_out.op_num),
        .bankb(self.bank_num),
        .addrb(signals.op_mem_op_num),
        .dia(operator_out.op_out),
        .dob(operator_mem_out)
    );

    enum {
        IDLE,
        LOAD_2_OP_SECOND,
        LOAD_2_OP_FIRST_AND_ACCUMULATE,
        LOAD_4_OP_THIRD,
        LOAD_4_OP_SECOND,
        LOAD_4_OP_FIRST_AND_ACCUMULATE,
        DONE
    } state = IDLE, next_state;

    struct packed {
        logic cnt_second;
        logic signed [OP_OUT_WIDTH-1:0] operator_out_third;
        logic signed [OP_OUT_WIDTH-1:0] operator_out_second;
        logic bank_num;
        logic [$clog2(NUM_OPERATORS_PER_BANK)-1:0] op_num;
        logic [$clog2(NUM_CHANNELS_PER_BANK)-1:0] channel_num;
        logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_a_acc_pre_clamp;
        logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_b_acc_pre_clamp;
        logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_c_acc_pre_clamp;
        logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_d_acc_pre_clamp;
    } self = 0, next_self;

    struct packed {
        logic [$clog2(NUM_OPERATORS_PER_BANK)-1:0] op_mem_op_num;
        logic [$clog2(NUM_CHANNELS_PER_BANK)-1:0] ch_abcd_cnt_mem_channel_num;
        logic signed [CHAN_2_OP_WIDTH-1:0] channel_2_op;
        logic signed [CHAN_4_OP_WIDTH-1:0] channel_4_op;
        logic latch_channels;
    } signals;

    always_ff @(posedge clk)
        if (sample_clk_en) begin
            state <= IDLE;
            self <= 0;
        end
        else begin
            state <= next_state;
            self <= next_self;
        end

    always_comb begin
        next_self = self;
        signals = 0;

        unique case (state)
        IDLE:
            if (ops_done_pulse)
                next_state = LOAD_2_OP_SECOND;
        LOAD_2_OP_SECOND: begin
            next_state = LOAD_2_OP_FIRST_AND_ACCUMULATE;
            signals.op_mem_op_num = self.op_num + 3;
            next_self.operator_out_second = operator_mem_out;
        end
        LOAD_2_OP_FIRST_AND_ACCUMULATE: begin
            signals.ch_abcd_cnt_mem_channel_num = self.channel_num;
            signals.channel_2_op = cnt ? operator_mem_out + self.operator_out_second : self.operator_out_second;
            if (ryt && self.bank_num == 0)
                unique case (self.channel_num)
                6:    signals.channel_2_op = cnt ? self.operator_out_second : operator_mem_out; // bass drum
                7, 8: signals.channel_2_op = operator_mem_out + self.operator_out_second; // hi-hat and snare drum, tom-tom and top cymbal
                default:;
                endcase

            if (self.channel_num < 3) begin
                if (self.bank_num == 0) begin
                    if (!is_new || (cha && !connection_sel[self.channel_num]))
                        next_self.channel_a_acc_pre_clamp = self.channel_a_acc_pre_clamp + signals.channel_2_op;
                    if (!is_new || (chb && !connection_sel[self.channel_num]))
                        next_self.channel_b_acc_pre_clamp = self.channel_b_acc_pre_clamp + signals.channel_2_op;
                    if (!is_new || (chc && !connection_sel[self.channel_num]))
                        next_self.channel_c_acc_pre_clamp = self.channel_c_acc_pre_clamp + signals.channel_2_op;
                    if (!is_new || (chd && !connection_sel[self.channel_num]))
                        next_self.channel_d_acc_pre_clamp = self.channel_d_acc_pre_clamp + signals.channel_2_op;
                end
                else begin
                    if (cha && !connection_sel[self.channel_num+3])
                        next_self.channel_a_acc_pre_clamp = self.channel_a_acc_pre_clamp + signals.channel_2_op;
                    if (chb && !connection_sel[self.channel_num+3])
                        next_self.channel_b_acc_pre_clamp = self.channel_b_acc_pre_clamp + signals.channel_2_op;
                    if (chc && !connection_sel[self.channel_num+3])
                        next_self.channel_c_acc_pre_clamp = self.channel_c_acc_pre_clamp + signals.channel_2_op;
                    if (chd && !connection_sel[self.channel_num+3])
                        next_self.channel_d_acc_pre_clamp = self.channel_d_acc_pre_clamp + signals.channel_2_op;
                end
            end
            else begin
                if ((self.bank_num == 0 && !is_new) || cha)
                    next_self.channel_a_acc_pre_clamp = self.channel_a_acc_pre_clamp + signals.channel_2_op;
                if ((self.bank_num == 0 && !is_new) || chb)
                    next_self.channel_b_acc_pre_clamp = self.channel_b_acc_pre_clamp + signals.channel_2_op;
                if ((self.bank_num == 0 && !is_new) || chc)
                    next_self.channel_c_acc_pre_clamp = self.channel_c_acc_pre_clamp + signals.channel_2_op;
                if ((self.bank_num == 0 && !is_new) || chd)
                    next_self.channel_d_acc_pre_clamp = self.channel_d_acc_pre_clamp + signals.channel_2_op;
            end

            if (self.channel_num == NUM_CHANNELS_PER_BANK - 1) begin
                if (self.bank_num == NUM_BANKS - 1) begin
                    next_state = LOAD_4_OP_THIRD;
                    next_self.op_num = 0;
                    next_self.channel_num = 0;
                    next_self.bank_num = 0;
                end
                else begin
                    next_state = LOAD_2_OP_SECOND;
                    next_self.op_num = 0;
                    next_self.bank_num = 1;
                    next_self.channel_num = 0;
                end
            end
            else begin
                next_state = LOAD_2_OP_SECOND;
                unique case (self.channel_num)
                2:       next_self.op_num = 6;
                5:       next_self.op_num = 12;
                default: next_self.op_num = self.op_num + 1;
                endcase
                next_self.channel_num = self.channel_num + 1;
            end
        end
        LOAD_4_OP_THIRD: begin
            next_state = LOAD_4_OP_SECOND;
            signals.op_mem_op_num = self.channel_num + 9;
            next_self.operator_out_third = operator_mem_out;
        end
        LOAD_4_OP_SECOND: begin
            next_state = LOAD_4_OP_FIRST_AND_ACCUMULATE;
            signals.op_mem_op_num = self.channel_num + 6;
            next_self.operator_out_second = operator_mem_out;
            signals.ch_abcd_cnt_mem_channel_num = self.channel_num + 3;
            next_self.cnt_second = cnt;
        end
        LOAD_4_OP_FIRST_AND_ACCUMULATE: begin
            signals.ch_abcd_cnt_mem_channel_num = self.channel_num;
            signals.op_mem_op_num = {cnt, self.cnt_second} == 'b01 ? self.channel_num + 3 : self.channel_num;
            unique case ({cnt, self.cnt_second})
            'b00: signals.channel_4_op = self.operator_out_third;
            'b01: signals.channel_4_op = operator_mem_out + self.operator_out_third;
            'b10: signals.channel_4_op = operator_mem_out + self.operator_out_third;
            'b11: signals.channel_4_op = operator_mem_out + self.operator_out_second + self.operator_out_third;
            endcase

            if (self.bank_num == 0) begin
                if (!is_new || (cha && connection_sel[self.channel_num]))
                    next_self.channel_a_acc_pre_clamp = self.channel_a_acc_pre_clamp + signals.channel_4_op;
                if (!is_new || (chb && connection_sel[self.channel_num]))
                    next_self.channel_b_acc_pre_clamp = self.channel_b_acc_pre_clamp + signals.channel_4_op;
                if (!is_new || (chc && connection_sel[self.channel_num]))
                    next_self.channel_c_acc_pre_clamp = self.channel_c_acc_pre_clamp + signals.channel_4_op;
                if (!is_new || (chd && connection_sel[self.channel_num]))
                    next_self.channel_d_acc_pre_clamp = self.channel_d_acc_pre_clamp + signals.channel_4_op;
            end
            else begin
                if (cha && connection_sel[self.channel_num+3])
                    next_self.channel_a_acc_pre_clamp = self.channel_a_acc_pre_clamp + signals.channel_4_op;
                if (chb && connection_sel[self.channel_num+3])
                    next_self.channel_b_acc_pre_clamp = self.channel_b_acc_pre_clamp + signals.channel_4_op;
                if (chc && connection_sel[self.channel_num+3])
                    next_self.channel_c_acc_pre_clamp = self.channel_c_acc_pre_clamp + signals.channel_4_op;
                if (chd && connection_sel[self.channel_num+3])
                    next_self.channel_d_acc_pre_clamp = self.channel_d_acc_pre_clamp + signals.channel_4_op;
            end

            if (self.channel_num == 2) begin
                if (self.bank_num == NUM_BANKS - 1)
                    next_state = DONE;
                else begin
                    next_state = LOAD_4_OP_THIRD;
                    next_self.channel_num = 0;
                    next_self.bank_num = 1;
                end
            end
            else begin
                next_state = LOAD_4_OP_THIRD;
                next_self.channel_num = self.channel_num + 1;
            end
        end
        DONE: begin
            next_state = IDLE;
            next_self = 0;
            signals.latch_channels = 1;
        end
        endcase
    end

    always_ff @(posedge clk)
        channel_valid <= signals.latch_channels;

    /*
     * Clamp output channels
     */
    always_ff @(posedge clk)
        if (signals.latch_channels) begin
            if (self.channel_a_acc_pre_clamp > 2**(SAMPLE_WIDTH - 1) - 1)
                channel_a <= 2**(SAMPLE_WIDTH - 1) - 1;
            else if (self.channel_a_acc_pre_clamp < -2**(SAMPLE_WIDTH - 1))
                channel_a <= -2**(SAMPLE_WIDTH - 1);
            else
                channel_a <= self.channel_a_acc_pre_clamp;

            if (self.channel_b_acc_pre_clamp > 2**(SAMPLE_WIDTH - 1) - 1)
                channel_b <= 2**(SAMPLE_WIDTH - 1) - 1;
            else if (self.channel_b_acc_pre_clamp < -2**(SAMPLE_WIDTH - 1))
                channel_b <= -2**(SAMPLE_WIDTH - 1);
            else
                channel_b <= self.channel_b_acc_pre_clamp;

            if (self.channel_c_acc_pre_clamp > 2**(SAMPLE_WIDTH - 1) - 1)
                channel_c <= 2**(SAMPLE_WIDTH - 1) - 1;
            else if (self.channel_c_acc_pre_clamp < -2**(SAMPLE_WIDTH - 1))
                channel_c <= -2**(SAMPLE_WIDTH - 1);
            else
                channel_c <= self.channel_c_acc_pre_clamp;

            if (self.channel_d_acc_pre_clamp > 2**(SAMPLE_WIDTH - 1) - 1)
                channel_d <= 2**(SAMPLE_WIDTH - 1) - 1;
            else if (self.channel_d_acc_pre_clamp < -2**(SAMPLE_WIDTH - 1))
                channel_d <= -2**(SAMPLE_WIDTH - 1);
            else
                channel_d <= self.channel_d_acc_pre_clamp;
        end

    channel_adder channel_adder (
        .*
    );

endmodule
`default_nettype wire