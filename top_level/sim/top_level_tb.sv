/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: top_level_tb.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 18 Oct 2014
# 
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   18 Oct 2014        Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`default_nettype none  // disable implicit net type declarations
`timescale 1ns / 1ps
  
module top_level_tb;
    localparam CLK_FREQ = 125e6;
    localparam CLK_HALF_PERIOD = 1/real'(CLK_FREQ)*1000e6/2;
    localparam GATE_DELAY = 2; // in ns    
    
    bit clk125;
    wire i2s_sclk;
    wire i2s_ws;
    wire i2s_sd;
    wire ac_mclk;
    
    always begin
        #CLK_HALF_PERIOD clk125 = 0;
        #CLK_HALF_PERIOD clk125 = 1;
    end        
    
    top_level top_level_inst (
        .*
    );
    
    program top_level_testbench;
		default clocking clk @(posedge clk125);
		endclocking      
		
        initial begin
        	##100000;
        end
    endprogram
endmodule
`default_nettype wire  // re-enable implicit net type declarations