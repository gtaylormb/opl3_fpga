///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Output SERial/DESerializer
// /___/   /\      Filename    : OSERDESE3.v
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

module OSERDESE3 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer DATA_WIDTH = 8,
  parameter [0:0] INIT = 1'b0,
  parameter [0:0] IS_CLKDIV_INVERTED = 1'b0,
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter [0:0] IS_RST_INVERTED = 1'b0,
  parameter ODDR_MODE = "FALSE",
  parameter OSERDES_D_BYPASS = "FALSE",
  parameter OSERDES_T_BYPASS = "FALSE",
  parameter real SIM_VERSION = 2.0
)(
  output OQ,
  output T_OUT,

  input CLK,
  input CLKDIV,
  input [7:0] D,
  input RST,
  input T
);
  
// define constants
  localparam MODULE_NAME = "OSERDESE3";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
`ifdef XIL_DR
  `include "OSERDESE3_dr.v"
`else
  localparam [3:0] DATA_WIDTH_REG = DATA_WIDTH;
  localparam [0:0] INIT_REG = INIT;
  localparam [0:0] IS_CLKDIV_INVERTED_REG = IS_CLKDIV_INVERTED;
  localparam [0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
  localparam [0:0] IS_RST_INVERTED_REG = IS_RST_INVERTED;
  localparam [40:1] ODDR_MODE_REG = ODDR_MODE;
  localparam [40:1] OSERDES_D_BYPASS_REG = OSERDES_D_BYPASS;
  localparam [40:1] OSERDES_T_BYPASS_REG = OSERDES_T_BYPASS;
  localparam real SIM_VERSION_REG = SIM_VERSION;
`endif

  localparam [64:1] TBYTE_CTL_REG = "T";

  wire IS_CLKDIV_INVERTED_BIN;
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

  wire OQ_out;
  wire T_OUT_out;

  wire OQ_delay;
  wire T_OUT_delay;

  wire CLKDIV_in;
  wire CLK_in;
  wire OFD_CE_in;
  wire RST_in;
  wire T_in;
  wire [7:0] D_in;

  wire CLKDIV_delay;
  wire CLK_delay;
  wire RST_delay;
  wire T_delay;
  wire [7:0] D_delay;
  wire init_param;

  assign #(out_delay) OQ = OQ_delay;
  assign #(out_delay) T_OUT = T_OUT_delay;

`ifdef XIL_TIMING
  reg notifier;
`endif

`ifndef XIL_TIMING // inputs with timing checks
  assign #(inclk_delay) CLKDIV_delay = CLKDIV;

  assign #(in_delay) D_delay = D;
  assign #(in_delay) RST_delay = RST;
`endif

