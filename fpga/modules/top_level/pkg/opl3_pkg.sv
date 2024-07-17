/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: opl3_pkg.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 13 Oct 2014
#
#   DESCRIPTION:
#   Generates a clk enable pulse based on the frequency specified by
#   OUTPUT_CLK_EN_FREQ.
#
#   CHANGE HISTORY:
#   13 Oct 2014        Greg Taylor
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

package opl3_pkg;
    /*
     * Original OPL3 used a 14.31818MHz master clock, divided by 288 giving a
     * sample clock of 49.7159KHz. Since our SSM2603 DAC uses fixed 256
     * oversampling, we'll use a 12.727MHz master clock which is the closest
     * value we can generate using an MMCM and 125MHz input clock. This will
     * give us a 49.7148KHz sample clock. We don't have to worry about clock
     * domain crossings.
     */
    localparam CLK_FREQ = 12.727e6;
    localparam DAC_OUTPUT_WIDTH = 24;
    localparam INSTANTIATE_TIMERS = 0; // set to 1 to use timers, 0 to save area
    localparam NUM_LEDS = 4; // connected to kon bank 0 starting at 0
    localparam INSTANTIATE_SAMPLE_SYNC_TO_DAC_CLK = 0;

    localparam DESIRED_SAMPLE_FREQ = 49.7159e3;
    localparam CLK_DIV_COUNT = int'($ceil(CLK_FREQ/DESIRED_SAMPLE_FREQ)); // unsupported by Quartus 17, set manually
    localparam ACTUAL_SAMPLE_FREQ = CLK_FREQ/CLK_DIV_COUNT;

    localparam NUM_REG_PER_BANK = 'hF6;
    localparam REG_FILE_DATA_WIDTH = 8;
    localparam REG_TIMER_WIDTH = 8;
    localparam REG_CONNECTION_SEL_WIDTH = 6;
    localparam REG_MULT_WIDTH = 4;
    localparam REG_FNUM_WIDTH = 10;
    localparam REG_BLOCK_WIDTH = 3;
    localparam REG_WS_WIDTH = 3;
    localparam REG_ENV_WIDTH = 4;
    localparam REG_TL_WIDTH = 6;
    localparam REG_KSL_WIDTH = 2;
    localparam REG_FB_WIDTH = 3;

    localparam SAMPLE_WIDTH = 16;
    localparam DAC_LEFT_SHIFT = signed'(DAC_OUTPUT_WIDTH - SAMPLE_WIDTH - 2) < 0 ? 0 : DAC_OUTPUT_WIDTH - SAMPLE_WIDTH - 3;
    localparam FINAL_ENV_WIDTH = 11;
    localparam OP_OUT_WIDTH = 13;
    localparam PHASE_ACC_WIDTH = 20;
    localparam PHASE_FINAL_WIDTH = 10;
    localparam VIB_VAL_WIDTH = REG_FNUM_WIDTH - 7;
    localparam ENV_SHIFT_WIDTH = 2;
    localparam TREMOLO_MAX_COUNT = 13*1024;
    localparam TREMOLO_INDEX_WIDTH = $clog2(TREMOLO_MAX_COUNT);
    localparam AM_VAL_WIDTH = TREMOLO_INDEX_WIDTH - 8;
    localparam KSL_ADD_WIDTH = 8;

    localparam NUM_BANKS = 2;
    localparam NUM_OPERATORS_PER_BANK = 18;
    localparam NUM_CHANNELS_PER_BANK = 9;
    localparam BANK_NUM_WIDTH = $clog2(NUM_BANKS);
    localparam OP_NUM_WIDTH = $clog2(NUM_OPERATORS_PER_BANK);

    localparam TIMER1_TICK_INTERVAL = 80e-6;  // in seconds
    localparam TIMER2_TICK_INTERVAL = 320e-6; // in seconds

    typedef enum logic [2:0] {
        OP_NORMAL,
        OP_BASS_DRUM,
        OP_HI_HAT,
        OP_TOM_TOM,
        OP_SNARE_DRUM,
        OP_TOP_CYMBAL
    } operator_t;

    typedef struct packed {
        logic valid;
        logic bank_num;
        logic [REG_FILE_DATA_WIDTH-1:0] address;
        logic [REG_FILE_DATA_WIDTH-1:0] data;
    } opl3_reg_wr_t;

    typedef struct packed {
        logic valid;
        logic bank_num;
        logic [$clog2(NUM_OPERATORS_PER_BANK)-1:0] op_num;
        logic signed [OP_OUT_WIDTH-1:0] op_out;
    } operator_out_t;

endpackage
`default_nettype wire
