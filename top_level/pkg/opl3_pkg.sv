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
package opl3_pkg;
    /*
     * Original OPL3 used a 14.31818MHz master clock, divided by 288 giving a
     * sample clock of 49.7159KHz. Since our SSM2603 DAC uses fixed 256
     * oversampling, we'll use a 12.727MHz master clock which is the closest
     * value we can generate using an MMCM and 125MHz input clock. This will
     * give us a 49.7148KHz sample clock. We don't have to worry about clock
     * domain crossings.
     */
    parameter int CLK_FREQ = 12.727e6;
    parameter DAC_OVERSAMPLE = 256;
    parameter SAMPLE_FREQ = CLK_FREQ/DAC_OVERSAMPLE;
    
    parameter REG_FILE_ADDRESS_WIDTH = $clog2('hF5);
    parameter REG_FILE_DATA_WIDTH = 8;
    parameter REG_TIMER_WIDTH = 8;
    parameter REG_CONNECTION_SEL_WIDTH = 6;
    parameter REG_MULT_WIDTH = 4;
    parameter REG_FNUM_WIDTH = 10;
    parameter REG_BLOCK_WIDTH = 3;
    parameter REG_WS_WIDTH = 3;
    parameter REG_ENV_WIDTH = 4;
    parameter REG_TL_WIDTH = 6;
    parameter REG_KSL_WIDTH = 2;
    parameter REG_FB_WIDTH = 3;
    
    parameter SAMPLE_WIDTH = 16;
    parameter ENV_WIDTH = 9;
    parameter OP_OUT_WIDTH = 13;
    parameter PHASE_ACC_WIDTH = 20;
    parameter AM_VAL_WIDTH = 5;
    parameter ENV_RATE_COUNTER_OVERFLOW_WIDTH = 8;
    parameter CHANNEL_ACCUMULATOR_WIDTH = 19;    
    
    parameter NUM_BANKS = 2;
    parameter NUM_OPERATORS_PER_BANK = 18;
    parameter NUM_CHANNELS_PER_BANK = 9;
    parameter BANK_NUM_WIDTH = $clog2(NUM_BANKS);
    parameter OP_NUM_WIDTH = $clog2(NUM_OPERATORS_PER_BANK);
    
    parameter TIMER1_TICK_INTERVAL = 80e-6;  // in seconds
    parameter TIMER2_TICK_INTERVAL = 320e-6; // in seconds

endpackage
