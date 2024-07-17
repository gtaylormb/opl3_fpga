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
    input wire reset,
    input wire clk_dac,
    input var opl3_reg_wr_t opl3_reg_wr,
    input wire sample_clk_en,
    output logic sample_valid,
    output logic signed [DAC_OUTPUT_WIDTH-1:0] sample_l,
    output logic signed [DAC_OUTPUT_WIDTH-1:0] sample_r
);
    localparam CHANNEL_OUT_WIDTH = OP_OUT_WIDTH + 2;

    // + 1 because we combine 2 channels together for left and right
    localparam CHANNEL_ACCUMULATOR_WIDTH = OP_OUT_WIDTH + $clog2(NUM_OPERATORS_PER_BANK*NUM_BANKS) + 1;

    operator_out_t operator_out;
    logic signed [OP_OUT_WIDTH-1:0] operator_mem_out;
    logic signed [SAMPLE_WIDTH-1:0] channel_l = 0;
    logic signed [SAMPLE_WIDTH-1:0] channel_r = 0;
    logic channel_valid = 0;
    logic ops_done_pulse;
    logic [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel = 0;
    logic is_new = 0; // 1 = OPL3, 0 = OPL2
    logic ryt = 0; // rhythm mode on/off
    logic cha; // chan a on/off
    logic chb; // chan b on/off
    logic chc; // chan c on/off
    logic chd; // chan d on/off
    logic cnt; // operator connection
    logic [REG_FB_WIDTH-1:0] fb_dummy;

    enum {
        IDLE,
        LOAD_2_OP_SECOND_0,
        LOAD_2_OP_SECOND_1,
        LOAD_2_OP_FIRST_AND_ACCUMULATE,
        LOAD_4_OP_THIRD_0,
        LOAD_4_OP_THIRD_1,
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
        logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_l_acc_pre_clamp;
        logic signed [CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_r_acc_pre_clamp;
    } self = 0, next_self;

    // verilator lint_off UNOPTFLAT
    struct packed {
        logic [$clog2(NUM_OPERATORS_PER_BANK)-1:0] op_mem_op_num;
        logic op_mem_rd;
        logic [$clog2(NUM_CHANNELS_PER_BANK)-1:0] ch_abcd_cnt_mem_channel_num;
        logic signed [CHANNEL_OUT_WIDTH-1:0] channel_out;
        logic latch_channels;
        logic add_a;
        logic add_b;
        logic add_c;
        logic add_d;
    } signals;
    // verilator lint_on UNOPTFLAT

    always_ff @(posedge clk) begin
        if (opl3_reg_wr.valid) begin
            if (opl3_reg_wr.bank_num == 1 && opl3_reg_wr.address == 4)
                connection_sel <= opl3_reg_wr.data[REG_CONNECTION_SEL_WIDTH-1:0];

            if (opl3_reg_wr.bank_num == 1 && opl3_reg_wr.address == 5)
                is_new <= opl3_reg_wr.data[0];

            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 'hBD)
                ryt <= opl3_reg_wr.data[5];
        end

        if (reset) begin
            // these should be reset as next game after reset may be OPL2 and not clear bank 1
            connection_sel <= 0;
            is_new <= 0;
        end
    end

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
        .addra(opl3_reg_wr.address[$clog2('h9)-1:0]),
        .bankb(self.bank_num),
        .addrb(signals.ch_abcd_cnt_mem_channel_num),
        .dia(opl3_reg_wr.data),
        .dob({chd, chc, chb, cha, fb_dummy, cnt})
    );

    control_operators control_operators (
        .*
    );

    mem_multi_bank #(
        .DATA_WIDTH(OP_OUT_WIDTH),
        .DEPTH(NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(1),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) operator_out_mem (
        .clk,
        .wea(operator_out.valid),
        .reb(signals.op_mem_rd),
        .banka(operator_out.bank_num),
        .addra(operator_out.op_num),
        .bankb(self.bank_num),
        .addrb(signals.op_mem_op_num),
        .dia(operator_out.op_out),
        .dob(operator_mem_out)
    );

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
        next_state = state;
        next_self = self;
        signals = 0;

        unique case (state)
        IDLE:
            // once operators are calculated for this sample, we can begin accumulating the channels
            if (ops_done_pulse)
                next_state = LOAD_2_OP_SECOND_0;
        LOAD_2_OP_SECOND_0: begin
            next_state = LOAD_2_OP_SECOND_1;
            signals.op_mem_op_num = self.op_num + 3;
            signals.op_mem_rd = 1;
        end
        LOAD_2_OP_SECOND_1: begin
            next_state = LOAD_2_OP_FIRST_AND_ACCUMULATE;
            next_self.operator_out_second = operator_mem_out;
            signals.op_mem_op_num = self.op_num;
            signals.op_mem_rd = 1;
        end
        LOAD_2_OP_FIRST_AND_ACCUMULATE: begin
            signals.ch_abcd_cnt_mem_channel_num = self.channel_num;
            signals.channel_out = cnt ? operator_mem_out + self.operator_out_second : self.operator_out_second;
            if (ryt && self.bank_num == 0)
                unique case (self.channel_num)
                6:    signals.channel_out = self.operator_out_second*2; // bass drum
                7, 8: signals.channel_out = (operator_mem_out + self.operator_out_second)*2; // hi-hat and snare drum, tom-tom and top cymbal
                default:;
                endcase

            if (self.channel_num < 3) begin
                if (self.bank_num == 0) begin
                    signals.add_a = !is_new || (cha && !connection_sel[self.channel_num]);
                    signals.add_b = !is_new || (chb && !connection_sel[self.channel_num]);
                    signals.add_c = !is_new || (chc && !connection_sel[self.channel_num]);
                    signals.add_d = !is_new || (chd && !connection_sel[self.channel_num]);
                end
                else begin
                    signals.add_a = cha && !connection_sel[self.channel_num+3];
                    signals.add_b = chb && !connection_sel[self.channel_num+3];
                    signals.add_c = chc && !connection_sel[self.channel_num+3];
                    signals.add_d = chd && !connection_sel[self.channel_num+3];
                end
            end
            else if (self.channel_num < 6) begin
                if (self.bank_num == 0) begin
                    signals.add_a = !is_new || (cha && !connection_sel[self.channel_num-3]);
                    signals.add_b = !is_new || (chb && !connection_sel[self.channel_num-3]);
                    signals.add_c = !is_new || (chc && !connection_sel[self.channel_num-3]);
                    signals.add_d = !is_new || (chd && !connection_sel[self.channel_num-3]);
                end
                else begin
                    signals.add_a = cha && !connection_sel[self.channel_num];
                    signals.add_b = chb && !connection_sel[self.channel_num];
                    signals.add_c = chc && !connection_sel[self.channel_num];
                    signals.add_d = chd && !connection_sel[self.channel_num];
                end
            end
            else begin
                signals.add_a = (self.bank_num == 0 && !is_new) || cha;
                signals.add_b = (self.bank_num == 0 && !is_new) || chb;
                signals.add_c = (self.bank_num == 0 && !is_new) || chc;
                signals.add_d = (self.bank_num == 0 && !is_new) || chd;
            end

            unique case ({signals.add_a, signals.add_c})
            'b01, 'b10: next_self.channel_l_acc_pre_clamp = self.channel_l_acc_pre_clamp + signals.channel_out;
            'b11:       next_self.channel_l_acc_pre_clamp = self.channel_l_acc_pre_clamp + signals.channel_out*2;
            default:;
            endcase

            unique case ({signals.add_b, signals.add_d})
            'b01, 'b10: next_self.channel_r_acc_pre_clamp = self.channel_r_acc_pre_clamp + signals.channel_out;
            'b11:       next_self.channel_r_acc_pre_clamp = self.channel_r_acc_pre_clamp + signals.channel_out*2;
            default:;
            endcase

            if (self.channel_num == NUM_CHANNELS_PER_BANK - 1) begin
                if (self.bank_num == 1) begin
                    next_state = LOAD_4_OP_THIRD_0;
                    next_self.op_num = 0;
                    next_self.channel_num = 0;
                    next_self.bank_num = 0;
                end
                else begin
                    next_state = LOAD_2_OP_SECOND_0;
                    next_self.op_num = 0;
                    next_self.bank_num = 1;
                    next_self.channel_num = 0;
                end
            end
            else begin
                next_state = LOAD_2_OP_SECOND_0;
                unique case (self.channel_num)
                2:       next_self.op_num = 6;
                5:       next_self.op_num = 12;
                default: next_self.op_num = self.op_num + 1;
                endcase
                next_self.channel_num = self.channel_num + 1;
            end
        end
        LOAD_4_OP_THIRD_0: begin
            // op_mem has a 1 cycle read delay so need an extra cycle at beginning of calculating channel op
            next_state = LOAD_4_OP_THIRD_1;
            signals.op_mem_op_num = self.channel_num + 9;
            signals.op_mem_rd = 1;
        end
        LOAD_4_OP_THIRD_1: begin
            next_state = LOAD_4_OP_SECOND;
            signals.op_mem_op_num = self.channel_num + 6;
            signals.op_mem_rd = 1;
            next_self.operator_out_third = operator_mem_out;
            signals.ch_abcd_cnt_mem_channel_num = self.channel_num + 3;
            next_self.cnt_second = cnt;
        end
        LOAD_4_OP_SECOND: begin
            next_state = LOAD_4_OP_FIRST_AND_ACCUMULATE;
            signals.ch_abcd_cnt_mem_channel_num = self.channel_num;
            signals.op_mem_op_num = {cnt, self.cnt_second} == 'b01 ? self.channel_num + 3 : self.channel_num;
            signals.op_mem_rd = 1;
            next_self.operator_out_second = operator_mem_out;
        end
        LOAD_4_OP_FIRST_AND_ACCUMULATE: begin
            signals.ch_abcd_cnt_mem_channel_num = self.channel_num;
            unique case ({cnt, self.cnt_second})
            'b00: signals.channel_out = self.operator_out_third;
            'b01: signals.channel_out = operator_mem_out + self.operator_out_third;
            'b10: signals.channel_out = operator_mem_out + self.operator_out_third;
            'b11: signals.channel_out = operator_mem_out + self.operator_out_second + self.operator_out_third;
            endcase

            if (self.bank_num == 0) begin
                signals.add_a = cha && connection_sel[self.channel_num];
                signals.add_b = chb && connection_sel[self.channel_num];
                signals.add_c = chc && connection_sel[self.channel_num];
                signals.add_d = chd && connection_sel[self.channel_num];
            end
            else begin
                signals.add_a = cha && connection_sel[self.channel_num+3];
                signals.add_b = chb && connection_sel[self.channel_num+3];
                signals.add_c = chc && connection_sel[self.channel_num+3];
                signals.add_d = chd && connection_sel[self.channel_num+3];
            end

            /*
            * The 4 16-bit output channels are normally combined into right and left in the analog domain
            * after the YAC512 DAC outputs. Here we'll just add digitally.
            */
            unique case ({signals.add_a, signals.add_c})
            'b01, 'b10: next_self.channel_l_acc_pre_clamp = self.channel_l_acc_pre_clamp + signals.channel_out;
            'b11:       next_self.channel_l_acc_pre_clamp = self.channel_l_acc_pre_clamp + signals.channel_out*2;
            default:;
            endcase

            unique case ({signals.add_b, signals.add_d})
            'b01, 'b10: next_self.channel_r_acc_pre_clamp = self.channel_r_acc_pre_clamp + signals.channel_out;
            'b11:       next_self.channel_r_acc_pre_clamp = self.channel_r_acc_pre_clamp + signals.channel_out*2;
            default:;
            endcase

            if (self.channel_num == 2) begin
                if (self.bank_num == NUM_BANKS - 1)
                    next_state = DONE;
                else begin
                    next_state = LOAD_4_OP_THIRD_0;
                    next_self.channel_num = 0;
                    next_self.bank_num = 1;
                end
            end
            else begin
                next_state = LOAD_4_OP_THIRD_0;
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
            if (self.channel_l_acc_pre_clamp > 2**(SAMPLE_WIDTH - 1) - 1)
                channel_l <= 2**(SAMPLE_WIDTH - 1) - 1;
            else if (self.channel_l_acc_pre_clamp < -2**(SAMPLE_WIDTH - 1))
                channel_l <= -2**(SAMPLE_WIDTH - 1);
            else
                channel_l <= self.channel_l_acc_pre_clamp;

            if (self.channel_r_acc_pre_clamp > 2**(SAMPLE_WIDTH - 1) - 1)
                channel_r <= 2**(SAMPLE_WIDTH - 1) - 1;
            else if (self.channel_r_acc_pre_clamp < -2**(SAMPLE_WIDTH - 1))
                channel_r <= -2**(SAMPLE_WIDTH - 1);
            else
                channel_r <= self.channel_r_acc_pre_clamp;
        end

    dac_prep dac_prep (
        .*
    );

endmodule
`default_nettype wire
