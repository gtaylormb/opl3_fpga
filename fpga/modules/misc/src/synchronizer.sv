/*******************************************************************************
#
#   FILENAME: synchronizer.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 31 March 2009
#
#   DESCRIPTION: Synchronize signal across time domains (2 stage)
#
#   CHANGE HISTORY:
#   31 March 2009        Greg Taylor
#       Initial version
#
#	13 March 2013		 Greg Taylor
#		Added SystemVerilog assertions to check for incorrect usage
#		From:
#		Mark Litterick, “Pragmatic Simulation-Based Verification of Clock Domain
#		Crossing Signals and Jitter Using SystemVerilog Assertions,” DVCon 2006
#  		www.verilab.com/files/sva_cdc_paper_dvcon2006.pdf
#
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none

module synchronizer #(
    parameter DATA_WIDTH = 1
) (
    input wire clk,   // clock domain of out
    input wire [DATA_WIDTH-1:0] in,
    output logic [DATA_WIDTH-1:0] out
);
    (* ASYNC_REG = "TRUE" *)
    logic [1:0] [DATA_WIDTH-1:0] sync_regs = 0;

    always_ff @(posedge clk)
    	{sync_regs[1], sync_regs[0]} <= {sync_regs[0], in};

    always_comb out = sync_regs[1];
endmodule
`default_nettype wire