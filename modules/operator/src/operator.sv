/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: operator.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 13 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   13 Oct 2014    Greg Taylor
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

import opl3_pkg::*;

module operator (
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,              
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire [REG_MULT_WIDTH-1:0] mult,
    input wire [REG_BLOCK_WIDTH-1:0] block,
    input wire [REG_WS_WIDTH-1:0] ws,
    input wire vib,
    input wire dvb,
    input wire kon[NUM_BANKS][NUM_OPERATORS_PER_BANK],  
    input wire [REG_ENV_WIDTH-1:0] ar, // attack rate
    input wire [REG_ENV_WIDTH-1:0] dr, // decay rate
    input wire [REG_ENV_WIDTH-1:0] sl, // sustain level
    input wire [REG_ENV_WIDTH-1:0] rr, // release rate
    input wire [REG_TL_WIDTH-1:0] tl,  // total level
    input wire ksr,                    // key scale rate
    input wire [REG_KSL_WIDTH-1:0] ksl, // key scale level
    input wire egt,                     // envelope type
    input wire am,                      // amplitude modulation (tremolo)
    input wire dam,                     // depth of tremolo
    input wire nts,                     // keyboard split selection
    input wire use_feedback,
    input wire [REG_FB_WIDTH-1:0] fb,
    input wire signed [OP_OUT_WIDTH-1:0] modulation,
    output logic signed [OP_OUT_WIDTH-1:0] out
);   
    wire signed [PHASE_ACC_WIDTH-1:0] phase_inc;
    logic signed [PHASE_ACC_WIDTH-1:0] phase_inc_post_add = 0;    
    logic key_on_pulse;
    wire key_on_pulse_array [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    logic key_off_pulse;
    wire key_off_pulse_array [NUM_BANKS][NUM_OPERATORS_PER_BANK];
    wire [ENV_WIDTH-1:0] env;
    logic [OP_OUT_WIDTH-1:0] feedback [NUM_BANKS][NUM_OPERATORS_PER_BANK][2] =
     '{default: 0};
    logic [PHASE_ACC_WIDTH-1:0] feedback_result = 0; 
    
    genvar i, j;
    generate
        for (i = 0; i < NUM_BANKS; i ++) 
            for (j = 0; j < NUM_OPERATORS_PER_BANK; j++) begin 
                /*
                 * Detect key on and key off
                 */
                edge_detector #(
                    .EDGE_LEVEL(1), 
                    .CLK_DLY(1)
                ) key_on_edge_detect (
                    .clk_en(i == bank_num && j == op_num && sample_clk_en),
                    .in(kon[i][j]), 
                    .edge_detected(key_on_pulse_array[i][j]),
                    .*
                );
                
                edge_detector #(
                    .EDGE_LEVEL(0), 
                    .CLK_DLY(1)
                ) key_off_edge_detect (
                    .clk_en(i == bank_num && j == op_num && sample_clk_en),
                    .in(kon[i][j]), 
                    .edge_detected(key_off_pulse_array[i][j]),
                    .*
                );                                   
            end            
    endgenerate 
    
    always_comb key_on_pulse = key_on_pulse_array[bank_num][op_num];
    always_comb key_off_pulse = key_off_pulse_array[bank_num][op_num];          
    
    always_ff @(posedge clk)
        if (sample_clk_en) begin
            feedback[bank_num][op_num][0] <= out;
            feedback[bank_num][op_num][1] <= feedback[bank_num][op_num][0];
        end
    
    always_comb
        feedback_result = ((feedback[bank_num][op_num][0] + feedback[bank_num][op_num][1]) << fb) >> 9;
        
    /*
     * An operator that implements feedback does not take any modulation
     * input (it is always operator 1 in any channel scheme)
     */            
    always_ff @(posedge clk)
        if (use_feedback)
            phase_inc_post_add <= phase_inc + feedback_result;
        else
            phase_inc_post_add <= phase_inc + modulation;
    
    calc_phase_inc calc_phase_inc (
        .*
    ); 
    
    envelope_generator envelope_generator (
        .*
    );
        
    phase_generator phase_generator (
        .phase_inc(phase_inc_post_add),
        .*
    );
endmodule
`default_nettype wire  // re-enable implicit net type declarations