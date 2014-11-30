/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: vibrato.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 13 Oct 2014
#
#   DESCRIPTION:
#   Prepare the phase increment for the NCO (calc multiplier and vibrato)
#
#   CHANGE HISTORY:
#   13 Oct 2014    Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none  // disable implicit net type declarations

import opl3_pkg::*;

module vibrato (
    input wire clk,
    input wire sample_clk_en,
    input wire [BANK_NUM_WIDTH-1:0] bank_num,
    input wire [OP_NUM_WIDTH-1:0] op_num,            
    input wire [REG_FNUM_WIDTH-1:0] fnum,
    input wire vib,
    input wire dvb,    
    output logic [REG_FNUM_WIDTH-1:0] vib_val
);
    localparam VIBRATO_INDEX_WIDTH = 13;
    
    logic [VIBRATO_INDEX_WIDTH-1:0] vibrato_index [NUM_BANKS][NUM_OPERATORS_PER_BANK]
        = '{ default: '0 };
    logic [REG_FNUM_WIDTH-1:0] delta0;
    logic [REG_FNUM_WIDTH-1:0] delta1;
    logic [REG_FNUM_WIDTH-1:0] delta2;
        
    /*
     * Low-Frequency Oscillator (LFO)
     * 6.07Hz (Sample Freq/2**13)
     */        
    always_ff @(posedge clk)
        if (sample_clk_en)
            vibrato_index[bank_num][op_num] <= vibrato_index[bank_num][op_num] + 1;
        
    always_comb delta0 = fnum >> 7;
    always_comb delta1 = ((vibrato_index[bank_num][op_num] >> 10) & 3) == 3 ? delta0 >> 1 : delta0;
    always_comb delta2 = !dvb ? delta1 >> 1 : delta1;
    
    always_ff @(posedge clk)
        vib_val <= ((vibrato_index[bank_num][op_num] >> 10) & 4) != 0 ? ~delta2 : delta2;
endmodule
`default_nettype wire  // re-enable implicit net type declarations