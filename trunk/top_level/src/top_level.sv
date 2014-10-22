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
    output logic ac_mclk,
    output wire ac_mute_n,
    inout wire i2c_scl,
    inout wire i2c_sda,
    output logic [3:0] led
);
    logic reset;
    wire clk_locked;
    wire clk;
    wire sample_clk_en;
    
    logic [REG_FNUM_WIDTH-1:0] fnum = 1023;
    logic [REG_MULT_WIDTH-1:0] mult = 1;
    logic [REG_BLOCK_WIDTH-1:0] block = 0;
    
    localparam int CLK_COUNT = CLK_FREQ;
    
    logic [$clog2(CLK_COUNT)-1:0] counter = 0;
    
    always_ff @(posedge clk)    
        if (counter == CLK_COUNT - 1)
            counter <= 0;
        else
            counter <= counter + 1;
        
    always_ff @(posedge clk)
        if (counter == CLK_COUNT -1)
            block <= block + 1;

    wire [SAMPLE_WIDTH-1:0] sample;
      
    clk_gen clk_gen_inst(
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
    
    ssm2603_init ssm2603_inst (
        .*
    );       
    
    always_comb led[0] = ac_mute_n;
    always_comb led[1] = 1;
    always_comb led[2] = 1;
    always_comb led[3] = 1;
    
    /*
    save_dac_input #(
        .DAC_WIDTH(SAMPLE_WIDTH)
    ) save_dac_input_inst (
        .dac_input(sample),
        .clk_en(sample_clk_en),
        .*
    );   */ 
    
    
endmodule
`default_nettype wire  // re-enable implicit net type declarations
