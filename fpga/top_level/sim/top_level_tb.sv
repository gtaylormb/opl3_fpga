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
`default_nettype none  // disable implicit net type declarations
`timescale 1ns / 1ps
  
module top_level_tb;
    localparam CLK_FREQ = 125e6;
    localparam CLK_HALF_PERIOD = 1/real'(CLK_FREQ)*1000e6/2;
    localparam CLK_PS_FREQ = 50e6;
    localparam CLK_PS_HALF_PERIOD = 1/real'(CLK_FREQ)*1000e6/2;    
    
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
/*    always begin
        #CLK_PS_HALF_PERIOD PS_CLK = 0;
        #CLK_PS_HALF_PERIOD PS_CLK = 1;
    end      */    
    
    top_level top_level_inst (
        .*
    );
    
    program top_level_testbench;
		default clocking clk @(posedge clk125);
		endclocking      
		
        initial begin
           // #(CLK_PS_HALF_PERIOD*2*5) PS_PORB = 1;
            //#(CLK_PS_HALF_PERIOD*2*10) PS_SRSTB = 1;
        	@(posedge ac_mute_n);
        end
    endprogram
endmodule
`default_nettype wire  // re-enable implicit net type declarations