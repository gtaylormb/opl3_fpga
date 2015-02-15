/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: clk_div.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 13 Oct 2014
#
#   DESCRIPTION:
#   Generates a clk enable pulse based on the frequency specified by
#   OUTPUT_CLK_EN_FREQ.
#
#   CHANGE HISTORY:
#   13 Oct 2014        Greg Taylor
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

module clk_div #(
    parameter INPUT_CLK_FREQ = 0,    // in Hz
    parameter OUTPUT_CLK_EN_FREQ = 0 // in Hz
)(
    input wire clk, 
    output logic clk_en = 0
);
    localparam int CLK_DIV_COUNT = INPUT_CLK_FREQ/OUTPUT_CLK_EN_FREQ;
    
    logic [$clog2(CLK_DIV_COUNT)-1:0] counter = 0;
    
    always_ff @(posedge clk)
        if (counter == CLK_DIV_COUNT - 1)
            counter <= 0;
        else
            counter <= counter + 1;
        
    always_ff @(posedge clk)
        if (counter == CLK_DIV_COUNT - 1)
            clk_en <= 1;
        else
            clk_en <= 0;
endmodule
`default_nettype wire  // re-enable implicit net type declarations
