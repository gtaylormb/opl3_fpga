///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor      : Xilinx
// \   \   \/     Version     : 2014.3
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                       Base Mixed Mode Clock Manager (MMCM)
// /___/   /\     Filename    : MMCME3_BASE.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module MMCME3_BASE #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter BANDWIDTH = "OPTIMIZED",
  parameter real CLKFBOUT_MULT_F = 5.000,
  parameter real CLKFBOUT_PHASE = 0.000,
  parameter real CLKIN1_PERIOD = 0.000,
  parameter real CLKOUT0_DIVIDE_F = 1.000,
  parameter real CLKOUT0_DUTY_CYCLE = 0.500,
  parameter real CLKOUT0_PHASE = 0.000,
  parameter integer CLKOUT1_DIVIDE = 1,
  parameter real CLKOUT1_DUTY_CYCLE = 0.500,
  parameter real CLKOUT1_PHASE = 0.000,
  parameter integer CLKOUT2_DIVIDE = 1,
  parameter real CLKOUT2_DUTY_CYCLE = 0.500,
  parameter real CLKOUT2_PHASE = 0.000,
  parameter integer CLKOUT3_DIVIDE = 1,
  parameter real CLKOUT3_DUTY_CYCLE = 0.500,
  parameter real CLKOUT3_PHASE = 0.000,
  parameter CLKOUT4_CASCADE = "FALSE",
  parameter integer CLKOUT4_DIVIDE = 1,
  parameter real CLKOUT4_DUTY_CYCLE = 0.500,
  parameter real CLKOUT4_PHASE = 0.000,
  parameter integer CLKOUT5_DIVIDE = 1,
  parameter real CLKOUT5_DUTY_CYCLE = 0.500,
  parameter real CLKOUT5_PHASE = 0.000,
  parameter integer CLKOUT6_DIVIDE = 1,
  parameter real CLKOUT6_DUTY_CYCLE = 0.500,
  parameter real CLKOUT6_PHASE = 0.000,
  parameter integer DIVCLK_DIVIDE = 1,
  parameter [0:0] IS_CLKFBIN_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN1_INVERTED = 1'b0,
  parameter [0:0] IS_PWRDWN_INVERTED = 1'b0,
  parameter [0:0] IS_RST_INVERTED = 1'b0,
  parameter real REF_JITTER1 = 0.010,
  parameter STARTUP_WAIT = "FALSE"
)(
  output CLKFBOUT,
  output CLKFBOUTB,
  output CLKOUT0,
  output CLKOUT0B,
  output CLKOUT1,
  output CLKOUT1B,
  output CLKOUT2,
  output CLKOUT2B,
  output CLKOUT3,
  output CLKOUT3B,
  output CLKOUT4,
  output CLKOUT5,
  output CLKOUT6,
  output LOCKED,

  input CLKFBIN,
  input CLKIN1,
  input PWRDWN,
  input RST
);
  
// define constants
  localparam MODULE_NAME = "MMCME3_BASE";
  reg trig_attr = 1'b0;
  localparam [0:0] IS_CLKFBIN_INVERTED_REG = IS_CLKFBIN_INVERTED;
  localparam [0:0] IS_CLKIN1_INVERTED_REG = IS_CLKIN1_INVERTED;
  localparam [0:0] IS_PWRDWN_INVERTED_REG = IS_PWRDWN_INVERTED;
  localparam [0:0] IS_RST_INVERTED_REG = IS_RST_INVERTED;

  wire IS_CLKFBIN_INVERTED_BIN;
  wire IS_CLKIN1_INVERTED_BIN;
  wire IS_PWRDWN_INVERTED_BIN;
  wire IS_RST_INVERTED_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;


  wire CLKFBIN_in;
  wire CLKIN1_in;
  wire PWRDWN_in;
  wire RST_in;



