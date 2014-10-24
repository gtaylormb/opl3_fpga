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
    wire ac_mute_n;
    wire i2c_scl;
    wire i2c_sda;
    wire [3:0] led;
    
    wire [53:0]MIO;
    wire DDR_CAS_n;
    wire DDR_CKE;
    wire DDR_Clk_n;
    wire DDR_Clk;
    wire DDR_CS_n;
    wire DDR_DRSTB;
    wire DDR_ODT;
    wire DDR_RAS_n;
    wire DDR_WEB;
    wire [2:0]DDR_BankAddr;
    wire [14:0]DDR_Addr;
    wire DDR_VRN;
    wire DDR_VRP;
    wire [3:0]DDR_DM;
    wire [31:0]DDR_DQ;
    wire [3:0]DDR_DQS_n;
    wire [3:0]DDR_DQS;
    wire PS_SRSTB;
    wire PS_CLK;
    wire PS_PORB;    
    
    pullup(i2c_scl);
    pullup(i2c_sda);
    
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
        	@(posedge ac_mute_n);
        end
    endprogram
endmodule
`default_nettype wire  // re-enable implicit net type declarations