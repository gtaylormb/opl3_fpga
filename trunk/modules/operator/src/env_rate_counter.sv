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
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none // disable implicit net type declarations

import opl3_pkg::*;

module env_rate_counter (
	input wire clk,
	input wire sample_clk_en,
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
    logic [1:0] rof;
    logic [COUNTER_WIDTH-1:0] counter = 0;
    logic [$clog2(OVERFLOW_TMP_MAX_VALUE)-1:0] overflow_tmp;
    
    always_comb rate_tmp0 = (fnum >> nts ? 8 : 9) & 1;
    always_comb rate_tmp1 = rate_tmp0 | (block << 1);
    always_comb rate_tmp2 = ksr ? rate_tmp1 : rate_tmp1 >> 2;
    
    always_ff @(posedge clk)
        if (rate_tmp2 + (requested_rate << 2) > 63)
            effective_rate <= 63;
        else
            effective_rate <= rate_tmp2 + (requested_rate << 2);
        
    always_comb rate_value = effective_rate >> 2;
    always_comb rof = effective_rate[1:0];
    
    always_ff @(posedge clk)
        if (sample_clk_en && requested_rate != 0)
            counter <= counter + ((4 | rof) << rate_value);
        
    always_comb overflow_tmp = counter + ((4 | rof) << rate_value);
    
    always_ff @(posedge clk)
        rate_counter_overflow <= overflow_tmp >> 15;
    
endmodule
`default_nettype wire  // re-enable implicit net type declarations
	