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
#   SVN Identification
#   $Id$
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
