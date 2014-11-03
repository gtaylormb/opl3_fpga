/*******************************************************************************
#   +html+<pre>
#
#   FILENAME: operator_tb.sv
#   AUTHOR: Greg Taylor     CREATION DATE: 2 Nov 2014
# 
#   DESCRIPTION:
#
#   CHANGE HISTORY:
#   2 Nov 2014        Greg Taylor
#       Initial version
#
#   SVN Identification
#   $Id$
#******************************************************************************/
`default_nettype none  // disable implicit net type declarations
`timescale 1ns / 1ps

`include "../../top_level/pkg/opl3_pkg.sv"
import opl3_pkg::*;

module operator_tb;
    localparam CLK_HALF_PERIOD = 1/real'(CLK_FREQ)*1000e6/2;
    localparam GATE_DELAY = 2; // in ns
    
    bit clk;
    wire sample_clk_en;
    wire [OP_OUT_WIDTH-1:0] out;
    
    bit [REG_FNUM_WIDTH-1:0] fnum = 512;
    bit [REG_MULT_WIDTH-1:0] mult = 5;
    bit [REG_BLOCK_WIDTH-1:0] block = 4;
    bit [REG_WS_WIDTH-1:0] ws = 0;
    bit vib = 0;
    bit dvb = 0;
    bit kon = 0;
    bit [REG_ENV_WIDTH-1:0] ar = 0; // attack rate
    bit [REG_ENV_WIDTH-1:0] dr = 0; // decay rate
    bit [REG_ENV_WIDTH-1:0] sl = 0; // sustain level
    bit [REG_ENV_WIDTH-1:0] rr = 0; // release rate
    bit [REG_TL_WIDTH-1:0] tl = 0;  // total level
    bit ksr = 0;                    // key scale rate
    bit [REG_KSL_WIDTH-1:0] ksl = 0; // key scale level
    bit egt = 0;                     // envelope type
    bit am = 0;                      // amplitude modulation (tremolo)
    bit dam = 0;                     // depth of tremolo
    bit nts = 0;                     // keyboard split selection               
    
    always begin
        #CLK_HALF_PERIOD clk = 0;
        #CLK_HALF_PERIOD clk = 1;
    end
    
    default clocking mclk @(posedge clk);
        default input #1step;
        default output #GATE_DELAY;
        input out;
        output fnum;
        output mult;
        output block;
        output ws;
        output vib;
        output dvb;
        output kon;
        output ar; 
        output dr;
        output sl; 
        output rr; 
        output tl;  
        output ksr;                  
        output ksl; 
        output egt;                    
        output am;                      
        output dam;                     
        output nts;                                   
    endclocking 
    
    clk_div #(
        .INPUT_CLK_FREQ(CLK_FREQ),       
        .OUTPUT_CLK_EN_FREQ(SAMPLE_FREQ) 
    ) sample_clk_gen_inst (
        .clk_en(sample_clk_en),
        .*
    );
    
    operator operator (      
        .*
    );
    
    initial begin
        ##10;
        mclk.ar <= 50;
        mclk.dr <= 100;
        mclk.sl <= 20;
        mclk.rr <= 50;
        mclk.tl <= 100;
        ##1000;
        mclk.kon <= 1;
        ##10000;
        mclk.kon <= 0;
        ##10000;  
    end

endmodule
`default_nettype wire  // re-enable implicit net type declarations
