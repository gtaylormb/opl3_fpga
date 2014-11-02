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
    input wire dam, // depth of tremolo
    output logic [AM_VAL_WIDTH-1:0] am_val = 0
);
    localparam TREMOLO_INDEX_WIDTH = 14;
    
    logic [TREMOLO_INDEX_WIDTH-1:0] tremolo_index = 0;
    logic [TREMOLO_INDEX_WIDTH-8-1:0] am_val_tmp;
    
    /*
     * Low-Frequency Oscillator (LFO)
     * 3.7 Hz (Sample Freq/2**14)
     */            
    always_ff @(posedge clk)
        if (sample_clk_en)
            tremolo_index <= tremolo_index + 1;
    
    always_comb am_val_tmp = tremolo_index >> 8;
        
    always_ff @(posedge clk)
        if (dam)
            am_val <= am_val_tmp > 26 ? 2*26 - am_val_tmp : am_val_tmp;
        else
            am_val <= am_val_tmp > 26 ? (2*26 - am_val_tmp) >> 2 : am_val_tmp >> 2;
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	