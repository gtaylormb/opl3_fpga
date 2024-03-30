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
`default_nettype none  // disable implicit net type declarations

module control_operators
    import opl3_pkg::*;
(
    input wire clk,
    input wire sample_clk_en,
    input wire [REG_CONNECTION_SEL_WIDTH-1:0] connection_sel,
    input wire is_new,
    input wire nts,                     // keyboard split selection
    input wire [REG_FNUM_WIDTH-1:0] fnum [NUM_BANKS][NUM_CHANNELS_PER_BANK],
    input wire [REG_MULT_WIDTH-1:0] mult [NUM_BANKS][NUM_OPERATORS_PER_BANK],
    input wire [REG_BLOCK_WIDTH-1:0] block [NUM_BANKS][NUM_CHANNELS_PER_BANK],
    input wire [REG_WS_WIDTH-1:0] ws [NUM_BANKS][NUM_OPERATORS_PER_BANK],
    input wire vib [NUM_BANKS][NUM_OPERATORS_PER_BANK],
    input wire dvb,
    input wire kon [NUM_BANKS][NUM_CHANNELS_PER_BANK],
    input wire [REG_ENV_WIDTH-1:0] ar [NUM_BANKS][NUM_OPERATORS_PER_BANK], // attack rate
    input wire [REG_ENV_WIDTH-1:0] dr [NUM_BANKS][NUM_OPERATORS_PER_BANK], // decay rate
    input wire [REG_ENV_WIDTH-1:0] sl [NUM_BANKS][NUM_OPERATORS_PER_BANK], // sustain level
    input wire [REG_ENV_WIDTH-1:0] rr [NUM_BANKS][NUM_OPERATORS_PER_BANK], // release rate
    input wire [REG_TL_WIDTH-1:0] tl [NUM_BANKS][NUM_OPERATORS_PER_BANK],  // total level
    input wire ksr [NUM_BANKS][NUM_OPERATORS_PER_BANK],                    // key scale rate
    input wire [REG_KSL_WIDTH-1:0] ksl [NUM_BANKS][NUM_OPERATORS_PER_BANK], // key scale level
    input wire egt [NUM_BANKS][NUM_OPERATORS_PER_BANK],                     // envelope type
    input wire am [NUM_BANKS][NUM_OPERATORS_PER_BANK],                      // amplitude modulation (tremolo)
    input wire dam,                             // depth of tremolo
    input wire ryt,
    input wire bd,
    input wire sd,
    input wire tom,
    input wire tc,
    input wire hh,
    input wire [REG_FB_WIDTH-1:0] fb [NUM_BANKS][NUM_CHANNELS_PER_BANK],
    input wire cnt [NUM_BANKS][NUM_CHANNELS_PER_BANK],
    output logic signed [OP_OUT_WIDTH-1:0] operator_out [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: '0}
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

    logic [REG_FNUM_WIDTH-1:0] fnum_tmp [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    logic [REG_BLOCK_WIDTH-1:0] block_tmp [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    logic kon_tmp [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    logic [REG_FB_WIDTH-1:0] fb_tmp [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    logic use_feedback [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    logic signed [OP_OUT_WIDTH-1:0] modulation [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    operator_t op_type_tmp [NUM_BANKS][NUM_OPERATORS_PER_BANK] = '{default: OP_NORMAL};
    logic signed [OP_OUT_WIDTH-1:0] out_p6;
    logic signed [OP_OUT_WIDTH-1:0] modulation_out_p0;
    logic [$clog2(NUM_OPERATORS_PER_BANK)-1:0] modulation_out_op_num;
    logic op_sample_clk_en;
    logic [PIPELINE_DELAY:1] op_sample_clk_en_p;
    logic [PIPELINE_DELAY:1] [BANK_NUM_WIDTH-1:0] bank_num_p;
    logic [PIPELINE_DELAY:1] [OP_NUM_WIDTH-1:0] op_num_p;

    always_comb begin
        /*
         * Operator input mappings
         *
         * The first mappings are static whether the operator is configured
         * in a 2 channel or a 4 channel mode. Next we start mapping connections
         * for operators whose input varies depending on the mode.
         */
        fnum_tmp[0][0] = fnum[0][0];
        block_tmp[0][0] = block[0][0];
        kon_tmp[0][0] = kon[0][0];
        fb_tmp[0][0] = fb[0][0];
        use_feedback[0][0] = 1;
        modulation[0][0] = 0;

        fnum_tmp[0][3] = fnum[0][0];
        block_tmp[0][3] = block[0][0];
        kon_tmp[0][3] = kon[0][0];
        fb_tmp[0][3] = 0;
        use_feedback[0][3] = 0;
        modulation[0][3] = cnt[0][0] ? 0 : modulation_out_p0;

        fnum_tmp[0][1] = fnum[0][1];
        block_tmp[0][1] = block[0][1];
        kon_tmp[0][1] = kon[0][1];
        fb_tmp[0][1] = fb[0][1];
        use_feedback[0][1] = 1;
        modulation[0][1] = 0;

        fnum_tmp[0][4] = fnum[0][1];
        block_tmp[0][4] = block[0][1];
        kon_tmp[0][4] = kon[0][1];
        fb_tmp[0][4] = 0;
        use_feedback[0][4] = 0;
        modulation[0][4] = cnt[0][1] ? 0 : modulation_out_p0;

        fnum_tmp[0][2] = fnum[0][2];
        block_tmp[0][2] = block[0][2];
        kon_tmp[0][2] = kon[0][2];
        fb_tmp[0][2] = fb[0][2];
        use_feedback[0][2] = 1;
        modulation[0][2] = 0;

        fnum_tmp[0][5] = fnum[0][2];
        block_tmp[0][5] = block[0][2];
        kon_tmp[0][5] = kon[0][2];
        fb_tmp[0][5] = 0;
        use_feedback[0][5] = 0;
        modulation[0][5] = cnt[0][2] ? 0 : modulation_out_p0;

        fnum_tmp[1][0] = fnum[1][0];
        block_tmp[1][0] = block[1][0];
        kon_tmp[1][0] = kon[1][0];
        fb_tmp[1][0] = fb[1][0];
        use_feedback[1][0] = 1;
        modulation[1][0] = 0;

        fnum_tmp[1][3] = fnum[1][0];
        block_tmp[1][3] = block[1][0];
        kon_tmp[1][3] = kon[1][0];
        fb_tmp[1][3] = 0;
        use_feedback[1][3] = 0;
        modulation[1][3] = cnt[1][0] ? 0 : modulation_out_p0;

        fnum_tmp[1][1] = fnum[1][1];
        block_tmp[1][1] = block[1][1];
        kon_tmp[1][1] = kon[1][1];
        fb_tmp[1][1] = fb[1][1];
        use_feedback[1][1] = 1;
        modulation[1][1] = 0;

        fnum_tmp[1][4] = fnum[1][1];
        block_tmp[1][4] = block[1][1];
        kon_tmp[1][4] = kon[1][1];
        fb_tmp[1][4] = 0;
        use_feedback[1][4] = 0;
        modulation[1][4] = cnt[1][1] ? 0 : modulation_out_p0;

        fnum_tmp[1][2] = fnum[1][2];
        block_tmp[1][2] = block[1][2];
        kon_tmp[1][2] = kon[1][2];
        fb_tmp[1][2] = fb[1][2];
        use_feedback[1][2] = 1;
        modulation[1][2] = 0;

        fnum_tmp[1][5] = fnum[1][2];
        block_tmp[1][5] = block[1][2];
        kon_tmp[1][5] = kon[1][2];
        fb_tmp[1][5] = 0;
        use_feedback[1][5] = 0;
        modulation[1][5] = cnt[1][2] ? 0 : modulation_out_p0;

        // aka bass drum operator 1
        fnum_tmp[0][12] = fnum[0][6];
        block_tmp[0][12] = block[0][6];
        kon_tmp[0][12] = kon[0][6];
        fb_tmp[0][12] = fb[0][6];
        op_type_tmp[0][12] = ryt ? OP_BASS_DRUM : OP_NORMAL;
        use_feedback[0][12] = 1;
        modulation[0][12] = 0;

        // aka bass drum operator 2
        fnum_tmp[0][15] = fnum[0][6];
        block_tmp[0][15] = block[0][6];
        kon_tmp[0][15] = kon[0][6];
        fb_tmp[0][15] = 0;
        op_type_tmp[0][15] = ryt ? OP_BASS_DRUM : OP_NORMAL;
        use_feedback[0][15] = 0;
        modulation[0][15] = cnt[0][6] ? 0 : modulation_out_p0;

        // aka hi hat operator
        fnum_tmp[0][13] = fnum[0][7];
        block_tmp[0][13] = block[0][7];
        kon_tmp[0][13] = kon[0][7];
        fb_tmp[0][13] = ryt ? 0 : fb[0][7];
        op_type_tmp[0][13] = ryt ? OP_HI_HAT : OP_NORMAL;
        use_feedback[0][13] = ryt ? 0 : 1;
        modulation[0][13] = 0;

        // aka snare drum operator
        fnum_tmp[0][16] = fnum[0][7];
        block_tmp[0][16] = block[0][7];
        kon_tmp[0][16] = kon[0][7];
        fb_tmp[0][16] = 0;
        op_type_tmp[0][16] = ryt ? OP_SNARE_DRUM : OP_NORMAL;
        use_feedback[0][16] = 0;
        modulation[0][16] = cnt[0][7] || ryt ? 0 : modulation_out_p0;

        // aka tom tom operator
        fnum_tmp[0][14] = fnum[0][8];
        block_tmp[0][14] = block[0][8];
        kon_tmp[0][14] = kon[0][8];
        fb_tmp[0][14] = ryt ? 0 : fb[0][8];
        op_type_tmp[0][14] = ryt ? OP_TOM_TOM : OP_NORMAL;
        use_feedback[0][14] = ryt ? 0 : 1;
        modulation[0][14] = 0;

        // aka top cymbal operator
        fnum_tmp[0][17] = fnum[0][8];
        block_tmp[0][17] = block[0][8];
        kon_tmp[0][17] = kon[0][8];
        fb_tmp[0][17] = 0;
        op_type_tmp[0][17] = ryt ? OP_TOP_CYMBAL : OP_NORMAL;
        use_feedback[0][17] = 0;
        modulation[0][17] = cnt[0][8] || ryt ? 0 : modulation_out_p0;

        fnum_tmp[1][12] = fnum[1][6];
        block_tmp[1][12] = block[1][6];
        kon_tmp[1][12] = kon[1][6];
        fb_tmp[1][12] = fb[1][6];
        use_feedback[1][12] = 1;
        modulation[1][12] = 0;

        fnum_tmp[1][15] = fnum[1][6];
        block_tmp[1][15] = block[1][6];
        kon_tmp[1][15] = kon[1][6];
        fb_tmp[1][15] = 0;
        use_feedback[1][15] = 0;
        modulation[1][15] = cnt[1][6] ? 0 : modulation_out_p0;

        fnum_tmp[1][13] = fnum[1][7];
        block_tmp[1][13] = block[1][7];
        kon_tmp[1][13] = kon[1][7];
        fb_tmp[1][13] = fb[1][7];
        use_feedback[1][13] = 1;
        modulation[1][13] = 0;

        fnum_tmp[1][16] = fnum[1][7];
        block_tmp[1][16] = block[1][7];
        kon_tmp[1][16] = kon[1][7];
        fb_tmp[1][16] = 0;
        use_feedback[1][16] = 0;
        modulation[1][16] = cnt[1][7] ? 0 : modulation_out_p0;

        fnum_tmp[1][14] = fnum[1][8];
        block_tmp[1][14] = block[1][8];
        kon_tmp[1][14] = kon[1][8];
        fb_tmp[1][14] = fb[1][8];
        use_feedback[1][14] = 1;
        modulation[1][14] = 0;

        fnum_tmp[1][17] = fnum[1][8];
        block_tmp[1][17] = block[1][8];
        kon_tmp[1][17] = kon[1][8];
        fb_tmp[1][17] = 0;
        use_feedback[1][17] = 0;
        modulation[1][17] = cnt[1][8] ? 0 : modulation_out_p0;

        if (connection_sel[0]) begin
            fnum_tmp[0][6] = fnum[0][0];
            block_tmp[0][6] = block[0][0];
            kon_tmp[0][6] = kon[0][0];
            fb_tmp[0][6] = 0;
            use_feedback[0][6] = 0;
            modulation[0][6] = !cnt[0][0] && cnt[0][3] ? 0 : modulation_out_p0;

            fnum_tmp[0][9] = fnum[0][0];
            block_tmp[0][9] = block[0][0];
            kon_tmp[0][9] = kon[0][0];
            fb_tmp[0][9] = 0;
            use_feedback[0][9] = 0;
            modulation[0][9] = cnt[0][0] && cnt[0][3] ? 0 : modulation_out_p0;
        end
        else begin
            fnum_tmp[0][6] = fnum[0][3];
            block_tmp[0][6] = block[0][3];
            kon_tmp[0][6] = kon[0][3];
            fb_tmp[0][6] = fb[0][3];
            use_feedback[0][6] = 1;
            modulation[0][6] = 0;

            fnum_tmp[0][9] = fnum[0][3];
            block_tmp[0][9] = block[0][3];
            kon_tmp[0][9] = kon[0][3];
            fb_tmp[0][9] = 0;
            use_feedback[0][9] = 0;
            modulation[0][9] = cnt[0][3] ? 0 : modulation_out_p0;
        end
        if (connection_sel[1]) begin
            fnum_tmp[0][7] = fnum[0][1];
            block_tmp[0][7] = block[0][1];
            kon_tmp[0][7] = kon[0][1];
            fb_tmp[0][7] = 0;
            use_feedback[0][7] = 0;
            modulation[0][7] = !cnt[0][1] && cnt[0][4] ? 0 : modulation_out_p0;

            fnum_tmp[0][10] = fnum[0][1];
            block_tmp[0][10] = block[0][1];
            kon_tmp[0][10] = kon[0][1];
            fb_tmp[0][10] = 0;
            use_feedback[0][10] = 0;
            modulation[0][10] = cnt[0][1] && cnt[0][4] ? 0 : modulation_out_p0;
        end
        else begin
            fnum_tmp[0][7] = fnum[0][4];
            block_tmp[0][7] = block[0][4];
            kon_tmp[0][7] = kon[0][4];
            fb_tmp[0][7] = fb[0][4];
            use_feedback[0][7] = 1;
            modulation[0][7] = 0;

            fnum_tmp[0][10] = fnum[0][4];
            block_tmp[0][10] = block[0][4];
            kon_tmp[0][10] = kon[0][4];
            fb_tmp[0][10] = 0;
            use_feedback[0][10] = 0;
            modulation[0][10] = cnt[0][4] ? 0 : modulation_out_p0;
        end
        if (connection_sel[2]) begin
            fnum_tmp[0][8] = fnum[0][2];
            block_tmp[0][8] = block[0][2];
            kon_tmp[0][8] = kon[0][2];
            fb_tmp[0][8] = 0;
            use_feedback[0][8] = 0;
            modulation[0][8] = !cnt[0][2] && cnt[0][5] ? 0 : modulation_out_p0;

            fnum_tmp[0][11] = fnum[0][2];
            block_tmp[0][11] = block[0][2];
            kon_tmp[0][11] = kon[0][2];
            fb_tmp[0][11] = 0;
            use_feedback[0][11] = 0;
            modulation[0][11] = cnt[0][2] && cnt[0][5] ? 0 : modulation_out_p0;
        end
        else begin
            fnum_tmp[0][8] = fnum[0][5];
            block_tmp[0][8] = block[0][5];
            kon_tmp[0][8] = kon[0][5];
            fb_tmp[0][8] = fb[0][5];
            use_feedback[0][8] = 1;
            modulation[0][8] = 0;

            fnum_tmp[0][11] = fnum[0][5];
            block_tmp[0][11] = block[0][5];
            kon_tmp[0][11] = kon[0][5];
            fb_tmp[0][11] = 0;
            use_feedback[0][11] = 0;
            modulation[0][11] = cnt[0][5] ? 0 : modulation_out_p0;
        end
        if (connection_sel[3]) begin
            fnum_tmp[1][6] = fnum[1][0];
            block_tmp[1][6] = block[1][0];
            kon_tmp[1][6] = kon[1][0];
            fb_tmp[1][6] = 0;
            use_feedback[1][6] = 0;
            modulation[1][6] = !cnt[1][0] && cnt[1][3] ? 0 : modulation_out_p0;

            fnum_tmp[1][9] = fnum[1][0];
            block_tmp[1][9] = block[1][0];
            kon_tmp[1][9] = kon[1][0];
            fb_tmp[1][9] = 0;
            use_feedback[1][9] = 0;
            modulation[1][9] = cnt[1][0] && cnt[1][3] ? 0 : modulation_out_p0;
        end
        else begin
            fnum_tmp[1][6] = fnum[1][3];
            block_tmp[1][6] = block[1][3];
            kon_tmp[1][6] = kon[1][3];
            fb_tmp[1][6] = fb[1][3];
            use_feedback[1][6] = 1;
            modulation[1][6] = 0;

            fnum_tmp[1][9] = fnum[1][3];
            block_tmp[1][9] = block[1][3];
            kon_tmp[1][9] = kon[1][3];
            fb_tmp[1][9] = 0;
            use_feedback[1][9] = 0;
            modulation[1][9] = cnt[1][3] ? 0 : modulation_out_p0;
        end
        if (connection_sel[4]) begin
            fnum_tmp[1][7] = fnum[1][1];
            block_tmp[1][7] = block[1][1];
            kon_tmp[1][7] = kon[1][1];
            fb_tmp[1][7] = 0;
            use_feedback[1][7] = 0;
            modulation[1][7] = !cnt[1][1] && cnt[1][4] ? 0 : modulation_out_p0;

            fnum_tmp[1][10] = fnum[1][1];
            block_tmp[1][10] = block[1][1];
            kon_tmp[1][10] = kon[1][1];
            fb_tmp[1][10] = 0;
            use_feedback[1][10] = 0;
            modulation[1][10] = cnt[1][1] && cnt[1][4] ? 0 : modulation_out_p0;
        end
        else begin
            fnum_tmp[1][7] = fnum[1][4];
            block_tmp[1][7] = block[1][4];
            kon_tmp[1][7] = kon[1][4];
            fb_tmp[1][7] = fb[1][4];
            use_feedback[1][7] = 1;
            modulation[1][7] = 0;

            fnum_tmp[1][10] = fnum[1][4];
            block_tmp[1][10] = block[1][4];
            kon_tmp[1][10] = kon[1][4];
            fb_tmp[1][10] = 0;
            use_feedback[1][10] = 0;
            modulation[1][10] = cnt[1][4] ? 0 : modulation_out_p0;
        end
        if (connection_sel[5]) begin
            fnum_tmp[1][8] = fnum[1][2];
            block_tmp[1][8] = block[1][2];
            kon_tmp[1][8] = kon[1][2];
            fb_tmp[1][8] = 0;
            use_feedback[1][8] = 0;
            modulation[1][8] = !cnt[1][2] && cnt[1][5] ? 0 : modulation_out_p0;

            fnum_tmp[1][11] = fnum[1][2];
            block_tmp[1][11] = block[1][2];
            kon_tmp[1][11] = kon[1][2];
            fb_tmp[1][11] = 0;
            use_feedback[1][11] = 0;
            modulation[1][11] = cnt[1][2] && cnt[1][5] ? 0 : modulation_out_p0;
        end
        else begin
            fnum_tmp[1][8] = fnum[1][5];
            block_tmp[1][8] = block[1][5];
            kon_tmp[1][8] = kon[1][5];
            fb_tmp[1][8] = fb[1][5];
            use_feedback[1][8] = 1;
            modulation[1][8] = 0;

            fnum_tmp[1][11] = fnum[1][5];
            block_tmp[1][11] = block[1][5];
            kon_tmp[1][11] = kon[1][5];
            fb_tmp[1][11] = 0;
            use_feedback[1][11] = 0;
            modulation[1][11] = cnt[1][5] ? 0 : modulation_out_p0;
        end
    end

    always_ff @(posedge clk)
        state <= next_state;

    always_comb
        if (state == 0)
            next_state = sample_clk_en;
        else if (delay_counter == PIPELINE_DELAY)
            if (state == NUM_OPERATOR_UPDATE_STATES - 1)
                next_state = 0;
            else
                next_state = state + 1;
        else
            next_state = state;

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

    always_comb op_sample_clk_en = state != 0 && delay_counter == 0;

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
        .fnum(fnum_tmp[bank_num][op_num]),
        .mult(mult[bank_num][op_num]),
        .block(block_tmp[bank_num][op_num]),
        .ws(ws[bank_num][op_num]),
        .vib(vib[bank_num][op_num]),
        .dvb,
        .kon(kon_tmp),
        .ar(ar[bank_num][op_num]),
        .dr(dr[bank_num][op_num]),
        .sl(sl[bank_num][op_num]),
        .rr(rr[bank_num][op_num]),
        .tl(tl[bank_num][op_num]),
        .ksr(ksr[bank_num][op_num]),
        .ksl(ksl[bank_num][op_num]),
        .egt(egt[bank_num][op_num]),
        .am(am[bank_num][op_num]),
        .dam,
        .nts,
        .bd,
        .sd,
        .tom,
        .tc,
        .hh,
        .use_feedback(use_feedback[bank_num][op_num]),
        .fb(fb_tmp[bank_num][op_num]),
        .modulation(modulation[bank_num][op_num]),
        .op_type(op_type_tmp[bank_num][op_num]),
        .out_p6
    );

    pipeline_sr #(
        .type_t(logic),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) sample_clk_en_sr (
        .clk,
        .in(op_sample_clk_en),
        .out(op_sample_clk_en_p)
    );

    pipeline_sr #(
        .type_t(logic [BANK_NUM_WIDTH-1:0]),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) bank_num_sr (
        .clk,
        .in(bank_num),
        .out(bank_num_p)
    );

    pipeline_sr #(
        .type_t(logic [OP_NUM_WIDTH-1:0]),
        .ENDING_CYCLE(PIPELINE_DELAY)
    ) op_num_sr (
        .clk,
        .in(op_num),
        .out(op_num_p)
    );

    // load the output from 3 operators ago but don't read out of range
    always_comb modulation_out_op_num = op_num >= 3 ? op_num - 3 : 0;

    mem_multi_bank #(
        .type_t(logic [OP_OUT_WIDTH-1:0]),
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
                if (i == bank_num && j == op_num && op_sample_clk_en_p[6])
                    operator_out[i][j] <= out_p6;
endmodule
`default_nettype wire  // re-enable implicit net type declarations