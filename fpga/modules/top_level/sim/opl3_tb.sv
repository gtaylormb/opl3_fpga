/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: opl3_tb.sv
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
  
module opl3_tb;
    localparam CLK_FREQ = 125e6;
    localparam CLK_HALF_PERIOD = 1/real'(CLK_FREQ)*1000e6/2;
    localparam CLK_PS_FREQ = 50e6;
    localparam CLK_PS_HALF_PERIOD = 1/real'(CLK_FREQ)*1000e6/2;    
    
    localparam NUM_AXI_REGISTERS = 128;
    localparam GATE_DELAY = 2; // in ns    
    
    bit clk125;
    wire clk;
    wire clk_locked;
    wire i2s_sclk;
    wire i2s_ws;
    wire i2s_sd;
    wire ac_mute_n;
    wire [3:0] led;
    logic [7:0] slv8_reg[NUM_AXI_REGISTERS*4] = '{default: '0};
    
    always begin
        #CLK_HALF_PERIOD clk125 = 0;
        #CLK_HALF_PERIOD clk125 = 1;
    end
    
    opl3 #(
        .C_S_AXI_DATA_WIDTH(32),
        .NUM_AXI_REGISTERS(NUM_AXI_REGISTERS)                 
    ) opl3 (
        .*
    );
    
    program top_level_testbench;
		default clocking clk @(posedge clk125);
		endclocking      
		
        initial begin
            force opl3.fnum[0][0] = '1;
            force opl3.mult[0][0] = '1;
            force opl3.block[0][0] = '1;
            force opl3.ws[0][0] = '1;
            
 /*           force opl3.ar[0][0] = '1;
            force opl3.dr[0][0] = '1;
            force opl3.sl[0][0] = '1;
            force opl3.rr[0][0] = '1;
            force opl3.tl[0][0] = '1;
 */           
            force opl3.cha[0][0] = '1;
            force opl3.chb[0][0] = '1;
            force opl3.cnt[0][0] = '1;
            
            force opl3.ryt = '1;
        
        	@(posedge opl3.clk_locked);
            ##10000 force opl3.kon[0][0] = 1;
            
            ##1000000;
        end
    endprogram
endmodule
`default_nettype wire  // re-enable implicit net type declarations