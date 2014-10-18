///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Advanced Phase-Locked Loop (PLL)
// /___/   /\      Filename    : PLLE3_BASE.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine
module PLLE3_BASE #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer CLKFBOUT_MULT = 5,
  parameter real CLKFBOUT_PHASE = 0.000,
  parameter real CLKIN_PERIOD = 0.000,
  parameter integer CLKOUT0_DIVIDE = 1,
  parameter real CLKOUT0_DUTY_CYCLE = 0.500,
  parameter real CLKOUT0_PHASE = 0.000,
  parameter integer CLKOUT1_DIVIDE = 1,
  parameter real CLKOUT1_DUTY_CYCLE = 0.500,
  parameter real CLKOUT1_PHASE = 0.000,
  parameter CLKOUTPHY_MODE = "VCO_2X",
  parameter integer DIVCLK_DIVIDE = 1,
  parameter [0:0] IS_CLKFBIN_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN_INVERTED = 1'b0,
  parameter [0:0] IS_PWRDWN_INVERTED = 1'b0,
  parameter [0:0] IS_RST_INVERTED = 1'b0,
  parameter real REF_JITTER = 0.010,
  parameter STARTUP_WAIT = "FALSE"
)(
  output CLKFBOUT,
  output CLKOUT0,
  output CLKOUT0B,
  output CLKOUT1,
  output CLKOUT1B,
  output CLKOUTPHY,
  output LOCKED,

  input CLKFBIN,
  input CLKIN,
  input CLKOUTPHYEN,
  input PWRDWN,
  input RST
);


// define constants
  localparam MODULE_NAME = "PLLE3_BASE";
`ifdef XIL_TIMING
  reg notifier;
`endif


  initial begin
    #1;
    if ($realtime == 0) begin
      $display ("Error: [Unisim %s-1] Simulator resolution is set to a value greater than 1 ps.", MODULE_NAME);
      $display ("The simulator resolution must be set to 1ps or smaller. Instance %m");
      $finish;
    end
  end


  wire OPEN_DRDY;
  wire OPEN_PSDONE;
  wire OPEN_FBS;
  wire OPEN_INS;
  wire [15:0] OPEN_DO;

  PLLE3_ADV #(
            .CLKFBOUT_MULT(CLKFBOUT_MULT),
            .CLKFBOUT_PHASE(CLKFBOUT_PHASE),
            .CLKIN_PERIOD(CLKIN_PERIOD),
            .CLKOUT0_DIVIDE(CLKOUT0_DIVIDE),
            .CLKOUT0_DUTY_CYCLE(CLKOUT0_DUTY_CYCLE),
            .CLKOUT0_PHASE(CLKOUT0_PHASE),
            .CLKOUT1_DIVIDE(CLKOUT1_DIVIDE),
            .CLKOUT1_DUTY_CYCLE(CLKOUT1_DUTY_CYCLE),
            .CLKOUT1_PHASE(CLKOUT1_PHASE),
            .CLKOUTPHY_MODE(CLKOUTPHY_MODE),
            .DIVCLK_DIVIDE(DIVCLK_DIVIDE),
            .IS_CLKFBIN_INVERTED(IS_CLKFBIN_INVERTED),
            .IS_CLKIN_INVERTED(IS_CLKIN_INVERTED),
            .IS_PWRDWN_INVERTED(IS_PWRDWN_INVERTED),
            .IS_RST_INVERTED(IS_RST_INVERTED),
            .REF_JITTER(REF_JITTER), 
            .STARTUP_WAIT(STARTUP_WAIT)
      )
      plle3_base_1 (
        .CLKFBIN (CLKFBIN),
        .CLKIN (CLKIN),
        .CLKFBOUT (CLKFBOUT),
        .CLKOUT0 (CLKOUT0),
        .CLKOUT0B (CLKOUT0B),
        .CLKOUT1 (CLKOUT1),
        .CLKOUT1B (CLKOUT1B),
        .CLKOUTPHY (CLKOUTPHY),
        .CLKOUTPHYEN (CLKOUTPHYEN),
        .DADDR (7'b0),
        .DCLK (1'b0),
        .DEN (1'b0),
        .DI (16'b0),
        .DO (OPEN_DO),
        .DRDY (OPEN_DRDY),
        .DWE (1'b0),
        .LOCKED (LOCKED),
        .PWRDWN(PWRDWN),
        .RST (RST)
    );

  specify
    (CLKIN => CLKFBOUT) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUT0) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUT0B) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUT1) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUT1B) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUTPHY) = (0:0:0, 0:0:0);
    (RST => LOCKED) = (0:0:0, 0:0:0);
    (negedge RST => (LOCKED +: 0)) = (0:0:0, 0:0:0);
    (posedge RST => (LOCKED +: 0)) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge CLKFBIN, 0:0:0, notifier);
    $period (negedge CLKFBOUT, 0:0:0, notifier);
    $period (negedge CLKIN, 0:0:0, notifier);
    $period (negedge CLKOUT0, 0:0:0, notifier);
    $period (negedge CLKOUT0B, 0:0:0, notifier);
    $period (negedge CLKOUT1, 0:0:0, notifier);
    $period (negedge CLKOUT1B, 0:0:0, notifier);
    $period (negedge CLKOUTPHY, 0:0:0, notifier);
    $period (posedge CLKFBIN, 0:0:0, notifier);
    $period (posedge CLKFBOUT, 0:0:0, notifier);
    $period (posedge CLKIN, 0:0:0, notifier);
    $period (posedge CLKOUT0, 0:0:0, notifier);
    $period (posedge CLKOUT0B, 0:0:0, notifier);
    $period (posedge CLKOUT1, 0:0:0, notifier);
    $period (posedge CLKOUT1B, 0:0:0, notifier);
    $period (posedge CLKOUTPHY, 0:0:0, notifier);
    $width (negedge CLKIN, 0:0:0, 0, notifier);
    $width (negedge PWRDWN, 0:0:0, 0, notifier);
    $width (negedge RST, 0:0:0, 0, notifier);
    $width (posedge CLKIN, 0:0:0, 0, notifier);
    $width (posedge PWRDWN, 0:0:0, 0, notifier);
    $width (posedge RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