// inputs with no timing checks
  assign #(inclk_delay) CLK_delay = CLK;

  assign #(in_delay) T_delay = T;

  assign OQ_delay = OQ_out;
  assign T_OUT_delay = T_OUT_out;

  assign CLKDIV_in = CLKDIV_delay ^ IS_CLKDIV_INVERTED_BIN;
  assign CLK_in = CLK_delay ^ IS_CLK_INVERTED_BIN;
  assign D_in = D_delay;
  assign RST_in = RST_delay ^ IS_RST_INVERTED_BIN;
  assign T_in = (T !== 1'bz) && T_delay; // rv 0

  assign IS_CLKDIV_INVERTED_BIN = IS_CLKDIV_INVERTED_REG;

  assign IS_CLK_INVERTED_BIN = IS_CLK_INVERTED_REG;

  assign IS_RST_INVERTED_BIN = IS_RST_INVERTED_REG;

  assign SIM_VERSION_BIN = SIM_VERSION_REG * 1000;
  assign init_param = (INIT == 1'b0) ? 1'b0 : 1'b1;

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
        ((INIT_REG !== 1'b0) && (INIT_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-102] INIT attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, INIT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLKDIV_INVERTED_REG !== 1'b0) && (IS_CLKDIV_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-103] IS_CLKDIV_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLKDIV_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLK_INVERTED_REG !== 1'b0) && (IS_CLK_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-104] IS_CLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLK_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_RST_INVERTED_REG !== 1'b0) && (IS_RST_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-105] IS_RST_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_RST_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ODDR_MODE_REG != "FALSE") &&
         (ODDR_MODE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-106] ODDR_MODE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ODDR_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((OSERDES_D_BYPASS_REG != "FALSE") &&
         (OSERDES_D_BYPASS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-107] OSERDES_D_BYPASS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, OSERDES_D_BYPASS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((OSERDES_T_BYPASS_REG != "FALSE") &&
         (OSERDES_T_BYPASS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-108] OSERDES_T_BYPASS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, OSERDES_T_BYPASS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
   ((SIM_VERSION_REG != 2.0) &&
      (SIM_VERSION_REG != 1.0))) begin
    $display("Error: [Unisim %s-109] SIM_VERSION attribute is set to %f.  Legal values for this attribute are 2.0 or 1.0. Instance: %m", MODULE_NAME, SIM_VERSION_REG);
    attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end


  assign OFD_CE_in = 1'b0; // tie off

generate
if (SIM_VERSION == 2.0) begin : generate_block1
  SIP_OSERDESE3_K2 SIP_OSERDESE3_INST (
    .DATA_WIDTH (DATA_WIDTH_REG),
    .INIT (INIT_REG),
    .ODDR_MODE (ODDR_MODE_REG),
    .OSERDES_D_BYPASS (OSERDES_D_BYPASS_REG),
    .OSERDES_T_BYPASS (OSERDES_T_BYPASS_REG),
    .SIM_VERSION (SIM_VERSION_BIN),
    .TBYTE_CTL (TBYTE_CTL_REG),
    .OQ (OQ_out),
    .T_OUT (T_OUT_out),
    .CLK (CLK_in),
    .CLKDIV (CLKDIV_in),
    .D (D_in),
    .OFD_CE (OFD_CE_in),
    .RST (RST_in),
    .T (T_in),
    .GSR (glblGSR)
  );
end else begin : generate_block1
SIP_OSERDESE3 SIP_OSERDESE3_INST (
    .DATA_WIDTH (DATA_WIDTH_REG),
    .INIT (INIT_REG),
    .ODDR_MODE (ODDR_MODE_REG),
    .OSERDES_D_BYPASS (OSERDES_D_BYPASS_REG),
    .OSERDES_T_BYPASS (OSERDES_T_BYPASS_REG),
    .SIM_VERSION (SIM_VERSION_BIN),
    .TBYTE_CTL (TBYTE_CTL_REG),
    .OQ (OQ_out),
    .T_OUT (T_OUT_out),
    .CLK (CLK_in),
    .CLKDIV (CLKDIV_in),
    .D (D_in),
    .OFD_CE (OFD_CE_in),
    .RST (RST_in),
    .T (T_in),
    .GSR (glblGSR)
  );
end 
endgenerate

  specify
    (CLK => OQ) = (0:0:0, 0:0:0);
    (CLKDIV => OQ) = (0:0:0, 0:0:0);
    (CLKDIV => T_OUT) = (0:0:0, 0:0:0);
    (D *> OQ) = (0:0:0, 0:0:0);
    (D *> T_OUT) = (0:0:0, 0:0:0);
    (T => T_OUT) = (0:0:0, 0:0:0);
    if (init_param == 1'b0) (negedge RST => (OQ +: 0)) = (0:0:0, 0:0:0);
    if (init_param == 1'b1) (negedge RST => (OQ +: 1)) = (0:0:0, 0:0:0);
    if (init_param == 1'b0) (negedge RST => (T_OUT +: 0)) = (0:0:0, 0:0:0);
    if (init_param == 1'b1) (negedge RST => (T_OUT +: 1)) = (0:0:0, 0:0:0);
    if (init_param == 1'b0) (posedge RST => (OQ +: 0)) = (0:0:0, 0:0:0);
    if (init_param == 1'b1) (posedge RST => (OQ +: 1)) = (0:0:0, 0:0:0);
    if (init_param == 1'b0) (posedge RST => (T_OUT +: 0)) = (0:0:0, 0:0:0);
    if (init_param == 1'b1) (posedge RST => (T_OUT +: 1)) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge CLK, 0:0:0, notifier);
    $period (negedge CLKDIV, 0:0:0, notifier);
    $period (posedge CLK, 0:0:0, notifier);
    $period (posedge CLKDIV, 0:0:0, notifier);
    $recrem ( negedge RST, negedge CLKDIV, 0:0:0, 0:0:0, notifier,,, RST_delay, CLKDIV_delay);
    $recrem ( negedge RST, posedge CLKDIV, 0:0:0, 0:0:0, notifier,,, RST_delay, CLKDIV_delay);
    $recrem ( posedge RST, negedge CLKDIV, 0:0:0, 0:0:0, notifier,,, RST_delay, CLKDIV_delay);
    $recrem ( posedge RST, posedge CLKDIV, 0:0:0, 0:0:0, notifier,,, RST_delay, CLKDIV_delay);
    $setuphold (negedge CLKDIV, negedge D, 0:0:0, 0:0:0, notifier,,, CLKDIV_delay, D_delay);
    $setuphold (negedge CLKDIV, negedge RST, 0:0:0, 0:0:0, notifier,,, CLKDIV_delay, RST_delay);
    $setuphold (negedge CLKDIV, posedge D, 0:0:0, 0:0:0, notifier,,, CLKDIV_delay, D_delay);
    $setuphold (negedge CLKDIV, posedge RST, 0:0:0, 0:0:0, notifier,,, CLKDIV_delay, RST_delay);
    $setuphold (posedge CLKDIV, negedge D, 0:0:0, 0:0:0, notifier,,, CLKDIV_delay, D_delay);
    $setuphold (posedge CLKDIV, negedge RST, 0:0:0, 0:0:0, notifier,,, CLKDIV_delay, RST_delay);
    $setuphold (posedge CLKDIV, posedge D, 0:0:0, 0:0:0, notifier,,, CLKDIV_delay, D_delay);
    $setuphold (posedge CLKDIV, posedge RST, 0:0:0, 0:0:0, notifier,,, CLKDIV_delay, RST_delay);
    $width (negedge CLK, 0:0:0, 0, notifier);
    $width (negedge CLKDIV, 0:0:0, 0, notifier);
    $width (negedge RST, 0:0:0, 0, notifier);
    $width (posedge CLK, 0:0:0, 0, notifier);
    $width (posedge CLKDIV, 0:0:0, 0, notifier);
    $width (posedge RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
