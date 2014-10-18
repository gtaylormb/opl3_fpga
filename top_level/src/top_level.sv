/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: top_level.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 13 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   13 Oct 2014        Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none // disable implicit net type declarations

`include "top_level/pkg/opl3_pkg.sv"
import opl3_pkg::*;

module top_level (
    input wire clk125,
    output wire i2s_sclk,
    output wire i2s_ws,
    output wire i2s_sd,
    output logic ac_mclk
);
    logic reset;
    wire clk_locked;
    wire clk;
    wire sample_clk_en;
    
    logic [REG_FNUM_WIDTH-1:0] fnum = 1023;
    logic [REG_MULT_WIDTH-1:0] mult = 1;
    logic [REG_BLOCK_WIDTH-1:0] block = 4;

    wire [SAMPLE_WIDTH-1:0] sample;
      
    clk_gen clk_gen_inst(
        .locked(clk_locked),
        .*
    );
    always_comb reset = !clk_locked;
    always_comb ac_mclk = clk;
    
    clk_div #(
        .INPUT_CLK_FREQ(CLK_FREQ),       
        .OUTPUT_CLK_EN_FREQ(SAMPLE_FREQ) 
    ) sample_clk_gen_inst (
        .clk_en(sample_clk_en),
        .*
    );

    /*
     * Frequency resolution can be found from the formula for F_NUM in ymf262
     * datasheet. Set F_NUM to 1, solve for frequency. This gives away the width
     * of the NCO
     */
    nco_control #(
        .CLK_FREQ(SAMPLE_FREQ),
        .FREQ_RES(0.047397614),
        .PHASE_ACC_WIDTH(20),
        .OUTPUT_WIDTH(SAMPLE_WIDTH)
    ) phase_gen_inst (
        .en(sample_clk_en),        
        .out(sample),
        .*
    );
    
    i2s i2s_inst (
        .left_channel(sample),
        .right_channel(sample),
        .*
    );
    
endmodule
`default_nettype wire  // re-enable implicit net type declarations