`ifdef XIL_TIMING
  reg notifier;
`endif



  assign CLKFBIN_in = (CLKFBIN !== 1'bz) && (CLKFBIN ^ IS_CLKFBIN_INVERTED_BIN); // rv 0
  assign CLKIN1_in = (CLKIN1 !== 1'bz) && (CLKIN1 ^ IS_CLKIN1_INVERTED_BIN); // rv 0
  assign PWRDWN_in = (PWRDWN !== 1'bz) && (PWRDWN ^ IS_PWRDWN_INVERTED_BIN); // rv 0
  assign RST_in = (RST !== 1'bz) && (RST ^ IS_RST_INVERTED_BIN); // rv 0

  assign IS_CLKFBIN_INVERTED_BIN = IS_CLKFBIN_INVERTED_REG;

  assign IS_CLKIN1_INVERTED_BIN = IS_CLKIN1_INVERTED_REG;

  assign IS_PWRDWN_INVERTED_BIN = IS_PWRDWN_INVERTED_REG;

  assign IS_RST_INVERTED_BIN = IS_RST_INVERTED_REG;

  initial begin
  #1;
  trig_attr = ~trig_attr;
    if ($realtime == 0) begin
      $display ("Error: [Unisim %s-1] Simulator resolution is set to a value greater than 1 ps. ", MODULE_NAME);
     $display ("The simulator resolution must be set to 1ps or smaller. Instance %m");
      #100;
     $finish;
    end
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((IS_CLKFBIN_INVERTED_REG !== 1'b0) && (IS_CLKFBIN_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-142] IS_CLKFBIN_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLKFBIN_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLKIN1_INVERTED_REG !== 1'b0) && (IS_CLKIN1_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-143] IS_CLKIN1_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLKIN1_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_PWRDWN_INVERTED_REG !== 1'b0) && (IS_PWRDWN_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-148] IS_PWRDWN_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_PWRDWN_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_RST_INVERTED_REG !== 1'b0) && (IS_RST_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-149] IS_RST_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_RST_INVERTED_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;

  end

  wire OPEN_CDDCDONE;
  wire OPEN_DRDY;
  wire OPEN_PSDONE;
  wire OPEN_FBS;
  wire OPEN_INS;
  wire [15:0] OPEN_DO;

  MMCME3_ADV #(
       .BANDWIDTH(BANDWIDTH),
       .CLKOUT4_CASCADE(CLKOUT4_CASCADE),
       .STARTUP_WAIT(STARTUP_WAIT),
       .CLKOUT1_DIVIDE(CLKOUT1_DIVIDE),
       .CLKOUT2_DIVIDE(CLKOUT2_DIVIDE),
       .CLKOUT3_DIVIDE(CLKOUT3_DIVIDE),
       .CLKOUT4_DIVIDE(CLKOUT4_DIVIDE),
       .CLKOUT5_DIVIDE(CLKOUT5_DIVIDE),
       .CLKOUT6_DIVIDE(CLKOUT6_DIVIDE),
       .DIVCLK_DIVIDE(DIVCLK_DIVIDE),
       .CLKFBOUT_MULT_F(CLKFBOUT_MULT_F),
       .CLKFBOUT_PHASE(CLKFBOUT_PHASE),
       .CLKIN1_PERIOD(CLKIN1_PERIOD),
       .CLKIN2_PERIOD(10),
       .CLKOUT0_DIVIDE_F(CLKOUT0_DIVIDE_F),
       .CLKOUT0_DUTY_CYCLE(CLKOUT0_DUTY_CYCLE),
       .CLKOUT0_PHASE(CLKOUT0_PHASE),
       .CLKOUT1_DUTY_CYCLE(CLKOUT1_DUTY_CYCLE),
       .CLKOUT1_PHASE(CLKOUT1_PHASE),
       .CLKOUT2_DUTY_CYCLE(CLKOUT2_DUTY_CYCLE),
       .CLKOUT2_PHASE(CLKOUT2_PHASE),
       .CLKOUT3_DUTY_CYCLE(CLKOUT3_DUTY_CYCLE),
       .CLKOUT3_PHASE(CLKOUT3_PHASE),
       .CLKOUT4_DUTY_CYCLE(CLKOUT4_DUTY_CYCLE),
       .CLKOUT4_PHASE(CLKOUT4_PHASE),
       .CLKOUT5_DUTY_CYCLE(CLKOUT5_DUTY_CYCLE),
       .CLKOUT5_PHASE(CLKOUT5_PHASE),
       .CLKOUT6_DUTY_CYCLE(CLKOUT6_DUTY_CYCLE),
       .CLKOUT6_PHASE(CLKOUT6_PHASE),
       .REF_JITTER1(REF_JITTER1)
      )
      mmcm_adv_1 (
       .CDDCDONE (OPEN_CDDCDONE),
       .CDDCREQ (1'b0),
       .CLKFBIN (CLKFBIN_in),
       .CLKFBOUT (CLKFBOUT),
       .CLKFBOUTB (CLKFBOUTB),
       .CLKIN1 (CLKIN1_in),
       .CLKIN2 (1'b0),
       .CLKOUT0 (CLKOUT0),
       .CLKOUT0B (CLKOUT0B),
       .CLKOUT1 (CLKOUT1),
       .CLKOUT1B (CLKOUT1B),
       .CLKOUT2 (CLKOUT2),
       .CLKOUT2B (CLKOUT2B),
       .CLKOUT3 (CLKOUT3),
       .CLKOUT3B (CLKOUT3B),
       .CLKOUT4 (CLKOUT4),
       .CLKOUT5 (CLKOUT5),
       .CLKOUT6 (CLKOUT6),
       .DADDR (7'b0),
       .DCLK (1'b0),
       .DEN (1'b0),
       .DI (16'b0),
       .DO (OPEN_DO),
       .DRDY (OPEN_DRDY),
       .DWE (1'b0),
       .LOCKED (LOCKED),
       .CLKINSEL(1'b1),
       .CLKFBSTOPPED(OPEN_FBS),
       .CLKINSTOPPED(OPEN_INS),
       .PSDONE(OPEN_PSDONE),
       .PSCLK(1'b0),
       .PSEN(1'b0),
       .PSINCDEC(1'b0),
       .PWRDWN(PWRDWN_in),
       .RST (RST_in)
    );

  specify
    (CLKIN1 => CLKFBOUT) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKFBOUTB) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT0) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT0B) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT1) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT1B) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT2) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT2B) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT3) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT3B) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT4) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT5) = (0:0:0, 0:0:0);
    (CLKIN1 => CLKOUT6) = (0:0:0, 0:0:0);
    (negedge RST => (LOCKED +: 0)) = (0:0:0, 0:0:0);
    (posedge RST => (LOCKED +: 0)) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge CLKFBIN, 0:0:0, notifier);
    $period (negedge CLKFBOUT, 0:0:0, notifier);
    $period (negedge CLKFBOUTB, 0:0:0, notifier);
    $period (negedge CLKIN1, 0:0:0, notifier);
    $period (negedge CLKOUT0, 0:0:0, notifier);
    $period (negedge CLKOUT0B, 0:0:0, notifier);
    $period (negedge CLKOUT1, 0:0:0, notifier);
    $period (negedge CLKOUT1B, 0:0:0, notifier);
    $period (negedge CLKOUT2, 0:0:0, notifier);
    $period (negedge CLKOUT2B, 0:0:0, notifier);
    $period (negedge CLKOUT3, 0:0:0, notifier);
    $period (negedge CLKOUT3B, 0:0:0, notifier);
    $period (negedge CLKOUT4, 0:0:0, notifier);
    $period (negedge CLKOUT5, 0:0:0, notifier);
    $period (negedge CLKOUT6, 0:0:0, notifier);
    $period (posedge CLKFBIN, 0:0:0, notifier);
    $period (posedge CLKFBOUT, 0:0:0, notifier);
    $period (posedge CLKFBOUTB, 0:0:0, notifier);
    $period (posedge CLKIN1, 0:0:0, notifier);
    $period (posedge CLKOUT0, 0:0:0, notifier);
    $period (posedge CLKOUT0B, 0:0:0, notifier);
    $period (posedge CLKOUT1, 0:0:0, notifier);
    $period (posedge CLKOUT1B, 0:0:0, notifier);
    $period (posedge CLKOUT2, 0:0:0, notifier);
    $period (posedge CLKOUT2B, 0:0:0, notifier);
    $period (posedge CLKOUT3, 0:0:0, notifier);
    $period (posedge CLKOUT3B, 0:0:0, notifier);
    $period (posedge CLKOUT4, 0:0:0, notifier);
    $period (posedge CLKOUT5, 0:0:0, notifier);
    $period (posedge CLKOUT6, 0:0:0, notifier);
    $width (negedge CLKIN1, 0:0:0, 0, notifier);
    $width (negedge PWRDWN, 0:0:0, 0, notifier);
    $width (negedge RST, 0:0:0, 0, notifier);
    $width (posedge CLKIN1, 0:0:0, 0, notifier);
    $width (posedge PWRDWN, 0:0:0, 0, notifier);
    $width (posedge RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
