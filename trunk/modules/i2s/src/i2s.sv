/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: i2s.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 17 Oct 2014
#
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   17 Oct 2014        Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`timescale 1ns / 1ps
`default_nettype none  // disable implicit net type declarations

import opl3_pkg::*;

module i2s (
    input wire clk, 
    input wire sample_clk_en,
    input wire [SAMPLE_WIDTH-1:0] left_channel,
    input wire [SAMPLE_WIDTH-1:0] right_channel,
    output logic i2s_sclk = 0,
    output logic i2s_ws = 0,
    output logic i2s_sd = 0
);
    localparam BITS_PER_FRAME = 64;
    localparam SCLK_FREQ = SAMPLE_FREQ*BITS_PER_FRAME;
    localparam int SCLK_DIV = CLK_FREQ/SCLK_FREQ/2;
    
    logic i2s_sclk_en;
    logic [$clog2(SCLK_DIV)-1:0] i2s_sclk_counter = 0;
    logic [$clog2(BITS_PER_FRAME)-1:0] bit_counter = 0;
    logic [SAMPLE_WIDTH-1:0] left_channel_r0 = 0;
    logic [SAMPLE_WIDTH-1:0] right_channel_r0 = 0;
    
    /*
     * Registers the inputs so they remain steady throughout frame transmit,
     * and of course better timing
     */
    always_ff @(posedge clk)
        if (sample_clk_en) begin
            left_channel_r0 <= left_channel;
            right_channel_r0 <= right_channel;
        end
    
    always_ff @(posedge clk)
        if (i2s_sclk_counter == SCLK_DIV - 1)
            i2s_sclk_counter <= 0;
        else
            i2s_sclk_counter <= i2s_sclk_counter + 1;

    always_ff @(posedge clk)
        if (i2s_sclk_counter == SCLK_DIV - 1)
            i2s_sclk <= !i2s_sclk;
    
    edge_detector #(
        .EDGE_LEVEL(1),
        .CLK_DLY(0)
    ) i2s_sclk_edge_inst (
        .in(i2s_sclk),
        .edge_detected(i2s_sclk_en),
        .*
    );
    
    always_ff @(posedge clk)
        if (sample_clk_en)
            bit_counter <= 0;
        else if (i2s_sclk_en)
            bit_counter <= bit_counter + 1;
    
    /*
     * Data transitions of i2s_ws and i2s_sd happen to occur on falling edge of i2s_sclk,
     * which is what we want
     */
    always_ff @(posedge clk)
        i2s_ws <= bit_counter >= 32;

    always_ff @(posedge clk)
        unique case (bit_counter)
        16: i2s_sd <= left_channel_r0[15];
        17: i2s_sd <= left_channel_r0[14];
        18: i2s_sd <= left_channel_r0[13];
        19: i2s_sd <= left_channel_r0[12];
        20: i2s_sd <= left_channel_r0[11];
        21: i2s_sd <= left_channel_r0[10];
        22: i2s_sd <= left_channel_r0[9];
        23: i2s_sd <= left_channel_r0[8];
        24: i2s_sd <= left_channel_r0[7];
        25: i2s_sd <= left_channel_r0[6];
        26: i2s_sd <= left_channel_r0[5];
        27: i2s_sd <= left_channel_r0[4];
        28: i2s_sd <= left_channel_r0[3];
        29: i2s_sd <= left_channel_r0[2];
        30: i2s_sd <= left_channel_r0[1];
        31: i2s_sd <= left_channel_r0[0];
        48: i2s_sd <= right_channel_r0[15];
        49: i2s_sd <= right_channel_r0[14];
        50: i2s_sd <= right_channel_r0[13];
        51: i2s_sd <= right_channel_r0[12];
        52: i2s_sd <= right_channel_r0[11];
        53: i2s_sd <= right_channel_r0[10];
        54: i2s_sd <= right_channel_r0[9];
        55: i2s_sd <= right_channel_r0[8];
        56: i2s_sd <= right_channel_r0[7];
        57: i2s_sd <= right_channel_r0[6];
        58: i2s_sd <= right_channel_r0[5];
        59: i2s_sd <= right_channel_r0[4];
        60: i2s_sd <= right_channel_r0[3];
        61: i2s_sd <= right_channel_r0[2];
        62: i2s_sd <= right_channel_r0[1];
        63: i2s_sd <= right_channel_r0[0];
        default: i2s_sd <= 0;
        endcase
endmodule
`default_nettype wire  // re-enable implicit net type declarations
