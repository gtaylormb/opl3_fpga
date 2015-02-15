///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____   ____
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \   \   \/      Version     : 2014.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        _no_description_
// /___/   /\      Filename    : ISERDESE3.v
// \   \  /  \ 
//  \___\/\___\                    
//                                 
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module ISERDESE3 #(
  `ifdef XIL_TIMING
  parameter LOC = "UNPLACED",  
  `endif
  parameter integer DATA_WIDTH = 8,
  parameter DDR_CLK_EDGE = "OPPOSITE_EDGE",
  parameter FIFO_ENABLE = "FALSE",
  parameter FIFO_SYNC_MODE = "FALSE",
  parameter IDDR_MODE = "FALSE",
  parameter [0:0] IS_CLK_B_INVERTED = 1'b0,
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter [0:0] IS_RST_INVERTED = 1'b0,
  parameter real SIM_VERSION = 2.0
)(
  output FIFO_EMPTY,
  output INTERNAL_DIVCLK,
  output [7:0] Q,

  input CLK,
  input CLKDIV,
  input CLK_B,
  input D,
  input FIFO_RD_CLK,
  input FIFO_RD_EN,
  input RST
);
  
// define constants
  localparam MODULE_NAME = "ISERDESE3";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  reg trig_attr = 1'b0;
  
// include dynamic registers - XILINX test only
  `ifdef XIL_DR
  `include "ISERDESE3_dr.v"
  `else
  localparam [3:0] DATA_WIDTH_REG = DATA_WIDTH;
  localparam [152:1] DDR_CLK_EDGE_REG = DDR_CLK_EDGE;
  localparam [40:1] FIFO_ENABLE_REG = FIFO_ENABLE;
  localparam [40:1] FIFO_SYNC_MODE_REG = FIFO_SYNC_MODE;
  localparam [40:1] IDDR_MODE_REG = IDDR_MODE;
  localparam [0:0] IS_CLK_B_INVERTED_REG = IS_CLK_B_INVERTED;
  localparam [0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
  localparam [0:0] IS_RST_INVERTED_REG = IS_RST_INVERTED;
  localparam real SIM_VERSION_REG = SIM_VERSION;
  `endif

  localparam [40:1] DDR_DIS_DQS_REG = "FALSE";

  wire IS_CLK_B_INVERTED_BIN;
  wire IS_CLK_INVERTED_BIN;
  wire IS_RST_INVERTED_BIN;
  wire [63:0] SIM_VERSION_BIN;

  `ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
  `else
  reg attr_test = 1'b0;
  `endif
  reg attr_err = 1'b0;
  tri0 glblGSR = glbl.GSR;

  `ifdef XIL_TIMING
  reg notifier;
  `endif

  wire FIFO_EMPTY_out;
  wire INTERNAL_DIVCLK_out;
  wire [7:0] Q_out;

  wire FIFO_EMPTY_delay;
  wire INTERNAL_DIVCLK_delay;
  wire [7:0] Q_delay;

  wire CLKDIV_in;
  wire CLK_B_in;
  wire CLK_in;
  wire D_in;
  wire FIFO_RD_CLK_in;
  wire FIFO_RD_EN_in;
  wire IFD_CE_in;
  wire RST_in;

  wire CLKDIV_delay;
  wire CLK_B_delay;
  wire CLK_delay;
  wire D_delay;
  wire FIFO_RD_CLK_delay;
  wire FIFO_RD_EN_delay;
  wire RST_delay;

  
  assign #(out_delay) FIFO_EMPTY = FIFO_EMPTY_delay;
  assign #(out_delay) INTERNAL_DIVCLK = INTERNAL_DIVCLK_delay;
  assign #(out_delay) Q = Q_delay;
  
`ifndef XIL_TIMING // inputs with timing checks
  assign #(inclk_delay) CLKDIV_delay = CLKDIV;
  assign #(inclk_delay) CLK_B_delay = CLK_B;
  assign #(inclk_delay) CLK_delay = CLK;
  assign #(inclk_delay) FIFO_RD_CLK_delay = FIFO_RD_CLK;

  assign #(in_delay) D_delay = D;
  assign #(in_delay) FIFO_RD_EN_delay = FIFO_RD_EN;
  assign #(in_delay) RST_delay = RST;
