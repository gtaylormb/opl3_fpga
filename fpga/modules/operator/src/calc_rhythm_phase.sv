/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: calc_rhythm_phase.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 25 July 2015
#
#   DESCRIPTION:
#   Does additional transformations to the phase for certain rhythm instruments.
#   Simply passes through the unmodified phase otherwise.
#
#   CHANGE HISTORY:
#   25 July 2015    Greg Taylor
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

module calc_rhythm_phase (
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,          
	input wire [PHASE_ACC_WIDTH-1:0] phase_acc [NUM_BANKS][NUM_OPERATORS_PER_BANK],
    input operator_t op_type,    
    output logic [PHASE_ACC_WIDTH-1:0] rhythm_phase
);	
    localparam RAND_POLYNOMIAL = 'h800302; // verified on real opl3
    localparam RAND_NUM_WIDTH = $clog2(RAND_POLYNOMIAL);
    
    /*
     * The hi hat and top cymbal use each other's phase
     */
    logic [PHASE_ACC_WIDTH-10-1:0] friend_phase;
    logic [PHASE_ACC_WIDTH-10-1:0] phase_bit;
    logic [PHASE_ACC_WIDTH-10-1:0] upper_current_phase;
    logic [PHASE_ACC_WIDTH-10-1:0] noise_bit;    
    logic [RAND_NUM_WIDTH-1:0] rand_num = 1;
    
    /*
     * Do operations in upper 10 bits, shift back returned value
     */
    always_comb upper_current_phase = phase_acc[bank_num][op_num] >> 10;
    
    always_comb
        unique case (op_type)
        OP_HI_HAT:     friend_phase = phase_acc[0][17] >> 10;
        OP_TOP_CYMBAL: friend_phase = phase_acc[0][13] >> 10;
        default:       friend_phase = '0;
        endcase
            
    always_comb
        phase_bit = (((upper_current_phase & 'h88) ^ ((upper_current_phase << 5) & 'h80)) |
         ((friend_phase ^ (friend_phase << 2)) & 'h20)) ? 'h02 : 'h00;
     
    always_comb
        unique case (op_type)
        OP_HI_HAT:     noise_bit = rand_num[0] << 1;
        OP_SNARE_DRUM: noise_bit = rand_num[0] << 8;
        default:       noise_bit = 0;
        endcase
    
    always_comb
        unique case (op_type)
        OP_NORMAL:     rhythm_phase = phase_acc[bank_num][op_num];
        OP_BASS_DRUM:  rhythm_phase = phase_acc[bank_num][op_num];
        OP_HI_HAT:     rhythm_phase = ((phase_bit << 8) | ('h34 << (phase_bit ^ noise_bit))) << 10;
        OP_TOM_TOM:    rhythm_phase = phase_acc[bank_num][op_num];
        OP_SNARE_DRUM: rhythm_phase = (('h100 + (upper_current_phase & 'h100)) ^ noise_bit) << 10;
        OP_TOP_CYMBAL: rhythm_phase = ((1 + phase_bit) << 8) << 10;
        endcase
            
    always_ff @(posedge clk)
        /*
         * Only update once per sample, not every operator time slot
         */
        if (sample_clk_en && bank_num == 0 && op_num == 0)
            if (rand_num & 1)
                rand_num <= (rand_num ^ RAND_POLYNOMIAL) >> 1;
            else
                rand_num <= rand_num >> 1;  
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	