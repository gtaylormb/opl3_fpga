/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: control_operators.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 17 Nov 2014
#
#   DESCRIPTION:
#   Implement the state-machine for time-sharing operator resources across
#   all operator slots
#
#   CHANGE HISTORY:
#   17 Nov 2014    Greg Taylor
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

module control_operators
    import opl3_pkg::*;
(
    input wire clk,
    input wire reset,
    input wire sample_clk_en,
    input var opl3_reg_wr_t opl3_reg_wr,
    input wire [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel,
    input wire is_new,
    input wire ryt,
    output operator_out_t operator_out,
    output logic ops_done_pulse = 0
);
    localparam PIPELINE_DELAY = 6;
    localparam MODULATION_DELAY = 1; // output of operator 0 must be ready by cycle 2 of operator 3 so it can modulate it
    localparam DELAY_COUNTER_WIDTH = MODULATION_DELAY > 1 ? $clog2(MODULATION_DELAY) : 1;
    localparam NUM_OPERATOR_UPDATE_STATES = NUM_BANKS*NUM_OPERATORS_PER_BANK + 1; // 36 operators + idle state
    logic [DELAY_COUNTER_WIDTH-1:0] delay_counter = 0;

    logic [$clog2(NUM_OPERATOR_UPDATE_STATES)-1:0] state = 0;
    logic [$clog2(NUM_OPERATOR_UPDATE_STATES)-1:0] next_state;

    logic [BANK_NUM_WIDTH-1:0] bank_num;
    logic [BANK_NUM_WIDTH-1:0] bank_num_p1 = 0;
    logic [OP_NUM_WIDTH-1:0] op_num;
    logic [OP_NUM_WIDTH-1:0] op_num_p1 = 0;

    logic use_feedback_p1 = 0;
    logic signed [OP_OUT_WIDTH-1:0] modulation_p1;
    logic signed [OP_OUT_WIDTH-1:0] out_p6;
    logic signed [OP_OUT_WIDTH-1:0] modulation_out_p1;

    logic op_sample_clk_en;
    logic [PIPELINE_DELAY:1] op_sample_clk_en_p;
    logic [PIPELINE_DELAY:1] [BANK_NUM_WIDTH-1:0] bank_num_p;
    logic [PIPELINE_DELAY:1] [OP_NUM_WIDTH-1:0] op_num_p;
    logic [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel_p1 = 0;
    logic ryt_p1 = 0;

    logic am;  // amplitude modulation (tremolo on/off)
    logic vib; // vibrato on/off
    logic egt; // envelope type (select sustain/decay)
    logic ksr; // key scale rate
    logic [REG_MULT_WIDTH-1:0] mult; // frequency data multiplier
    logic [REG_KSL_WIDTH-1:0] ksl;   // key scale level
    logic [REG_TL_WIDTH-1:0] tl;     // total level (modulation, volume setting)
    logic [REG_ENV_WIDTH-1:0] ar;    // attack rate
    logic [REG_ENV_WIDTH-1:0] dr;    // decay rate
    logic [REG_ENV_WIDTH-1:0] sl;    // sustain level
    logic [REG_ENV_WIDTH-1:0] rr;    // release rate
    logic [REG_WS_WIDTH-1:0] ws;     // waveform select
    logic [$clog2('h16)-1:0] operator_mem_rd_address;

    logic [REG_FNUM_WIDTH-1:0] fnum;   // f-number (scale data within the octave)
    logic [REG_BLOCK_WIDTH-1:0] block; // octave data
    logic kon;                         // key-on (sound generation on/off)
    logic [REG_FB_WIDTH-1:0] fb_p1;       // feedback (modulation for slot 1 FM feedback)
    logic cnt0_p1;                         // operator connection
    logic cnt1_p1;                         // operator connection
    logic [$clog2('h9)-1:0] kon_block_fnum_channel_mem_rd_address;
    logic [$clog2('h9)-1:0] fb_cnt0_channel_mem_rd_address;
    logic [$clog2('h9)-1:0] cnt1_channel_mem_rd_address;

    logic nts = 0; // keyboard split selection
    logic dvb = 0; // vibrato depth
    logic dam = 0; // depth of tremolo
    logic bd = 0;  // bass drum key-on
    logic sd = 0;  // snare drum key-on
    logic tom = 0; // tom-tom key-on
    logic tc = 0;  // top-cymbal key-on
    logic hh = 0;  // hi-hat key-on

    always_ff @(posedge clk)
        if (opl3_reg_wr.valid) begin
            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 8)
                nts <= opl3_reg_wr.data[6];

            if (opl3_reg_wr.bank_num == 0 && opl3_reg_wr.address == 'hBD) begin
                dam <= opl3_reg_wr.data[7];
                dvb <= opl3_reg_wr.data[6];
                bd  <= opl3_reg_wr.data[4];
                sd  <= opl3_reg_wr.data[3];
                tom <= opl3_reg_wr.data[2];
                tc  <= opl3_reg_wr.data[1];
                hh  <= opl3_reg_wr.data[0];
            end
        end

    always_comb
        if (op_num < 6)
            operator_mem_rd_address = op_num;
        else if (op_num < 12)
            operator_mem_rd_address = op_num + 2;
        else
            operator_mem_rd_address = op_num + 4;

    mem_multi_bank #(
        .DATA_WIDTH(REG_FILE_DATA_WIDTH),
        .DEPTH('h16),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) am_vib_egt_ksr_mult_mem (
        .clk,
        .wea(opl3_reg_wr.valid && opl3_reg_wr.address >= 'h20 && opl3_reg_wr.address <= 'h35),
        .reb(op_sample_clk_en),
        .banka(opl3_reg_wr.bank_num),
        .addra(opl3_reg_wr.address[$clog2('h16)-1:0]),
        .bankb(bank_num),
        .addrb(operator_mem_rd_address),
        .dia(opl3_reg_wr.data),
        .dob({am, vib, egt, ksr, mult})
    );

    mem_multi_bank #(
        .DATA_WIDTH(REG_FILE_DATA_WIDTH),
        .DEPTH('h16),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) ksl_tl_mem (
        .clk,
        .wea(opl3_reg_wr.valid && opl3_reg_wr.address >= 'h40 && opl3_reg_wr.address <= 'h55),
        .reb(op_sample_clk_en),
        .banka(opl3_reg_wr.bank_num),
        .addra(opl3_reg_wr.address[$clog2('h16)-1:0]),
        .bankb(bank_num),
        .addrb(operator_mem_rd_address),
        .dia(opl3_reg_wr.data),
        .dob({ksl, tl})
    );

    mem_multi_bank #(
        .DATA_WIDTH(REG_FILE_DATA_WIDTH),
        .DEPTH('h16),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) ar_dr_mem (
        .clk,
        .wea(opl3_reg_wr.valid && opl3_reg_wr.address >= 'h60 && opl3_reg_wr.address <= 'h75),
        .reb(op_sample_clk_en),
        .banka(opl3_reg_wr.bank_num),
        .addra(opl3_reg_wr.address[$clog2('h16)-1:0]),
        .bankb(bank_num),
        .addrb(operator_mem_rd_address),
        .dia(opl3_reg_wr.data),
        .dob({ar, dr})
    );

    mem_multi_bank #(
        .DATA_WIDTH(REG_FILE_DATA_WIDTH),
        .DEPTH('h16),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) sl_rr_mem (
        .clk,
        .wea(opl3_reg_wr.valid && opl3_reg_wr.address >= 'h80 && opl3_reg_wr.address <= 'h95),
        .reb(op_sample_clk_en),
        .banka(opl3_reg_wr.bank_num),
        .addra(opl3_reg_wr.address[$clog2('h16)-1:0]),
        .bankb(bank_num),
        .addrb(operator_mem_rd_address),
        .dia(opl3_reg_wr.data),
        .dob({sl, rr})
    );

    mem_multi_bank #(
        .DATA_WIDTH(REG_WS_WIDTH),
        .DEPTH('h16),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) ws_mem (
        .clk,
        .wea(opl3_reg_wr.valid && opl3_reg_wr.address >= 'hE0 && opl3_reg_wr.address <= 'hF5),
        .reb(op_sample_clk_en),
        .banka(opl3_reg_wr.bank_num),
        .addra(opl3_reg_wr.address[$clog2('h16)-1:0]),
        .bankb(bank_num),
        .addrb(operator_mem_rd_address),
        .dia(opl3_reg_wr.data[REG_WS_WIDTH-1:0]),
        .dob(ws)
    );

    always_comb begin
        cnt1_channel_mem_rd_address = 0;

        unique case (op_num)
        0, 3: begin
            kon_block_fnum_channel_mem_rd_address = 0;
            fb_cnt0_channel_mem_rd_address = 0;
        end
        1, 4: begin
            kon_block_fnum_channel_mem_rd_address = 1;
            fb_cnt0_channel_mem_rd_address = 1;
        end
        2, 5: begin
            kon_block_fnum_channel_mem_rd_address = 2;
            fb_cnt0_channel_mem_rd_address = 2;
        end
        6, 9: begin
            cnt1_channel_mem_rd_address = 3;
            if (bank_num == 0) begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[0] ? 0 : 3;
                fb_cnt0_channel_mem_rd_address = connection_sel[0] ? 0 : 3;
            end
            else begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[3] ? 0 : 3;
                fb_cnt0_channel_mem_rd_address = connection_sel[3] ? 0 : 3;
            end
        end
        7, 10: begin
            cnt1_channel_mem_rd_address = 4;
            if (bank_num == 0) begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[1] ? 1 : 4;
                fb_cnt0_channel_mem_rd_address = connection_sel[1] ? 1 : 4;
            end
            else begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[4] ? 1 : 4;
                fb_cnt0_channel_mem_rd_address = connection_sel[4] ? 1 : 4;
                cnt1_channel_mem_rd_address = 4;
            end
        end
        8, 11: begin
            cnt1_channel_mem_rd_address = 5;
            if (bank_num == 0) begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[2] ? 2 : 5;
                fb_cnt0_channel_mem_rd_address = connection_sel[2] ? 2 : 5;
            end
            else begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[5] ? 2 : 5;
                fb_cnt0_channel_mem_rd_address = connection_sel[2] ? 2 : 5;
            end
        end
        12, 15: begin
            kon_block_fnum_channel_mem_rd_address = 6;
            fb_cnt0_channel_mem_rd_address = 6;
        end
        13, 16: begin
            kon_block_fnum_channel_mem_rd_address = 7;
            fb_cnt0_channel_mem_rd_address = 7;
        end
        14, 17: begin
            kon_block_fnum_channel_mem_rd_address = 8;
            fb_cnt0_channel_mem_rd_address = 8;
        end
        endcase
    end

    mem_multi_bank #(
        .DATA_WIDTH(REG_FILE_DATA_WIDTH),
        .DEPTH('h9),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) fnum_low_mem (
        .clk,
        .wea(opl3_reg_wr.valid && opl3_reg_wr.address >= 'hA0 && opl3_reg_wr.address <= 'hA8),
        .reb(op_sample_clk_en),
        .banka(opl3_reg_wr.bank_num),
        .addra(opl3_reg_wr.address[$clog2('h9)-1:0]),
        .bankb(bank_num),
        .addrb(kon_block_fnum_channel_mem_rd_address),
        .dia(opl3_reg_wr.data),
        .dob(fnum[7:0])
    );

    localparam kon_block_fnum_high_mem_width = $bits(kon) + $bits(block) + $bits(fnum[9:8]);

    mem_multi_bank #(
        .DATA_WIDTH(kon_block_fnum_high_mem_width),
        .DEPTH('h9),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) kon_block_fnum_high_mem (
        .clk,
        .wea(opl3_reg_wr.valid && opl3_reg_wr.address >= 'hB0 && opl3_reg_wr.address <= 'hB8),
        .reb(op_sample_clk_en),
        .banka(opl3_reg_wr.bank_num),
        .addra(opl3_reg_wr.address[$clog2('h9)-1:0]),
        .bankb(bank_num),
        .addrb(kon_block_fnum_channel_mem_rd_address),
        .dia(opl3_reg_wr.data[kon_block_fnum_high_mem_width-1:0]),
        .dob({kon, block, fnum[9:8]})
    );

    localparam fb_cnt_mem_width = $bits(fb_p1) + $bits(cnt0_p1);

    mem_multi_bank #(
        .DATA_WIDTH(fb_cnt_mem_width),
        .DEPTH('h9),
        .OUTPUT_DELAY(1),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) fb_cnt0_mem (
        .clk,
        .wea(opl3_reg_wr.valid && opl3_reg_wr.address >= 'hC0 && opl3_reg_wr.address <= 'hC8),
        .reb(op_sample_clk_en),
        .banka(opl3_reg_wr.bank_num),
        .addra(opl3_reg_wr.address[$clog2('h9)-1:0]),
        .bankb(bank_num),
        .addrb(fb_cnt0_channel_mem_rd_address),
        .dia(opl3_reg_wr.data[fb_cnt_mem_width-1:0]),
        .dob({fb_p1, cnt0_p1})
    );

    // used for 4 op connections, need both cnt0 and cnt1 simultaneously
    localparam cnt_mem_width = $bits(cnt1_p1);

    mem_multi_bank #(
        .DATA_WIDTH(cnt_mem_width),
        .DEPTH('h9),
        .OUTPUT_DELAY(1),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) fb_cnt1_mem (
        .clk,
        .wea(opl3_reg_wr.valid && opl3_reg_wr.address >= 'hC0 && opl3_reg_wr.address <= 'hC8),
        .reb(op_sample_clk_en),
        .banka(opl3_reg_wr.bank_num),
        .addra(opl3_reg_wr.address[$clog2('h9)-1:0]),
        .bankb(bank_num),
        .addrb(cnt1_channel_mem_rd_address),
        .dia(opl3_reg_wr.data[cnt_mem_width-1:0]),
        .dob(cnt1_p1)
    );

    always_ff @(posedge clk)
        unique case (op_num)
        0, 1, 2, 12:          use_feedback_p1 <= 1;
        3, 4, 5, 9, 10, 11,
        15, 16, 17:           use_feedback_p1 <= 0;
        6: if (bank_num == 0) use_feedback_p1 <= !connection_sel[0];
           else               use_feedback_p1 <= !connection_sel[3];
        7: if (bank_num == 0) use_feedback_p1 <= !connection_sel[1];
           else               use_feedback_p1 <= !connection_sel[4];
        8: if (bank_num == 0) use_feedback_p1 <= !connection_sel[2];
           else               use_feedback_p1 <= !connection_sel[5];
        13, 14:               use_feedback_p1 <= !(bank_num == 0 && ryt); // hi-hat and tom-tom do not use feedback
        endcase

    always_ff @(posedge clk) begin
        bank_num_p1 <= bank_num;
        connection_sel_p1 <= connection_sel;
        ryt_p1 <= ryt;
        op_num_p1 <= op_num;
    end

    always_comb
        unique case (op_num_p1)
        0, 1, 2, 12, 13, 14:      modulation_p1 = 0;
        3, 4, 5, 15:              modulation_p1 = cnt0_p1 ? 0 : modulation_out_p1;
        6:
            if ((bank_num_p1 == 0 && connection_sel_p1[0]) || (bank_num_p1 == 1 && connection_sel_p1[3]))
                unique case ({cnt0_p1, cnt1_p1}) // 4 op mode
                'b00, 'b10, 'b11: modulation_p1 = modulation_out_p1;
                'b01:             modulation_p1 = 0;
                endcase
            else                  modulation_p1 = 0;
        7:
            if ((bank_num_p1 == 0 && connection_sel_p1[1]) || (bank_num_p1 == 1 && connection_sel_p1[4]))
                unique case ({cnt0_p1, cnt1_p1}) // 4 op mode
                'b00, 'b10, 'b11: modulation_p1 = modulation_out_p1;
                'b01:             modulation_p1 = 0;
                endcase
            else                  modulation_p1 = 0;
        8:
            if ((bank_num_p1 == 0 && connection_sel_p1[2]) || (bank_num_p1 == 1 && connection_sel_p1[5]))
                unique case ({cnt0_p1, cnt1_p1}) // 4 op mode
                'b00, 'b10, 'b11: modulation_p1 = modulation_out_p1;
                'b01:             modulation_p1 = 0;
                endcase
            else                  modulation_p1 = 0;
        9:
            if ((bank_num_p1 == 0 && connection_sel_p1[0]) || (bank_num_p1 == 1 && connection_sel_p1[3]))
                unique case ({cnt0_p1, cnt1_p1}) // 4 op mode
                'b00, 'b01, 'b10: modulation_p1 = modulation_out_p1;
                'b11:             modulation_p1 = 0;
                endcase
            else                  modulation_p1 = cnt0_p1 ? 0 : modulation_out_p1;
        10:
            if ((bank_num_p1 == 0 && connection_sel_p1[1]) || (bank_num_p1 == 1 && connection_sel_p1[4]))
                unique case ({cnt0_p1, cnt1_p1}) // 4 op mode
                'b00, 'b01, 'b10: modulation_p1 = modulation_out_p1;
                'b11:             modulation_p1 = 0;
                endcase
            else                  modulation_p1 = cnt0_p1 ? 0 : modulation_out_p1;
        11:
            if ((bank_num_p1 == 0 && connection_sel_p1[2]) || (bank_num_p1 == 1 && connection_sel_p1[5]))
                unique case ({cnt0_p1, cnt1_p1}) // 4 op mode
                'b00, 'b01, 'b10: modulation_p1 = modulation_out_p1;
                'b11:             modulation_p1 = 0;
                endcase
            else                  modulation_p1 = cnt0_p1 ? 0 : modulation_out_p1;
        16, 17:                   modulation_p1 = cnt0_p1 || (ryt_p1 && bank_num_p1 == 0) ? 0 : modulation_out_p1; // snare drum and top cymbal do not use modulation
        endcase

    always_ff @(posedge clk)
        state <= next_state;

    always_comb
        if (state == 0)
            next_state = sample_clk_en;
        else if (delay_counter == MODULATION_DELAY) begin
            if (state == NUM_OPERATOR_UPDATE_STATES - 1)
                next_state = 0;
            else
                next_state = state + 1;
        end
        else
            next_state = state;

    always_ff @(posedge clk)
        if (next_state != state)
            delay_counter <= 0;
        else if (delay_counter == MODULATION_DELAY)
            delay_counter <= 0;
        else
            delay_counter <= delay_counter + 1;

    always_comb bank_num = state > NUM_OPERATORS_PER_BANK;
    always_comb
        if (state == 0)
            op_num = 0;
        else if (state > NUM_OPERATORS_PER_BANK)
            op_num = state - NUM_OPERATORS_PER_BANK - 1;
        else
            op_num = state - 1;

    always_comb op_sample_clk_en = state != 0 && delay_counter == 0;

    /*
     * The sample_clk_en input for each operator slot is pulsed in the first
     * cycle of that time slot. Operator is fully pipelined so we can issue
     * back to back.
     */
    operator operator (
        .sample_clk_en(op_sample_clk_en),
        .*
    );

    pipeline_sr #(
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) sample_clk_en_sr (
        .clk,
        .in(op_sample_clk_en),
        .out(op_sample_clk_en_p)
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

    // This has to perfectly line up with the output of operator 0 and the input of operator 3, etc.
    // It's a function of the PIPELINE_DELAY of the operator, the MODULATION_DELAY parameter, and
    // modulation is required on cycle 1 of the operator.
    always_ff @(posedge clk)
        modulation_out_p1 <= out_p6;

    ERROR_operators_not_aligned_for_modulation:
    assert property (@(posedge clk)
        op_sample_clk_en && op_num == 3 |-> operator_out.valid && operator_out.op_num == 0);

    always_comb begin
        operator_out.valid = op_sample_clk_en_p[6];
        operator_out.bank_num = bank_num_p[6];
        operator_out.op_num = op_num_p[6];
        operator_out.op_out = out_p6;
    end

    always_ff @(posedge clk)
        ops_done_pulse <= operator_out.valid && operator_out.bank_num == 1 && operator_out.op_num == 17;
endmodule
`default_nettype wire