`endif //  `ifndef XIL_TIMING


  assign FIFO_EMPTY_delay = FIFO_EMPTY_out;
  assign INTERNAL_DIVCLK_delay = INTERNAL_DIVCLK_out;
  assign Q_delay = Q_out;

  assign CLKDIV_in = CLKDIV_delay;
  assign CLK_B_in = CLK_B_delay ^ IS_CLK_B_INVERTED_BIN;
  assign CLK_in = CLK_delay ^ IS_CLK_INVERTED_BIN;
  assign D_in = D_delay;
  assign FIFO_RD_CLK_in = FIFO_RD_CLK_delay;
  assign FIFO_RD_EN_in = FIFO_RD_EN_delay;
  assign RST_in = RST_delay ^ IS_RST_INVERTED_BIN;

  assign IS_CLK_B_INVERTED_BIN = IS_CLK_B_INVERTED_REG;

  assign IS_CLK_INVERTED_BIN = IS_CLK_INVERTED_REG;

  assign IS_RST_INVERTED_BIN = IS_RST_INVERTED_REG;

  assign SIM_VERSION_BIN = SIM_VERSION_REG * 1000;


  initial begin
    #1;
    trig_attr = ~trig_attr;
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((DATA_WIDTH_REG != 8) &&
         (DATA_WIDTH_REG != 4))) begin
      $display("Error: [Unisim %s-101] DATA_WIDTH attribute is set to %d.  Legal values for this attribute are 8 or 4. Instance: %m", MODULE_NAME, DATA_WIDTH_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DDR_CLK_EDGE_REG != "OPPOSITE_EDGE") &&
         (DDR_CLK_EDGE_REG != "SAME_EDGE") &&
         (DDR_CLK_EDGE_REG != "SAME_EDGE_PIPELINED"))) begin
      $display("Error: [Unisim %s-102] DDR_CLK_EDGE attribute is set to %s.  Legal values for this attribute are OPPOSITE_EDGE, SAME_EDGE or SAME_EDGE_PIPELINED. Instance: %m", MODULE_NAME, DDR_CLK_EDGE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((FIFO_ENABLE_REG != "FALSE") &&
         (FIFO_ENABLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-104] FIFO_ENABLE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, FIFO_ENABLE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((FIFO_SYNC_MODE_REG != "FALSE") &&
         (FIFO_SYNC_MODE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-105] FIFO_SYNC_MODE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, FIFO_SYNC_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IDDR_MODE_REG != "FALSE") &&
         (IDDR_MODE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-106] IDDR_MODE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, IDDR_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLK_B_INVERTED_REG !== 1'b0) && (IS_CLK_B_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-107] IS_CLK_B_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLK_B_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLK_INVERTED_REG !== 1'b0) && (IS_CLK_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-108] IS_CLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLK_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_RST_INVERTED_REG !== 1'b0) && (IS_RST_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-109] IS_RST_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_RST_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
   ((SIM_VERSION_REG != 2.0) &&
      (SIM_VERSION_REG != 1.0))) begin
    $display("Error: [Unisim %s-110] SIM_VERSION attribute is set to %f.  Legal values for this attribute are 2.0 or 1.0. Instance: %m", MODULE_NAME, SIM_VERSION_REG);
    attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end


  assign IFD_CE_in = 1'b0; // tie off

  SIP_ISERDESE3 SIP_ISERDESE3_INST (
    .DATA_WIDTH (DATA_WIDTH_REG),
    .DDR_CLK_EDGE (DDR_CLK_EDGE_REG),
    .DDR_DIS_DQS (DDR_DIS_DQS_REG),
    .FIFO_ENABLE (FIFO_ENABLE_REG),
    .FIFO_SYNC_MODE (FIFO_SYNC_MODE_REG),
    .IDDR_MODE (IDDR_MODE_REG),
    .SIM_VERSION (SIM_VERSION_BIN),
    .FIFO_EMPTY (FIFO_EMPTY_out),
    .INTERNAL_DIVCLK (INTERNAL_DIVCLK_out),
    .Q (Q_out),
    .CLK (CLK_in),
    .CLKDIV (CLKDIV_in),
    .CLK_B (CLK_B_in),
    .D (D_in),
    .FIFO_RD_CLK (FIFO_RD_CLK_in),
    .FIFO_RD_EN (FIFO_RD_EN_in),
    .IFD_CE (IFD_CE_in),
    .RST (RST_in),
    .GSR (glblGSR)
  );

  specify
    (CLK *> Q) = (0:0:0, 0:0:0);
    (CLK => FIFO_EMPTY) = (0:0:0, 0:0:0);
    (CLK => INTERNAL_DIVCLK) = (0:0:0, 0:0:0);
    (CLK_B *> Q) = (0:0:0, 0:0:0);
    (FIFO_RD_CLK *> Q) = (0:0:0, 0:0:0);
    (FIFO_RD_CLK => FIFO_EMPTY) = (0:0:0, 0:0:0);
    // (INTERNAL_DIVCLK *> Q) = (0:0:0, 0:0:0); // error prop output to output
