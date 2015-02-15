/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: env_rate_counter.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 2 Nov 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
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
#   Copyright (C) 2012  Steffen Ohrendorf <steffen.ohrendorf@gmx.de>
#   
#   Some code based on forum posts in: 
#   http://forums.submarine.org.uk/phpBB/viewforum.php?f=9,
#   Copyright (C) 2010-2013 by carbon14 and opl3    
#   
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none // disable implicit net type declarations

import opl3_pkg::*;

module env_rate_counter (
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,                  
    input wire ksr, // key scale rate    
    input wire nts, // keyboard split selection
    input wire [REG_FNUM_WIDTH-1:0] fnum,    
    input wire [REG_BLOCK_WIDTH-1:0] block,    
    input wire [REG_ENV_WIDTH-1:0] requested_rate,
    output logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_counter_overflow = 0
);
    localparam COUNTER_WIDTH = 15;
    localparam OVERFLOW_TMP_MAX_VALUE = 7<<15;
    
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_tmp0;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_tmp1;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_tmp2;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] effective_rate = 0;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] rate_value;
    logic [ENV_RATE_COUNTER_OVERFLOW_WIDTH-1:0] requested_rate_shifted;
    logic [1:0] rof;
    logic [COUNTER_WIDTH-1:0] counter [NUM_BANKS][NUM_OPERATORS_PER_BANK] =
     '{ default: '0 };
    logic [$clog2(OVERFLOW_TMP_MAX_VALUE)-1:0] overflow_tmp;
    logic sample_clk_en_d0 = 0;
    
    always_comb rate_tmp0 = nts ? fnum[8] : fnum[9];
    always_comb rate_tmp1 = rate_tmp0 | (block << 1);
    always_comb rate_tmp2 = ksr ? rate_tmp1 : rate_tmp1 >> 2;
    always_comb requested_rate_shifted = requested_rate << 2;
    
    always_comb
        if (rate_tmp2 + requested_rate_shifted > 60)
            effective_rate = 60;
        else
            effective_rate = rate_tmp2 + requested_rate_shifted;
        
    always_comb rate_value = effective_rate >> 2;
    always_comb rof = effective_rate[1:0];
    
    always_ff @(posedge clk)
        sample_clk_en_d0 <= sample_clk_en;
    
    always_ff @(posedge clk)
        if (sample_clk_en_d0 && requested_rate != 0)
            counter[bank_num][op_num] <= counter[bank_num][op_num] + ((4 | rof) << rate_value);
        
    always_comb overflow_tmp = counter[bank_num][op_num] + ((4 | rof) << rate_value);
    
    always_comb
        rate_counter_overflow = overflow_tmp >> 15;
    
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	