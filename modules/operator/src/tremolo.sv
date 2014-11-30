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
#   SVN Identification
#   $Id$
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
	