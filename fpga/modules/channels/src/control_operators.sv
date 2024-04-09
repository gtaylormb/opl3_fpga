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
    input wire sample_clk_en,
    input var opl3_reg_wr_t opl3_reg_wr,
    input wire [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel,
    input wire is_new,
    input wire nts,                     // keyboard split selection
    input wire dvb,
    input wire dam,                             // depth of tremolo
    input wire ryt,
    input wire bd,
    input wire sd,
    input wire tom,
    input wire tc,
    input wire hh,
    output logic signed [OP_OUT_WIDTH-1:0] operator_out [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: 0},
    output logic ops_done_pulse = 0
);

    /*
     * 256/36 operators gives us ~7.1 cycles per operator before next
     * sample_clk_en
     */
    localparam PIPELINE_DELAY = 6;
    localparam NUM_OPERATOR_UPDATE_STATES = NUM_BANKS*NUM_OPERATORS_PER_BANK + 1; // 36 operators + idle state
    logic [$clog2(PIPELINE_DELAY)-1:0] delay_counter = 0;

    logic [$clog2(NUM_OPERATOR_UPDATE_STATES)-1:0] state = 0;
    logic [$clog2(NUM_OPERATOR_UPDATE_STATES)-1:0] next_state;

    logic [$clog2(NUM_BANKS)-1:0] bank_num;
    logic [$clog2(NUM_OPERATORS_PER_BANK)-1:0] op_num;

    logic use_feedback;
    logic signed [OP_OUT_WIDTH-1:0] modulation [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    operator_t op_type_tmp [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    logic signed [OP_OUT_WIDTH-1:0] out_p6;
    logic signed [OP_OUT_WIDTH-1:0] modulation_out_p0;
    logic [$clog2(NUM_OPERATORS_PER_BANK)-1:0] modulation_out_op_num;
    logic op_sample_clk_en;
    logic [PIPELINE_DELAY:1] op_sample_clk_en_p;
    logic [PIPELINE_DELAY:1] [BANK_NUM_WIDTH-1:0] bank_num_p;
    logic [PIPELINE_DELAY:1] [OP_NUM_WIDTH-1:0] op_num_p;

    logic am; // amplitude modulation (tremolo)
    logic vib;
    logic egt; // envelope type
    logic ksr;
    logic [REG_MULT_WIDTH-1:0] mult;
    logic [REG_KSL_WIDTH-1:0] ksl;
    logic [REG_TL_WIDTH-1:0] tl;
    logic [REG_ENV_WIDTH-1:0] ar;
    logic [REG_ENV_WIDTH-1:0] dr;
    logic [REG_ENV_WIDTH-1:0] sl;
    logic [REG_ENV_WIDTH-1:0] rr;
    logic [REG_WS_WIDTH-1:0] ws;
    logic [$clog2('h16)-1:0] operator_mem_rd_address;

    logic [REG_FNUM_WIDTH-1:0] fnum;
    logic [REG_BLOCK_WIDTH-1:0] block;
    logic kon;
    logic [REG_FB_WIDTH-1:0] fb;
    logic cnt;
    logic [$clog2('h9)-1:0] kon_block_fnum_channel_mem_rd_address;
    logic [$clog2('h9)-1:0] fb_cnt_channel_mem_rd_address;

    always_comb
        if (op_num < 6)
            operator_mem_rd_address = op_num;
        else if (op_num < 12)
            operator_mem_rd_address = op_num + 2;
        else if (op_num < 18)
            operator_mem_rd_address = op_num + 4;

    logic [$clog2('h16)-1:0] am_vib_egt_ksr_mult_mem_wr_address = opl3_reg_wr.address - 'h20;

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
        .addra(am_vib_egt_ksr_mult_mem_wr_address),
        .bankb(bank_num),
        .addrb(operator_mem_rd_address),
        .dia(opl3_reg_wr.data),
        .dob({am, vib, egt, ksr, mult})
    );

    logic [$clog2('h16)-1:0] ksl_tl_mem_wr_address = opl3_reg_wr.address - 'h40;

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
        .addra(ksl_tl_mem_wr_address),
        .bankb(bank_num),
        .addrb(operator_mem_rd_address),
        .dia(opl3_reg_wr.data),
        .dob({ksl, tl})
    );

    logic [$clog2('h16)-1:0] ar_dr_mem_wr_address = opl3_reg_wr.address - 'h60;

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
        .addra(ar_dr_mem_wr_address),
        .bankb(bank_num),
        .addrb(operator_mem_rd_address),
        .dia(opl3_reg_wr.data),
        .dob({ar, dr})
    );

    logic [$clog2('h16)-1:0] sl_rr_mem_wr_address = opl3_reg_wr.address - 'h80;

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
        .addra(sl_rr_mem_wr_address),
        .bankb(bank_num),
        .addrb(operator_mem_rd_address),
        .dia(opl3_reg_wr.data),
        .dob({sl, rr})
    );

    logic [$clog2('h16)-1:0] ws_mem_wr_address = opl3_reg_wr.address - 'hE0;

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
        .addra(ws_mem_wr_address),
        .bankb(bank_num),
        .addrb(operator_mem_rd_address),
        .dia(opl3_reg_wr.data[REG_WS_WIDTH-1:0]),
        .dob(ws)
    );

    always_comb
        unique case (op_num)
        0, 3: begin
            kon_block_fnum_channel_mem_rd_address = 0;
            fb_cnt_channel_mem_rd_address = 0;
        end
        1, 4: begin
            kon_block_fnum_channel_mem_rd_address = 1;
            fb_cnt_channel_mem_rd_address = 1;
        end
        2, 5: begin
            kon_block_fnum_channel_mem_rd_address = 2;
            fb_cnt_channel_mem_rd_address = 2;
        end
        6, 9:
            if (bank_num == 0) begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[0] ? 0 : 3;
                fb_cnt_channel_mem_rd_address = 3;
            end
            else begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[3] ? 0 : 3;
                fb_cnt_channel_mem_rd_address = 3;
            end
        7, 10:
            if (bank_num == 0) begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[1] ? 1 : 4;
                fb_cnt_channel_mem_rd_address = 4;
            end
            else begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[4] ? 1 : 4;
                fb_cnt_channel_mem_rd_address = 4;
            end
        8, 11:
            if (bank_num == 0) begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[2] ? 2 : 5;
                fb_cnt_channel_mem_rd_address = 5;
            end
            else begin
                kon_block_fnum_channel_mem_rd_address = connection_sel[5] ? 2 : 5;
                fb_cnt_channel_mem_rd_address = 5;
            end
        12, 15: begin
            kon_block_fnum_channel_mem_rd_address = 6;
            fb_cnt_channel_mem_rd_address = 6;
        end
        13, 16: begin
            kon_block_fnum_channel_mem_rd_address = 7;
            fb_cnt_channel_mem_rd_address = 7;
        end
        14, 17: begin
            kon_block_fnum_channel_mem_rd_address = 8;
            fb_cnt_channel_mem_rd_address = 8;
        end
        endcase

    logic [$clog2('h9)-1:0] fnum_low_mem_wr_address = opl3_reg_wr.address - 'hA0;

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
        .addra(fnum_low_mem_wr_address),
        .bankb(bank_num),
        .addrb(kon_block_fnum_channel_mem_rd_address),
        .dia(opl3_reg_wr.data),
        .dob(fnum[7:0])
    );

    logic [$clog2('h9)-1:0] kon_block_fnum_high_mem_wr_address = opl3_reg_wr.address - 'hB0;
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
        .addra(kon_block_fnum_high_mem_wr_address),
        .bankb(bank_num),
        .addrb(kon_block_fnum_channel_mem_rd_address),
        .dia(opl3_reg_wr.data[kon_block_fnum_high_mem_width-1:0]),
        .dob({kon, block, fnum[9:8]})
    );

    logic [$clog2('h9)-1:0] fb_cnt_mem_wr_address = opl3_reg_wr.address - 'hC0;
    localparam fb_cnt_mem_width = $bits(fb) + $bits(cnt);

    mem_multi_bank #(
        .DATA_WIDTH(fb_cnt_mem_width),
        .DEPTH('h9),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) fb_cnt_mem (
        .clk,
        .wea(opl3_reg_wr.valid && opl3_reg_wr.address >= 'hC0 && opl3_reg_wr.address <= 'hC8),
        .reb(op_sample_clk_en),
        .banka(opl3_reg_wr.bank_num),
        .addra(fb_cnt_mem_wr_address),
        .bankb(bank_num),
        .addrb(fb_cnt_channel_mem_rd_address),
        .dia(opl3_reg_wr.data[fb_cnt_mem_width-1:0]),
        .dob({fb, cnt})
    );

    always_comb begin
        op_type_tmp = '{default: OP_NORMAL};

        unique case (op_num)
        0, 1, 2, 12:          use_feedback = 1;
        3, 4, 5, 9, 10, 11,
        15, 16, 17:           use_feedback = 0;
        6: if (bank_num == 0) use_feedback = !connection_sel[0];
           else               use_feedback = !connection_sel[3];
        7: if (bank_num == 0) use_feedback = !connection_sel[1];
           else               use_feedback = !connection_sel[4];
        8: if (bank_num == 0) use_feedback = !connection_sel[2];
           else               use_feedback = !connection_sel[5];
        13:                   use_feedback = !(bank_num == 0 && ryt); // aka hi hat operator in bank 0
        14:                   use_feedback = !(bank_num == 0 && ryt); // aka tom tom operator in bank 0
        endcase

        /*
         * Operator input mappings
         *
         * The first mappings are static whether the operator is configured
         * in a 2 channel or a 4 channel mode. Next we start mapping connections
         * for operators whose input varies depending on the mode.
         */
        modulation[0][0] = 0;
        modulation[0][3] = cnt ? 0 : modulation_out_p0;
        modulation[0][1] = 0;
        modulation[0][4] = cnt ? 0 : modulation_out_p0;
        modulation[0][2] = 0;
        modulation[0][5] = cnt ? 0 : modulation_out_p0;
        modulation[1][0] = 0;
        modulation[1][3] = cnt ? 0 : modulation_out_p0;
        modulation[1][1] = 0;
        modulation[1][4] = cnt ? 0 : modulation_out_p0;
        modulation[1][2] = 0;
        modulation[1][5] = cnt ? 0 : modulation_out_p0;

        // aka bass drum operator 1
        op_type_tmp[0][12] = ryt ? OP_BASS_DRUM : OP_NORMAL;
        modulation[0][12] = 0;

        // aka bass drum operator 2
        op_type_tmp[0][15] = ryt ? OP_BASS_DRUM : OP_NORMAL;
        modulation[0][15] = cnt ? 0 : modulation_out_p0;

        // aka hi hat operator
        op_type_tmp[0][13] = ryt ? OP_HI_HAT : OP_NORMAL;
        modulation[0][13] = 0;

        // aka snare drum operator
        op_type_tmp[0][16] = ryt ? OP_SNARE_DRUM : OP_NORMAL;
        modulation[0][16] = cnt || ryt ? 0 : modulation_out_p0;

        // aka tom tom operator
        op_type_tmp[0][14] = ryt ? OP_TOM_TOM : OP_NORMAL;
        modulation[0][14] = 0;

        // aka top cymbal operator
        op_type_tmp[0][17] = ryt ? OP_TOP_CYMBAL : OP_NORMAL;
        modulation[0][17] = cnt || ryt ? 0 : modulation_out_p0;

        modulation[1][12] = 0;
        modulation[1][15] = cnt ? 0 : modulation_out_p0;
        modulation[1][13] = 0;
        modulation[1][16] = cnt ? 0 : modulation_out_p0;
        modulation[1][14] = 0;
        modulation[1][17] = cnt ? 0 : modulation_out_p0;

        if (connection_sel[0]) begin
            modulation[0][6] = cnt ? 0 : modulation_out_p0;
            modulation[0][9] = cnt ? 0 : modulation_out_p0;
        end
        else begin
            modulation[0][6] = 0;
            modulation[0][9] = cnt ? 0 : modulation_out_p0;
        end
        if (connection_sel[1]) begin
            modulation[0][7] = cnt ? 0 : modulation_out_p0;
            modulation[0][10] = cnt ? 0 : modulation_out_p0;
        end
        else begin
            modulation[0][7] = 0;
            modulation[0][10] = cnt ? 0 : modulation_out_p0;
        end
        if (connection_sel[2]) begin
            modulation[0][8] = cnt ? 0 : modulation_out_p0;
            modulation[0][11] = cnt ? 0 : modulation_out_p0;
        end
        else begin
            modulation[0][8] = 0;
            modulation[0][11] = cnt ? 0 : modulation_out_p0;
        end
        if (connection_sel[3]) begin
            modulation[1][6] = cnt ? 0 : modulation_out_p0;
            modulation[1][9] = cnt ? 0 : modulation_out_p0;
        end
        else begin
            modulation[1][6] = 0;
            modulation[1][9] = cnt ? 0 : modulation_out_p0;
        end
        if (connection_sel[4]) begin
            modulation[1][7] = cnt ? 0 : modulation_out_p0;
            modulation[1][10] = cnt ? 0 : modulation_out_p0;
        end
        else begin
            modulation[1][7] = 0;
            modulation[1][10] = cnt ? 0 : modulation_out_p0;
        end
        if (connection_sel[5]) begin
            modulation[1][8] = cnt ? 0 : modulation_out_p0;
            modulation[1][11] = cnt ? 0 : modulation_out_p0;
        end
        else begin
            modulation[1][8] = 0;
            modulation[1][11] = cnt ? 0 : modulation_out_p0;
        end
    end

    always_ff @(posedge clk)
        state <= next_state;

    always_comb
        if (state == 0)
            next_state = sample_clk_en;
        else if (state == NUM_OPERATOR_UPDATE_STATES - 1)
            next_state = 0;
        else
            next_state = state + 1;

    always_ff @(posedge clk)
        if (next_state != state)
            delay_counter <= 0;
        else if (delay_counter == PIPELINE_DELAY )
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

    always_comb op_sample_clk_en = state != 0;

    /*
     * The sample_clk_en input for each operator slot is pulsed in the first
     * cycle of that time slot
     */
    operator operator (
        .clk,
        .sample_clk_en(op_sample_clk_en),
        .is_new,
        .bank_num,
        .op_num,
        .fnum,
        .mult,
        .block,
        .ws,
        .vib,
        .dvb,
        .kon,
        .ar,
        .dr,
        .sl,
        .rr,
        .tl,
        .ksr,
        .ksl,
        .egt,
        .am,
        .dam,
        .nts,
        .bd,
        .sd,
        .tom,
        .tc,
        .hh,
        .use_feedback,
        .fb,
        .modulation(modulation[bank_num][op_num]),
        .op_type(op_type_tmp[bank_num][op_num]),
        .out_p6
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

    // load the output from 3 operators ago but don't read out of range
    always_comb modulation_out_op_num = op_num >= 3 ? op_num - 3 : 0;

    always_ff @(posedge clk)
        ops_done_pulse <= op_sample_clk_en_p[6] && !op_sample_clk_en_p[5];

    mem_multi_bank #(
        .DATA_WIDTH(OP_OUT_WIDTH),
        .DEPTH(NUM_OPERATORS_PER_BANK),
        .OUTPUT_DELAY(0),
        .DEFAULT_VALUE(0),
        .NUM_BANKS(NUM_BANKS)
    ) sample_out_mem (
        .clk,
        .wea(op_sample_clk_en_p[6]),
        .reb(op_sample_clk_en),
        .banka(bank_num_p[6]),
        .addra(op_num_p[6]),
        .bankb(bank_num),
        .addrb(modulation_out_op_num),
        .dia(out_p6),
        .dob(modulation_out_p0)
    );

    for (genvar i = 0; i < NUM_BANKS; i++)
        for (genvar j = 0; j < NUM_OPERATORS_PER_BANK; j++)
            /*
             * Capture output from operator in the last cycle of the time slot
             */
            always_ff @(posedge clk)
                if (i == bank_num_p[6] && j == op_num_p[6] && op_sample_clk_en_p[6])
                    operator_out[i][j] <= out_p6;
endmodule
`default_nettype wire