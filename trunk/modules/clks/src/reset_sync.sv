/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: reset_sync.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 21 July 2009
#
#   DESCRIPTION:
#   To be used as the source for a local reset; takes global asynchronous reset
#   as input. Ensures that deassertion of the local reset signal is synchronous
#   to the local clock signal. Assertion of local reset remains asynchronous.
#   Local reset remains asserted for 2 clock cycles after global asynchronous
#   reset is deasserted. Taken from Xilinx Whitepaper 272.
#   http://www.xilinx.com/support/documentation/white_papers/wp272.pdf
#
#   CHANGE HISTORY:
#   21 July 2009        Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none  // disable implicit net type declarations

module reset_sync (
    input wire clk, // clock domain of the local logic
    input wire areset, // global asynchronous active-high reset signal
    output logic reset   // synchronous active-high local reset
);
    logic r0, r1, r2;
    
    always_ff @(posedge clk or posedge areset)
        if (areset) begin
            r0 <= 1;
            r1 <= 1;
            r2 <= 1;
        end
        else begin
            r0 <= 0;
            r1 <= r0;
            r2 <= r1;
        end
    
    always_comb reset = r2;
endmodule
`default_nettype wire  // re-enable implicit net type declarations
