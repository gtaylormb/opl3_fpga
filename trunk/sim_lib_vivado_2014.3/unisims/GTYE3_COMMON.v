///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 2011 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \   \   \/      Version     : 2012.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        
// /___/   /\      Filename    : GTYE3_COMMON.v
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
module GTYE3_COMMON #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",  
  `endif
  parameter [15:0] A_SDM1DATA1_0 = 16'b0000000000000000,
  parameter [8:0] A_SDM1DATA1_1 = 9'b000000000,
  parameter [15:0] BIAS_CFG0 = 16'h0000,
  parameter [15:0] BIAS_CFG1 = 16'h0000,
  parameter [15:0] BIAS_CFG2 = 16'h0000,
  parameter [15:0] BIAS_CFG3 = 16'h0000,
  parameter [15:0] BIAS_CFG4 = 16'h0000,
  parameter [9:0] BIAS_CFG_RSVD = 10'b0000000000,
  parameter [15:0] COMMON_CFG0 = 16'h0000,
  parameter [15:0] COMMON_CFG1 = 16'h0000,
  parameter [15:0] POR_CFG = 16'h0004,
  parameter [15:0] PPF0_CFG = 16'h0FFF,
  parameter [15:0] PPF1_CFG = 16'h0FFF,
  parameter QPLL0CLKOUT_RATE = "FULL",
  parameter [15:0] QPLL0_CFG0 = 16'h301C,
  parameter [15:0] QPLL0_CFG1 = 16'h0000,
  parameter [15:0] QPLL0_CFG1_G3 = 16'h0020,
  parameter [15:0] QPLL0_CFG2 = 16'h0780,
  parameter [15:0] QPLL0_CFG2_G3 = 16'h0780,
  parameter [15:0] QPLL0_CFG3 = 16'h0120,
  parameter [15:0] QPLL0_CFG4 = 16'h0021,
  parameter [9:0] QPLL0_CP = 10'b0000011111,
  parameter [9:0] QPLL0_CP_G3 = 10'b0000011111,
  parameter integer QPLL0_FBDIV = 66,
  parameter integer QPLL0_FBDIV_G3 = 80,
  parameter [15:0] QPLL0_INIT_CFG0 = 16'h0000,
  parameter [7:0] QPLL0_INIT_CFG1 = 8'h00,
  parameter [15:0] QPLL0_LOCK_CFG = 16'h01E8,
  parameter [15:0] QPLL0_LOCK_CFG_G3 = 16'h21E8,
  parameter [9:0] QPLL0_LPF = 10'b1111111111,
  parameter [9:0] QPLL0_LPF_G3 = 10'b1111111111,
  parameter integer QPLL0_REFCLK_DIV = 2,
  parameter [15:0] QPLL0_SDM_CFG0 = 16'h0040,
  parameter [15:0] QPLL0_SDM_CFG1 = 16'h0000,
  parameter [15:0] QPLL0_SDM_CFG2 = 16'h0000,
  parameter QPLL1CLKOUT_RATE = "FULL",
  parameter [15:0] QPLL1_CFG0 = 16'h301C,
  parameter [15:0] QPLL1_CFG1 = 16'h0000,
  parameter [15:0] QPLL1_CFG1_G3 = 16'h0020,
  parameter [15:0] QPLL1_CFG2 = 16'h0780,
  parameter [15:0] QPLL1_CFG2_G3 = 16'h0780,
  parameter [15:0] QPLL1_CFG3 = 16'h0120,
  parameter [15:0] QPLL1_CFG4 = 16'h0021,
  parameter [9:0] QPLL1_CP = 10'b0000011111,
  parameter [9:0] QPLL1_CP_G3 = 10'b0000011111,
  parameter integer QPLL1_FBDIV = 66,
  parameter integer QPLL1_FBDIV_G3 = 80,
  parameter [15:0] QPLL1_INIT_CFG0 = 16'h0000,
  parameter [7:0] QPLL1_INIT_CFG1 = 8'h00,
  parameter [15:0] QPLL1_LOCK_CFG = 16'h01E8,
  parameter [15:0] QPLL1_LOCK_CFG_G3 = 16'h21E8,
  parameter [9:0] QPLL1_LPF = 10'b1111111111,
  parameter [9:0] QPLL1_LPF_G3 = 10'b1111111111,
  parameter integer QPLL1_REFCLK_DIV = 2,
  parameter [15:0] QPLL1_SDM_CFG0 = 16'h0040,
  parameter [15:0] QPLL1_SDM_CFG1 = 16'h0000,
  parameter [15:0] QPLL1_SDM_CFG2 = 16'h0000,
  parameter [15:0] RSVD_ATTR0 = 16'h0000,
  parameter [15:0] RSVD_ATTR1 = 16'h0000,
  parameter [15:0] RSVD_ATTR2 = 16'h0000,
  parameter [15:0] RSVD_ATTR3 = 16'h0000,
  parameter [1:0] RXRECCLKOUT0_SEL = 2'b00,
  parameter [1:0] RXRECCLKOUT1_SEL = 2'b00,
  parameter [0:0] SARC_EN = 1'b1,
  parameter [0:0] SARC_SEL = 1'b0,
  parameter [15:0] SDM0INITSEED0_0 = 16'b0000000000000000,
  parameter [8:0] SDM0INITSEED0_1 = 9'b000000000,
  parameter [15:0] SDM1INITSEED0_0 = 16'b0000000000000000,
  parameter [8:0] SDM1INITSEED0_1 = 9'b000000000,
  parameter SIM_RESET_SPEEDUP = "TRUE",
  parameter real SIM_VERSION = 1.0
)(
  output [15:0] DRPDO,
  output DRPRDY,
  output [7:0] PMARSVDOUT0,
  output [7:0] PMARSVDOUT1,
  output QPLL0FBCLKLOST,
  output QPLL0LOCK,
  output QPLL0OUTCLK,
  output QPLL0OUTREFCLK,
  output QPLL0REFCLKLOST,
  output QPLL1FBCLKLOST,
  output QPLL1LOCK,
  output QPLL1OUTCLK,
  output QPLL1OUTREFCLK,
  output QPLL1REFCLKLOST,
  output [7:0] QPLLDMONITOR0,
  output [7:0] QPLLDMONITOR1,
  output REFCLKOUTMONITOR0,
  output REFCLKOUTMONITOR1,
  output [1:0] RXRECCLK0_SEL,
  output [1:0] RXRECCLK1_SEL,
  output [3:0] SDM0FINALOUT,
  output [14:0] SDM0TESTDATA,
  output [3:0] SDM1FINALOUT,
  output [14:0] SDM1TESTDATA,

  input BGBYPASSB,
  input BGMONITORENB,
  input BGPDB,
  input [4:0] BGRCALOVRD,
  input BGRCALOVRDENB,
  input [9:0] DRPADDR,
  input DRPCLK,
  input [15:0] DRPDI,
  input DRPEN,
  input DRPWE,
  input GTGREFCLK0,
  input GTGREFCLK1,
  input GTNORTHREFCLK00,
  input GTNORTHREFCLK01,
  input GTNORTHREFCLK10,
  input GTNORTHREFCLK11,
  input GTREFCLK00,
  input GTREFCLK01,
  input GTREFCLK10,
  input GTREFCLK11,
  input GTSOUTHREFCLK00,
  input GTSOUTHREFCLK01,
  input GTSOUTHREFCLK10,
  input GTSOUTHREFCLK11,
  input [7:0] PMARSVD0,
  input [7:0] PMARSVD1,
  input QPLL0CLKRSVD0,
  input QPLL0LOCKDETCLK,
  input QPLL0LOCKEN,
  input QPLL0PD,
  input [2:0] QPLL0REFCLKSEL,
  input QPLL0RESET,
  input QPLL1CLKRSVD0,
  input QPLL1LOCKDETCLK,
  input QPLL1LOCKEN,
  input QPLL1PD,
  input [2:0] QPLL1REFCLKSEL,
  input QPLL1RESET,
  input [7:0] QPLLRSVD1,
  input [4:0] QPLLRSVD2,
  input [4:0] QPLLRSVD3,
  input [7:0] QPLLRSVD4,
  input RCALENB,
  input [24:0] SDM0DATA,
  input SDM0RESET,
  input [1:0] SDM0WIDTH,
  input [24:0] SDM1DATA,
  input SDM1RESET,
  input [1:0] SDM1WIDTH
);
  
// define constants
  localparam MODULE_NAME = "GTYE3_COMMON";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers

  `ifndef XIL_DR
  localparam [15:0] A_SDM1DATA1_0_REG = A_SDM1DATA1_0;
  localparam [8:0] A_SDM1DATA1_1_REG = A_SDM1DATA1_1;
  localparam [15:0] BIAS_CFG0_REG = BIAS_CFG0;
  localparam [15:0] BIAS_CFG1_REG = BIAS_CFG1;
  localparam [15:0] BIAS_CFG2_REG = BIAS_CFG2;
  localparam [15:0] BIAS_CFG3_REG = BIAS_CFG3;
  localparam [15:0] BIAS_CFG4_REG = BIAS_CFG4;
  localparam [9:0] BIAS_CFG_RSVD_REG = BIAS_CFG_RSVD;
  localparam [15:0] COMMON_CFG0_REG = COMMON_CFG0;
  localparam [15:0] COMMON_CFG1_REG = COMMON_CFG1;
  localparam [15:0] POR_CFG_REG = POR_CFG;
  localparam [15:0] PPF0_CFG_REG = PPF0_CFG;
  localparam [15:0] PPF1_CFG_REG = PPF1_CFG;
  localparam [32:1] QPLL0CLKOUT_RATE_REG = QPLL0CLKOUT_RATE;
  localparam [15:0] QPLL0_CFG0_REG = QPLL0_CFG0;
  localparam [15:0] QPLL0_CFG1_REG = QPLL0_CFG1;
  localparam [15:0] QPLL0_CFG1_G3_REG = QPLL0_CFG1_G3;
  localparam [15:0] QPLL0_CFG2_REG = QPLL0_CFG2;
  localparam [15:0] QPLL0_CFG2_G3_REG = QPLL0_CFG2_G3;
  localparam [15:0] QPLL0_CFG3_REG = QPLL0_CFG3;
  localparam [15:0] QPLL0_CFG4_REG = QPLL0_CFG4;
  localparam [9:0] QPLL0_CP_REG = QPLL0_CP;
  localparam [9:0] QPLL0_CP_G3_REG = QPLL0_CP_G3;
  localparam [7:0] QPLL0_FBDIV_REG = QPLL0_FBDIV;
  localparam [7:0] QPLL0_FBDIV_G3_REG = QPLL0_FBDIV_G3;
  localparam [15:0] QPLL0_INIT_CFG0_REG = QPLL0_INIT_CFG0;
  localparam [7:0] QPLL0_INIT_CFG1_REG = QPLL0_INIT_CFG1;
  localparam [15:0] QPLL0_LOCK_CFG_REG = QPLL0_LOCK_CFG;
  localparam [15:0] QPLL0_LOCK_CFG_G3_REG = QPLL0_LOCK_CFG_G3;
  localparam [9:0] QPLL0_LPF_REG = QPLL0_LPF;
  localparam [9:0] QPLL0_LPF_G3_REG = QPLL0_LPF_G3;
  localparam [4:0] QPLL0_REFCLK_DIV_REG = QPLL0_REFCLK_DIV;
  localparam [15:0] QPLL0_SDM_CFG0_REG = QPLL0_SDM_CFG0;
  localparam [15:0] QPLL0_SDM_CFG1_REG = QPLL0_SDM_CFG1;
  localparam [15:0] QPLL0_SDM_CFG2_REG = QPLL0_SDM_CFG2;
  localparam [32:1] QPLL1CLKOUT_RATE_REG = QPLL1CLKOUT_RATE;
  localparam [15:0] QPLL1_CFG0_REG = QPLL1_CFG0;
  localparam [15:0] QPLL1_CFG1_REG = QPLL1_CFG1;
  localparam [15:0] QPLL1_CFG1_G3_REG = QPLL1_CFG1_G3;
  localparam [15:0] QPLL1_CFG2_REG = QPLL1_CFG2;
  localparam [15:0] QPLL1_CFG2_G3_REG = QPLL1_CFG2_G3;
  localparam [15:0] QPLL1_CFG3_REG = QPLL1_CFG3;
  localparam [15:0] QPLL1_CFG4_REG = QPLL1_CFG4;
  localparam [9:0] QPLL1_CP_REG = QPLL1_CP;
  localparam [9:0] QPLL1_CP_G3_REG = QPLL1_CP_G3;
  localparam [7:0] QPLL1_FBDIV_REG = QPLL1_FBDIV;
  localparam [7:0] QPLL1_FBDIV_G3_REG = QPLL1_FBDIV_G3;
  localparam [15:0] QPLL1_INIT_CFG0_REG = QPLL1_INIT_CFG0;
  localparam [7:0] QPLL1_INIT_CFG1_REG = QPLL1_INIT_CFG1;
  localparam [15:0] QPLL1_LOCK_CFG_REG = QPLL1_LOCK_CFG;
  localparam [15:0] QPLL1_LOCK_CFG_G3_REG = QPLL1_LOCK_CFG_G3;
  localparam [9:0] QPLL1_LPF_REG = QPLL1_LPF;
  localparam [9:0] QPLL1_LPF_G3_REG = QPLL1_LPF_G3;
  localparam [4:0] QPLL1_REFCLK_DIV_REG = QPLL1_REFCLK_DIV;
  localparam [15:0] QPLL1_SDM_CFG0_REG = QPLL1_SDM_CFG0;
  localparam [15:0] QPLL1_SDM_CFG1_REG = QPLL1_SDM_CFG1;
  localparam [15:0] QPLL1_SDM_CFG2_REG = QPLL1_SDM_CFG2;
  localparam [15:0] RSVD_ATTR0_REG = RSVD_ATTR0;
  localparam [15:0] RSVD_ATTR1_REG = RSVD_ATTR1;
  localparam [15:0] RSVD_ATTR2_REG = RSVD_ATTR2;
  localparam [15:0] RSVD_ATTR3_REG = RSVD_ATTR3;
  localparam [1:0] RXRECCLKOUT0_SEL_REG = RXRECCLKOUT0_SEL;
  localparam [1:0] RXRECCLKOUT1_SEL_REG = RXRECCLKOUT1_SEL;
  localparam [0:0] SARC_EN_REG = SARC_EN;
  localparam [0:0] SARC_SEL_REG = SARC_SEL;
  localparam [15:0] SDM0INITSEED0_0_REG = SDM0INITSEED0_0;
  localparam [8:0] SDM0INITSEED0_1_REG = SDM0INITSEED0_1;
  localparam [15:0] SDM1INITSEED0_0_REG = SDM1INITSEED0_0;
  localparam [8:0] SDM1INITSEED0_1_REG = SDM1INITSEED0_1;
  localparam [40:1] SIM_RESET_SPEEDUP_REG = SIM_RESET_SPEEDUP;
  localparam real SIM_VERSION_REG = SIM_VERSION;
  `endif

  localparam [0:0] AEN_BGBS0_REG = 1'b0;
  localparam [0:0] AEN_BGBS1_REG = 1'b0;
  localparam [0:0] AEN_MASTER0_REG = 1'b0;
  localparam [0:0] AEN_MASTER1_REG = 1'b0;
  localparam [0:0] AEN_PD0_REG = 1'b0;
  localparam [0:0] AEN_PD1_REG = 1'b0;
  localparam [0:0] AEN_QPLL0_REG = 1'b0;
  localparam [0:0] AEN_QPLL1_REG = 1'b0;
  localparam [0:0] AEN_REFCLK0_REG = 1'b0;
  localparam [0:0] AEN_REFCLK1_REG = 1'b0;
  localparam [0:0] AEN_RESET0_REG = 1'b0;
  localparam [0:0] AEN_RESET1_REG = 1'b0;
  localparam [0:0] AEN_SDMDATA0_REG = 1'b0;
  localparam [0:0] AEN_SDMDATA1_REG = 1'b0;
  localparam [0:0] AEN_SDMRESET0_REG = 1'b0;
  localparam [0:0] AEN_SDMRESET1_REG = 1'b0;
  localparam [0:0] AEN_SDMWIDTH0_REG = 1'b0;
  localparam [0:0] AEN_SDMWIDTH1_REG = 1'b0;
  localparam [3:0] AQDMUXSEL1_REG = 4'b0000;
  localparam [3:0] AVCC_SENSE_SEL_REG = 4'b0000;
  localparam [3:0] AVTT_SENSE_SEL_REG = 4'b0000;
  localparam [0:0] A_BGMONITOREN_REG = 1'b0;
  localparam [0:0] A_BGPD_REG = 1'b0;
  localparam [0:0] A_GTREFCLKPD0_REG = 1'b0;
  localparam [0:0] A_GTREFCLKPD1_REG = 1'b0;
  localparam [0:0] A_QPLL0LOCKEN_REG = 1'b0;
  localparam [0:0] A_QPLL0PD_REG = 1'b0;
  localparam [0:0] A_QPLL0RESET_REG = 1'b0;
  localparam [0:0] A_QPLL1LOCKEN_REG = 1'b0;
  localparam [0:0] A_QPLL1PD_REG = 1'b0;
  localparam [0:0] A_QPLL1RESET_REG = 1'b0;
  localparam [15:0] A_SDM0DATA1_0_REG = 16'b0000000000000000;
  localparam [8:0] A_SDM0DATA1_1_REG = 9'b000000000;
  localparam [0:0] A_SDMRESET0_REG = 1'b0;
  localparam [0:0] A_SDMRESET1_REG = 1'b0;
  localparam [1:0] COMMON_AMUX_SEL0_REG = 2'b00;
  localparam [1:0] COMMON_AMUX_SEL1_REG = 2'b00;
  localparam [0:0] COMMON_INSTANTIATED_REG = 1'b1;
  localparam [2:0] QPLL0_AMONITOR_SEL_REG = 3'b000;
  localparam [2:0] QPLL1_AMONITOR_SEL_REG = 3'b000;
  localparam [0:0] RCALSAP_TESTEN_REG = 1'b0;
  localparam [0:0] RCAL_APROBE_REG = 1'b0;
  localparam [0:0] REFCLK0_EN_DC_COUP_REG = 1'b0;
  localparam [0:0] REFCLK0_VCM_HIGH_REG = 1'b0;
  localparam [0:0] REFCLK0_VCM_LOW_REG = 1'b0;
  localparam [0:0] REFCLK1_EN_DC_COUP_REG = 1'b0;
  localparam [0:0] REFCLK1_VCM_HIGH_REG = 1'b0;
  localparam [0:0] REFCLK1_VCM_LOW_REG = 1'b0;
  localparam [1:0] VCCAUX_SENSE_SEL_REG = 2'b00;

  wire [63:0] SIM_VERSION_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  tri0 glblGSR = glbl.GSR;

  `ifdef XIL_TIMING //Simprim 
  reg notifier;
  `endif
  reg trig_attr = 1'b0;
  reg attr_err = 1'b0;
  
// include dynamic registers - XILINX test only
  `ifdef XIL_DR
  `include "GTYE3_COMMON_dr.v"
  `endif

  wire DRPRDY_out;
  wire QPLL0FBCLKLOST_out;
  wire QPLL0LOCK_out;
  wire QPLL0OUTCLK_out;
  wire QPLL0OUTREFCLK_out;
  wire QPLL0REFCLKLOST_out;
  wire QPLL1FBCLKLOST_out;
  wire QPLL1LOCK_out;
  wire QPLL1OUTCLK_out;
  wire QPLL1OUTREFCLK_out;
  wire QPLL1REFCLKLOST_out;
  wire REFCLKOUTMONITOR0_out;
  wire REFCLKOUTMONITOR1_out;
  wire [14:0] SDM0TESTDATA_out;
  wire [14:0] SDM1TESTDATA_out;
  wire [15:0] DRPDO_out;
  wire [1:0] RXRECCLK0_SEL_out;
  wire [1:0] RXRECCLK1_SEL_out;
  wire [3:0] SARCCLK_out;
  wire [3:0] SDM0FINALOUT_out;
  wire [3:0] SDM1FINALOUT_out;
  wire [7:0] PMARSVDOUT0_out;
  wire [7:0] PMARSVDOUT1_out;
  wire [7:0] PMASCANOUT_out;
  wire [7:0] QPLLDMONITOR0_out;
  wire [7:0] QPLLDMONITOR1_out;

  wire DRPRDY_delay;
  wire QPLL0FBCLKLOST_delay;
  wire QPLL0LOCK_delay;
  wire QPLL0OUTCLK_delay;
  wire QPLL0OUTREFCLK_delay;
  wire QPLL0REFCLKLOST_delay;
  wire QPLL1FBCLKLOST_delay;
  wire QPLL1LOCK_delay;
  wire QPLL1OUTCLK_delay;
  wire QPLL1OUTREFCLK_delay;
  wire QPLL1REFCLKLOST_delay;
  wire REFCLKOUTMONITOR0_delay;
  wire REFCLKOUTMONITOR1_delay;
  wire [14:0] SDM0TESTDATA_delay;
  wire [14:0] SDM1TESTDATA_delay;
  wire [15:0] DRPDO_delay;
  wire [1:0] RXRECCLK0_SEL_delay;
  wire [1:0] RXRECCLK1_SEL_delay;
  wire [3:0] SDM0FINALOUT_delay;
  wire [3:0] SDM1FINALOUT_delay;
  wire [7:0] PMARSVDOUT0_delay;
  wire [7:0] PMARSVDOUT1_delay;
  wire [7:0] QPLLDMONITOR0_delay;
  wire [7:0] QPLLDMONITOR1_delay;

  wire BGBYPASSB_in;
  wire BGMONITORENB_in;
  wire BGPDB_in;
  wire BGRCALOVRDENB_in;
  wire DRPCLK_in;
  wire DRPEN_in;
  wire DRPWE_in;
  wire GTGREFCLK0_in;
  wire GTGREFCLK1_in;
  wire GTNORTHREFCLK00_in;
  wire GTNORTHREFCLK01_in;
  wire GTNORTHREFCLK10_in;
  wire GTNORTHREFCLK11_in;
  wire GTREFCLK00_in;
  wire GTREFCLK01_in;
  wire GTREFCLK10_in;
  wire GTREFCLK11_in;
  wire GTSOUTHREFCLK00_in;
  wire GTSOUTHREFCLK01_in;
  wire GTSOUTHREFCLK10_in;
  wire GTSOUTHREFCLK11_in;
  wire PMASCANENB_in;
  wire QDPMASCANMODEB_in;
  wire QDPMASCANRSTEN_in;
  wire QPLL0CLKRSVD0_in;
  wire QPLL0LOCKDETCLK_in;
  wire QPLL0LOCKEN_in;
  wire QPLL0PD_in;
  wire QPLL0RESET_in;
  wire QPLL1CLKRSVD0_in;
  wire QPLL1LOCKDETCLK_in;
  wire QPLL1LOCKEN_in;
  wire QPLL1PD_in;
  wire QPLL1RESET_in;
  wire RCALENB_in;
  wire SDM0RESET_in;
  wire SDM1RESET_in;
  wire [15:0] DRPDI_in;
  wire [1:0] SDM0WIDTH_in;
  wire [1:0] SDM1WIDTH_in;
  wire [24:0] SDM0DATA_in;
  wire [24:0] SDM1DATA_in;
  wire [2:0] QPLL0REFCLKSEL_in;
  wire [2:0] QPLL1REFCLKSEL_in;
  wire [3:0] RXRECCLK_in;
  wire [4:0] BGRCALOVRD_in;
  wire [4:0] QPLLRSVD2_in;
  wire [4:0] QPLLRSVD3_in;
  wire [7:0] PMARSVD0_in;
  wire [7:0] PMARSVD1_in;
  wire [7:0] PMASCANCLK_in;
  wire [7:0] PMASCANIN_in;
  wire [7:0] QPLLRSVD1_in;
  wire [7:0] QPLLRSVD4_in;
  wire [9:0] DRPADDR_in;

  wire BGBYPASSB_delay;
  wire BGMONITORENB_delay;
  wire BGPDB_delay;
  wire BGRCALOVRDENB_delay;
  wire DRPCLK_delay;
  wire DRPEN_delay;
  wire DRPWE_delay;
  wire GTGREFCLK0_delay;
  wire GTGREFCLK1_delay;
  wire GTNORTHREFCLK00_delay;
  wire GTNORTHREFCLK01_delay;
  wire GTNORTHREFCLK10_delay;
  wire GTNORTHREFCLK11_delay;
  wire GTREFCLK00_delay;
  wire GTREFCLK01_delay;
  wire GTREFCLK10_delay;
  wire GTREFCLK11_delay;
  wire GTSOUTHREFCLK00_delay;
  wire GTSOUTHREFCLK01_delay;
  wire GTSOUTHREFCLK10_delay;
  wire GTSOUTHREFCLK11_delay;
  wire QPLL0CLKRSVD0_delay;
  wire QPLL0LOCKDETCLK_delay;
  wire QPLL0LOCKEN_delay;
  wire QPLL0PD_delay;
  wire QPLL0RESET_delay;
  wire QPLL1CLKRSVD0_delay;
  wire QPLL1LOCKDETCLK_delay;
  wire QPLL1LOCKEN_delay;
  wire QPLL1PD_delay;
  wire QPLL1RESET_delay;
  wire RCALENB_delay;
  wire SDM0RESET_delay;
  wire SDM1RESET_delay;
  wire [15:0] DRPDI_delay;
  wire [1:0] SDM0WIDTH_delay;
  wire [1:0] SDM1WIDTH_delay;
  wire [24:0] SDM0DATA_delay;
  wire [24:0] SDM1DATA_delay;
  wire [2:0] QPLL0REFCLKSEL_delay;
  wire [2:0] QPLL1REFCLKSEL_delay;
  wire [4:0] BGRCALOVRD_delay;
  wire [4:0] QPLLRSVD2_delay;
  wire [4:0] QPLLRSVD3_delay;
  wire [7:0] PMARSVD0_delay;
  wire [7:0] PMARSVD1_delay;
  wire [7:0] QPLLRSVD1_delay;
  wire [7:0] QPLLRSVD4_delay;
  wire [9:0] DRPADDR_delay;

  
  assign #(out_delay) DRPDO = DRPDO_delay;
  assign #(out_delay) DRPRDY = DRPRDY_delay;
  assign #(out_delay) PMARSVDOUT0 = PMARSVDOUT0_delay;
  assign #(out_delay) PMARSVDOUT1 = PMARSVDOUT1_delay;
  assign #(out_delay) QPLL0FBCLKLOST = QPLL0FBCLKLOST_delay;
  assign #(out_delay) QPLL0LOCK = QPLL0LOCK_delay;
  assign #(out_delay) QPLL0OUTCLK = QPLL0OUTCLK_delay;
  assign #(out_delay) QPLL0OUTREFCLK = QPLL0OUTREFCLK_delay;
  assign #(out_delay) QPLL0REFCLKLOST = QPLL0REFCLKLOST_delay;
  assign #(out_delay) QPLL1FBCLKLOST = QPLL1FBCLKLOST_delay;
  assign #(out_delay) QPLL1LOCK = QPLL1LOCK_delay;
  assign #(out_delay) QPLL1OUTCLK = QPLL1OUTCLK_delay;
  assign #(out_delay) QPLL1OUTREFCLK = QPLL1OUTREFCLK_delay;
  assign #(out_delay) QPLL1REFCLKLOST = QPLL1REFCLKLOST_delay;
  assign #(out_delay) QPLLDMONITOR0 = QPLLDMONITOR0_delay;
  assign #(out_delay) QPLLDMONITOR1 = QPLLDMONITOR1_delay;
  assign #(out_delay) REFCLKOUTMONITOR0 = REFCLKOUTMONITOR0_delay;
  assign #(out_delay) REFCLKOUTMONITOR1 = REFCLKOUTMONITOR1_delay;
  assign #(out_delay) RXRECCLK0_SEL = RXRECCLK0_SEL_delay;
  assign #(out_delay) RXRECCLK1_SEL = RXRECCLK1_SEL_delay;
  assign #(out_delay) SDM0FINALOUT = SDM0FINALOUT_delay;
  assign #(out_delay) SDM0TESTDATA = SDM0TESTDATA_delay;
  assign #(out_delay) SDM1FINALOUT = SDM1FINALOUT_delay;
  assign #(out_delay) SDM1TESTDATA = SDM1TESTDATA_delay;
  