`ifdef XIL_TIMING
    $period (negedge CLK, 0:0:0, notifier);
    $period (negedge CLKDIV, 0:0:0, notifier);
    $period (negedge CLK_B, 0:0:0, notifier);
    $period (negedge FIFO_RD_CLK, 0:0:0, notifier);
    $period (posedge CLK, 0:0:0, notifier);
    $period (posedge CLKDIV, 0:0:0, notifier);
    $period (posedge CLK_B, 0:0:0, notifier);
    $period (posedge FIFO_RD_CLK, 0:0:0, notifier);
    $recrem ( negedge RST, negedge CLK, 0:0:0, 0:0:0, notifier,,, RST_delay, CLK_delay);
    $recrem ( negedge RST, negedge CLK_B, 0:0:0, 0:0:0, notifier,,, RST_delay, CLK_B_delay);
    $recrem ( negedge RST, posedge CLK, 0:0:0, 0:0:0, notifier,,, RST_delay, CLK_delay);
    $recrem ( negedge RST, posedge CLKDIV, 0:0:0, 0:0:0, notifier,,, RST_delay, CLKDIV_delay);
    $recrem ( negedge RST, posedge CLK_B, 0:0:0, 0:0:0, notifier,,, RST_delay, CLK_B_delay);
    $recrem ( posedge RST, negedge CLK, 0:0:0, 0:0:0, notifier,,, RST_delay, CLK_delay);
    $recrem ( posedge RST, negedge CLK_B, 0:0:0, 0:0:0, notifier,,, RST_delay, CLK_B_delay);
    $recrem ( posedge RST, posedge CLK, 0:0:0, 0:0:0, notifier,,, RST_delay, CLK_delay);
    $recrem ( posedge RST, posedge CLKDIV, 0:0:0, 0:0:0, notifier,,, RST_delay, CLKDIV_delay);
    $recrem ( posedge RST, posedge CLK_B, 0:0:0, 0:0:0, notifier,,, RST_delay, CLK_B_delay);
    $setuphold (negedge CLK, negedge D, 0:0:0, 0:0:0, notifier,,, CLK_delay, D_delay);
    $setuphold (negedge CLK, posedge D, 0:0:0, 0:0:0, notifier,,, CLK_delay, D_delay);
    $setuphold (negedge CLK_B, negedge D, 0:0:0, 0:0:0, notifier,,, CLK_B_delay, D_delay);
    $setuphold (negedge CLK_B, posedge D, 0:0:0, 0:0:0, notifier,,, CLK_B_delay, D_delay);
    $setuphold (posedge CLK, negedge D, 0:0:0, 0:0:0, notifier,,, CLK_delay, D_delay);
    $setuphold (posedge CLK, posedge D, 0:0:0, 0:0:0, notifier,,, CLK_delay, D_delay);
    $setuphold (posedge CLKDIV, negedge RST, 0:0:0, 0:0:0, notifier,,, CLKDIV_delay, RST_delay);
    $setuphold (posedge CLKDIV, posedge RST, 0:0:0, 0:0:0, notifier,,, CLKDIV_delay, RST_delay);
    $setuphold (posedge CLK_B, negedge D, 0:0:0, 0:0:0, notifier,,, CLK_B_delay, D_delay);
    $setuphold (posedge CLK_B, posedge D, 0:0:0, 0:0:0, notifier,,, CLK_B_delay, D_delay);
    $setuphold (posedge FIFO_RD_CLK, negedge FIFO_RD_EN, 0:0:0, 0:0:0, notifier,,, FIFO_RD_CLK_delay, FIFO_RD_EN_delay);
    $setuphold (posedge FIFO_RD_CLK, posedge FIFO_RD_EN, 0:0:0, 0:0:0, notifier,,, FIFO_RD_CLK_delay, FIFO_RD_EN_delay);
    $width (negedge CLK, 0:0:0, 0, notifier);
    $width (negedge CLKDIV, 0:0:0, 0, notifier);
    $width (negedge CLK_B, 0:0:0, 0, notifier);
    $width (negedge FIFO_RD_CLK, 0:0:0, 0, notifier);
    $width (negedge RST, 0:0:0, 0, notifier);
    $width (posedge CLK, 0:0:0, 0, notifier);
    $width (posedge CLKDIV, 0:0:0, 0, notifier);
    $width (posedge CLK_B, 0:0:0, 0, notifier);
    $width (posedge FIFO_RD_CLK, 0:0:0, 0, notifier);
    $width (posedge RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
