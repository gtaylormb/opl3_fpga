/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: tremolo.sv
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

module tremolo (
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,            
    input wire dam, // depth of tremolo
    output logic [AM_VAL_WIDTH-1:0] am_val = 0
);
    localparam TREMOLO_MAX_COUNT = 13*1024;
    localparam TREMOLO_INDEX_WIDTH = $clog2(TREMOLO_MAX_COUNT);
    
    logic [TREMOLO_INDEX_WIDTH-1:0] tremolo_index [NUM_BANKS][NUM_OPERATORS_PER_BANK]
        = '{default: '0};
    logic [TREMOLO_INDEX_WIDTH-8-1:0] am_val_tmp0;
    logic [TREMOLO_INDEX_WIDTH-8-1:0] am_val_tmp1;
    
    /*
     * Low-Frequency Oscillator (LFO)
     * 3.7 Hz (Sample Freq/2**14)
     */            
    always_ff @(posedge clk)
        if (sample_clk_en)
            if (tremolo_index[bank_num][op_num] == TREMOLO_MAX_COUNT - 1)
                tremolo_index[bank_num][op_num] <= 0;
            else
                tremolo_index[bank_num][op_num] <= tremolo_index[bank_num][op_num] + 1;
    
    always_comb am_val_tmp0 = tremolo_index[bank_num][op_num] >> 8;
    
    always_comb 
        if (am_val_tmp0 > 26)
            am_val_tmp1 = 2*26 + ~am_val_tmp0;
        else
            am_val_tmp1 = am_val_tmp0;
        
    always_ff @(posedge clk)
        if (dam)
            am_val <= am_val_tmp1;
        else
            am_val <= am_val_tmp1 >> 2;
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	