// inputs with no timing checks
  assign #(inclk_delay) DRPCLK_delay = DRPCLK;
  assign #(inclk_delay) GTGREFCLK0_delay = GTGREFCLK0;
  assign #(inclk_delay) GTGREFCLK1_delay = GTGREFCLK1;
  assign #(inclk_delay) GTNORTHREFCLK00_delay = GTNORTHREFCLK00;
  assign #(inclk_delay) GTNORTHREFCLK01_delay = GTNORTHREFCLK01;
  assign #(inclk_delay) GTNORTHREFCLK10_delay = GTNORTHREFCLK10;
  assign #(inclk_delay) GTNORTHREFCLK11_delay = GTNORTHREFCLK11;
  assign #(inclk_delay) GTREFCLK00_delay = GTREFCLK00;
  assign #(inclk_delay) GTREFCLK01_delay = GTREFCLK01;
  assign #(inclk_delay) GTREFCLK10_delay = GTREFCLK10;
  assign #(inclk_delay) GTREFCLK11_delay = GTREFCLK11;
  assign #(inclk_delay) GTSOUTHREFCLK00_delay = GTSOUTHREFCLK00;
  assign #(inclk_delay) GTSOUTHREFCLK01_delay = GTSOUTHREFCLK01;
  assign #(inclk_delay) GTSOUTHREFCLK10_delay = GTSOUTHREFCLK10;
  assign #(inclk_delay) GTSOUTHREFCLK11_delay = GTSOUTHREFCLK11;
  assign #(inclk_delay) QPLL0CLKRSVD0_delay = QPLL0CLKRSVD0;
  assign #(inclk_delay) QPLL0LOCKDETCLK_delay = QPLL0LOCKDETCLK;
  assign #(inclk_delay) QPLL1CLKRSVD0_delay = QPLL1CLKRSVD0;
  assign #(inclk_delay) QPLL1LOCKDETCLK_delay = QPLL1LOCKDETCLK;

  assign #(in_delay) BGBYPASSB_delay = BGBYPASSB;
  assign #(in_delay) BGMONITORENB_delay = BGMONITORENB;
  assign #(in_delay) BGPDB_delay = BGPDB;
  assign #(in_delay) BGRCALOVRDENB_delay = BGRCALOVRDENB;
  assign #(in_delay) BGRCALOVRD_delay = BGRCALOVRD;
  assign #(in_delay) DRPADDR_delay = DRPADDR;
  assign #(in_delay) DRPDI_delay = DRPDI;
  assign #(in_delay) DRPEN_delay = DRPEN;
  assign #(in_delay) DRPWE_delay = DRPWE;
  assign #(in_delay) PMARSVD0_delay = PMARSVD0;
  assign #(in_delay) PMARSVD1_delay = PMARSVD1;
  assign #(in_delay) QPLL0LOCKEN_delay = QPLL0LOCKEN;
  assign #(in_delay) QPLL0PD_delay = QPLL0PD;
  assign #(in_delay) QPLL0REFCLKSEL_delay = QPLL0REFCLKSEL;
  assign #(in_delay) QPLL0RESET_delay = QPLL0RESET;
  assign #(in_delay) QPLL1LOCKEN_delay = QPLL1LOCKEN;
  assign #(in_delay) QPLL1PD_delay = QPLL1PD;
  assign #(in_delay) QPLL1REFCLKSEL_delay = QPLL1REFCLKSEL;
  assign #(in_delay) QPLL1RESET_delay = QPLL1RESET;
  assign #(in_delay) QPLLRSVD1_delay = QPLLRSVD1;
  assign #(in_delay) QPLLRSVD2_delay = QPLLRSVD2;
  assign #(in_delay) QPLLRSVD3_delay = QPLLRSVD3;
  assign #(in_delay) QPLLRSVD4_delay = QPLLRSVD4;
  assign #(in_delay) RCALENB_delay = RCALENB;
  assign #(in_delay) SDM0DATA_delay = SDM0DATA;
  assign #(in_delay) SDM0RESET_delay = SDM0RESET;
  assign #(in_delay) SDM0WIDTH_delay = SDM0WIDTH;
  assign #(in_delay) SDM1DATA_delay = SDM1DATA;
  assign #(in_delay) SDM1RESET_delay = SDM1RESET;
  assign #(in_delay) SDM1WIDTH_delay = SDM1WIDTH;

  assign DRPDO_delay = DRPDO_out;
  assign DRPRDY_delay = DRPRDY_out;
  assign PMARSVDOUT0_delay = PMARSVDOUT0_out;
  assign PMARSVDOUT1_delay = PMARSVDOUT1_out;
  assign QPLL0FBCLKLOST_delay = QPLL0FBCLKLOST_out;
  assign QPLL0LOCK_delay = QPLL0LOCK_out;
  assign QPLL0OUTCLK_delay = QPLL0OUTCLK_out;
  assign QPLL0OUTREFCLK_delay = QPLL0OUTREFCLK_out;
  assign QPLL0REFCLKLOST_delay = QPLL0REFCLKLOST_out;
  assign QPLL1FBCLKLOST_delay = QPLL1FBCLKLOST_out;
  assign QPLL1LOCK_delay = QPLL1LOCK_out;
  assign QPLL1OUTCLK_delay = QPLL1OUTCLK_out;
  assign QPLL1OUTREFCLK_delay = QPLL1OUTREFCLK_out;
  assign QPLL1REFCLKLOST_delay = QPLL1REFCLKLOST_out;
  assign QPLLDMONITOR0_delay = QPLLDMONITOR0_out;
  assign QPLLDMONITOR1_delay = QPLLDMONITOR1_out;
  assign REFCLKOUTMONITOR0_delay = REFCLKOUTMONITOR0_out;
  assign REFCLKOUTMONITOR1_delay = REFCLKOUTMONITOR1_out;
  assign RXRECCLK0_SEL_delay = RXRECCLK0_SEL_out;
  assign RXRECCLK1_SEL_delay = RXRECCLK1_SEL_out;
  assign SDM0FINALOUT_delay = SDM0FINALOUT_out;
  assign SDM0TESTDATA_delay = SDM0TESTDATA_out;
  assign SDM1FINALOUT_delay = SDM1FINALOUT_out;
  assign SDM1TESTDATA_delay = SDM1TESTDATA_out;

  assign BGBYPASSB_in = BGBYPASSB_delay;
  assign BGMONITORENB_in = BGMONITORENB_delay;
  assign BGPDB_in = BGPDB_delay;
  assign BGRCALOVRDENB_in = (BGRCALOVRDENB === 1'bz) || BGRCALOVRDENB_delay; // rv 1
  assign BGRCALOVRD_in = BGRCALOVRD_delay;
  assign DRPADDR_in[0] = (DRPADDR[0] !== 1'bz) && DRPADDR_delay[0]; // rv 0
  assign DRPADDR_in[1] = (DRPADDR[1] !== 1'bz) && DRPADDR_delay[1]; // rv 0
  assign DRPADDR_in[2] = (DRPADDR[2] !== 1'bz) && DRPADDR_delay[2]; // rv 0
  assign DRPADDR_in[3] = (DRPADDR[3] !== 1'bz) && DRPADDR_delay[3]; // rv 0
  assign DRPADDR_in[4] = (DRPADDR[4] !== 1'bz) && DRPADDR_delay[4]; // rv 0
  assign DRPADDR_in[5] = (DRPADDR[5] !== 1'bz) && DRPADDR_delay[5]; // rv 0
  assign DRPADDR_in[6] = (DRPADDR[6] !== 1'bz) && DRPADDR_delay[6]; // rv 0
  assign DRPADDR_in[7] = (DRPADDR[7] !== 1'bz) && DRPADDR_delay[7]; // rv 0
  assign DRPADDR_in[8] = (DRPADDR[8] !== 1'bz) && DRPADDR_delay[8]; // rv 0
  assign DRPADDR_in[9] = (DRPADDR[9] !== 1'bz) && DRPADDR_delay[9]; // rv 0
  assign DRPCLK_in = (DRPCLK !== 1'bz) && DRPCLK_delay; // rv 0
  assign DRPDI_in[0] = (DRPDI[0] !== 1'bz) && DRPDI_delay[0]; // rv 0
  assign DRPDI_in[10] = (DRPDI[10] !== 1'bz) && DRPDI_delay[10]; // rv 0
  assign DRPDI_in[11] = (DRPDI[11] !== 1'bz) && DRPDI_delay[11]; // rv 0
  assign DRPDI_in[12] = (DRPDI[12] !== 1'bz) && DRPDI_delay[12]; // rv 0
  assign DRPDI_in[13] = (DRPDI[13] !== 1'bz) && DRPDI_delay[13]; // rv 0
  assign DRPDI_in[14] = (DRPDI[14] !== 1'bz) && DRPDI_delay[14]; // rv 0
  assign DRPDI_in[15] = (DRPDI[15] !== 1'bz) && DRPDI_delay[15]; // rv 0
  assign DRPDI_in[1] = (DRPDI[1] !== 1'bz) && DRPDI_delay[1]; // rv 0
  assign DRPDI_in[2] = (DRPDI[2] !== 1'bz) && DRPDI_delay[2]; // rv 0
  assign DRPDI_in[3] = (DRPDI[3] !== 1'bz) && DRPDI_delay[3]; // rv 0
  assign DRPDI_in[4] = (DRPDI[4] !== 1'bz) && DRPDI_delay[4]; // rv 0
  assign DRPDI_in[5] = (DRPDI[5] !== 1'bz) && DRPDI_delay[5]; // rv 0
  assign DRPDI_in[6] = (DRPDI[6] !== 1'bz) && DRPDI_delay[6]; // rv 0
  assign DRPDI_in[7] = (DRPDI[7] !== 1'bz) && DRPDI_delay[7]; // rv 0
  assign DRPDI_in[8] = (DRPDI[8] !== 1'bz) && DRPDI_delay[8]; // rv 0
  assign DRPDI_in[9] = (DRPDI[9] !== 1'bz) && DRPDI_delay[9]; // rv 0
  assign DRPEN_in = (DRPEN !== 1'bz) && DRPEN_delay; // rv 0
  assign DRPWE_in = (DRPWE !== 1'bz) && DRPWE_delay; // rv 0
  assign GTGREFCLK0_in = GTGREFCLK0_delay;
  assign GTGREFCLK1_in = GTGREFCLK1_delay;
  assign GTNORTHREFCLK00_in = GTNORTHREFCLK00_delay;
  assign GTNORTHREFCLK01_in = GTNORTHREFCLK01_delay;
  assign GTNORTHREFCLK10_in = GTNORTHREFCLK10_delay;
  assign GTNORTHREFCLK11_in = GTNORTHREFCLK11_delay;
  assign GTREFCLK00_in = GTREFCLK00_delay;
  assign GTREFCLK01_in = GTREFCLK01_delay;
  assign GTREFCLK10_in = GTREFCLK10_delay;
  assign GTREFCLK11_in = GTREFCLK11_delay;
  assign GTSOUTHREFCLK00_in = GTSOUTHREFCLK00_delay;
  assign GTSOUTHREFCLK01_in = GTSOUTHREFCLK01_delay;
  assign GTSOUTHREFCLK10_in = GTSOUTHREFCLK10_delay;
  assign GTSOUTHREFCLK11_in = GTSOUTHREFCLK11_delay;
  assign PMARSVD0_in[0] = (PMARSVD0[0] !== 1'bz) && PMARSVD0_delay[0]; // rv 0
  assign PMARSVD0_in[1] = (PMARSVD0[1] !== 1'bz) && PMARSVD0_delay[1]; // rv 0
  assign PMARSVD0_in[2] = (PMARSVD0[2] !== 1'bz) && PMARSVD0_delay[2]; // rv 0
  assign PMARSVD0_in[3] = (PMARSVD0[3] !== 1'bz) && PMARSVD0_delay[3]; // rv 0
  assign PMARSVD0_in[4] = (PMARSVD0[4] !== 1'bz) && PMARSVD0_delay[4]; // rv 0
  assign PMARSVD0_in[5] = (PMARSVD0[5] !== 1'bz) && PMARSVD0_delay[5]; // rv 0
  assign PMARSVD0_in[6] = (PMARSVD0[6] !== 1'bz) && PMARSVD0_delay[6]; // rv 0
  assign PMARSVD0_in[7] = (PMARSVD0[7] !== 1'bz) && PMARSVD0_delay[7]; // rv 0
  assign PMARSVD1_in[0] = (PMARSVD1[0] !== 1'bz) && PMARSVD1_delay[0]; // rv 0
  assign PMARSVD1_in[1] = (PMARSVD1[1] !== 1'bz) && PMARSVD1_delay[1]; // rv 0
  assign PMARSVD1_in[2] = (PMARSVD1[2] !== 1'bz) && PMARSVD1_delay[2]; // rv 0
  assign PMARSVD1_in[3] = (PMARSVD1[3] !== 1'bz) && PMARSVD1_delay[3]; // rv 0
  assign PMARSVD1_in[4] = (PMARSVD1[4] !== 1'bz) && PMARSVD1_delay[4]; // rv 0
  assign PMARSVD1_in[5] = (PMARSVD1[5] !== 1'bz) && PMARSVD1_delay[5]; // rv 0
  assign PMARSVD1_in[6] = (PMARSVD1[6] !== 1'bz) && PMARSVD1_delay[6]; // rv 0
  assign PMARSVD1_in[7] = (PMARSVD1[7] !== 1'bz) && PMARSVD1_delay[7]; // rv 0
  assign QPLL0CLKRSVD0_in = (QPLL0CLKRSVD0 === 1'bz) || QPLL0CLKRSVD0_delay; // rv 1
  assign QPLL0LOCKDETCLK_in = (QPLL0LOCKDETCLK === 1'bz) || QPLL0LOCKDETCLK_delay; // rv 1
  assign QPLL0LOCKEN_in = (QPLL0LOCKEN !== 1'bz) && QPLL0LOCKEN_delay; // rv 0
  assign QPLL0PD_in = (QPLL0PD !== 1'bz) && QPLL0PD_delay; // rv 0
  assign QPLL0REFCLKSEL_in[0] = (QPLL0REFCLKSEL[0] === 1'bz) || QPLL0REFCLKSEL_delay[0]; // rv 1
  assign QPLL0REFCLKSEL_in[1] = (QPLL0REFCLKSEL[1] !== 1'bz) && QPLL0REFCLKSEL_delay[1]; // rv 0
  assign QPLL0REFCLKSEL_in[2] = (QPLL0REFCLKSEL[2] !== 1'bz) && QPLL0REFCLKSEL_delay[2]; // rv 0
  assign QPLL0RESET_in = (QPLL0RESET !== 1'bz) && QPLL0RESET_delay; // rv 0
  assign QPLL1CLKRSVD0_in = (QPLL1CLKRSVD0 === 1'bz) || QPLL1CLKRSVD0_delay; // rv 1
  assign QPLL1LOCKDETCLK_in = (QPLL1LOCKDETCLK === 1'bz) || QPLL1LOCKDETCLK_delay; // rv 1
  assign QPLL1LOCKEN_in = (QPLL1LOCKEN !== 1'bz) && QPLL1LOCKEN_delay; // rv 0
  assign QPLL1PD_in = (QPLL1PD !== 1'bz) && QPLL1PD_delay; // rv 0
  assign QPLL1REFCLKSEL_in[0] = (QPLL1REFCLKSEL[0] === 1'bz) || QPLL1REFCLKSEL_delay[0]; // rv 1
  assign QPLL1REFCLKSEL_in[1] = (QPLL1REFCLKSEL[1] !== 1'bz) && QPLL1REFCLKSEL_delay[1]; // rv 0
  assign QPLL1REFCLKSEL_in[2] = (QPLL1REFCLKSEL[2] !== 1'bz) && QPLL1REFCLKSEL_delay[2]; // rv 0
  assign QPLL1RESET_in = (QPLL1RESET !== 1'bz) && QPLL1RESET_delay; // rv 0
  assign QPLLRSVD1_in[0] = (QPLLRSVD1[0] !== 1'bz) && QPLLRSVD1_delay[0]; // rv 0
  assign QPLLRSVD1_in[1] = (QPLLRSVD1[1] !== 1'bz) && QPLLRSVD1_delay[1]; // rv 0
  assign QPLLRSVD1_in[2] = (QPLLRSVD1[2] !== 1'bz) && QPLLRSVD1_delay[2]; // rv 0
  assign QPLLRSVD1_in[3] = (QPLLRSVD1[3] !== 1'bz) && QPLLRSVD1_delay[3]; // rv 0
  assign QPLLRSVD1_in[4] = (QPLLRSVD1[4] !== 1'bz) && QPLLRSVD1_delay[4]; // rv 0
  assign QPLLRSVD1_in[5] = (QPLLRSVD1[5] !== 1'bz) && QPLLRSVD1_delay[5]; // rv 0
  assign QPLLRSVD1_in[6] = (QPLLRSVD1[6] !== 1'bz) && QPLLRSVD1_delay[6]; // rv 0
  assign QPLLRSVD1_in[7] = (QPLLRSVD1[7] !== 1'bz) && QPLLRSVD1_delay[7]; // rv 0
  assign QPLLRSVD2_in[0] = (QPLLRSVD2[0] !== 1'bz) && QPLLRSVD2_delay[0]; // rv 0
  assign QPLLRSVD2_in[1] = (QPLLRSVD2[1] !== 1'bz) && QPLLRSVD2_delay[1]; // rv 0
  assign QPLLRSVD2_in[2] = (QPLLRSVD2[2] !== 1'bz) && QPLLRSVD2_delay[2]; // rv 0
  assign QPLLRSVD2_in[3] = (QPLLRSVD2[3] !== 1'bz) && QPLLRSVD2_delay[3]; // rv 0
  assign QPLLRSVD2_in[4] = (QPLLRSVD2[4] !== 1'bz) && QPLLRSVD2_delay[4]; // rv 0
  assign QPLLRSVD3_in[0] = (QPLLRSVD3[0] !== 1'bz) && QPLLRSVD3_delay[0]; // rv 0
  assign QPLLRSVD3_in[1] = (QPLLRSVD3[1] !== 1'bz) && QPLLRSVD3_delay[1]; // rv 0
  assign QPLLRSVD3_in[2] = (QPLLRSVD3[2] !== 1'bz) && QPLLRSVD3_delay[2]; // rv 0
  assign QPLLRSVD3_in[3] = (QPLLRSVD3[3] !== 1'bz) && QPLLRSVD3_delay[3]; // rv 0
  assign QPLLRSVD3_in[4] = (QPLLRSVD3[4] !== 1'bz) && QPLLRSVD3_delay[4]; // rv 0
  assign QPLLRSVD4_in[0] = (QPLLRSVD4[0] !== 1'bz) && QPLLRSVD4_delay[0]; // rv 0
  assign QPLLRSVD4_in[1] = (QPLLRSVD4[1] !== 1'bz) && QPLLRSVD4_delay[1]; // rv 0
  assign QPLLRSVD4_in[2] = (QPLLRSVD4[2] !== 1'bz) && QPLLRSVD4_delay[2]; // rv 0
  assign QPLLRSVD4_in[3] = (QPLLRSVD4[3] !== 1'bz) && QPLLRSVD4_delay[3]; // rv 0
  assign QPLLRSVD4_in[4] = (QPLLRSVD4[4] !== 1'bz) && QPLLRSVD4_delay[4]; // rv 0
  assign QPLLRSVD4_in[5] = (QPLLRSVD4[5] !== 1'bz) && QPLLRSVD4_delay[5]; // rv 0
  assign QPLLRSVD4_in[6] = (QPLLRSVD4[6] !== 1'bz) && QPLLRSVD4_delay[6]; // rv 0
  assign QPLLRSVD4_in[7] = (QPLLRSVD4[7] !== 1'bz) && QPLLRSVD4_delay[7]; // rv 0
  assign RCALENB_in = RCALENB_delay;
  assign SDM0DATA_in[0] = (SDM0DATA[0] !== 1'bz) && SDM0DATA_delay[0]; // rv 0
  assign SDM0DATA_in[10] = (SDM0DATA[10] !== 1'bz) && SDM0DATA_delay[10]; // rv 0
  assign SDM0DATA_in[11] = (SDM0DATA[11] !== 1'bz) && SDM0DATA_delay[11]; // rv 0
  assign SDM0DATA_in[12] = (SDM0DATA[12] !== 1'bz) && SDM0DATA_delay[12]; // rv 0
  assign SDM0DATA_in[13] = (SDM0DATA[13] !== 1'bz) && SDM0DATA_delay[13]; // rv 0
  assign SDM0DATA_in[14] = (SDM0DATA[14] !== 1'bz) && SDM0DATA_delay[14]; // rv 0
  assign SDM0DATA_in[15] = (SDM0DATA[15] !== 1'bz) && SDM0DATA_delay[15]; // rv 0
  assign SDM0DATA_in[16] = (SDM0DATA[16] !== 1'bz) && SDM0DATA_delay[16]; // rv 0
  assign SDM0DATA_in[17] = (SDM0DATA[17] !== 1'bz) && SDM0DATA_delay[17]; // rv 0
  assign SDM0DATA_in[18] = (SDM0DATA[18] !== 1'bz) && SDM0DATA_delay[18]; // rv 0
  assign SDM0DATA_in[19] = (SDM0DATA[19] !== 1'bz) && SDM0DATA_delay[19]; // rv 0
  assign SDM0DATA_in[1] = (SDM0DATA[1] !== 1'bz) && SDM0DATA_delay[1]; // rv 0
  assign SDM0DATA_in[20] = (SDM0DATA[20] !== 1'bz) && SDM0DATA_delay[20]; // rv 0
  assign SDM0DATA_in[21] = (SDM0DATA[21] !== 1'bz) && SDM0DATA_delay[21]; // rv 0
  assign SDM0DATA_in[22] = (SDM0DATA[22] !== 1'bz) && SDM0DATA_delay[22]; // rv 0
  assign SDM0DATA_in[23] = (SDM0DATA[23] !== 1'bz) && SDM0DATA_delay[23]; // rv 0
  assign SDM0DATA_in[24] = (SDM0DATA[24] !== 1'bz) && SDM0DATA_delay[24]; // rv 0
  assign SDM0DATA_in[2] = (SDM0DATA[2] !== 1'bz) && SDM0DATA_delay[2]; // rv 0
  assign SDM0DATA_in[3] = (SDM0DATA[3] !== 1'bz) && SDM0DATA_delay[3]; // rv 0
  assign SDM0DATA_in[4] = (SDM0DATA[4] !== 1'bz) && SDM0DATA_delay[4]; // rv 0
  assign SDM0DATA_in[5] = (SDM0DATA[5] !== 1'bz) && SDM0DATA_delay[5]; // rv 0
  assign SDM0DATA_in[6] = (SDM0DATA[6] !== 1'bz) && SDM0DATA_delay[6]; // rv 0
  assign SDM0DATA_in[7] = (SDM0DATA[7] !== 1'bz) && SDM0DATA_delay[7]; // rv 0
  assign SDM0DATA_in[8] = (SDM0DATA[8] !== 1'bz) && SDM0DATA_delay[8]; // rv 0
  assign SDM0DATA_in[9] = (SDM0DATA[9] !== 1'bz) && SDM0DATA_delay[9]; // rv 0
  assign SDM0RESET_in = (SDM0RESET !== 1'bz) && SDM0RESET_delay; // rv 0
  assign SDM0WIDTH_in[0] = (SDM0WIDTH[0] !== 1'bz) && SDM0WIDTH_delay[0]; // rv 0
  assign SDM0WIDTH_in[1] = (SDM0WIDTH[1] !== 1'bz) && SDM0WIDTH_delay[1]; // rv 0
  assign SDM1DATA_in[0] = (SDM1DATA[0] !== 1'bz) && SDM1DATA_delay[0]; // rv 0
  assign SDM1DATA_in[10] = (SDM1DATA[10] !== 1'bz) && SDM1DATA_delay[10]; // rv 0
  assign SDM1DATA_in[11] = (SDM1DATA[11] !== 1'bz) && SDM1DATA_delay[11]; // rv 0
  assign SDM1DATA_in[12] = (SDM1DATA[12] !== 1'bz) && SDM1DATA_delay[12]; // rv 0
  assign SDM1DATA_in[13] = (SDM1DATA[13] !== 1'bz) && SDM1DATA_delay[13]; // rv 0
  assign SDM1DATA_in[14] = (SDM1DATA[14] !== 1'bz) && SDM1DATA_delay[14]; // rv 0
  assign SDM1DATA_in[15] = (SDM1DATA[15] !== 1'bz) && SDM1DATA_delay[15]; // rv 0
  assign SDM1DATA_in[16] = (SDM1DATA[16] !== 1'bz) && SDM1DATA_delay[16]; // rv 0
  assign SDM1DATA_in[17] = (SDM1DATA[17] !== 1'bz) && SDM1DATA_delay[17]; // rv 0
  assign SDM1DATA_in[18] = (SDM1DATA[18] !== 1'bz) && SDM1DATA_delay[18]; // rv 0
  assign SDM1DATA_in[19] = (SDM1DATA[19] !== 1'bz) && SDM1DATA_delay[19]; // rv 0
  assign SDM1DATA_in[1] = (SDM1DATA[1] !== 1'bz) && SDM1DATA_delay[1]; // rv 0
  assign SDM1DATA_in[20] = (SDM1DATA[20] !== 1'bz) && SDM1DATA_delay[20]; // rv 0
  assign SDM1DATA_in[21] = (SDM1DATA[21] !== 1'bz) && SDM1DATA_delay[21]; // rv 0
  assign SDM1DATA_in[22] = (SDM1DATA[22] !== 1'bz) && SDM1DATA_delay[22]; // rv 0
  assign SDM1DATA_in[23] = (SDM1DATA[23] !== 1'bz) && SDM1DATA_delay[23]; // rv 0
  assign SDM1DATA_in[24] = (SDM1DATA[24] !== 1'bz) && SDM1DATA_delay[24]; // rv 0
  assign SDM1DATA_in[2] = (SDM1DATA[2] !== 1'bz) && SDM1DATA_delay[2]; // rv 0
  assign SDM1DATA_in[3] = (SDM1DATA[3] !== 1'bz) && SDM1DATA_delay[3]; // rv 0
  assign SDM1DATA_in[4] = (SDM1DATA[4] !== 1'bz) && SDM1DATA_delay[4]; // rv 0
  assign SDM1DATA_in[5] = (SDM1DATA[5] !== 1'bz) && SDM1DATA_delay[5]; // rv 0
  assign SDM1DATA_in[6] = (SDM1DATA[6] !== 1'bz) && SDM1DATA_delay[6]; // rv 0
  assign SDM1DATA_in[7] = (SDM1DATA[7] !== 1'bz) && SDM1DATA_delay[7]; // rv 0
  assign SDM1DATA_in[8] = (SDM1DATA[8] !== 1'bz) && SDM1DATA_delay[8]; // rv 0
  assign SDM1DATA_in[9] = (SDM1DATA[9] !== 1'bz) && SDM1DATA_delay[9]; // rv 0
  assign SDM1RESET_in = (SDM1RESET !== 1'bz) && SDM1RESET_delay; // rv 0
  assign SDM1WIDTH_in[0] = (SDM1WIDTH[0] !== 1'bz) && SDM1WIDTH_delay[0]; // rv 0
  assign SDM1WIDTH_in[1] = (SDM1WIDTH[1] !== 1'bz) && SDM1WIDTH_delay[1]; // rv 0


  initial begin
  #1;
  trig_attr = ~trig_attr;
  end

  assign SIM_VERSION_BIN = SIM_VERSION_REG * 1000;

  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
         ((QPLL0_FBDIV_G3_REG < 16) || (QPLL0_FBDIV_G3_REG > 160))) begin
      $display("Error: [Unisim %s-164] QPLL0_FBDIV_G3 attribute is set to %d.  Legal values for this attribute are 16 to 160. Instance: %m", MODULE_NAME, QPLL0_FBDIV_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((QPLL0_FBDIV_REG < 16) || (QPLL0_FBDIV_REG > 160))) begin
      $display("Error: [Unisim %s-163] QPLL0_FBDIV attribute is set to %d.  Legal values for this attribute are 16 to 160. Instance: %m", MODULE_NAME, QPLL0_FBDIV_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((QPLL1_FBDIV_G3_REG < 16) || (QPLL1_FBDIV_G3_REG > 160))) begin
      $display("Error: [Unisim %s-187] QPLL1_FBDIV_G3 attribute is set to %d.  Legal values for this attribute are 16 to 160. Instance: %m", MODULE_NAME, QPLL1_FBDIV_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((QPLL1_FBDIV_REG < 16) || (QPLL1_FBDIV_REG > 160))) begin
      $display("Error: [Unisim %s-186] QPLL1_FBDIV attribute is set to %d.  Legal values for this attribute are 16 to 160. Instance: %m", MODULE_NAME, QPLL1_FBDIV_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((A_SDM1DATA1_0_REG < 16'b0000000000000000) || (A_SDM1DATA1_0_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-134] A_SDM1DATA1_0 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, A_SDM1DATA1_0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((A_SDM1DATA1_1_REG < 9'b000000000) || (A_SDM1DATA1_1_REG > 9'b111111111))) begin
      $display("Error: [Unisim %s-135] A_SDM1DATA1_1 attribute is set to %b.  Legal values for this attribute are 9'b000000000 to 9'b111111111. Instance: %m", MODULE_NAME, A_SDM1DATA1_1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BIAS_CFG0_REG < 16'h0000) || (BIAS_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-138] BIAS_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, BIAS_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BIAS_CFG1_REG < 16'h0000) || (BIAS_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-139] BIAS_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, BIAS_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BIAS_CFG2_REG < 16'h0000) || (BIAS_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-140] BIAS_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, BIAS_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BIAS_CFG3_REG < 16'h0000) || (BIAS_CFG3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-141] BIAS_CFG3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, BIAS_CFG3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BIAS_CFG4_REG < 16'h0000) || (BIAS_CFG4_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-142] BIAS_CFG4 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, BIAS_CFG4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BIAS_CFG_RSVD_REG < 10'b0000000000) || (BIAS_CFG_RSVD_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-143] BIAS_CFG_RSVD attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, BIAS_CFG_RSVD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((COMMON_CFG0_REG < 16'h0000) || (COMMON_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-146] COMMON_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, COMMON_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((COMMON_CFG1_REG < 16'h0000) || (COMMON_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-147] COMMON_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, COMMON_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((POR_CFG_REG < 16'h0000) || (POR_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-149] POR_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, POR_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PPF0_CFG_REG < 16'h0000) || (PPF0_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-150] PPF0_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, PPF0_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PPF1_CFG_REG < 16'h0000) || (PPF1_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-151] PPF1_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, PPF1_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0CLKOUT_RATE_REG != "FULL") &&
         (QPLL0CLKOUT_RATE_REG != "HALF"))) begin
      $display("Error: [Unisim %s-152] QPLL0CLKOUT_RATE attribute is set to %s.  Legal values for this attribute are FULL or HALF. Instance: %m", MODULE_NAME, QPLL0CLKOUT_RATE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_CFG0_REG < 16'h0000) || (QPLL0_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-154] QPLL0_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_CFG1_G3_REG < 16'h0000) || (QPLL0_CFG1_G3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-156] QPLL0_CFG1_G3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_CFG1_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_CFG1_REG < 16'h0000) || (QPLL0_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-155] QPLL0_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_CFG2_G3_REG < 16'h0000) || (QPLL0_CFG2_G3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-158] QPLL0_CFG2_G3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_CFG2_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_CFG2_REG < 16'h0000) || (QPLL0_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-157] QPLL0_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_CFG3_REG < 16'h0000) || (QPLL0_CFG3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-159] QPLL0_CFG3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_CFG3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_CFG4_REG < 16'h0000) || (QPLL0_CFG4_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-160] QPLL0_CFG4 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_CFG4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_CP_G3_REG < 10'b0000000000) || (QPLL0_CP_G3_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-162] QPLL0_CP_G3 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, QPLL0_CP_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_CP_REG < 10'b0000000000) || (QPLL0_CP_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-161] QPLL0_CP attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, QPLL0_CP_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_INIT_CFG0_REG < 16'h0000) || (QPLL0_INIT_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-165] QPLL0_INIT_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_INIT_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_INIT_CFG1_REG < 8'h00) || (QPLL0_INIT_CFG1_REG > 8'hFF))) begin
      $display("Error: [Unisim %s-166] QPLL0_INIT_CFG1 attribute is set to %h.  Legal values for this attribute are 8'h00 to 8'hFF. Instance: %m", MODULE_NAME, QPLL0_INIT_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_LOCK_CFG_G3_REG < 16'h0000) || (QPLL0_LOCK_CFG_G3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-168] QPLL0_LOCK_CFG_G3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_LOCK_CFG_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_LOCK_CFG_REG < 16'h0000) || (QPLL0_LOCK_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-167] QPLL0_LOCK_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_LOCK_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_LPF_G3_REG < 10'b0000000000) || (QPLL0_LPF_G3_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-170] QPLL0_LPF_G3 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, QPLL0_LPF_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_LPF_REG < 10'b0000000000) || (QPLL0_LPF_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-169] QPLL0_LPF attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, QPLL0_LPF_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_REFCLK_DIV_REG != 2) &&
         (QPLL0_REFCLK_DIV_REG != 1) &&
         (QPLL0_REFCLK_DIV_REG != 3) &&
         (QPLL0_REFCLK_DIV_REG != 4) &&
         (QPLL0_REFCLK_DIV_REG != 5) &&
         (QPLL0_REFCLK_DIV_REG != 6) &&
         (QPLL0_REFCLK_DIV_REG != 8) &&
         (QPLL0_REFCLK_DIV_REG != 10) &&
         (QPLL0_REFCLK_DIV_REG != 12) &&
         (QPLL0_REFCLK_DIV_REG != 16) &&
         (QPLL0_REFCLK_DIV_REG != 20))) begin
      $display("Error: [Unisim %s-171] QPLL0_REFCLK_DIV attribute is set to %d.  Legal values for this attribute are 2, 1, 3, 4, 5, 6, 8, 10, 12, 16 or 20. Instance: %m", MODULE_NAME, QPLL0_REFCLK_DIV_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_SDM_CFG0_REG < 16'h0000) || (QPLL0_SDM_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-172] QPLL0_SDM_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_SDM_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_SDM_CFG1_REG < 16'h0000) || (QPLL0_SDM_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-173] QPLL0_SDM_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_SDM_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL0_SDM_CFG2_REG < 16'h0000) || (QPLL0_SDM_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-174] QPLL0_SDM_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL0_SDM_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1CLKOUT_RATE_REG != "FULL") &&
         (QPLL1CLKOUT_RATE_REG != "HALF"))) begin
      $display("Error: [Unisim %s-175] QPLL1CLKOUT_RATE attribute is set to %s.  Legal values for this attribute are FULL or HALF. Instance: %m", MODULE_NAME, QPLL1CLKOUT_RATE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_CFG0_REG < 16'h0000) || (QPLL1_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-177] QPLL1_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_CFG1_G3_REG < 16'h0000) || (QPLL1_CFG1_G3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-179] QPLL1_CFG1_G3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_CFG1_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_CFG1_REG < 16'h0000) || (QPLL1_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-178] QPLL1_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_CFG2_G3_REG < 16'h0000) || (QPLL1_CFG2_G3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-181] QPLL1_CFG2_G3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_CFG2_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_CFG2_REG < 16'h0000) || (QPLL1_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-180] QPLL1_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_CFG3_REG < 16'h0000) || (QPLL1_CFG3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-182] QPLL1_CFG3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_CFG3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_CFG4_REG < 16'h0000) || (QPLL1_CFG4_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-183] QPLL1_CFG4 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_CFG4_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_CP_G3_REG < 10'b0000000000) || (QPLL1_CP_G3_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-185] QPLL1_CP_G3 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, QPLL1_CP_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_CP_REG < 10'b0000000000) || (QPLL1_CP_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-184] QPLL1_CP attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, QPLL1_CP_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_INIT_CFG0_REG < 16'h0000) || (QPLL1_INIT_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-188] QPLL1_INIT_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_INIT_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_INIT_CFG1_REG < 8'h00) || (QPLL1_INIT_CFG1_REG > 8'hFF))) begin
      $display("Error: [Unisim %s-189] QPLL1_INIT_CFG1 attribute is set to %h.  Legal values for this attribute are 8'h00 to 8'hFF. Instance: %m", MODULE_NAME, QPLL1_INIT_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_LOCK_CFG_G3_REG < 16'h0000) || (QPLL1_LOCK_CFG_G3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-191] QPLL1_LOCK_CFG_G3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_LOCK_CFG_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_LOCK_CFG_REG < 16'h0000) || (QPLL1_LOCK_CFG_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-190] QPLL1_LOCK_CFG attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_LOCK_CFG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_LPF_G3_REG < 10'b0000000000) || (QPLL1_LPF_G3_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-193] QPLL1_LPF_G3 attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, QPLL1_LPF_G3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_LPF_REG < 10'b0000000000) || (QPLL1_LPF_REG > 10'b1111111111))) begin
      $display("Error: [Unisim %s-192] QPLL1_LPF attribute is set to %b.  Legal values for this attribute are 10'b0000000000 to 10'b1111111111. Instance: %m", MODULE_NAME, QPLL1_LPF_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_REFCLK_DIV_REG != 2) &&
         (QPLL1_REFCLK_DIV_REG != 1) &&
         (QPLL1_REFCLK_DIV_REG != 3) &&
         (QPLL1_REFCLK_DIV_REG != 4) &&
         (QPLL1_REFCLK_DIV_REG != 5) &&
         (QPLL1_REFCLK_DIV_REG != 6) &&
         (QPLL1_REFCLK_DIV_REG != 8) &&
         (QPLL1_REFCLK_DIV_REG != 10) &&
         (QPLL1_REFCLK_DIV_REG != 12) &&
         (QPLL1_REFCLK_DIV_REG != 16) &&
         (QPLL1_REFCLK_DIV_REG != 20))) begin
      $display("Error: [Unisim %s-194] QPLL1_REFCLK_DIV attribute is set to %d.  Legal values for this attribute are 2, 1, 3, 4, 5, 6, 8, 10, 12, 16 or 20. Instance: %m", MODULE_NAME, QPLL1_REFCLK_DIV_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_SDM_CFG0_REG < 16'h0000) || (QPLL1_SDM_CFG0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-195] QPLL1_SDM_CFG0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_SDM_CFG0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_SDM_CFG1_REG < 16'h0000) || (QPLL1_SDM_CFG1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-196] QPLL1_SDM_CFG1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_SDM_CFG1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((QPLL1_SDM_CFG2_REG < 16'h0000) || (QPLL1_SDM_CFG2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-197] QPLL1_SDM_CFG2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, QPLL1_SDM_CFG2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RSVD_ATTR0_REG < 16'h0000) || (RSVD_ATTR0_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-206] RSVD_ATTR0 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RSVD_ATTR0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RSVD_ATTR1_REG < 16'h0000) || (RSVD_ATTR1_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-207] RSVD_ATTR1 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RSVD_ATTR1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RSVD_ATTR2_REG < 16'h0000) || (RSVD_ATTR2_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-208] RSVD_ATTR2 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RSVD_ATTR2_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RSVD_ATTR3_REG < 16'h0000) || (RSVD_ATTR3_REG > 16'hFFFF))) begin
      $display("Error: [Unisim %s-209] RSVD_ATTR3 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, RSVD_ATTR3_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXRECCLKOUT0_SEL_REG < 2'b00) || (RXRECCLKOUT0_SEL_REG > 2'b11))) begin
      $display("Error: [Unisim %s-210] RXRECCLKOUT0_SEL attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, RXRECCLKOUT0_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RXRECCLKOUT1_SEL_REG < 2'b00) || (RXRECCLKOUT1_SEL_REG > 2'b11))) begin
      $display("Error: [Unisim %s-211] RXRECCLKOUT1_SEL attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, RXRECCLKOUT1_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SARC_EN_REG !== 1'b0) && (SARC_EN_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-212] SARC_EN attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, SARC_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SARC_SEL_REG !== 1'b0) && (SARC_SEL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-213] SARC_SEL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, SARC_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SDM0INITSEED0_0_REG < 16'b0000000000000000) || (SDM0INITSEED0_0_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-214] SDM0INITSEED0_0 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, SDM0INITSEED0_0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SDM0INITSEED0_1_REG < 9'b000000000) || (SDM0INITSEED0_1_REG > 9'b111111111))) begin
      $display("Error: [Unisim %s-215] SDM0INITSEED0_1 attribute is set to %b.  Legal values for this attribute are 9'b000000000 to 9'b111111111. Instance: %m", MODULE_NAME, SDM0INITSEED0_1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SDM1INITSEED0_0_REG < 16'b0000000000000000) || (SDM1INITSEED0_0_REG > 16'b1111111111111111))) begin
      $display("Error: [Unisim %s-216] SDM1INITSEED0_0 attribute is set to %b.  Legal values for this attribute are 16'b0000000000000000 to 16'b1111111111111111. Instance: %m", MODULE_NAME, SDM1INITSEED0_0_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SDM1INITSEED0_1_REG < 9'b000000000) || (SDM1INITSEED0_1_REG > 9'b111111111))) begin
      $display("Error: [Unisim %s-217] SDM1INITSEED0_1 attribute is set to %b.  Legal values for this attribute are 9'b000000000 to 9'b111111111. Instance: %m", MODULE_NAME, SDM1INITSEED0_1_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SIM_RESET_SPEEDUP_REG != "TRUE") &&
         (SIM_RESET_SPEEDUP_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-218] SIM_RESET_SPEEDUP attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, SIM_RESET_SPEEDUP_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
   ((SIM_VERSION_REG != 1.0) &&
      (SIM_VERSION_REG != 2.0))) begin
    $display("Error: [Unisim %s-219] SIM_VERSION attribute is set to %f.  Legal values for this attribute are 1.0 or 2.0. Instance: %m", MODULE_NAME, SIM_VERSION_REG);
    attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

assign PMASCANCLK_in = 8'b11111111; // tie off

assign PMASCANENB_in = 1'b1; // tie off
assign PMASCANIN_in = 8'b11111111; // tie off
assign QDPMASCANMODEB_in = 1'b1; // tie off
assign QDPMASCANRSTEN_in = 1'b1; // tie off
assign RXRECCLK_in = 4'b1111; // tie off

SIP_GTYE3_COMMON #( 
  .SIM_RESET_SPEEDUP (SIM_RESET_SPEEDUP),
  .SIM_VERSION       (SIM_VERSION)
) SIP_GTYE3_COMMON_INST (
  .AEN_BGBS0 (AEN_BGBS0_REG),
  .AEN_BGBS1 (AEN_BGBS1_REG),
  .AEN_MASTER0 (AEN_MASTER0_REG),
  .AEN_MASTER1 (AEN_MASTER1_REG),
  .AEN_PD0 (AEN_PD0_REG),
  .AEN_PD1 (AEN_PD1_REG),
  .AEN_QPLL0 (AEN_QPLL0_REG),
  .AEN_QPLL1 (AEN_QPLL1_REG),
  .AEN_REFCLK0 (AEN_REFCLK0_REG),
  .AEN_REFCLK1 (AEN_REFCLK1_REG),
  .AEN_RESET0 (AEN_RESET0_REG),
  .AEN_RESET1 (AEN_RESET1_REG),
  .AEN_SDMDATA0 (AEN_SDMDATA0_REG),
  .AEN_SDMDATA1 (AEN_SDMDATA1_REG),
  .AEN_SDMRESET0 (AEN_SDMRESET0_REG),
  .AEN_SDMRESET1 (AEN_SDMRESET1_REG),
  .AEN_SDMWIDTH0 (AEN_SDMWIDTH0_REG),
  .AEN_SDMWIDTH1 (AEN_SDMWIDTH1_REG),
  .AQDMUXSEL1 (AQDMUXSEL1_REG),
  .AVCC_SENSE_SEL (AVCC_SENSE_SEL_REG),
  .AVTT_SENSE_SEL (AVTT_SENSE_SEL_REG),
  .A_BGMONITOREN (A_BGMONITOREN_REG),
  .A_BGPD (A_BGPD_REG),
  .A_GTREFCLKPD0 (A_GTREFCLKPD0_REG),
  .A_GTREFCLKPD1 (A_GTREFCLKPD1_REG),
  .A_QPLL0LOCKEN (A_QPLL0LOCKEN_REG),
  .A_QPLL0PD (A_QPLL0PD_REG),
  .A_QPLL0RESET (A_QPLL0RESET_REG),
  .A_QPLL1LOCKEN (A_QPLL1LOCKEN_REG),
  .A_QPLL1PD (A_QPLL1PD_REG),
  .A_QPLL1RESET (A_QPLL1RESET_REG),
  .A_SDM0DATA1_0 (A_SDM0DATA1_0_REG),
  .A_SDM0DATA1_1 (A_SDM0DATA1_1_REG),
  .A_SDM1DATA1_0 (A_SDM1DATA1_0_REG),
  .A_SDM1DATA1_1 (A_SDM1DATA1_1_REG),
  .A_SDMRESET0 (A_SDMRESET0_REG),
  .A_SDMRESET1 (A_SDMRESET1_REG),
  .BIAS_CFG0 (BIAS_CFG0_REG),
  .BIAS_CFG1 (BIAS_CFG1_REG),
  .BIAS_CFG2 (BIAS_CFG2_REG),
  .BIAS_CFG3 (BIAS_CFG3_REG),
  .BIAS_CFG4 (BIAS_CFG4_REG),
  .BIAS_CFG_RSVD (BIAS_CFG_RSVD_REG),
  .COMMON_AMUX_SEL0 (COMMON_AMUX_SEL0_REG),
  .COMMON_AMUX_SEL1 (COMMON_AMUX_SEL1_REG),
  .COMMON_CFG0 (COMMON_CFG0_REG),
  .COMMON_CFG1 (COMMON_CFG1_REG),
  .COMMON_INSTANTIATED (COMMON_INSTANTIATED_REG),
  .POR_CFG (POR_CFG_REG),
  .PPF0_CFG (PPF0_CFG_REG),
  .PPF1_CFG (PPF1_CFG_REG),
  .QPLL0CLKOUT_RATE (QPLL0CLKOUT_RATE_REG),
  .QPLL0_AMONITOR_SEL (QPLL0_AMONITOR_SEL_REG),
  .QPLL0_CFG0 (QPLL0_CFG0_REG),
  .QPLL0_CFG1 (QPLL0_CFG1_REG),
  .QPLL0_CFG1_G3 (QPLL0_CFG1_G3_REG),
  .QPLL0_CFG2 (QPLL0_CFG2_REG),
  .QPLL0_CFG2_G3 (QPLL0_CFG2_G3_REG),
  .QPLL0_CFG3 (QPLL0_CFG3_REG),
  .QPLL0_CFG4 (QPLL0_CFG4_REG),
  .QPLL0_CP (QPLL0_CP_REG),
  .QPLL0_CP_G3 (QPLL0_CP_G3_REG),
  .QPLL0_FBDIV (QPLL0_FBDIV_REG),
  .QPLL0_FBDIV_G3 (QPLL0_FBDIV_G3_REG),
  .QPLL0_INIT_CFG0 (QPLL0_INIT_CFG0_REG),
  .QPLL0_INIT_CFG1 (QPLL0_INIT_CFG1_REG),
  .QPLL0_LOCK_CFG (QPLL0_LOCK_CFG_REG),
  .QPLL0_LOCK_CFG_G3 (QPLL0_LOCK_CFG_G3_REG),
  .QPLL0_LPF (QPLL0_LPF_REG),
  .QPLL0_LPF_G3 (QPLL0_LPF_G3_REG),
  .QPLL0_REFCLK_DIV (QPLL0_REFCLK_DIV_REG),
  .QPLL0_SDM_CFG0 (QPLL0_SDM_CFG0_REG),
  .QPLL0_SDM_CFG1 (QPLL0_SDM_CFG1_REG),
  .QPLL0_SDM_CFG2 (QPLL0_SDM_CFG2_REG),
  .QPLL1CLKOUT_RATE (QPLL1CLKOUT_RATE_REG),
  .QPLL1_AMONITOR_SEL (QPLL1_AMONITOR_SEL_REG),
  .QPLL1_CFG0 (QPLL1_CFG0_REG),
  .QPLL1_CFG1 (QPLL1_CFG1_REG),
  .QPLL1_CFG1_G3 (QPLL1_CFG1_G3_REG),
  .QPLL1_CFG2 (QPLL1_CFG2_REG),
  .QPLL1_CFG2_G3 (QPLL1_CFG2_G3_REG),
  .QPLL1_CFG3 (QPLL1_CFG3_REG),
  .QPLL1_CFG4 (QPLL1_CFG4_REG),
  .QPLL1_CP (QPLL1_CP_REG),
  .QPLL1_CP_G3 (QPLL1_CP_G3_REG),
  .QPLL1_FBDIV (QPLL1_FBDIV_REG),
  .QPLL1_FBDIV_G3 (QPLL1_FBDIV_G3_REG),
  .QPLL1_INIT_CFG0 (QPLL1_INIT_CFG0_REG),
  .QPLL1_INIT_CFG1 (QPLL1_INIT_CFG1_REG),
  .QPLL1_LOCK_CFG (QPLL1_LOCK_CFG_REG),
  .QPLL1_LOCK_CFG_G3 (QPLL1_LOCK_CFG_G3_REG),
  .QPLL1_LPF (QPLL1_LPF_REG),
  .QPLL1_LPF_G3 (QPLL1_LPF_G3_REG),
  .QPLL1_REFCLK_DIV (QPLL1_REFCLK_DIV_REG),
  .QPLL1_SDM_CFG0 (QPLL1_SDM_CFG0_REG),
  .QPLL1_SDM_CFG1 (QPLL1_SDM_CFG1_REG),
  .QPLL1_SDM_CFG2 (QPLL1_SDM_CFG2_REG),
  .RCALSAP_TESTEN (RCALSAP_TESTEN_REG),
  .RCAL_APROBE (RCAL_APROBE_REG),
  .REFCLK0_EN_DC_COUP (REFCLK0_EN_DC_COUP_REG),
  .REFCLK0_VCM_HIGH (REFCLK0_VCM_HIGH_REG),
  .REFCLK0_VCM_LOW (REFCLK0_VCM_LOW_REG),
  .REFCLK1_EN_DC_COUP (REFCLK1_EN_DC_COUP_REG),
  .REFCLK1_VCM_HIGH (REFCLK1_VCM_HIGH_REG),
  .REFCLK1_VCM_LOW (REFCLK1_VCM_LOW_REG),
  .RSVD_ATTR0 (RSVD_ATTR0_REG),
  .RSVD_ATTR1 (RSVD_ATTR1_REG),
  .RSVD_ATTR2 (RSVD_ATTR2_REG),
  .RSVD_ATTR3 (RSVD_ATTR3_REG),
  .RXRECCLKOUT0_SEL (RXRECCLKOUT0_SEL_REG),
  .RXRECCLKOUT1_SEL (RXRECCLKOUT1_SEL_REG),
  .SARC_EN (SARC_EN_REG),
  .SARC_SEL (SARC_SEL_REG),
  .SDM0INITSEED0_0 (SDM0INITSEED0_0_REG),
  .SDM0INITSEED0_1 (SDM0INITSEED0_1_REG),
  .SDM1INITSEED0_0 (SDM1INITSEED0_0_REG),
  .SDM1INITSEED0_1 (SDM1INITSEED0_1_REG),
  .VCCAUX_SENSE_SEL (VCCAUX_SENSE_SEL_REG),
  .DRPDO (DRPDO_out),
  .DRPRDY (DRPRDY_out),
  .PMARSVDOUT0 (PMARSVDOUT0_out),
  .PMARSVDOUT1 (PMARSVDOUT1_out),
  .PMASCANOUT (PMASCANOUT_out),
  .QPLL0FBCLKLOST (QPLL0FBCLKLOST_out),
  .QPLL0LOCK (QPLL0LOCK_out),
  .QPLL0OUTCLK (QPLL0OUTCLK_out),
  .QPLL0OUTREFCLK (QPLL0OUTREFCLK_out),
  .QPLL0REFCLKLOST (QPLL0REFCLKLOST_out),
  .QPLL1FBCLKLOST (QPLL1FBCLKLOST_out),
  .QPLL1LOCK (QPLL1LOCK_out),
  .QPLL1OUTCLK (QPLL1OUTCLK_out),
  .QPLL1OUTREFCLK (QPLL1OUTREFCLK_out),
  .QPLL1REFCLKLOST (QPLL1REFCLKLOST_out),
  .QPLLDMONITOR0 (QPLLDMONITOR0_out),
  .QPLLDMONITOR1 (QPLLDMONITOR1_out),
  .REFCLKOUTMONITOR0 (REFCLKOUTMONITOR0_out),
  .REFCLKOUTMONITOR1 (REFCLKOUTMONITOR1_out),
  .RXRECCLK0_SEL (RXRECCLK0_SEL_out),
  .RXRECCLK1_SEL (RXRECCLK1_SEL_out),
  .SARCCLK (SARCCLK_out),
  .SDM0FINALOUT (SDM0FINALOUT_out),
  .SDM0TESTDATA (SDM0TESTDATA_out),
  .SDM1FINALOUT (SDM1FINALOUT_out),
  .SDM1TESTDATA (SDM1TESTDATA_out),
  .BGBYPASSB (BGBYPASSB_in),
  .BGMONITORENB (BGMONITORENB_in),
  .BGPDB (BGPDB_in),
  .BGRCALOVRD (BGRCALOVRD_in),
  .BGRCALOVRDENB (BGRCALOVRDENB_in),
  .DRPADDR (DRPADDR_in),
  .DRPCLK (DRPCLK_in),
  .DRPDI (DRPDI_in),
  .DRPEN (DRPEN_in),
  .DRPWE (DRPWE_in),
  .GTGREFCLK0 (GTGREFCLK0_in),
  .GTGREFCLK1 (GTGREFCLK1_in),
  .GTNORTHREFCLK00 (GTNORTHREFCLK00_in),
  .GTNORTHREFCLK01 (GTNORTHREFCLK01_in),
  .GTNORTHREFCLK10 (GTNORTHREFCLK10_in),
  .GTNORTHREFCLK11 (GTNORTHREFCLK11_in),
  .GTREFCLK00 (GTREFCLK00_in),
  .GTREFCLK01 (GTREFCLK01_in),
  .GTREFCLK10 (GTREFCLK10_in),
  .GTREFCLK11 (GTREFCLK11_in),
  .GTSOUTHREFCLK00 (GTSOUTHREFCLK00_in),
  .GTSOUTHREFCLK01 (GTSOUTHREFCLK01_in),
  .GTSOUTHREFCLK10 (GTSOUTHREFCLK10_in),
  .GTSOUTHREFCLK11 (GTSOUTHREFCLK11_in),
  .PMARSVD0 (PMARSVD0_in),
  .PMARSVD1 (PMARSVD1_in),
  .PMASCANCLK (PMASCANCLK_in),
  .PMASCANENB (PMASCANENB_in),
  .PMASCANIN (PMASCANIN_in),
  .QDPMASCANMODEB (QDPMASCANMODEB_in),
  .QDPMASCANRSTEN (QDPMASCANRSTEN_in),
  .QPLL0CLKRSVD0 (QPLL0CLKRSVD0_in),
  .QPLL0LOCKDETCLK (QPLL0LOCKDETCLK_in),
  .QPLL0LOCKEN (QPLL0LOCKEN_in),
  .QPLL0PD (QPLL0PD_in),
  .QPLL0REFCLKSEL (QPLL0REFCLKSEL_in),
  .QPLL0RESET (QPLL0RESET_in),
  .QPLL1CLKRSVD0 (QPLL1CLKRSVD0_in),
  .QPLL1LOCKDETCLK (QPLL1LOCKDETCLK_in),
  .QPLL1LOCKEN (QPLL1LOCKEN_in),
  .QPLL1PD (QPLL1PD_in),
  .QPLL1REFCLKSEL (QPLL1REFCLKSEL_in),
  .QPLL1RESET (QPLL1RESET_in),
  .QPLLRSVD1 (QPLLRSVD1_in),
  .QPLLRSVD2 (QPLLRSVD2_in),
  .QPLLRSVD3 (QPLLRSVD3_in),
  .QPLLRSVD4 (QPLLRSVD4_in),
  .RCALENB (RCALENB_in),
  .RXRECCLK (RXRECCLK_in),
  .SDM0DATA (SDM0DATA_in),
  .SDM0RESET (SDM0RESET_in),
  .SDM0WIDTH (SDM0WIDTH_in),
  .SDM1DATA (SDM1DATA_in),
  .SDM1RESET (SDM1RESET_in),
  .SDM1WIDTH (SDM1WIDTH_in),
  .GSR (glblGSR)
);


  specify
  (DRPCLK => DRPDO[0]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[10]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[11]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[12]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[13]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[14]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[15]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[1]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[2]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[3]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[4]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[5]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[6]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[7]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[8]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPDO[9]) = (0:0:0, 0:0:0);
  (DRPCLK => DRPRDY) = (0:0:0, 0:0:0);
  (GTGREFCLK0 => QPLL0OUTREFCLK) = (0:0:0, 0:0:0);
  (GTGREFCLK1 => QPLL1OUTREFCLK) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK00 => QPLL0OUTREFCLK) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK01 => QPLL1OUTREFCLK) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK10 => QPLL0OUTREFCLK) = (0:0:0, 0:0:0);
  (GTNORTHREFCLK11 => QPLL1OUTREFCLK) = (0:0:0, 0:0:0);
  (GTREFCLK00 => QPLL0OUTREFCLK) = (0:0:0, 0:0:0);
  (GTREFCLK01 => QPLL1OUTREFCLK) = (0:0:0, 0:0:0);
  (GTREFCLK10 => QPLL0OUTREFCLK) = (0:0:0, 0:0:0);
  (GTREFCLK11 => QPLL1OUTREFCLK) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK00 => QPLL0OUTREFCLK) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK01 => QPLL1OUTREFCLK) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK10 => QPLL0OUTREFCLK) = (0:0:0, 0:0:0);
  (GTSOUTHREFCLK11 => QPLL1OUTREFCLK) = (0:0:0, 0:0:0);
  // (QPLL0OUTREFCLK => REFCLKOUTMONITOR0) = (0:0:0, 0:0:0); // error prop output to output
  // (QPLL1OUTREFCLK => REFCLKOUTMONITOR1) = (0:0:0, 0:0:0); // error prop output to output
`ifdef XIL_TIMING
  $setuphold (posedge DRPCLK, negedge DRPADDR[0], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[0]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[1], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[1]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[2], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[2]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[3], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[3]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[4], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[4]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[5], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[5]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[6], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[6]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[7], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[7]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[8], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[8]);
  $setuphold (posedge DRPCLK, negedge DRPADDR[9], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[9]);
  $setuphold (posedge DRPCLK, negedge DRPDI[0], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[0]);
  $setuphold (posedge DRPCLK, negedge DRPDI[10], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[10]);
  $setuphold (posedge DRPCLK, negedge DRPDI[11], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[11]);
  $setuphold (posedge DRPCLK, negedge DRPDI[12], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[12]);
  $setuphold (posedge DRPCLK, negedge DRPDI[13], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[13]);
  $setuphold (posedge DRPCLK, negedge DRPDI[14], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[14]);
  $setuphold (posedge DRPCLK, negedge DRPDI[15], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[15]);
  $setuphold (posedge DRPCLK, negedge DRPDI[1], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[1]);
  $setuphold (posedge DRPCLK, negedge DRPDI[2], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[2]);
  $setuphold (posedge DRPCLK, negedge DRPDI[3], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[3]);
  $setuphold (posedge DRPCLK, negedge DRPDI[4], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[4]);
  $setuphold (posedge DRPCLK, negedge DRPDI[5], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[5]);
  $setuphold (posedge DRPCLK, negedge DRPDI[6], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[6]);
  $setuphold (posedge DRPCLK, negedge DRPDI[7], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[7]);
  $setuphold (posedge DRPCLK, negedge DRPDI[8], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[8]);
  $setuphold (posedge DRPCLK, negedge DRPDI[9], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[9]);
  $setuphold (posedge DRPCLK, negedge DRPEN, 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPEN_delay);
  $setuphold (posedge DRPCLK, negedge DRPWE, 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPWE_delay);
  $setuphold (posedge DRPCLK, posedge DRPADDR[0], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[0]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[1], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[1]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[2], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[2]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[3], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[3]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[4], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[4]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[5], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[5]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[6], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[6]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[7], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[7]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[8], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[8]);
  $setuphold (posedge DRPCLK, posedge DRPADDR[9], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPADDR_delay[9]);
  $setuphold (posedge DRPCLK, posedge DRPDI[0], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[0]);
  $setuphold (posedge DRPCLK, posedge DRPDI[10], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[10]);
  $setuphold (posedge DRPCLK, posedge DRPDI[11], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[11]);
  $setuphold (posedge DRPCLK, posedge DRPDI[12], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[12]);
  $setuphold (posedge DRPCLK, posedge DRPDI[13], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[13]);
  $setuphold (posedge DRPCLK, posedge DRPDI[14], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[14]);
  $setuphold (posedge DRPCLK, posedge DRPDI[15], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[15]);
  $setuphold (posedge DRPCLK, posedge DRPDI[1], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[1]);
  $setuphold (posedge DRPCLK, posedge DRPDI[2], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[2]);
  $setuphold (posedge DRPCLK, posedge DRPDI[3], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[3]);
  $setuphold (posedge DRPCLK, posedge DRPDI[4], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[4]);
  $setuphold (posedge DRPCLK, posedge DRPDI[5], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[5]);
  $setuphold (posedge DRPCLK, posedge DRPDI[6], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[6]);
  $setuphold (posedge DRPCLK, posedge DRPDI[7], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[7]);
  $setuphold (posedge DRPCLK, posedge DRPDI[8], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[8]);
  $setuphold (posedge DRPCLK, posedge DRPDI[9], 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPDI_delay[9]);
  $setuphold (posedge DRPCLK, posedge DRPEN, 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPEN_delay);
  $setuphold (posedge DRPCLK, posedge DRPWE, 0:0:0, 0:0:0, notifier,,, DRPCLK_delay, DRPWE_delay);
`endif
  specparam PATHPULSE$ = 0;
endspecify

endmodule

`endcelldefine
