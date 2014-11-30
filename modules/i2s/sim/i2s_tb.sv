/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: i2s_tb.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 17 Oct 2014
# 
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   17 Oct 2014        Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`default_nettype none  // disable implicit net type declarations
`timescale 1ns / 1ps

`include "../../top_level/pkg/opl3_pkg.sv"
import opl3_pkg::*;

module i2s_tb;
    localparam CLK_HALF_PERIOD = 1/real'(CLK_FREQ)*1000e6/2;
    localparam GATE_DELAY = 2; // in ns
    
    bit clk;
    wire sample_clk_en;
    bit [SAMPLE_WIDTH-1:0] left_channel = 0;
    bit [SAMPLE_WIDTH-1:0] right_channel = 2**16/2;
    wire i2s_sclk;
    wire i2s_ws;
    wire i2s_sd;
    
    always begin
        #CLK_HALF_PERIOD clk = 0;
        #CLK_HALF_PERIOD clk = 1;
    end
    
    clk_div #(
        .INPUT_CLK_FREQ(CLK_FREQ),       
        .OUTPUT_CLK_EN_FREQ(SAMPLE_FREQ) 
    ) sample_clk_gen_inst (
        .clk_en(sample_clk_en),
        .*
    );
    
    i2s i2s_inst (
        .*
    );
    	
    always_ff @(posedge clk)
        if (sample_clk_en) begin
            left_channel <= left_channel + 1;
            right_channel <= right_channel + 1;
        end
endmodule
`default_nettype wire  // re-enable implicit net type declarations
