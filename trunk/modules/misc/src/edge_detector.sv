/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: edge_detector.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 1 April 2009
#
#   DESCRIPTION: 
#       Detect edge on i_in. Create single pulse on o_edge_detected upon edge
#       detection. i_in must be synchronous to i_sys_clk (this is not an
#       asynchronous edge detector!). Use 1 clock delay for glitch free output
#       (output registered).
#
#   CHANGE HISTORY:
#   1 April 2009        Greg Taylor
#       Initial version
#   14 Sept 2009        Greg Taylor
#       Added clock delay configuration parameter
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none  // disable implicit net type declarations

module edge_detector #(
    parameter EDGE_LEVEL = 1, // 1 = positive edge, 0 = negative edge
    parameter CLK_DLY = 0 // 0 = no clock delay, 1 = 1 clock delay
) (
    input wire clk,
    input wire in, 
    output reg edge_detected = 0
);
    reg in_r0 = !EDGE_LEVEL;
    reg in_r1 = !EDGE_LEVEL;
    
    always_ff @(posedge clk)
    	if (!CLK_DLY)
            in_r0 <= in;
        else begin
            in_r0 <= in;
            in_r1 <= in_r0;
        end
    
    always_comb
        if (EDGE_LEVEL)
            if (!CLK_DLY)
                edge_detected = in && !in_r0;
            else
                edge_detected = in_r0 && !in_r1;
        else
            if (!CLK_DLY)
                edge_detected = !in && in_r0;
            else 
                edge_detected = !in_r0 && in_r1;        
endmodule
`default_nettype wire  // re-enable implicit net type declarations
