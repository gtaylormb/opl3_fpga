///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        18K-bit Configurable Synchronous Block RAM
// /___/   /\      Filename    : RAMB18E2.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  02/28/2013 - intial from FIFO
//  03/09/2013 - update from various initial CR - collisions
//  03/22/2013 - sync5 yaml update, port ordering
//  03/25/2013 - 707719 - Add sync5 cascade feature
//  03/27/2013 - revert NO_CHANGE fix
//  04/04/2013 - 709962 - typo CASDOUTPA/PB vs CASDOUTAP/BP
//  04/23/2013 - PR683925 - add invertible pin support.
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module RAMB18E2 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter CASCADE_ORDER_A = "NONE",
  parameter CASCADE_ORDER_B = "NONE",
  parameter CLOCK_DOMAINS = "INDEPENDENT",
  parameter integer DOA_REG = 1,
  parameter integer DOB_REG = 1,
  parameter ENADDRENA = "FALSE",
  parameter ENADDRENB = "FALSE",
  parameter [255:0] INITP_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INITP_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [255:0] INIT_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000,
  parameter [17:0] INIT_A = 18'h00000,
  parameter [17:0] INIT_B = 18'h00000,
  parameter INIT_FILE = "NONE",
  parameter [0:0] IS_CLKARDCLK_INVERTED = 1'b0,
  parameter [0:0] IS_CLKBWRCLK_INVERTED = 1'b0,
  parameter [0:0] IS_ENARDEN_INVERTED = 1'b0,
  parameter [0:0] IS_ENBWREN_INVERTED = 1'b0,
  parameter [0:0] IS_RSTRAMARSTRAM_INVERTED = 1'b0,
  parameter [0:0] IS_RSTRAMB_INVERTED = 1'b0,
  parameter [0:0] IS_RSTREGARSTREG_INVERTED = 1'b0,
  parameter [0:0] IS_RSTREGB_INVERTED = 1'b0,
  parameter RDADDRCHANGEA = "FALSE",
  parameter RDADDRCHANGEB = "FALSE",
  parameter integer READ_WIDTH_A = 0,
  parameter integer READ_WIDTH_B = 0,
  parameter RSTREG_PRIORITY_A = "RSTREG",
  parameter RSTREG_PRIORITY_B = "RSTREG",
  parameter SIM_COLLISION_CHECK = "ALL",
  parameter SLEEP_ASYNC = "FALSE",
  parameter [17:0] SRVAL_A = 18'h00000,
  parameter [17:0] SRVAL_B = 18'h00000,
  parameter WRITE_MODE_A = "NO_CHANGE",
  parameter WRITE_MODE_B = "NO_CHANGE",
  parameter integer WRITE_WIDTH_A = 0,
  parameter integer WRITE_WIDTH_B = 0
)(
  output [15:0] CASDOUTA,
  output [15:0] CASDOUTB,
  output [1:0] CASDOUTPA,
  output [1:0] CASDOUTPB,
  output [15:0] DOUTADOUT,
  output [15:0] DOUTBDOUT,
  output [1:0] DOUTPADOUTP,
  output [1:0] DOUTPBDOUTP,

  input [13:0] ADDRARDADDR,
  input [13:0] ADDRBWRADDR,
  input ADDRENA,
  input ADDRENB,
  input CASDIMUXA,
  input CASDIMUXB,
  input [15:0] CASDINA,
  input [15:0] CASDINB,
  input [1:0] CASDINPA,
  input [1:0] CASDINPB,
  input CASDOMUXA,
  input CASDOMUXB,
  input CASDOMUXEN_A,
  input CASDOMUXEN_B,
  input CASOREGIMUXA,
  input CASOREGIMUXB,
  input CASOREGIMUXEN_A,
  input CASOREGIMUXEN_B,
  input CLKARDCLK,
  input CLKBWRCLK,
  input [15:0] DINADIN,
  input [15:0] DINBDIN,
  input [1:0] DINPADINP,
  input [1:0] DINPBDINP,
  input ENARDEN,
  input ENBWREN,
  input REGCEAREGCE,
  input REGCEB,
  input RSTRAMARSTRAM,
  input RSTRAMB,
  input RSTREGARSTREG,
  input RSTREGB,
  input SLEEP,
  input [1:0] WEA,
  input [3:0] WEBWE
);
  
// define constants
  localparam MODULE_NAME = "RAMB18E2";

// Parameter encodings and registers
  localparam CASCADE_ORDER_A_FIRST = 1;
  localparam CASCADE_ORDER_A_LAST = 2;
  localparam CASCADE_ORDER_A_MIDDLE = 3;
  localparam CASCADE_ORDER_A_NONE = 0;
  localparam CASCADE_ORDER_B_FIRST = 1;
  localparam CASCADE_ORDER_B_LAST = 2;
  localparam CASCADE_ORDER_B_MIDDLE = 3;
  localparam CASCADE_ORDER_B_NONE = 0;
  localparam CLOCK_DOMAINS_COMMON = 1;
  localparam CLOCK_DOMAINS_INDEPENDENT = 0;
  localparam DOA_REG_0 = 1;
  localparam DOA_REG_1 = 0;
  localparam DOB_REG_0 = 1;
  localparam DOB_REG_1 = 0;
  localparam ENADDRENA_FALSE = 0;
  localparam ENADDRENA_TRUE = 1;
  localparam ENADDRENB_FALSE = 0;
  localparam ENADDRENB_TRUE = 1;
  localparam RDADDRCHANGEA_FALSE = 0;
  localparam RDADDRCHANGEA_TRUE = 1;
  localparam RDADDRCHANGEB_FALSE = 0;
  localparam RDADDRCHANGEB_TRUE = 1;
  localparam READ_WIDTH_A_0 = 1;
  localparam READ_WIDTH_A_1 = 1;
  localparam READ_WIDTH_A_18 = 16;
  localparam READ_WIDTH_A_2 = 2;
  localparam READ_WIDTH_A_36 = 32;
  localparam READ_WIDTH_A_4 = 4;
  localparam READ_WIDTH_A_9 = 8;
  localparam READ_WIDTH_B_0 = 1;
  localparam READ_WIDTH_B_1 = 1;
  localparam READ_WIDTH_B_18 = 16;
  localparam READ_WIDTH_B_2 = 2;
  localparam READ_WIDTH_B_4 = 4;
  localparam READ_WIDTH_B_9 = 8;
  localparam RSTREG_PRIORITY_A_REGCE = 1;
  localparam RSTREG_PRIORITY_A_RSTREG = 0;
  localparam RSTREG_PRIORITY_B_REGCE = 1;
  localparam RSTREG_PRIORITY_B_RSTREG = 0;
  localparam SIM_COLLISION_CHECK_ALL = 0;
  localparam SIM_COLLISION_CHECK_GENERATE_X_ONLY = 1;
  localparam SIM_COLLISION_CHECK_NONE = 2;
  localparam SIM_COLLISION_CHECK_WARNING_ONLY = 3;
  localparam SLEEP_ASYNC_FALSE = 0;
  localparam SLEEP_ASYNC_TRUE = 1;
  localparam WRITE_MODE_A_NO_CHANGE = 0;
  localparam WRITE_MODE_A_READ_FIRST = 1;
  localparam WRITE_MODE_A_WRITE_FIRST = 2;
  localparam WRITE_MODE_B_NO_CHANGE = 0;
  localparam WRITE_MODE_B_READ_FIRST = 1;
  localparam WRITE_MODE_B_WRITE_FIRST = 2;
  localparam WRITE_WIDTH_A_0 = 1;
  localparam WRITE_WIDTH_A_1 = 1;
  localparam WRITE_WIDTH_A_18 = 16;
  localparam WRITE_WIDTH_A_2 = 2;
  localparam WRITE_WIDTH_A_4 = 4;
  localparam WRITE_WIDTH_A_9 = 8;
  localparam WRITE_WIDTH_B_0 = 1;
  localparam WRITE_WIDTH_B_1 = 1;
  localparam WRITE_WIDTH_B_18 = 16;
  localparam WRITE_WIDTH_B_2 = 2;
  localparam WRITE_WIDTH_B_36 = 32;
  localparam WRITE_WIDTH_B_4 = 4;
  localparam WRITE_WIDTH_B_9 = 8;

// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
`ifdef XIL_DR
  `include "RAMB18E2_dr.v"
`else
  localparam [48:1] CASCADE_ORDER_A_REG = CASCADE_ORDER_A;
  localparam [48:1] CASCADE_ORDER_B_REG = CASCADE_ORDER_B;
  localparam [88:1] CLOCK_DOMAINS_REG = CLOCK_DOMAINS;
  localparam [0:0] DOA_REG_REG = DOA_REG;
  localparam [0:0] DOB_REG_REG = DOB_REG;
  localparam [40:1] ENADDRENA_REG = ENADDRENA;
  localparam [40:1] ENADDRENB_REG = ENADDRENB;
  localparam [255:0] INITP_00_REG = INITP_00;
  localparam [255:0] INITP_01_REG = INITP_01;
  localparam [255:0] INITP_02_REG = INITP_02;
  localparam [255:0] INITP_03_REG = INITP_03;
  localparam [255:0] INITP_04_REG = INITP_04;
  localparam [255:0] INITP_05_REG = INITP_05;
  localparam [255:0] INITP_06_REG = INITP_06;
  localparam [255:0] INITP_07_REG = INITP_07;
  localparam [255:0] INIT_00_REG = INIT_00;
  localparam [255:0] INIT_01_REG = INIT_01;
  localparam [255:0] INIT_02_REG = INIT_02;
  localparam [255:0] INIT_03_REG = INIT_03;
  localparam [255:0] INIT_04_REG = INIT_04;
  localparam [255:0] INIT_05_REG = INIT_05;
  localparam [255:0] INIT_06_REG = INIT_06;
  localparam [255:0] INIT_07_REG = INIT_07;
  localparam [255:0] INIT_08_REG = INIT_08;
  localparam [255:0] INIT_09_REG = INIT_09;
  localparam [255:0] INIT_0A_REG = INIT_0A;
  localparam [255:0] INIT_0B_REG = INIT_0B;
  localparam [255:0] INIT_0C_REG = INIT_0C;
  localparam [255:0] INIT_0D_REG = INIT_0D;
  localparam [255:0] INIT_0E_REG = INIT_0E;
  localparam [255:0] INIT_0F_REG = INIT_0F;
  localparam [255:0] INIT_10_REG = INIT_10;
  localparam [255:0] INIT_11_REG = INIT_11;
  localparam [255:0] INIT_12_REG = INIT_12;
  localparam [255:0] INIT_13_REG = INIT_13;
  localparam [255:0] INIT_14_REG = INIT_14;
  localparam [255:0] INIT_15_REG = INIT_15;
  localparam [255:0] INIT_16_REG = INIT_16;
  localparam [255:0] INIT_17_REG = INIT_17;
  localparam [255:0] INIT_18_REG = INIT_18;
  localparam [255:0] INIT_19_REG = INIT_19;
  localparam [255:0] INIT_1A_REG = INIT_1A;
  localparam [255:0] INIT_1B_REG = INIT_1B;
  localparam [255:0] INIT_1C_REG = INIT_1C;
  localparam [255:0] INIT_1D_REG = INIT_1D;
  localparam [255:0] INIT_1E_REG = INIT_1E;
  localparam [255:0] INIT_1F_REG = INIT_1F;
  localparam [255:0] INIT_20_REG = INIT_20;
  localparam [255:0] INIT_21_REG = INIT_21;
  localparam [255:0] INIT_22_REG = INIT_22;
  localparam [255:0] INIT_23_REG = INIT_23;
  localparam [255:0] INIT_24_REG = INIT_24;
  localparam [255:0] INIT_25_REG = INIT_25;
  localparam [255:0] INIT_26_REG = INIT_26;
  localparam [255:0] INIT_27_REG = INIT_27;
  localparam [255:0] INIT_28_REG = INIT_28;
  localparam [255:0] INIT_29_REG = INIT_29;
  localparam [255:0] INIT_2A_REG = INIT_2A;
  localparam [255:0] INIT_2B_REG = INIT_2B;
  localparam [255:0] INIT_2C_REG = INIT_2C;
  localparam [255:0] INIT_2D_REG = INIT_2D;
  localparam [255:0] INIT_2E_REG = INIT_2E;
  localparam [255:0] INIT_2F_REG = INIT_2F;
  localparam [255:0] INIT_30_REG = INIT_30;
  localparam [255:0] INIT_31_REG = INIT_31;
  localparam [255:0] INIT_32_REG = INIT_32;
  localparam [255:0] INIT_33_REG = INIT_33;
  localparam [255:0] INIT_34_REG = INIT_34;
  localparam [255:0] INIT_35_REG = INIT_35;
  localparam [255:0] INIT_36_REG = INIT_36;
  localparam [255:0] INIT_37_REG = INIT_37;
  localparam [255:0] INIT_38_REG = INIT_38;
  localparam [255:0] INIT_39_REG = INIT_39;
  localparam [255:0] INIT_3A_REG = INIT_3A;
  localparam [255:0] INIT_3B_REG = INIT_3B;
  localparam [255:0] INIT_3C_REG = INIT_3C;
  localparam [255:0] INIT_3D_REG = INIT_3D;
  localparam [255:0] INIT_3E_REG = INIT_3E;
  localparam [255:0] INIT_3F_REG = INIT_3F;
  localparam [17:0] INIT_A_REG = INIT_A;
  localparam [17:0] INIT_B_REG = INIT_B;
  localparam INIT_FILE_REG = INIT_FILE;
  localparam [0:0] IS_CLKARDCLK_INVERTED_REG = IS_CLKARDCLK_INVERTED;
  localparam [0:0] IS_CLKBWRCLK_INVERTED_REG = IS_CLKBWRCLK_INVERTED;
  localparam [0:0] IS_ENARDEN_INVERTED_REG = IS_ENARDEN_INVERTED;
  localparam [0:0] IS_ENBWREN_INVERTED_REG = IS_ENBWREN_INVERTED;
  localparam [0:0] IS_RSTRAMARSTRAM_INVERTED_REG = IS_RSTRAMARSTRAM_INVERTED;
  localparam [0:0] IS_RSTRAMB_INVERTED_REG = IS_RSTRAMB_INVERTED;
  localparam [0:0] IS_RSTREGARSTREG_INVERTED_REG = IS_RSTREGARSTREG_INVERTED;
  localparam [0:0] IS_RSTREGB_INVERTED_REG = IS_RSTREGB_INVERTED;
  localparam [40:1] RDADDRCHANGEA_REG = RDADDRCHANGEA;
  localparam [40:1] RDADDRCHANGEB_REG = RDADDRCHANGEB;
  localparam [5:0] READ_WIDTH_A_REG = READ_WIDTH_A;
  localparam [4:0] READ_WIDTH_B_REG = READ_WIDTH_B;
  localparam [48:1] RSTREG_PRIORITY_A_REG = RSTREG_PRIORITY_A;
  localparam [48:1] RSTREG_PRIORITY_B_REG = RSTREG_PRIORITY_B;
  localparam [120:1] SIM_COLLISION_CHECK_REG = SIM_COLLISION_CHECK;
  localparam [40:1] SLEEP_ASYNC_REG = SLEEP_ASYNC;
  localparam [17:0] SRVAL_A_REG = SRVAL_A;
  localparam [17:0] SRVAL_B_REG = SRVAL_B;
  localparam [88:1] WRITE_MODE_A_REG = WRITE_MODE_A;
  localparam [88:1] WRITE_MODE_B_REG = WRITE_MODE_B;
  localparam [4:0] WRITE_WIDTH_A_REG = WRITE_WIDTH_A;
  localparam [5:0] WRITE_WIDTH_B_REG = WRITE_WIDTH_B;
`endif

  wire [1:0] CASCADE_ORDER_A_BIN;
  wire [1:0] CASCADE_ORDER_B_BIN;
  wire CLOCK_DOMAINS_BIN;
  wire DOA_REG_BIN;
  wire DOB_REG_BIN;
  wire ENADDRENA_BIN;
  wire ENADDRENB_BIN;
  wire [255:0] INITP_BIN [0:7];
  wire [255:0] INIT_BIN [0:63];
  wire [17:0] INIT_A_BIN;
  wire [17:0] INIT_B_BIN;
  wire IS_CLKARDCLK_INVERTED_BIN;
  wire IS_CLKBWRCLK_INVERTED_BIN;
  wire IS_ENARDEN_INVERTED_BIN;
  wire IS_ENBWREN_INVERTED_BIN;
  wire IS_RSTRAMARSTRAM_INVERTED_BIN;
  wire IS_RSTRAMB_INVERTED_BIN;
  wire IS_RSTREGARSTREG_INVERTED_BIN;
  wire IS_RSTREGB_INVERTED_BIN;
  wire RDADDRCHANGEA_BIN;
  wire RDADDRCHANGEB_BIN;
  wire [5:0] READ_WIDTH_A_BIN;
  wire [5:0] READ_WIDTH_B_BIN;
  wire RSTREG_PRIORITY_A_BIN;
  wire RSTREG_PRIORITY_B_BIN;
  wire [1:0] SIM_COLLISION_CHECK_BIN;
  wire SLEEP_ASYNC_BIN;
  wire [17:0] SRVAL_A_BIN;
  wire [17:0] SRVAL_B_BIN;
  wire [1:0] WRITE_MODE_A_BIN;
  wire [1:0] WRITE_MODE_B_BIN;
  wire [6:0] WRITE_WIDTH_A_BIN;
  wire [6:0] WRITE_WIDTH_B_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;
  tri0 glblGSR = glbl.GSR || trig_attr;

  wire [15:0] CASDOUTA_out;
  wire [15:0] CASDOUTB_out;
  reg [15:0] DOUTADOUT_out;
  reg [15:0] DOUTBDOUT_out;
  wire [1:0] CASDOUTPA_out;
  wire [1:0] CASDOUTPB_out;
  reg [1:0] DOUTPADOUTP_out;
  reg [1:0] DOUTPBDOUTP_out;

  wire ADDRENA_in;
  wire ADDRENB_in;
  wire CASDIMUXA_in;
  wire CASDIMUXB_in;
  wire CASDOMUXA_in;
  wire CASDOMUXB_in;
  wire CASDOMUXEN_A_in;
  wire CASDOMUXEN_B_in;
  wire CASOREGIMUXA_in;
  wire CASOREGIMUXB_in;
  wire CASOREGIMUXEN_A_in;
  wire CASOREGIMUXEN_B_in;
  wire CLKARDCLK_in;
  wire CLKBWRCLK_in;
  wire ENARDEN_in;
  wire ENBWREN_in;
  wire REGCEAREGCE_in;
  wire REGCEB_in;
  wire RSTRAMARSTRAM_in;
  wire RSTRAMB_in;
  wire RSTREGARSTREG_in;
  wire RSTREGB_in;
  wire SLEEP_in;
  reg [13:0] ADDRARDADDR_in;
  reg [13:0] ADDRBWRADDR_in;
  wire [15:0] CASDINA_in;
  wire [15:0] CASDINB_in;
  reg [15:0] DINADIN_in;
  reg [15:0] DINBDIN_in;
  wire [1:0] CASDINPA_in;
  wire [1:0] CASDINPB_in;
  reg [1:0] DINPADINP_in;
  reg [1:0] DINPBDINP_in;
  wire [1:0] WEA_in;
  wire [3:0] WEBWE_in;

`ifdef XIL_TIMING
  wire ADDRENA_delay;
  wire ADDRENB_delay;
  wire CASDIMUXA_delay;
  wire CASDIMUXB_delay;
  wire CASDOMUXA_delay;
  wire CASDOMUXB_delay;
  wire CASDOMUXEN_A_delay;
  wire CASDOMUXEN_B_delay;
  wire CASOREGIMUXA_delay;
  wire CASOREGIMUXB_delay;
  wire CASOREGIMUXEN_A_delay;
  wire CASOREGIMUXEN_B_delay;
  wire CLKARDCLK_delay;
  wire CLKBWRCLK_delay;
  wire ENARDEN_delay;
  wire ENBWREN_delay;
  wire REGCEAREGCE_delay;
  wire REGCEB_delay;
  wire RSTRAMARSTRAM_delay;
  wire RSTRAMB_delay;
  wire RSTREGARSTREG_delay;
  wire RSTREGB_delay;
  wire SLEEP_delay;
  wire [13:0] ADDRARDADDR_delay;
  wire [13:0] ADDRBWRADDR_delay;
  wire [15:0] CASDINA_delay;
  wire [15:0] CASDINB_delay;
  wire [15:0] DINADIN_delay;
  wire [15:0] DINBDIN_delay;
  wire [1:0] CASDINPA_delay;
  wire [1:0] CASDINPB_delay;
  wire [1:0] DINPADINP_delay;
  wire [1:0] DINPBDINP_delay;
  wire [1:0] WEA_delay;
  wire [3:0] WEBWE_delay;
`endif

  assign CASDOUTA = CASDOUTA_out;
  assign CASDOUTB = CASDOUTB_out;
  assign CASDOUTPA = CASDOUTPA_out;
  assign CASDOUTPB = CASDOUTPB_out;
  assign DOUTADOUT = DOUTADOUT_out;
  assign DOUTBDOUT = DOUTBDOUT_out;
  assign DOUTPADOUTP = DOUTPADOUTP_out;
  assign DOUTPBDOUTP = DOUTPBDOUTP_out;

`ifdef XIL_TIMING
  reg notifier;
`endif

`ifdef XIL_TIMING
  always @ (*) ADDRARDADDR_in = ADDRARDADDR_delay;
  always @ (*) ADDRBWRADDR_in = ADDRBWRADDR_delay;
  assign ADDRENA_in = (ADDRENA === 1'bz) || ADDRENA_delay; // rv 1
  assign ADDRENB_in = (ADDRENB === 1'bz) || ADDRENB_delay; // rv 1
  assign CASDIMUXA_in = (CASDIMUXA !== 1'bz) && CASDIMUXA_delay; // rv 0
  assign CASDIMUXB_in = (CASDIMUXB !== 1'bz) && CASDIMUXB_delay; // rv 0
  assign CASDINA_in[0] = (CASDINA[0] !== 1'bz) && CASDINA_delay[0]; // rv 0
  assign CASDINA_in[10] = (CASDINA[10] !== 1'bz) && CASDINA_delay[10]; // rv 0
  assign CASDINA_in[11] = (CASDINA[11] !== 1'bz) && CASDINA_delay[11]; // rv 0
  assign CASDINA_in[12] = (CASDINA[12] !== 1'bz) && CASDINA_delay[12]; // rv 0
  assign CASDINA_in[13] = (CASDINA[13] !== 1'bz) && CASDINA_delay[13]; // rv 0
  assign CASDINA_in[14] = (CASDINA[14] !== 1'bz) && CASDINA_delay[14]; // rv 0
  assign CASDINA_in[15] = (CASDINA[15] !== 1'bz) && CASDINA_delay[15]; // rv 0
  assign CASDINA_in[1] = (CASDINA[1] !== 1'bz) && CASDINA_delay[1]; // rv 0
  assign CASDINA_in[2] = (CASDINA[2] !== 1'bz) && CASDINA_delay[2]; // rv 0
  assign CASDINA_in[3] = (CASDINA[3] !== 1'bz) && CASDINA_delay[3]; // rv 0
  assign CASDINA_in[4] = (CASDINA[4] !== 1'bz) && CASDINA_delay[4]; // rv 0
  assign CASDINA_in[5] = (CASDINA[5] !== 1'bz) && CASDINA_delay[5]; // rv 0
  assign CASDINA_in[6] = (CASDINA[6] !== 1'bz) && CASDINA_delay[6]; // rv 0
  assign CASDINA_in[7] = (CASDINA[7] !== 1'bz) && CASDINA_delay[7]; // rv 0
  assign CASDINA_in[8] = (CASDINA[8] !== 1'bz) && CASDINA_delay[8]; // rv 0
  assign CASDINA_in[9] = (CASDINA[9] !== 1'bz) && CASDINA_delay[9]; // rv 0
  assign CASDINB_in[0] = (CASDINB[0] !== 1'bz) && CASDINB_delay[0]; // rv 0
  assign CASDINB_in[10] = (CASDINB[10] !== 1'bz) && CASDINB_delay[10]; // rv 0
  assign CASDINB_in[11] = (CASDINB[11] !== 1'bz) && CASDINB_delay[11]; // rv 0
  assign CASDINB_in[12] = (CASDINB[12] !== 1'bz) && CASDINB_delay[12]; // rv 0
  assign CASDINB_in[13] = (CASDINB[13] !== 1'bz) && CASDINB_delay[13]; // rv 0
  assign CASDINB_in[14] = (CASDINB[14] !== 1'bz) && CASDINB_delay[14]; // rv 0
  assign CASDINB_in[15] = (CASDINB[15] !== 1'bz) && CASDINB_delay[15]; // rv 0
  assign CASDINB_in[1] = (CASDINB[1] !== 1'bz) && CASDINB_delay[1]; // rv 0
  assign CASDINB_in[2] = (CASDINB[2] !== 1'bz) && CASDINB_delay[2]; // rv 0
  assign CASDINB_in[3] = (CASDINB[3] !== 1'bz) && CASDINB_delay[3]; // rv 0
  assign CASDINB_in[4] = (CASDINB[4] !== 1'bz) && CASDINB_delay[4]; // rv 0
  assign CASDINB_in[5] = (CASDINB[5] !== 1'bz) && CASDINB_delay[5]; // rv 0
  assign CASDINB_in[6] = (CASDINB[6] !== 1'bz) && CASDINB_delay[6]; // rv 0
  assign CASDINB_in[7] = (CASDINB[7] !== 1'bz) && CASDINB_delay[7]; // rv 0
  assign CASDINB_in[8] = (CASDINB[8] !== 1'bz) && CASDINB_delay[8]; // rv 0
  assign CASDINB_in[9] = (CASDINB[9] !== 1'bz) && CASDINB_delay[9]; // rv 0
  assign CASDINPA_in[0] = (CASDINPA[0] !== 1'bz) && CASDINPA_delay[0]; // rv 0
  assign CASDINPA_in[1] = (CASDINPA[1] !== 1'bz) && CASDINPA_delay[1]; // rv 0
  assign CASDINPB_in[0] = (CASDINPB[0] !== 1'bz) && CASDINPB_delay[0]; // rv 0
  assign CASDINPB_in[1] = (CASDINPB[1] !== 1'bz) && CASDINPB_delay[1]; // rv 0
  assign CASDOMUXA_in = (CASDOMUXA !== 1'bz) && CASDOMUXA_delay; // rv 0
  assign CASDOMUXB_in = (CASDOMUXB !== 1'bz) && CASDOMUXB_delay; // rv 0
  assign CASDOMUXEN_A_in = (CASDOMUXEN_A === 1'bz) || CASDOMUXEN_A_delay; // rv 1
  assign CASDOMUXEN_B_in = (CASDOMUXEN_B === 1'bz) || CASDOMUXEN_B_delay; // rv 1
  assign CASOREGIMUXA_in = (CASOREGIMUXA !== 1'bz) && CASOREGIMUXA_delay; // rv 0
  assign CASOREGIMUXB_in = (CASOREGIMUXB !== 1'bz) && CASOREGIMUXB_delay; // rv 0
  assign CASOREGIMUXEN_A_in = (CASOREGIMUXEN_A === 1'bz) || CASOREGIMUXEN_A_delay; // rv 1
  assign CASOREGIMUXEN_B_in = (CASOREGIMUXEN_B === 1'bz) || CASOREGIMUXEN_B_delay; // rv 1
  assign CLKARDCLK_in = (CLKARDCLK !== 1'bz) && (CLKARDCLK_delay ^ IS_CLKARDCLK_INVERTED_BIN); // rv 0
  assign CLKBWRCLK_in = (CLKBWRCLK !== 1'bz) && (CLKBWRCLK_delay ^ IS_CLKBWRCLK_INVERTED_BIN); // rv 0
  always @ (*) DINADIN_in = DINADIN_delay;
  always @ (*) DINBDIN_in = DINBDIN_delay;
  always @ (*) DINPADINP_in = DINPADINP_delay;
  always @ (*) DINPBDINP_in = DINPBDINP_delay;
  assign ENARDEN_in = (ENARDEN !== 1'bz) && (ENARDEN_delay ^ IS_ENARDEN_INVERTED_BIN); // rv 0
  assign ENBWREN_in = (ENBWREN !== 1'bz) && (ENBWREN_delay ^ IS_ENBWREN_INVERTED_BIN); // rv 0
  assign REGCEAREGCE_in = (REGCEAREGCE === 1'bz) || REGCEAREGCE_delay; // rv 1
  assign REGCEB_in = (REGCEB === 1'bz) || REGCEB_delay; // rv 1
  assign RSTRAMARSTRAM_in = (RSTRAMARSTRAM !== 1'bz) && (RSTRAMARSTRAM_delay ^ IS_RSTRAMARSTRAM_INVERTED_BIN); // rv 0
  assign RSTRAMB_in = (RSTRAMB !== 1'bz) && (RSTRAMB_delay ^ IS_RSTRAMB_INVERTED_BIN); // rv 0
  assign RSTREGARSTREG_in = (RSTREGARSTREG !== 1'bz) && (RSTREGARSTREG_delay ^ IS_RSTREGARSTREG_INVERTED_BIN); // rv 0
  assign RSTREGB_in = (RSTREGB !== 1'bz) && (RSTREGB_delay ^ IS_RSTREGB_INVERTED_BIN); // rv 0
  assign SLEEP_in = (SLEEP !== 1'bz) && SLEEP_delay; // rv 0
  assign WEA_in[0] = (WEA[0] === 1'bz) || WEA_delay[0]; // rv 1
  assign WEA_in[1] = (WEA[1] === 1'bz) || WEA_delay[1]; // rv 1
  assign WEBWE_in[0] = (WEBWE[0] === 1'bz) || WEBWE_delay[0]; // rv 1
  assign WEBWE_in[1] = (WEBWE[1] === 1'bz) || WEBWE_delay[1]; // rv 1
  assign WEBWE_in[2] = (WEBWE[2] === 1'bz) || WEBWE_delay[2]; // rv 1
  assign WEBWE_in[3] = (WEBWE[3] === 1'bz) || WEBWE_delay[3]; // rv 1
`else
  always @ (*) ADDRARDADDR_in = ADDRARDADDR;
  always @ (*) ADDRBWRADDR_in = ADDRBWRADDR;
  assign ADDRENA_in = (ADDRENA === 1'bz) || ADDRENA; // rv 1
  assign ADDRENB_in = (ADDRENB === 1'bz) || ADDRENB; // rv 1
  assign CASDIMUXA_in = (CASDIMUXA !== 1'bz) && CASDIMUXA; // rv 0
  assign CASDIMUXB_in = (CASDIMUXB !== 1'bz) && CASDIMUXB; // rv 0
  assign CASDINA_in[0] = (CASDINA[0] !== 1'bz) && CASDINA[0]; // rv 0
  assign CASDINA_in[10] = (CASDINA[10] !== 1'bz) && CASDINA[10]; // rv 0
  assign CASDINA_in[11] = (CASDINA[11] !== 1'bz) && CASDINA[11]; // rv 0
  assign CASDINA_in[12] = (CASDINA[12] !== 1'bz) && CASDINA[12]; // rv 0
  assign CASDINA_in[13] = (CASDINA[13] !== 1'bz) && CASDINA[13]; // rv 0
  assign CASDINA_in[14] = (CASDINA[14] !== 1'bz) && CASDINA[14]; // rv 0
  assign CASDINA_in[15] = (CASDINA[15] !== 1'bz) && CASDINA[15]; // rv 0
  assign CASDINA_in[1] = (CASDINA[1] !== 1'bz) && CASDINA[1]; // rv 0
  assign CASDINA_in[2] = (CASDINA[2] !== 1'bz) && CASDINA[2]; // rv 0
  assign CASDINA_in[3] = (CASDINA[3] !== 1'bz) && CASDINA[3]; // rv 0
  assign CASDINA_in[4] = (CASDINA[4] !== 1'bz) && CASDINA[4]; // rv 0
  assign CASDINA_in[5] = (CASDINA[5] !== 1'bz) && CASDINA[5]; // rv 0
  assign CASDINA_in[6] = (CASDINA[6] !== 1'bz) && CASDINA[6]; // rv 0
  assign CASDINA_in[7] = (CASDINA[7] !== 1'bz) && CASDINA[7]; // rv 0
  assign CASDINA_in[8] = (CASDINA[8] !== 1'bz) && CASDINA[8]; // rv 0
  assign CASDINA_in[9] = (CASDINA[9] !== 1'bz) && CASDINA[9]; // rv 0
  assign CASDINB_in[0] = (CASDINB[0] !== 1'bz) && CASDINB[0]; // rv 0
  assign CASDINB_in[10] = (CASDINB[10] !== 1'bz) && CASDINB[10]; // rv 0
  assign CASDINB_in[11] = (CASDINB[11] !== 1'bz) && CASDINB[11]; // rv 0
  assign CASDINB_in[12] = (CASDINB[12] !== 1'bz) && CASDINB[12]; // rv 0
  assign CASDINB_in[13] = (CASDINB[13] !== 1'bz) && CASDINB[13]; // rv 0
  assign CASDINB_in[14] = (CASDINB[14] !== 1'bz) && CASDINB[14]; // rv 0
  assign CASDINB_in[15] = (CASDINB[15] !== 1'bz) && CASDINB[15]; // rv 0
  assign CASDINB_in[1] = (CASDINB[1] !== 1'bz) && CASDINB[1]; // rv 0
  assign CASDINB_in[2] = (CASDINB[2] !== 1'bz) && CASDINB[2]; // rv 0
  assign CASDINB_in[3] = (CASDINB[3] !== 1'bz) && CASDINB[3]; // rv 0
  assign CASDINB_in[4] = (CASDINB[4] !== 1'bz) && CASDINB[4]; // rv 0
  assign CASDINB_in[5] = (CASDINB[5] !== 1'bz) && CASDINB[5]; // rv 0
  assign CASDINB_in[6] = (CASDINB[6] !== 1'bz) && CASDINB[6]; // rv 0
  assign CASDINB_in[7] = (CASDINB[7] !== 1'bz) && CASDINB[7]; // rv 0
  assign CASDINB_in[8] = (CASDINB[8] !== 1'bz) && CASDINB[8]; // rv 0
  assign CASDINB_in[9] = (CASDINB[9] !== 1'bz) && CASDINB[9]; // rv 0
  assign CASDINPA_in[0] = (CASDINPA[0] !== 1'bz) && CASDINPA[0]; // rv 0
  assign CASDINPA_in[1] = (CASDINPA[1] !== 1'bz) && CASDINPA[1]; // rv 0
  assign CASDINPB_in[0] = (CASDINPB[0] !== 1'bz) && CASDINPB[0]; // rv 0
  assign CASDINPB_in[1] = (CASDINPB[1] !== 1'bz) && CASDINPB[1]; // rv 0
  assign CASDOMUXA_in = (CASDOMUXA !== 1'bz) && CASDOMUXA; // rv 0
  assign CASDOMUXB_in = (CASDOMUXB !== 1'bz) && CASDOMUXB; // rv 0
  assign CASDOMUXEN_A_in = (CASDOMUXEN_A === 1'bz) || CASDOMUXEN_A; // rv 1
  assign CASDOMUXEN_B_in = (CASDOMUXEN_B === 1'bz) || CASDOMUXEN_B; // rv 1
  assign CASOREGIMUXA_in = (CASOREGIMUXA !== 1'bz) && CASOREGIMUXA; // rv 0
  assign CASOREGIMUXB_in = (CASOREGIMUXB !== 1'bz) && CASOREGIMUXB; // rv 0
  assign CASOREGIMUXEN_A_in = (CASOREGIMUXEN_A === 1'bz) || CASOREGIMUXEN_A; // rv 1
  assign CASOREGIMUXEN_B_in = (CASOREGIMUXEN_B === 1'bz) || CASOREGIMUXEN_B; // rv 1
  assign CLKARDCLK_in = (CLKARDCLK !== 1'bz) && (CLKARDCLK ^ IS_CLKARDCLK_INVERTED_BIN); // rv 0
  assign CLKBWRCLK_in = (CLKBWRCLK !== 1'bz) && (CLKBWRCLK ^ IS_CLKBWRCLK_INVERTED_BIN); // rv 0
//  always @ (CLKARDCLK) begin
//    if ((CLKARDCLK === 1'bz) || // rv 0
//        (CLKARDCLK === IS_CLKARDCLK_INVERTED_BIN)) CLKARDCLK_in = 1'b0;
//    else  CLKARDCLK_in = 1'b1;
//  end
//  always @ (CLKBWRCLK) begin
//    if ((CLKBWRCLK === 1'bz) || // rv 0
//        (CLKBWRCLK === IS_CLKBWRCLK_INVERTED_BIN)) CLKBWRCLK_in = 1'b0;
//    else  CLKBWRCLK_in = 1'b1;
//  end
  always @ (*) DINADIN_in = DINADIN;
  always @ (*) DINBDIN_in = DINBDIN;
  always @ (*) DINPADINP_in = DINPADINP;
  always @ (*) DINPBDINP_in = DINPBDINP;
  assign ENARDEN_in = (ENARDEN !== 1'bz) && (ENARDEN ^ IS_ENARDEN_INVERTED_BIN); // rv 0
  assign ENBWREN_in = (ENBWREN !== 1'bz) && (ENBWREN ^ IS_ENBWREN_INVERTED_BIN); // rv 0
  assign REGCEAREGCE_in = (REGCEAREGCE === 1'bz) || REGCEAREGCE; // rv 1
  assign REGCEB_in = (REGCEB === 1'bz) || REGCEB; // rv 1
  assign RSTRAMARSTRAM_in = (RSTRAMARSTRAM !== 1'bz) && (RSTRAMARSTRAM ^ IS_RSTRAMARSTRAM_INVERTED_BIN); // rv 0
  assign RSTRAMB_in = (RSTRAMB !== 1'bz) && (RSTRAMB ^ IS_RSTRAMB_INVERTED_BIN); // rv 0
  assign RSTREGARSTREG_in = (RSTREGARSTREG !== 1'bz) && (RSTREGARSTREG ^ IS_RSTREGARSTREG_INVERTED_BIN); // rv 0
  assign RSTREGB_in = (RSTREGB !== 1'bz) && (RSTREGB ^ IS_RSTREGB_INVERTED_BIN); // rv 0
  assign SLEEP_in = (SLEEP !== 1'bz) && SLEEP; // rv 0
  assign WEA_in[0] = (WEA[0] === 1'bz) || WEA[0]; // rv 1
  assign WEA_in[1] = (WEA[1] === 1'bz) || WEA[1]; // rv 1
  assign WEBWE_in[0] = (WEBWE[0] === 1'bz) || WEBWE[0]; // rv 1
  assign WEBWE_in[1] = (WEBWE[1] === 1'bz) || WEBWE[1]; // rv 1
  assign WEBWE_in[2] = (WEBWE[2] === 1'bz) || WEBWE[2]; // rv 1
  assign WEBWE_in[3] = (WEBWE[3] === 1'bz) || WEBWE[3]; // rv 1
`endif

// internal variables, signals, busses
  localparam integer ADDR_WIDTH = 14;
  localparam integer INIT_WIDTH = 36;
  localparam integer D_WIDTH = 32;
  localparam integer DP_WIDTH = 4;

  localparam mem_width = 1;
  localparam memp_width = 1;
  localparam mem_depth = 16384+32;
  localparam memp_depth = 2048+4;
  integer t_coll_min = 50;
  integer t_coll_max = 3000 - 49;
  reg [255:0] INITP_TMP;
  reg [255:0] INIT_TMP;
  integer i=0;
  integer j=0;
  integer k=0;
  integer ra=0;
  integer raa=0;
  integer raw=0;
  integer wb=0;
  integer rb=0;
  integer rbb=0;
  integer rbw=0;
  integer wa=0;
  integer rd_loops_a = 1;
  integer wr_loops_a = 1;
  integer rd_loops_b = 1;
  integer rd_loops_f = 1;
  integer wr_loops_b = 1;
  localparam max_rd_loops = D_WIDTH;
  localparam max_wr_loops = D_WIDTH;
  reg INIT_MEM = 0;
  wire SLEEP_int;
  reg  SLEEP_reg = 1'b0;
  reg  SLEEP_reg1 = 1'b0;
  wire RSTREG_A_int;
  wire REGCE_A_int;
  wire ADDRENA_int;
  wire ADDRENB_int;
  wire RSTREG_B_int;
  wire REGCE_B_int;
  reg CASDOMUXA_reg = 1'b0;
  reg CASOREGIMUXA_reg = 1'b0;
  reg CASDOMUXB_reg = 1'b0;
  reg CASOREGIMUXB_reg = 1'b0;
  wire CASDOMUXB_int;
  wire [INIT_WIDTH-1:0] INIT_A_int;
  wire [INIT_WIDTH-1:0] SRVAL_A_int;
  wire [INIT_WIDTH/2-1:0] INIT_B_int;
  wire [INIT_WIDTH/2-1:0] SRVAL_B_int;

  wire mem_wr_en_a;
  reg mem_wr_en_a_wf = 1'b0;
  reg [D_WIDTH/2-1:0] mem_we_a;
  reg [DP_WIDTH/2-1:0] memp_we_a;
  wire [D_WIDTH/2-1:0] mem_rm_doutb;
  wire [DP_WIDTH/2-1:0] memp_rm_doutb;
  wire [D_WIDTH-1:0] mem_rm_a;
  wire [D_WIDTH-1:0] mem_rm_b;
  wire [D_WIDTH-1:0] mem_wm_a;
  wire [D_WIDTH-1:0] mem_wm_b;
  reg wr_data_matches = 0;
  reg wr_a_data_matches_rd_b_data = 0;
  reg wr_b_data_matches_rd_a_data = 0;
  wire mem_wr_en_b;
  reg mem_wr_en_b_wf = 1'b0;
  reg [D_WIDTH-1:0] mem_we_b;
  reg [DP_WIDTH-1:0] memp_we_b;
  wire [D_WIDTH-1:0] mem_rm_douta;
  wire [DP_WIDTH-1:0] memp_rm_douta;
  wire mem_rd_en_a;
  wire mem_rst_a;
  wire mem_rd_en_b;
  wire mem_rst_b;

  reg                     mem      [0 : mem_depth-1];
  reg [D_WIDTH/2-1 : 0]  mem_wr_a;
  reg  wr_a_event = 1'b0;
  reg  wr_a_wf_event = 1'b0;
  reg  [D_WIDTH-1 : 0]  ram_rd_a;
  reg  [D_WIDTH-1 : 0]  mem_rd_a_wf;
  reg [D_WIDTH-1 : 0]  mem_wr_b;
  reg  wr_b_event = 1'b0;
  reg  wr_b_wf_event = 1'b0;
  reg  [D_WIDTH-1 : 0]  mem_rd_b;
  reg  [D_WIDTH-1 : 0]  mem_rd_b_rf;
  reg  [D_WIDTH-1 : 0]  mem_rd_b_wf;
  reg  [D_WIDTH-1 : 0]  mem_a_reg;
  reg [D_WIDTH-1 : 0]  mem_a_reg_mux;
  reg  [D_WIDTH-1 : 0]  mem_a_lat;
  reg  [D_WIDTH/2-1 : 0]  mem_b_reg;
  reg [D_WIDTH/2-1 : 0]  mem_b_reg_mux;
  reg  [D_WIDTH/2-1 : 0]  mem_b_lat;
  reg                     memp     [0 : memp_depth - 1];
  reg [DP_WIDTH-1 : 0] memp_wr_a;
  reg  [DP_WIDTH-1 : 0] ramp_rd_a;
  reg  [DP_WIDTH-1 : 0] memp_rd_a_wf;
  reg [DP_WIDTH-1 : 0] memp_wr_b;
  reg  [DP_WIDTH-1 : 0] memp_rd_b;
  reg  [DP_WIDTH-1 : 0] memp_rd_b_rf;
  reg  [DP_WIDTH-1 : 0] memp_rd_b_wf;
  reg  [DP_WIDTH-1 : 0]  memp_a_reg;
  reg [DP_WIDTH-1 : 0]  memp_a_reg_mux;
  reg  [DP_WIDTH-1 : 0]  memp_a_lat;
  reg [DP_WIDTH-1 : 0]  memp_a_out;
  reg  [DP_WIDTH/2-1 : 0]  memp_b_reg;
  reg [DP_WIDTH/2-1 : 0]  memp_b_reg_mux;
  reg  [DP_WIDTH/2-1 : 0]  memp_b_lat;
  reg [DP_WIDTH/2-1 : 0]  memp_b_out;
  wire [ADDR_WIDTH-1:0] rd_addr_a_mask;
  wire [ADDR_WIDTH-1:0] rd_addr_b_mask;
  wire [ADDR_WIDTH-1:0] wr_addr_a_mask;
  wire [ADDR_WIDTH-1:0] wr_addr_b_mask;
  reg [ADDR_WIDTH-1:0] rd_addr_a = 0;
  reg [ADDR_WIDTH-1:0] rd_addr_b = 0;
  reg [ADDR_WIDTH-1:0] wr_addr_a = 0;
  reg [ADDR_WIDTH-1:0] wr_addr_b = 0;
  reg wr_a_rd_b_addr_coll = 1'b0;
  reg wr_addr_coll = 1'b0;
  reg wr_b_rd_a_addr_coll = 1'b0;
  wire sdp_mode;
  wire sdp_mode_wr;
  wire sdp_mode_rd;

// clk period for collision window variables
integer t_max_a=3000, t_max_b=3000;
reg clka_toggled=1'b0, clkb_toggled=1'b0;
reg clka_done=1'b0, clkb_done=1'b0;
reg clka_timeout=0, clkb_timeout=0;
wire clks_done;
reg en_clk_sync = 1'b0;

  assign mem_rst_a = RSTRAMARSTRAM_in;
  assign mem_rst_b = sdp_mode ? RSTRAMARSTRAM_in : RSTRAMB_in;
  always @ (*) begin
    if (((CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_LAST) ||
         (CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_MIDDLE)) && CASDIMUXA_in)
       mem_wr_a = {16'h0, CASDINA_in};
    else
       mem_wr_a = {16'h0, DINADIN_in};
  end
  always @ (*) begin
    if (((CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_LAST) ||
         (CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_MIDDLE)) && CASDIMUXA_in)
       memp_wr_a = {2'b0, CASDINPA_in};
    else
       memp_wr_a = {2'b0, DINPADINP_in};
  end
  always @ (*) begin
    if (WRITE_WIDTH_B_BIN != WRITE_WIDTH_B_36) begin
      if (((CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_LAST) ||
           (CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_MIDDLE)) && CASDIMUXB_in) begin
        mem_wr_b = {16'h0, CASDINB_in};
        memp_wr_b = {4'h0, CASDINPB_in};
        end
      else begin
        mem_wr_b = {16'h0, DINBDIN_in};
        memp_wr_b = {4'h0, DINPBDINP_in};
        end
      end
    else begin
      if (((CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_LAST) ||
           (CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_MIDDLE)) && CASDIMUXB_in) begin
        mem_wr_b = {CASDINB_in, CASDINA_in};
        memp_wr_b = {CASDINPB_in, CASDINPA_in};
        end
      else begin
        mem_wr_b = {DINBDIN_in, DINADIN_in};
        memp_wr_b = {DINPBDINP_in, DINPADINP_in};
        end
    end
  end

  assign mem_wr_en_a = ~sdp_mode && ENARDEN_in && |WEA_in;
  assign mem_rd_en_a = (WRITE_MODE_A_BIN == WRITE_MODE_A_NO_CHANGE) ?
                        ENARDEN_in && (~mem_wr_en_a || mem_rst_a) : ENARDEN_in;
  assign mem_wr_en_b = ENBWREN_in && (sdp_mode ? |WEBWE_in : |WEBWE_in[DP_WIDTH/2-1:0]);
  assign mem_rd_en_b = (WRITE_MODE_B_BIN == WRITE_MODE_B_NO_CHANGE) ?
                        ~sdp_mode && ENBWREN_in && (~mem_wr_en_b || mem_rst_b) :
                        ~sdp_mode && ENBWREN_in;


  assign CASCADE_ORDER_A_BIN =
    (CASCADE_ORDER_A_REG == "NONE") ? CASCADE_ORDER_A_NONE :
    (CASCADE_ORDER_A_REG == "FIRST") ? CASCADE_ORDER_A_FIRST :
    (CASCADE_ORDER_A_REG == "LAST") ? CASCADE_ORDER_A_LAST :
    (CASCADE_ORDER_A_REG == "MIDDLE") ? CASCADE_ORDER_A_MIDDLE :
     CASCADE_ORDER_A_NONE;

  assign CASCADE_ORDER_B_BIN =
    (CASCADE_ORDER_B_REG == "NONE") ? CASCADE_ORDER_B_NONE :
    (CASCADE_ORDER_B_REG == "FIRST") ? CASCADE_ORDER_B_FIRST :
    (CASCADE_ORDER_B_REG == "LAST") ? CASCADE_ORDER_B_LAST :
    (CASCADE_ORDER_B_REG == "MIDDLE") ? CASCADE_ORDER_B_MIDDLE :
     CASCADE_ORDER_B_NONE;

  assign CLOCK_DOMAINS_BIN =
    (CLOCK_DOMAINS_REG == "INDEPENDENT") ? CLOCK_DOMAINS_INDEPENDENT :
    (CLOCK_DOMAINS_REG == "COMMON") ? CLOCK_DOMAINS_COMMON :
     CLOCK_DOMAINS_INDEPENDENT;

  assign DOA_REG_BIN =
    (DOA_REG_REG == 1) ? DOA_REG_1 :
    (DOA_REG_REG == 0) ? DOA_REG_0 :
     DOA_REG_1;

  assign DOB_REG_BIN =
    (DOB_REG_REG == 1) ? DOB_REG_1 :
    (DOB_REG_REG == 0) ? DOB_REG_0 :
     DOB_REG_1;

  assign ENADDRENA_BIN =
    (ENADDRENA_REG == "FALSE") ? ENADDRENA_FALSE :
    (ENADDRENA_REG == "TRUE") ? ENADDRENA_TRUE :
     ENADDRENA_FALSE;

  assign ENADDRENB_BIN =
    (ENADDRENB_REG == "FALSE") ? ENADDRENB_FALSE :
    (ENADDRENB_REG == "TRUE") ? ENADDRENB_TRUE :
     ENADDRENB_FALSE;

  assign INITP_BIN['h00] = INITP_00_REG;

  assign INITP_BIN['h01] = INITP_01_REG;

  assign INITP_BIN['h02] = INITP_02_REG;

  assign INITP_BIN['h03] = INITP_03_REG;

  assign INITP_BIN['h04] = INITP_04_REG;

  assign INITP_BIN['h05] = INITP_05_REG;

  assign INITP_BIN['h06] = INITP_06_REG;

  assign INITP_BIN['h07] = INITP_07_REG;

  assign INIT_BIN['h00] = INIT_00_REG;

  assign INIT_BIN['h01] = INIT_01_REG;

  assign INIT_BIN['h02] = INIT_02_REG;

  assign INIT_BIN['h03] = INIT_03_REG;

  assign INIT_BIN['h04] = INIT_04_REG;

  assign INIT_BIN['h05] = INIT_05_REG;

  assign INIT_BIN['h06] = INIT_06_REG;

  assign INIT_BIN['h07] = INIT_07_REG;

  assign INIT_BIN['h08] = INIT_08_REG;

  assign INIT_BIN['h09] = INIT_09_REG;

  assign INIT_BIN['h0A] = INIT_0A_REG;

  assign INIT_BIN['h0B] = INIT_0B_REG;

  assign INIT_BIN['h0C] = INIT_0C_REG;

  assign INIT_BIN['h0D] = INIT_0D_REG;

  assign INIT_BIN['h0E] = INIT_0E_REG;

  assign INIT_BIN['h0F] = INIT_0F_REG;

  assign INIT_BIN['h10] = INIT_10_REG;

  assign INIT_BIN['h11] = INIT_11_REG;

  assign INIT_BIN['h12] = INIT_12_REG;

  assign INIT_BIN['h13] = INIT_13_REG;

  assign INIT_BIN['h14] = INIT_14_REG;

  assign INIT_BIN['h15] = INIT_15_REG;

  assign INIT_BIN['h16] = INIT_16_REG;

  assign INIT_BIN['h17] = INIT_17_REG;

  assign INIT_BIN['h18] = INIT_18_REG;

  assign INIT_BIN['h19] = INIT_19_REG;

  assign INIT_BIN['h1A] = INIT_1A_REG;

  assign INIT_BIN['h1B] = INIT_1B_REG;

  assign INIT_BIN['h1C] = INIT_1C_REG;

  assign INIT_BIN['h1D] = INIT_1D_REG;

  assign INIT_BIN['h1E] = INIT_1E_REG;

  assign INIT_BIN['h1F] = INIT_1F_REG;

  assign INIT_BIN['h20] = INIT_20_REG;

  assign INIT_BIN['h21] = INIT_21_REG;

  assign INIT_BIN['h22] = INIT_22_REG;

  assign INIT_BIN['h23] = INIT_23_REG;

  assign INIT_BIN['h24] = INIT_24_REG;

  assign INIT_BIN['h25] = INIT_25_REG;

  assign INIT_BIN['h26] = INIT_26_REG;

  assign INIT_BIN['h27] = INIT_27_REG;

  assign INIT_BIN['h28] = INIT_28_REG;

  assign INIT_BIN['h29] = INIT_29_REG;

  assign INIT_BIN['h2A] = INIT_2A_REG;

  assign INIT_BIN['h2B] = INIT_2B_REG;

  assign INIT_BIN['h2C] = INIT_2C_REG;

  assign INIT_BIN['h2D] = INIT_2D_REG;

  assign INIT_BIN['h2E] = INIT_2E_REG;

  assign INIT_BIN['h2F] = INIT_2F_REG;

  assign INIT_BIN['h30] = INIT_30_REG;

  assign INIT_BIN['h31] = INIT_31_REG;

  assign INIT_BIN['h32] = INIT_32_REG;

  assign INIT_BIN['h33] = INIT_33_REG;

  assign INIT_BIN['h34] = INIT_34_REG;

  assign INIT_BIN['h35] = INIT_35_REG;

  assign INIT_BIN['h36] = INIT_36_REG;

  assign INIT_BIN['h37] = INIT_37_REG;

  assign INIT_BIN['h38] = INIT_38_REG;

  assign INIT_BIN['h39] = INIT_39_REG;

  assign INIT_BIN['h3A] = INIT_3A_REG;

  assign INIT_BIN['h3B] = INIT_3B_REG;

  assign INIT_BIN['h3C] = INIT_3C_REG;

  assign INIT_BIN['h3D] = INIT_3D_REG;

  assign INIT_BIN['h3E] = INIT_3E_REG;

  assign INIT_BIN['h3F] = INIT_3F_REG;

  assign INIT_A_BIN = INIT_A_REG;

  assign INIT_B_BIN = INIT_B_REG;

//  assign INIT_FILE_BIN =
//    (INIT_FILE_REG == "NONE") ? INIT_FILE_NONE :
//    INIT_FILE_NONE;

  assign IS_CLKARDCLK_INVERTED_BIN = IS_CLKARDCLK_INVERTED_REG;

  assign IS_CLKBWRCLK_INVERTED_BIN = IS_CLKBWRCLK_INVERTED_REG;

  assign IS_ENARDEN_INVERTED_BIN = IS_ENARDEN_INVERTED_REG;

  assign IS_ENBWREN_INVERTED_BIN = IS_ENBWREN_INVERTED_REG;

  assign IS_RSTRAMARSTRAM_INVERTED_BIN = IS_RSTRAMARSTRAM_INVERTED_REG;

  assign IS_RSTRAMB_INVERTED_BIN = IS_RSTRAMB_INVERTED_REG;

  assign IS_RSTREGARSTREG_INVERTED_BIN = IS_RSTREGARSTREG_INVERTED_REG;

  assign IS_RSTREGB_INVERTED_BIN = IS_RSTREGB_INVERTED_REG;

  assign RDADDRCHANGEA_BIN =
    (RDADDRCHANGEA_REG == "FALSE") ? RDADDRCHANGEA_FALSE :
    (RDADDRCHANGEA_REG == "TRUE") ? RDADDRCHANGEA_TRUE :
     RDADDRCHANGEA_FALSE;

  assign RDADDRCHANGEB_BIN =
    (RDADDRCHANGEB_REG == "FALSE") ? RDADDRCHANGEB_FALSE :
    (RDADDRCHANGEB_REG == "TRUE") ? RDADDRCHANGEB_TRUE :
     RDADDRCHANGEB_FALSE;

  assign READ_WIDTH_A_BIN =
    (READ_WIDTH_A_REG == 0) ? READ_WIDTH_A_0 :
    (READ_WIDTH_A_REG == 1) ? READ_WIDTH_A_1 :
    (READ_WIDTH_A_REG == 2) ? READ_WIDTH_A_2 :
    (READ_WIDTH_A_REG == 4) ? READ_WIDTH_A_4 :
    (READ_WIDTH_A_REG == 9) ? READ_WIDTH_A_9 :
    (READ_WIDTH_A_REG == 18) ? READ_WIDTH_A_18 :
    (READ_WIDTH_A_REG == 36) ? READ_WIDTH_A_36 :
     READ_WIDTH_A_0;

  assign READ_WIDTH_B_BIN =
    (READ_WIDTH_B_REG == 0) ? READ_WIDTH_B_0 :
    (READ_WIDTH_B_REG == 1) ? READ_WIDTH_B_1 :
    (READ_WIDTH_B_REG == 2) ? READ_WIDTH_B_2 :
    (READ_WIDTH_B_REG == 4) ? READ_WIDTH_B_4 :
    (READ_WIDTH_B_REG == 9) ? READ_WIDTH_B_9 :
    (READ_WIDTH_B_REG == 18) ? READ_WIDTH_B_18 :
     READ_WIDTH_B_0;

  assign RSTREG_PRIORITY_A_BIN =
    (RSTREG_PRIORITY_A_REG == "RSTREG") ? RSTREG_PRIORITY_A_RSTREG :
    (RSTREG_PRIORITY_A_REG == "REGCE") ? RSTREG_PRIORITY_A_REGCE :
     RSTREG_PRIORITY_A_RSTREG;

  assign RSTREG_PRIORITY_B_BIN =
    (RSTREG_PRIORITY_B_REG == "RSTREG") ? RSTREG_PRIORITY_B_RSTREG :
    (RSTREG_PRIORITY_B_REG == "REGCE") ? RSTREG_PRIORITY_B_REGCE :
     RSTREG_PRIORITY_B_RSTREG;

  assign SIM_COLLISION_CHECK_BIN =
    (SIM_COLLISION_CHECK_REG == "ALL") ? SIM_COLLISION_CHECK_ALL :
    (SIM_COLLISION_CHECK_REG == "GENERATE_X_ONLY") ? SIM_COLLISION_CHECK_GENERATE_X_ONLY :
    (SIM_COLLISION_CHECK_REG == "NONE") ? SIM_COLLISION_CHECK_NONE :
    (SIM_COLLISION_CHECK_REG == "WARNING_ONLY") ? SIM_COLLISION_CHECK_WARNING_ONLY :
     SIM_COLLISION_CHECK_ALL;

  assign SLEEP_ASYNC_BIN =
    (SLEEP_ASYNC_REG == "FALSE") ? SLEEP_ASYNC_FALSE :
    (SLEEP_ASYNC_REG == "TRUE") ? SLEEP_ASYNC_TRUE :
     SLEEP_ASYNC_FALSE;

  assign SRVAL_A_BIN = SRVAL_A_REG;

  assign SRVAL_B_BIN = SRVAL_B_REG;

  assign WRITE_MODE_A_BIN =
    (WRITE_MODE_A_REG == "NO_CHANGE") ? WRITE_MODE_A_NO_CHANGE :
    (WRITE_MODE_A_REG == "READ_FIRST") ? WRITE_MODE_A_READ_FIRST :
    (WRITE_MODE_A_REG == "WRITE_FIRST") ? WRITE_MODE_A_WRITE_FIRST :
     WRITE_MODE_A_NO_CHANGE;

  assign WRITE_MODE_B_BIN =
    (WRITE_MODE_B_REG == "NO_CHANGE") ? WRITE_MODE_B_NO_CHANGE :
    (WRITE_MODE_B_REG == "READ_FIRST") ? WRITE_MODE_B_READ_FIRST :
    (WRITE_MODE_B_REG == "WRITE_FIRST") ? WRITE_MODE_B_WRITE_FIRST :
     WRITE_MODE_B_NO_CHANGE;

  assign WRITE_WIDTH_A_BIN =
    (WRITE_WIDTH_A_REG == 0) ? WRITE_WIDTH_A_0 :
    (WRITE_WIDTH_A_REG == 1) ? WRITE_WIDTH_A_1 :
    (WRITE_WIDTH_A_REG == 2) ? WRITE_WIDTH_A_2 :
    (WRITE_WIDTH_A_REG == 4) ? WRITE_WIDTH_A_4 :
    (WRITE_WIDTH_A_REG == 9) ? WRITE_WIDTH_A_9 :
    (WRITE_WIDTH_A_REG == 18) ? WRITE_WIDTH_A_18 :
     WRITE_WIDTH_A_0;

  assign WRITE_WIDTH_B_BIN =
    (WRITE_WIDTH_B_REG == 0) ? WRITE_WIDTH_B_0 :
    (WRITE_WIDTH_B_REG == 1) ? WRITE_WIDTH_B_1 :
    (WRITE_WIDTH_B_REG == 2) ? WRITE_WIDTH_B_2 :
    (WRITE_WIDTH_B_REG == 4) ? WRITE_WIDTH_B_4 :
    (WRITE_WIDTH_B_REG == 9) ? WRITE_WIDTH_B_9 :
    (WRITE_WIDTH_B_REG == 18) ? WRITE_WIDTH_B_18 :
    (WRITE_WIDTH_B_REG == 36) ? WRITE_WIDTH_B_36 :
     WRITE_WIDTH_B_0;

  initial begin
    #1;
    trig_attr = 1'b1;
    #100;
    trig_attr = 1'b0;
  end

  always @ (posedge trig_attr) begin
    if ((attr_test == 1'b1) ||
        ((CASCADE_ORDER_A_REG != "NONE") &&
         (CASCADE_ORDER_A_REG != "FIRST") &&
         (CASCADE_ORDER_A_REG != "LAST") &&
         (CASCADE_ORDER_A_REG != "MIDDLE"))) begin
      $display("Error: [Unisim %s-101] CASCADE_ORDER_A attribute is set to %s.  Legal values for this attribute are NONE, FIRST, LAST or MIDDLE. Instance: %m", MODULE_NAME, CASCADE_ORDER_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CASCADE_ORDER_B_REG != "NONE") &&
         (CASCADE_ORDER_B_REG != "FIRST") &&
         (CASCADE_ORDER_B_REG != "LAST") &&
         (CASCADE_ORDER_B_REG != "MIDDLE"))) begin
      $display("Error: [Unisim %s-102] CASCADE_ORDER_B attribute is set to %s.  Legal values for this attribute are NONE, FIRST, LAST or MIDDLE. Instance: %m", MODULE_NAME, CASCADE_ORDER_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLOCK_DOMAINS_REG != "INDEPENDENT") &&
         (CLOCK_DOMAINS_REG != "COMMON"))) begin
      $display("Error: [Unisim %s-103] CLOCK_DOMAINS attribute is set to %s.  Legal values for this attribute are INDEPENDENT or COMMON. Instance: %m", MODULE_NAME, CLOCK_DOMAINS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DOA_REG_REG != 1) &&
         (DOA_REG_REG != 0))) begin
      $display("Error: [Unisim %s-104] DOA_REG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, DOA_REG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DOB_REG_REG != 1) &&
         (DOB_REG_REG != 0))) begin
      $display("Error: [Unisim %s-105] DOB_REG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, DOB_REG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ENADDRENA_REG != "FALSE") &&
         (ENADDRENA_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-106] ENADDRENA attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ENADDRENA_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ENADDRENB_REG != "FALSE") &&
         (ENADDRENB_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-107] ENADDRENB attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ENADDRENB_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INITP_00_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INITP_00_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-111] INITP_00 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INITP_00_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INITP_01_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INITP_01_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-112] INITP_01 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INITP_01_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INITP_02_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INITP_02_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-113] INITP_02 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INITP_02_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INITP_03_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INITP_03_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-114] INITP_03 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INITP_03_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INITP_04_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INITP_04_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-115] INITP_04 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INITP_04_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INITP_05_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INITP_05_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-116] INITP_05 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INITP_05_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INITP_06_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INITP_06_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-117] INITP_06 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INITP_06_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INITP_07_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INITP_07_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-118] INITP_07 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INITP_07_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_00_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_00_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-127] INIT_00 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_00_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_01_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_01_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-128] INIT_01 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_01_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_02_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_02_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-129] INIT_02 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_02_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_03_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_03_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-130] INIT_03 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_03_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_04_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_04_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-131] INIT_04 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_04_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_05_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_05_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-132] INIT_05 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_05_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_06_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_06_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-133] INIT_06 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_06_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_07_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_07_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-134] INIT_07 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_07_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_08_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_08_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-135] INIT_08 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_08_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_09_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_09_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-136] INIT_09 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_09_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_0A_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_0A_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-137] INIT_0A attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_0A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_0B_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_0B_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-138] INIT_0B attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_0B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_0C_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_0C_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-139] INIT_0C attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_0C_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_0D_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_0D_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-140] INIT_0D attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_0D_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_0E_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_0E_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-141] INIT_0E attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_0E_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_0F_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_0F_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-142] INIT_0F attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_0F_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_10_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_10_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-143] INIT_10 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_10_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_11_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_11_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-144] INIT_11 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_11_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_12_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_12_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-145] INIT_12 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_12_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_13_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_13_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-146] INIT_13 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_13_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_14_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_14_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-147] INIT_14 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_14_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_15_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_15_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-148] INIT_15 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_15_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_16_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_16_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-149] INIT_16 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_16_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_17_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_17_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-150] INIT_17 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_17_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_18_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_18_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-151] INIT_18 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_18_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_19_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_19_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-152] INIT_19 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_19_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_1A_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_1A_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-153] INIT_1A attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_1A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_1B_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_1B_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-154] INIT_1B attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_1B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_1C_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_1C_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-155] INIT_1C attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_1C_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_1D_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_1D_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-156] INIT_1D attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_1D_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_1E_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_1E_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-157] INIT_1E attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_1E_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_1F_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_1F_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-158] INIT_1F attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_1F_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_20_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_20_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-159] INIT_20 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_20_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_21_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_21_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-160] INIT_21 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_21_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_22_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_22_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-161] INIT_22 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_22_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_23_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_23_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-162] INIT_23 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_23_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_24_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_24_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-163] INIT_24 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_24_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_25_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_25_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-164] INIT_25 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_25_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_26_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_26_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-165] INIT_26 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_26_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_27_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_27_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-166] INIT_27 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_27_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_28_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_28_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-167] INIT_28 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_28_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_29_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_29_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-168] INIT_29 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_29_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_2A_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_2A_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-169] INIT_2A attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_2A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_2B_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_2B_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-170] INIT_2B attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_2B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_2C_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_2C_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-171] INIT_2C attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_2C_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_2D_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_2D_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-172] INIT_2D attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_2D_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_2E_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_2E_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-173] INIT_2E attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_2E_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_2F_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_2F_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-174] INIT_2F attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_2F_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_30_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_30_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-175] INIT_30 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_30_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_31_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_31_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-176] INIT_31 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_31_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_32_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_32_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-177] INIT_32 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_32_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_33_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_33_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-178] INIT_33 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_33_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_34_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_34_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-179] INIT_34 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_34_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_35_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_35_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-180] INIT_35 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_35_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_36_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_36_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-181] INIT_36 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_36_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_37_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_37_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-182] INIT_37 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_37_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_38_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_38_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-183] INIT_38 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_38_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_39_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_39_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-184] INIT_39 attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_39_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_3A_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_3A_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-185] INIT_3A attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_3A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_3B_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_3B_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-186] INIT_3B attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_3B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_3C_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_3C_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-187] INIT_3C attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_3C_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_3D_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_3D_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-188] INIT_3D attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_3D_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_3E_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_3E_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-189] INIT_3E attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_3E_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_3F_REG < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT_3F_REG > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-190] INIT_3F attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_3F_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_A_REG < 18'h00000) || (INIT_A_REG > 18'h3FFFF))) begin
      $display("Error: [Unisim %s-255] INIT_A attribute is set to %h.  Legal values for this attribute are 18'h00000 to 18'h3FFFF. Instance: %m", MODULE_NAME, INIT_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_B_REG < 18'h00000) || (INIT_B_REG > 18'h3FFFF))) begin
      $display("Error: [Unisim %s-256] INIT_B attribute is set to %h.  Legal values for this attribute are 18'h00000 to 18'h3FFFF. Instance: %m", MODULE_NAME, INIT_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_FILE_REG != "NONE"))) begin
      $display("INFO: Unisim %s-257] The attribute INIT_FILE is set to (%s) but loading memory contents from a file is not yet supported. Instance: %m", MODULE_NAME, INIT_FILE_REG);
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLKARDCLK_INVERTED_REG !== 1'b0) && (IS_CLKARDCLK_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-258] IS_CLKARDCLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLKARDCLK_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLKBWRCLK_INVERTED_REG !== 1'b0) && (IS_CLKBWRCLK_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-259] IS_CLKBWRCLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLKBWRCLK_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_ENARDEN_INVERTED_REG !== 1'b0) && (IS_ENARDEN_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-260] IS_ENARDEN_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_ENARDEN_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_ENBWREN_INVERTED_REG !== 1'b0) && (IS_ENBWREN_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-261] IS_ENBWREN_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_ENBWREN_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_RSTRAMARSTRAM_INVERTED_REG !== 1'b0) && (IS_RSTRAMARSTRAM_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-262] IS_RSTRAMARSTRAM_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_RSTRAMARSTRAM_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_RSTRAMB_INVERTED_REG !== 1'b0) && (IS_RSTRAMB_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-263] IS_RSTRAMB_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_RSTRAMB_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_RSTREGARSTREG_INVERTED_REG !== 1'b0) && (IS_RSTREGARSTREG_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-264] IS_RSTREGARSTREG_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_RSTREGARSTREG_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_RSTREGB_INVERTED_REG !== 1'b0) && (IS_RSTREGB_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-265] IS_RSTREGB_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_RSTREGB_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RDADDRCHANGEA_REG != "FALSE") &&
         (RDADDRCHANGEA_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-266] RDADDRCHANGEA attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RDADDRCHANGEA_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RDADDRCHANGEB_REG != "FALSE") &&
         (RDADDRCHANGEB_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-267] RDADDRCHANGEB attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RDADDRCHANGEB_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((READ_WIDTH_A_REG != 0) &&
         (READ_WIDTH_A_REG != 1) &&
         (READ_WIDTH_A_REG != 2) &&
         (READ_WIDTH_A_REG != 4) &&
         (READ_WIDTH_A_REG != 9) &&
         (READ_WIDTH_A_REG != 18) &&
         (READ_WIDTH_A_REG != 36))) begin
      $display("Error: [Unisim %s-268] READ_WIDTH_A attribute is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9, 18 or 36. Instance: %m", MODULE_NAME, READ_WIDTH_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((READ_WIDTH_B_REG != 0) &&
         (READ_WIDTH_B_REG != 1) &&
         (READ_WIDTH_B_REG != 2) &&
         (READ_WIDTH_B_REG != 4) &&
         (READ_WIDTH_B_REG != 9) &&
         (READ_WIDTH_B_REG != 18))) begin
      $display("Error: [Unisim %s-269] READ_WIDTH_B attribute is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18. Instance: %m", MODULE_NAME, READ_WIDTH_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RSTREG_PRIORITY_A_REG != "RSTREG") &&
         (RSTREG_PRIORITY_A_REG != "REGCE"))) begin
      $display("Error: [Unisim %s-270] RSTREG_PRIORITY_A attribute is set to %s.  Legal values for this attribute are RSTREG or REGCE. Instance: %m", MODULE_NAME, RSTREG_PRIORITY_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RSTREG_PRIORITY_B_REG != "RSTREG") &&
         (RSTREG_PRIORITY_B_REG != "REGCE"))) begin
      $display("Error: [Unisim %s-271] RSTREG_PRIORITY_B attribute is set to %s.  Legal values for this attribute are RSTREG or REGCE. Instance: %m", MODULE_NAME, RSTREG_PRIORITY_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SIM_COLLISION_CHECK_REG != "ALL") &&
         (SIM_COLLISION_CHECK_REG != "GENERATE_X_ONLY") &&
         (SIM_COLLISION_CHECK_REG != "NONE") &&
         (SIM_COLLISION_CHECK_REG != "WARNING_ONLY"))) begin
      $display("Error: [Unisim %s-272] SIM_COLLISION_CHECK attribute is set to %s.  Legal values for this attribute are ALL, GENERATE_X_ONLY, NONE or WARNING_ONLY. Instance: %m", MODULE_NAME, SIM_COLLISION_CHECK_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SLEEP_ASYNC_REG != "FALSE") &&
         (SLEEP_ASYNC_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-273] SLEEP_ASYNC attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SLEEP_ASYNC_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SRVAL_A_REG < 18'h00000) || (SRVAL_A_REG > 18'h3FFFF))) begin
      $display("Error: [Unisim %s-274] SRVAL_A attribute is set to %h.  Legal values for this attribute are 18'h00000 to 18'h3FFFF. Instance: %m", MODULE_NAME, SRVAL_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SRVAL_B_REG < 18'h00000) || (SRVAL_B_REG > 18'h3FFFF))) begin
      $display("Error: [Unisim %s-275] SRVAL_B attribute is set to %h.  Legal values for this attribute are 18'h00000 to 18'h3FFFF. Instance: %m", MODULE_NAME, SRVAL_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((WRITE_MODE_A_REG != "NO_CHANGE") &&
         (WRITE_MODE_A_REG != "READ_FIRST") &&
         (WRITE_MODE_A_REG != "WRITE_FIRST"))) begin
      $display("Error: [Unisim %s-276] WRITE_MODE_A attribute is set to %s.  Legal values for this attribute are NO_CHANGE, READ_FIRST or WRITE_FIRST. Instance: %m", MODULE_NAME, WRITE_MODE_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((WRITE_MODE_B_REG != "NO_CHANGE") &&
         (WRITE_MODE_B_REG != "READ_FIRST") &&
         (WRITE_MODE_B_REG != "WRITE_FIRST"))) begin
      $display("Error: [Unisim %s-277] WRITE_MODE_B attribute is set to %s.  Legal values for this attribute are NO_CHANGE, READ_FIRST or WRITE_FIRST. Instance: %m", MODULE_NAME, WRITE_MODE_B_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((WRITE_WIDTH_A_REG != 0) &&
         (WRITE_WIDTH_A_REG != 1) &&
         (WRITE_WIDTH_A_REG != 2) &&
         (WRITE_WIDTH_A_REG != 4) &&
         (WRITE_WIDTH_A_REG != 9) &&
         (WRITE_WIDTH_A_REG != 18))) begin
      $display("Error: [Unisim %s-278] WRITE_WIDTH_A attribute is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18. Instance: %m", MODULE_NAME, WRITE_WIDTH_A_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((WRITE_WIDTH_B_REG != 0) &&
         (WRITE_WIDTH_B_REG != 1) &&
         (WRITE_WIDTH_B_REG != 2) &&
         (WRITE_WIDTH_B_REG != 4) &&
         (WRITE_WIDTH_B_REG != 9) &&
         (WRITE_WIDTH_B_REG != 18) &&
         (WRITE_WIDTH_B_REG != 36))) begin
      $display("Error: [Unisim %s-279] WRITE_WIDTH_B attribute is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9, 18 or 36. Instance: %m", MODULE_NAME, WRITE_WIDTH_B_REG);
      $display("Attribute Syntax Error : The attribute WRITE_WIDTH_B on %s instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9, 18 or 36.", MODULE_NAME, WRITE_WIDTH_B_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #100 $finish;
  end

  initial begin
    INIT_MEM  <= #100 1'b1;
    INIT_MEM  <= #200 1'b0;
  end

  assign rd_addr_a_mask =
    (READ_WIDTH_A_REG == 0) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3f} :
    (READ_WIDTH_A_REG == 1) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3f} :
    (READ_WIDTH_A_REG == 2) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3e} :
    (READ_WIDTH_A_REG == 4) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3c} :
    (READ_WIDTH_A_REG == 9) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (READ_WIDTH_A_REG == 18) ? {{ADDR_WIDTH-6{1'b1}}, 6'h30} :
    (READ_WIDTH_A_REG == 36) ? {{ADDR_WIDTH-6{1'b1}}, 6'h20} :
    {{ADDR_WIDTH-6{1'b1}}, 6'h3f};

  assign rd_addr_b_mask =
    (READ_WIDTH_B_REG == 0) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3f} :
    (READ_WIDTH_B_REG == 1) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3f} :
    (READ_WIDTH_B_REG == 2) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3e} :
    (READ_WIDTH_B_REG == 4) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3c} :
    (READ_WIDTH_B_REG == 9) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (READ_WIDTH_B_REG == 18) ? {{ADDR_WIDTH-6{1'b1}}, 6'h30} :
    (READ_WIDTH_B_REG == 36) ? {{ADDR_WIDTH-6{1'b1}}, 6'h20} :
    {{ADDR_WIDTH-6{1'b1}}, 6'h3f};

  assign wr_addr_a_mask =
    (WRITE_WIDTH_A_REG == 0) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3f} :
    (WRITE_WIDTH_A_REG == 1) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3f} :
    (WRITE_WIDTH_A_REG == 2) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3e} :
    (WRITE_WIDTH_A_REG == 4) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3c} :
    (WRITE_WIDTH_A_REG == 9) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (WRITE_WIDTH_A_REG == 18) ? {{ADDR_WIDTH-6{1'b1}}, 6'h30} :
    (WRITE_WIDTH_A_REG == 36) ? {{ADDR_WIDTH-6{1'b1}}, 6'h20} :
    {{ADDR_WIDTH-6{1'b1}}, 6'h3f};

  assign wr_addr_b_mask =
    (WRITE_WIDTH_B_REG == 0) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3f} :
    (WRITE_WIDTH_B_REG == 1) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3f} :
    (WRITE_WIDTH_B_REG == 2) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3e} :
    (WRITE_WIDTH_B_REG == 4) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h3c} :
    (WRITE_WIDTH_B_REG == 9) ?  {{ADDR_WIDTH-6{1'b1}}, 6'h38} :
    (WRITE_WIDTH_B_REG == 18) ? {{ADDR_WIDTH-6{1'b1}}, 6'h30} :
    (WRITE_WIDTH_B_REG == 36) ? {{ADDR_WIDTH-6{1'b1}}, 6'h20} :
    {{ADDR_WIDTH-6{1'b1}}, 6'h3f};

  always @(READ_WIDTH_A_BIN) rd_loops_a <= READ_WIDTH_A_BIN;
  always @(READ_WIDTH_B_BIN) rd_loops_b <= READ_WIDTH_B_BIN;
  always @(*) begin
    if (READ_WIDTH_A_BIN > READ_WIDTH_B_BIN) rd_loops_f <= READ_WIDTH_A_BIN;
    else rd_loops_f <= READ_WIDTH_B_BIN;
  end
  always @(WRITE_WIDTH_A_BIN) wr_loops_a <= WRITE_WIDTH_A_BIN;
  always @(WRITE_WIDTH_B_BIN) wr_loops_b <= WRITE_WIDTH_B_BIN;

// determine clk period for collision window.
assign clks_done = clka_done && clkb_done;
initial begin
  @(negedge glblGSR);
  clka_timeout = 0;
  clka_timeout <= #6000 1;
  @(posedge CLKARDCLK_in or posedge clka_timeout);
  if (~clka_timeout) begin
    t_max_a = 0;
    for (i=0;i<2000;i=i+1) begin
      if (~clka_done) begin
        if (CLKARDCLK_in) begin
          #1;
          t_max_a = t_max_a + 1;
        end
        else begin
          t_max_a = t_max_a - 1;
          clka_done = 1;
          i = 2000;
        end
      end
    end
  end
  clka_done = 1;
end

initial begin
  @(posedge CLKARDCLK_in)
  @(posedge CLKARDCLK_in)
  clka_toggled = 1'b1;
end

initial begin
  @(posedge CLKBWRCLK_in)
  @(posedge CLKBWRCLK_in)
  clkb_toggled = 1'b1;
end

initial begin
  @(negedge glblGSR);
  clkb_timeout = 0;
  clkb_timeout <= #6000 1;
  @(posedge CLKBWRCLK_in or posedge clkb_timeout);
  if (~clkb_timeout) begin
    t_max_b = 0;
    for (j=0;j<2000;j=j+1) begin
      if (~clkb_done) begin
        if (CLKBWRCLK_in) begin
          #1;
          t_max_b = t_max_b + 1;
        end
        else begin
          t_max_b = t_max_b - 1;
          clkb_done = 1;
          j = 2000;
        end
      end
    end
  end
  clkb_done = 1;
end

initial begin
 @(posedge clks_done);
 if (((t_max_a > 50) && (t_max_a < 1500)) &&
     ((t_max_b == 0) || (t_max_a <= t_max_b))) t_coll_max = 2 * t_max_a - 49;
 if (((t_max_b > 50) && (t_max_b < 1500)) &&
     ((t_max_a == 0) || (t_max_b <  t_max_a))) t_coll_max = 2 * t_max_b - 49;
end

    always @ (posedge CLKARDCLK_in) begin
      if (glblGSR || (SLEEP_ASYNC_BIN == SLEEP_ASYNC_TRUE)) begin
          SLEEP_reg <= 1'b0;
          SLEEP_reg1 <= 1'b0;
      end
      else begin
          {SLEEP_reg, SLEEP_reg1} <= {SLEEP_reg1, SLEEP_in};
      end
    end

    assign SLEEP_int = SLEEP_reg1 || SLEEP_in;

    assign sdp_mode_wr = (WRITE_WIDTH_B_BIN == WRITE_WIDTH_B_36) ? 1'b1 : 1'b0;
    assign sdp_mode_rd = (READ_WIDTH_A_BIN == READ_WIDTH_A_36) ? 1'b1 : 1'b0;
   assign sdp_mode = sdp_mode_rd || sdp_mode_wr;
   assign REGCE_A_int = REGCEAREGCE_in;
   assign REGCE_B_int = REGCEB_in;
   assign RSTREG_A_int = (RSTREG_PRIORITY_A_BIN == RSTREG_PRIORITY_A_RSTREG) ?
                         RSTREGARSTREG_in : (RSTREGARSTREG_in && REGCEAREGCE_in);
   assign RSTREG_B_int = (RSTREG_PRIORITY_B_BIN == RSTREG_PRIORITY_B_RSTREG) ?
                         RSTREGB_in : (RSTREGB_in && REGCEB_in);
  assign ADDRENA_int = (ENADDRENA_BIN == ENADDRENA_TRUE) ? ADDRENA_in : 1'b1;
  assign ADDRENB_int = (ENADDRENB_BIN == ENADDRENB_TRUE) ? ADDRENB_in : 1'b1;
   always @ (*) begin
     if (((CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_LAST) ||
          (CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_MIDDLE)) && CASDOMUXA_reg) begin
       DOUTADOUT_out = CASDINA_in;
       DOUTPADOUTP_out = CASDINPA_in;
     end
     else if (DOA_REG_BIN == DOA_REG_1) begin
       DOUTADOUT_out = mem_a_reg ^ mem_rm_douta;
       DOUTPADOUTP_out = memp_a_reg ^ memp_rm_douta;
     end
     else if (mem_wr_en_a_wf) begin
       DOUTADOUT_out = mem_rd_a_wf ^ mem_rm_douta;
       DOUTPADOUTP_out = memp_rd_a_wf ^ memp_rm_douta;
     end
     else begin
       DOUTADOUT_out = mem_a_lat ^ mem_rm_douta;
       DOUTPADOUTP_out = memp_a_lat ^ memp_rm_douta;
     end
   end
   always @ (*) begin
     if (((CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_LAST) ||
          (CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_MIDDLE)) && CASDOMUXB_int) begin
          DOUTBDOUT_out = CASDINB_in;
          DOUTPBDOUTP_out = CASDINPB_in;
     end
     else if (sdp_mode_rd) begin
       if (DOA_REG_BIN == DOA_REG_1) begin
         DOUTBDOUT_out = mem_a_reg[31:16] ^ mem_rm_douta[31:16];
         DOUTPBDOUTP_out = memp_a_reg[3:2] ^ memp_rm_douta[3:2];
       end
       else if (mem_wr_en_a_wf) begin
         DOUTBDOUT_out = mem_rd_a_wf[31:16] ^ mem_rm_douta[31:16];
         DOUTPBDOUTP_out = memp_rd_a_wf[3:2] ^ memp_rm_douta[3:2];
       end
       else begin
         DOUTBDOUT_out = mem_a_lat[31:16] ^ mem_rm_douta[31:16];
         DOUTPBDOUTP_out = memp_a_lat[3:2] ^ memp_rm_douta[3:2];
       end
     end
     else begin
       if (DOB_REG_BIN == DOB_REG_1) begin
         DOUTBDOUT_out = mem_b_reg ^ mem_rm_doutb;
         DOUTPBDOUTP_out = memp_b_reg ^ memp_rm_doutb;
       end
       else if (mem_wr_en_b_wf) begin
         DOUTBDOUT_out = mem_rd_b_wf ^ mem_rm_doutb;
         DOUTPBDOUTP_out = memp_rd_b_wf ^ memp_rm_doutb;
       end
       else begin
         DOUTBDOUT_out = mem_b_lat ^ mem_rm_doutb;
         DOUTPBDOUTP_out = memp_b_lat ^ memp_rm_doutb;
       end
     end
   end

   assign INIT_A_int =
    (READ_WIDTH_A_BIN <= READ_WIDTH_A_9)  ? {{4{INIT_A_BIN[8]}},     {4{INIT_A_BIN[7:0]}}} :
    (READ_WIDTH_A_BIN == READ_WIDTH_A_18) ? {{2{INIT_A_BIN[17:16]}}, {2{INIT_A_BIN[15:0]}}} :
          {INIT_B_BIN[17:16],INIT_A_BIN[17:16],INIT_B_BIN[15:0],INIT_A_BIN[15:0]};

   assign INIT_B_int =
    (READ_WIDTH_B_BIN <= READ_WIDTH_B_9)  ? {{2{INIT_B_BIN[8]}}, {2{INIT_B_BIN[7:0]}}} :
                                            INIT_B_BIN;

   assign SRVAL_A_int =
    (READ_WIDTH_A_BIN <= READ_WIDTH_A_9)  ? {{4{SRVAL_A_BIN[8]}},     {4{SRVAL_A_BIN[7:0]}}} :
    (READ_WIDTH_A_BIN == READ_WIDTH_A_18) ? {{2{SRVAL_A_BIN[17:16]}}, {2{SRVAL_A_BIN[15:0]}}} :
          {SRVAL_B_BIN[17:16],SRVAL_A_BIN[17:16],SRVAL_B_BIN[15:0],SRVAL_A_BIN[15:0]};
   assign SRVAL_B_int =
    (READ_WIDTH_B_BIN <= READ_WIDTH_B_9)  ? {{2{SRVAL_B_BIN[8]}}, {2{SRVAL_B_BIN[7:0]}}} :
                                            SRVAL_B_BIN;
// cascade out
   assign CASDOUTA_out = ((CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_FIRST) ||
                           (CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_MIDDLE)) ?
                          DOUTADOUT_out : {D_WIDTH-1{1'b0}};
   assign CASDOUTPA_out = ((CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_FIRST) ||
                           (CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_MIDDLE)) ?
                          DOUTPADOUTP_out : {DP_WIDTH-1{1'b0}};
   assign CASDOUTB_out = ((CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_FIRST) ||
                           (CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_MIDDLE)) ?
                          DOUTBDOUT_out : {D_WIDTH-1{1'b0}};
   assign CASDOUTPB_out = ((CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_FIRST) ||
                           (CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_MIDDLE)) ?
                          DOUTPBDOUTP_out : {DP_WIDTH-1{1'b0}};
// start model internals

// cascade control
   always @ (posedge CLKARDCLK_in) begin
      if (glblGSR) CASDOMUXA_reg <= 1'b0;
      else if (CASDOMUXEN_A_in == 1'b1) CASDOMUXA_reg <= CASDOMUXA_in;
      end

   always @ (posedge CLKARDCLK_in) begin
      if (glblGSR) CASOREGIMUXA_reg <= 1'b0;
      else if (CASOREGIMUXEN_A_in == 1'b1) CASOREGIMUXA_reg <= CASOREGIMUXA_in;
      end

   assign CASDOMUXB_int = (READ_WIDTH_A_BIN == READ_WIDTH_A_36) ?
                          CASDOMUXA_reg : CASDOMUXB_reg;
   always @ (posedge CLKBWRCLK_in) begin
      if (glblGSR || sdp_mode) CASDOMUXB_reg <= 1'b0;
      else if (CASDOMUXEN_B_in == 1'b1) CASDOMUXB_reg <= CASDOMUXB_in;
      end

   always @ (posedge CLKBWRCLK_in) begin
      if (glblGSR || sdp_mode) CASOREGIMUXB_reg <= 1'b0;
      else if (CASOREGIMUXEN_B_in == 1'b1) CASOREGIMUXB_reg <= CASOREGIMUXB_in;
      end

// collison detection
reg coll_win_wr_clk_a_min = 1'b0;
reg coll_win_wr_clk_b_min = 1'b0;
reg coll_win_rd_clk_a_min = 1'b0;
reg coll_win_rd_clk_b_min = 1'b0;
reg coll_win_wr_clk_a_max = 1'b0;
reg coll_win_wr_clk_b_max = 1'b0;
reg coll_win_rd_clk_a_max = 1'b0;
reg coll_win_rd_clk_b_max = 1'b0;
reg wr_b_wr_a_coll = 1'b0;
reg wr_b_rd_a_coll = 1'b0;
reg rd_b_wr_a_coll = 1'b0;
reg wr_a_wr_b_coll = 1'b0;
reg wr_a_rd_b_coll = 1'b0;
reg rd_a_wr_b_coll = 1'b0;

wire coll_wr_sim;
wire coll_wr_b_wr_a;
wire coll_wr_b_rd_a_sim;
wire coll_wr_b_rd_a;
wire coll_rd_b_wr_a_sim;
wire coll_rd_b_wr_a;
wire coll_wr_a_wr_b;
wire coll_wr_a_rd_b_sim;
wire coll_wr_a_rd_b;
wire coll_rd_a_wr_b_sim;
wire coll_rd_a_wr_b;

assign coll_wr_sim = wr_addr_coll && coll_win_wr_clk_a_min && coll_win_wr_clk_b_min;
assign coll_wr_b_wr_a = wr_addr_coll && coll_win_wr_clk_b_min && ~coll_win_wr_clk_a_min && coll_win_wr_clk_a_max;
assign coll_wr_b_rd_a_sim = wr_b_rd_a_addr_coll && coll_win_wr_clk_b_min && coll_win_rd_clk_a_min;
assign coll_wr_b_rd_a = wr_b_rd_a_addr_coll && coll_win_wr_clk_b_min && ~coll_win_rd_clk_a_min && coll_win_rd_clk_a_max;
assign coll_rd_b_wr_a_sim = wr_a_rd_b_addr_coll && coll_win_rd_clk_b_min && coll_win_wr_clk_a_min;
assign coll_rd_b_wr_a = wr_a_rd_b_addr_coll && coll_win_rd_clk_b_min && ~coll_win_wr_clk_a_min && coll_win_wr_clk_a_max;
assign coll_wr_a_wr_b = wr_addr_coll && coll_win_wr_clk_a_min && ~coll_win_wr_clk_b_min && coll_win_wr_clk_b_max;
assign coll_wr_a_rd_b_sim = wr_a_rd_b_addr_coll && coll_win_wr_clk_a_min && coll_win_rd_clk_b_min;
assign coll_wr_a_rd_b = wr_a_rd_b_addr_coll && coll_win_wr_clk_a_min && ~coll_win_rd_clk_b_min && coll_win_rd_clk_b_max;
assign coll_rd_a_wr_b_sim = wr_b_rd_a_addr_coll && coll_win_rd_clk_a_min && coll_win_wr_clk_b_min;
assign coll_rd_a_wr_b = wr_b_rd_a_addr_coll && coll_win_rd_clk_a_min && ~coll_win_wr_clk_b_min && coll_win_wr_clk_b_max;

always @(posedge CLKARDCLK_in) begin
  if (mem_wr_en_a === 1'b1 && ~glblGSR && clkb_toggled && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE) & ~sdp_mode) begin
    coll_win_wr_clk_a_min <= 1'b1;
    coll_win_wr_clk_a_max <= #99 1'b1;
    coll_win_wr_clk_a_min <= #(t_coll_min) 1'b0;
    coll_win_wr_clk_a_max <= #(t_coll_max) 1'b0;
  end
end

always @(posedge coll_wr_sim) begin
  if (~wr_data_matches) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
       $display("Error: [Unisim %s-1] Memory Collision at time %.3f ns.\nA simultaneous WRITE occured on port A (addr:%h data:%h) and port B (addr:%h data:%h).\nMemory contents at those locations have been corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, mem_wr_a, wr_addr_b, mem_wr_b);
      wr_a_wr_b_coll <= #10  1'b1;
      wr_a_wr_b_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
       $display("Error: [Unisim %s-2] Memory Collision at time %.3f ns.\nA simultaneous WRITE occured on port A (addr:%h data:%h) and port B (addr:%h data:%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, mem_wr_a, wr_addr_b, mem_wr_b);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_a_wr_b_coll <= #10  1'b1;
      wr_a_wr_b_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_wr_a_wr_b) begin
  if (~wr_data_matches) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-3] Memory Collision at time %.3f ns.\nA WRITE on port A (%h) occured during the WRITE window on port B (%h).\nMemory contents at those locations have been corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, wr_addr_b);
      wr_a_wr_b_coll <= #10  1'b1;
      wr_a_wr_b_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-4] Memory Collision at time %.3f ns.\nA WRITE on port A (%h) occured during the WRITE window on port B (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, wr_addr_b);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_a_wr_b_coll <= #10  1'b1;
      wr_a_wr_b_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_wr_a_rd_b_sim) begin
  if (~wr_a_data_matches_rd_b_data && (WRITE_MODE_A_BIN != WRITE_MODE_A_READ_FIRST)) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-5] Memory Collision at time %.3f ns.\nA simultaneous WRITE on port A (%h) occured during a READ on port B (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, rd_addr_b);
      wr_a_rd_b_coll <= #10  1'b1;
      wr_a_rd_b_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-6] Memory Collision at time %.3f ns.\nA simultaneous WRITE on port A (%h) occured during a READ on port B (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, rd_addr_b);
    else if (SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_a_rd_b_coll <= #10  1'b1;
      wr_a_rd_b_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_wr_a_rd_b) begin
  if (~wr_a_data_matches_rd_b_data && (WRITE_MODE_A_BIN != WRITE_MODE_A_READ_FIRST)) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-7] Memory Collision at time %.3f ns.\nA WRITE on port A (%h) occured during the READ window on port B (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, rd_addr_b);
      wr_a_rd_b_coll <= #10 1'b1;
      wr_a_rd_b_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-8] Memory Collision at time %.3f ns.\nA WRITE on port A (%h) occured during the READ window on port B (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_a, rd_addr_b);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_a_rd_b_coll <= #10 1'b1;
      wr_a_rd_b_coll <= #100 1'b0;
    end
  end
end

always @(posedge CLKBWRCLK_in) begin
  if (mem_wr_en_b === 1'b1 && ~glblGSR && clka_toggled && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE)) begin
    coll_win_wr_clk_b_min <= 1'b1;
    coll_win_wr_clk_b_max <= #99 1'b1;
    coll_win_wr_clk_b_min <= #(t_coll_min) 1'b0;
    coll_win_wr_clk_b_max <= #(t_coll_max) 1'b0;
  end
end


always @(posedge coll_wr_b_wr_a) begin
  if (~wr_data_matches) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-9] Memory Collision at time %.3f ns.\nA WRITE on port B (%h) occured during the WRITE window on port A (%h).\nMemory contents at those locations have been corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, wr_addr_a);
      wr_b_wr_a_coll <= #10  1'b1;
      wr_b_wr_a_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-10] Memory Collision at time %.3f ns.\nA WRITE on port B (%h) occured during the WRITE window on port A (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, wr_addr_a);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_b_wr_a_coll <= #10  1'b1;
      wr_b_wr_a_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_wr_b_rd_a_sim) begin
  if (~wr_b_data_matches_rd_a_data && (WRITE_MODE_B_BIN != WRITE_MODE_B_READ_FIRST)) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-11] Memory Collision at time %.3f ns.\nA simultaneous WRITE on port B (%h) occured during a READ on port A (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, rd_addr_a);
      wr_b_rd_a_coll <= #10  1'b1;
      wr_b_rd_a_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-12] Memory Collision at time %.3f ns.\nA simultaneous WRITE on port B (%h) occured during a READ on port A (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, rd_addr_a);
    else if (SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_b_rd_a_coll <= #10  1'b1;
      wr_b_rd_a_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_wr_b_rd_a) begin
  if (~wr_b_data_matches_rd_a_data && (WRITE_MODE_B_BIN != WRITE_MODE_B_READ_FIRST)) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-13] Memory Collision at time %.3f ns.\nA WRITE on port B (%h) occured during the READ window on port A (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, rd_addr_a);
      wr_b_rd_a_coll <= #10 1'b1;
      wr_b_rd_a_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-14] Memory Collision at time %.3f ns.\nA WRITE on port B (%h) occured during the READ window on port A (%h). Instance: %m", MODULE_NAME, $time/1000.0, wr_addr_b, rd_addr_a);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      wr_b_rd_a_coll <= #10 1'b1;
      wr_b_rd_a_coll <= #100 1'b0;
    end
  end
end

always @(posedge CLKARDCLK_in) begin
  if (mem_rd_en_a === 1'b1 && ~glblGSR && clkb_toggled && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE)) begin
    coll_win_rd_clk_a_min <= 1'b1;
    coll_win_rd_clk_a_max <= #99 1'b1;
    coll_win_rd_clk_a_min <= #(t_coll_min) 1'b0;
    coll_win_rd_clk_a_max <= #(t_coll_max) 1'b0;
  end
end

always @(posedge coll_rd_a_wr_b_sim) begin
  if (~wr_b_data_matches_rd_a_data && (WRITE_MODE_B_BIN != WRITE_MODE_B_READ_FIRST)) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-15] Memory Collision at time %.3f ns.\nA simultaneous READ on port A (%h) occured during a WRITE on port B (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_a, wr_addr_b);
      rd_a_wr_b_coll <= #10  1'b1;
      rd_a_wr_b_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-16] Memory Collision at time %.3f ns.\nA simultaneous READ on port A (%h) occured during a WRITE on port B (%h). Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_a, wr_addr_b);
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      rd_a_wr_b_coll <= #10  1'b1;
      rd_a_wr_b_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_rd_a_wr_b) begin
  if (~wr_b_data_matches_rd_a_data) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-17] Memory Collision at time %.3f ns.\nA READ on port A (%h) occured during the WRITE window on port B (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_a, wr_addr_b);
      rd_a_wr_b_coll <= #10 1'b1;
      rd_a_wr_b_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-18] Memory Collision at time %.3f ns.\nA READ on port A (%h) occured during the WRITE window on port B (%h). Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_a, wr_addr_b);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      rd_a_wr_b_coll <= #10 1'b1;
      rd_a_wr_b_coll <= #100 1'b0;
    end
  end
end

always @(posedge CLKBWRCLK_in) begin
  if (mem_rd_en_b === 1'b1 && ~glblGSR && clka_toggled && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE) && ~sdp_mode) begin
    coll_win_rd_clk_b_min <= 1'b1;
    coll_win_rd_clk_b_max <= #99 1'b1;
    coll_win_rd_clk_b_min <= #(t_coll_min) 1'b0;
    coll_win_rd_clk_b_max <= #(t_coll_max) 1'b0;
  end
end

always @(posedge coll_rd_b_wr_a_sim) begin
  if (~wr_a_data_matches_rd_b_data && (WRITE_MODE_A_BIN != WRITE_MODE_A_READ_FIRST)) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-19] Memory Collision at time %.3f ns.\nA simultaneous READ on port B (%h) occured during a WRITE on port A (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_b, wr_addr_a);
      rd_b_wr_a_coll <= #10  1'b1;
      rd_b_wr_a_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
       $display("Error: [Unisim %s-20] Memory Collision at time %.3f ns.\nA simultaneous READ on port B (%h) occured during a WRITE on port A (%h). Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_b, wr_addr_a);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      rd_b_wr_a_coll <= #10  1'b1;
      rd_b_wr_a_coll <= #100 1'b0;
    end
  end
end

always @(posedge coll_rd_b_wr_a) begin
  if (~wr_a_data_matches_rd_b_data) begin
    if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) begin
      $display("Error: [Unisim %s-21] Memory Collision at time %.3f ns.\nA READ on port B (%h) occured during the WRITE window on port A (%h).\nThe WRITE was successful but the READ may be corrupted. Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_b, wr_addr_a);
      rd_b_wr_a_coll <= #10  1'b1;
      rd_b_wr_a_coll <= #100 1'b0;
    end
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_WARNING_ONLY)
      $display("Error: [Unisim %s-22] Memory Collision at time %.3f ns.\nA READ on port B (%h) occured during the WRITE window on port A (%h). Instance: %m", MODULE_NAME, $time/1000.0, rd_addr_b, wr_addr_a);
    else if(SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY) begin
      rd_b_wr_a_coll <= #10  1'b1;
      rd_b_wr_a_coll <= #100 1'b0;
    end
  end
end

// output register
   always @ (*) begin
     if (((CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_LAST) ||
          (CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_MIDDLE)) &&
          CASOREGIMUXA_reg) mem_a_reg_mux = {CASDINB_in, CASDINA_in};
     else if (mem_wr_en_a_wf) mem_a_reg_mux = mem_rd_a_wf;
     else mem_a_reg_mux = mem_a_lat;
   end
   always @ (*) begin
     if  (((CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_LAST) ||
           (CASCADE_ORDER_A_BIN == CASCADE_ORDER_A_MIDDLE)) &&
          CASOREGIMUXA_reg) memp_a_reg_mux = {CASDINPB_in, CASDINPA_in};
     else if (mem_wr_en_a_wf) memp_a_reg_mux = memp_rd_a_wf;
     else memp_a_reg_mux = memp_a_lat;
   end

   always @ (posedge CLKARDCLK_in or posedge INIT_MEM or glblGSR) begin
      if (glblGSR || INIT_MEM) begin
         {memp_a_reg, mem_a_reg} <= INIT_A_int;
         end
      else if (RSTREG_A_int) begin
         {memp_a_reg, mem_a_reg} <= SRVAL_A_int;
         end
      else if (REGCE_A_int) begin
         mem_a_reg <= mem_a_reg_mux;
         memp_a_reg <= memp_a_reg_mux;
         end
      end

   always @ (*) begin
     if (((CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_LAST) ||
          (CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_MIDDLE)) &&
         CASOREGIMUXB_reg) mem_b_reg_mux = CASDINB_in;
     else if (mem_wr_en_b_wf) mem_b_reg_mux = mem_rd_b_wf;
     else mem_b_reg_mux = mem_b_lat;
   end
   always @ (*) begin
     if (((CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_LAST) ||
          (CASCADE_ORDER_B_BIN == CASCADE_ORDER_B_MIDDLE)) &&
         CASOREGIMUXB_reg) memp_b_reg_mux = CASDINPB_in;
     else if (mem_wr_en_b_wf) memp_b_reg_mux = memp_rd_b_wf;
     else memp_b_reg_mux = memp_b_lat;
   end
   always @ (posedge CLKBWRCLK_in or posedge INIT_MEM or glblGSR) begin
      if (glblGSR || INIT_MEM || sdp_mode) begin
         {memp_b_reg, mem_b_reg} <= INIT_B_int;
         end
      else if (RSTREG_B_int) begin
         {memp_b_reg, mem_b_reg} <= SRVAL_B_int;
         end
      else if (REGCE_B_int) begin
         mem_b_reg <= mem_b_reg_mux;
         memp_b_reg <= memp_b_reg_mux;
         end
      end

// read engine
   always @ (posedge CLKARDCLK_in) begin
     if ((WRITE_MODE_A_BIN == WRITE_MODE_A_WRITE_FIRST) && ~sdp_mode && mem_rd_en_a && ~glblGSR) begin
       mem_wr_en_a_wf <= mem_wr_en_a && ~mem_rst_a;
     end
   end

   always @ (posedge CLKBWRCLK_in) begin
     if ((WRITE_MODE_B_BIN == WRITE_MODE_B_WRITE_FIRST) && mem_rd_en_b && ~glblGSR) begin
       mem_wr_en_b_wf <= mem_wr_en_b && ~mem_rst_b;
     end
   end

   always @ (wr_a_wf_event or INIT_MEM) begin
      if (~coll_rd_a_wr_b && ~coll_rd_a_wr_b_sim
          && ~coll_wr_b_rd_a && ~coll_wr_b_rd_a_sim) begin
         for (raw=0;raw<rd_loops_f;raw=raw+1) begin
            mem_rd_a_wf[raw] <= mem [rd_addr_a+raw];
         end
          if (rd_loops_f >= 8) begin
            for (raw=0;raw<rd_loops_f/8;raw=raw+1) begin
              memp_rd_a_wf[raw] <= memp [(rd_addr_a/8)+raw];
            end
          end
      end
   end

   always @ (rd_addr_a or mem_rd_en_a or mem_rst_a or wr_a_event or wr_b_event or posedge coll_win_rd_clk_b_min or INIT_MEM) begin
      if ((mem_rd_en_a || INIT_MEM) && ~mem_rst_a) begin
         for (raa=0;raa<rd_loops_a;raa=raa+1) begin
           ram_rd_a[raa] = mem [rd_addr_a+raa];
         end
         if (rd_loops_a >= 8) begin
           for (raa=0;raa<rd_loops_a/8;raa=raa+1) begin
             ramp_rd_a[raa] = memp [(rd_addr_a/8)+raa];
           end
         end
      end
   end

   always @(posedge CLKARDCLK_in or posedge INIT_MEM or posedge glblGSR or posedge wr_b_rd_a_coll or posedge rd_a_wr_b_coll) begin
      if (glblGSR || INIT_MEM) begin
         for (ra=0;ra<rd_loops_a;ra=ra+1) begin
            mem_a_lat[ra] <= INIT_A_int >> ra;
            if (ra<rd_loops_a/8) begin
               memp_a_lat[ra] <= INIT_A_int >> (D_WIDTH+ra);
            end
         end
      end
      else if (SLEEP_int && mem_rd_en_a) begin
         $display("Error: [Unisim %s-23] DRC : READ on port A attempted while in SLEEP mode. Instance: %m.", MODULE_NAME);
         for (ra=0;ra<rd_loops_a;ra=ra+1) begin
            mem_a_lat[ra] <= 1'bx;
            if (ra<rd_loops_a/8) begin
               memp_a_lat[ra] <= 1'bx;
            end
         end
      end
      else if (mem_rst_a && mem_rd_en_a) begin
         for (ra=0;ra<rd_loops_a;ra=ra+1) begin
            mem_a_lat[ra] <= SRVAL_A_int >> ra;
            if (ra<rd_loops_a/8) begin
               memp_a_lat[ra]  <= SRVAL_A_int >> (D_WIDTH+ra);
            end
         end
      end
      else if (rd_a_wr_b_coll) begin
        if (~wr_b_data_matches_rd_a_data &&
            ((SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) ||
             (SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY))) begin
          for (ra=0;ra<rd_loops_a;ra=ra+1) begin
             mem_a_lat[ra] <= 1'bx;
             if (ra<rd_loops_a/8) begin
                memp_a_lat[ra] <= 1'bx;
             end
          end
        end
      end
      else if (wr_b_rd_a_coll) begin
        if ((WRITE_MODE_B_BIN != WRITE_MODE_B_READ_FIRST) && ~wr_b_data_matches_rd_a_data &&
             ((SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) ||
              (SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY))) begin
          for (ra=0;ra<rd_loops_a;ra=ra+1) begin
            mem_a_lat[ra] <= 1'bx;
            if (ra<rd_loops_a/8) begin
              memp_a_lat[ra] <= 1'bx;
            end
          end
        end
      end
      else if (mem_rd_en_a) begin
         if (wr_b_rd_a_addr_coll && coll_win_wr_clk_b_min && sdp_mode && (WRITE_MODE_B_BIN == WRITE_MODE_B_READ_FIRST)) begin
           mem_a_lat   <= mem_rd_b_rf;
           memp_a_lat  <= memp_rd_b_rf;
         end
         else begin
           mem_a_lat   <= ram_rd_a;
           memp_a_lat  <= ramp_rd_a;
         end
      end
   end

   always @ (wr_b_wf_event) begin
      if (~(coll_rd_b_wr_a || coll_rd_b_wr_a_sim || coll_wr_a_rd_b || coll_wr_a_rd_b_sim)) begin
//        for (rbw=0;rbw<max_rd_loops;rbw=rbw+1) begin
        for (rbw=0;rbw<rd_loops_f;rbw=rbw+1) begin
          mem_rd_b_wf[rbw] <= mem [rd_addr_b+rbw];
//          if (rbw<max_rd_loops/8) begin
          if (rbw<rd_loops_f/8) begin
            memp_rd_b_wf[rbw] <= memp [(rd_addr_b/8)+rbw];
          end
        end
      end
   end

   always @ (rd_addr_b or mem_rd_en_b or mem_rst_b or wr_b_event or wr_a_event or INIT_MEM) begin
      if ((mem_rd_en_b || INIT_MEM) && ~mem_rst_b) begin
        for (rbb=0;rbb<rd_loops_b;rbb=rbb+1) begin
          mem_rd_b[rbb] <= mem [rd_addr_b+rbb];
          if (rbb<rd_loops_b/8) begin
            memp_rd_b[rbb] <= memp [(rd_addr_b/8)+rbb];
          end
        end
      end
   end

   always @(posedge CLKBWRCLK_in or posedge INIT_MEM or posedge glblGSR or posedge wr_a_rd_b_coll or posedge rd_b_wr_a_coll) begin
      if (glblGSR || INIT_MEM) begin
         for (rb=0;rb<rd_loops_b;rb=rb+1) begin
            mem_b_lat[rb] <= INIT_B_int >> rb;
            if (rb<rd_loops_b/8) begin
               memp_b_lat[rb] <= INIT_B_int >> (D_WIDTH/2+rb);
            end
         end
      end
      else if (SLEEP_int && mem_rd_en_b && ~sdp_mode) begin
         $display("Error: [Unisim %s-24] DRC : READ on port B attempted while in SLEEP mode. Instance: %m.", MODULE_NAME);
         for (rb=0;rb<rd_loops_b;rb=rb+1) begin
            mem_b_lat[rb] <= 1'bx;
            if (rb<rd_loops_b/8) begin
               memp_b_lat[rb] <= 1'bx;
            end
         end
      end
      else if (mem_rst_b && mem_rd_en_b && ~sdp_mode) begin
         for (rb=0;rb<rd_loops_b;rb=rb+1) begin
            mem_b_lat[rb] <= SRVAL_B_int >> rb;
            if (rb<rd_loops_b/8) begin
               memp_b_lat[rb] <= SRVAL_B_int >> (D_WIDTH/2+rb);
            end
         end
      end
      else if (rd_b_wr_a_coll) begin
        if (~wr_a_data_matches_rd_b_data &&
            ((SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) ||
             (SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY))) begin
          for (rb=0;rb<rd_loops_b;rb=rb+1) begin
             mem_b_lat[rb] <= 1'bx;
             if (rb<rd_loops_b/8) begin
                memp_b_lat[rb] <= 1'bx;
             end
          end
        end
      end
      else if (wr_a_rd_b_coll) begin
        if ((WRITE_MODE_A_BIN != WRITE_MODE_A_READ_FIRST) && ~wr_a_data_matches_rd_b_data &&
             ((SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_ALL) ||
              (SIM_COLLISION_CHECK_BIN == SIM_COLLISION_CHECK_GENERATE_X_ONLY))) begin
          for (rb=0;rb<rd_loops_b;rb=rb+1) begin
            mem_b_lat[rb] <= 1'bx;
            if (rb<rd_loops_b/8) begin
              memp_b_lat[rb] <= 1'bx;
            end
          end
        end
      end
      else if (mem_rd_en_b && ~sdp_mode) begin
        mem_b_lat <= mem_rd_b[D_WIDTH/2-1:0];
        memp_b_lat <= memp_rd_b[DP_WIDTH/2-1:0];
      end
   end

// write engine
   always @ (posedge CLKARDCLK_in or posedge wr_a_wr_b_coll) begin
     if (wr_a_wr_b_coll && ~glblGSR) begin
       if (~wr_data_matches) begin
         for (wa=0;wa<wr_loops_a;wa=wa+1) begin
           if (mem_we_a[wa]) mem [wr_addr_a+wa] <= {mem_width{1'bx}};
           if (wa<wr_loops_a/8) begin
             if (memp_we_a[wa]) memp [(wr_addr_a/8)+wa] <= {memp_width{1'bx}};
           end
         end
       end
     end
     else if (mem_wr_en_a && ~glblGSR && ~sdp_mode) begin
       if (SLEEP_int) begin
         $display("Error: [Unisim %s-25] DRC : WRITE on port A attempted while in SLEEP mode. Instance: %m.", MODULE_NAME);
       end
       else begin
         for (wa=0;wa<wr_loops_a;wa=wa+1) begin
           if (mem_we_a[wa]) begin
             mem [wr_addr_a+wa] <= mem_wr_a[wa];
           end
         end
         if (wr_loops_a >= 8) begin
           for (wa=0;wa<wr_loops_a/8;wa=wa+1) begin
             if (memp_we_a[wa]) begin
               memp [(wr_addr_a/8)+wa] <= memp_wr_a[wa];
             end
           end
         end
         wr_a_event <= ~wr_a_event;
         if (WRITE_MODE_A_BIN == WRITE_MODE_A_WRITE_FIRST) wr_a_wf_event <= ~wr_a_wf_event;
       end
     end
   end

   always @ (posedge CLKBWRCLK_in or posedge INIT_MEM or posedge wr_b_wr_a_coll) begin
     if (INIT_MEM == 1'b1) begin
// initialize memory
       for (j=0;j<64;j=j+1) begin
         INIT_TMP = INIT_BIN[j];
         for (i=0;i<256;i=i+1) begin
           mem [j*256+i] <= INIT_TMP[i];
         end
       end
// initialize memory p
       for (j=0;j<8;j=j+1) begin
         INITP_TMP = INITP_BIN[j];
         for (i=0;i<256;i=i+1) begin
           memp [j*256+i] <= INITP_TMP[i];
         end
       end
     end
     else if (wr_b_wr_a_coll && ~glblGSR) begin
       if (~wr_data_matches) begin
         for (wb=0;wb<wr_loops_b;wb=wb+1) begin
           if (mem_we_b[wb]) mem [wr_addr_b+wb] <= {mem_width{1'bx}};
           if (wb<wr_loops_b/8) begin
             if (memp_we_b[wb]) memp [(wr_addr_b/8)+wb] <= {memp_width{1'bx}};
           end
         end
       end
     end
     else if (mem_wr_en_b && ~glblGSR) begin
       if (SLEEP_int) begin
         $display("Error: [Unisim %s-26] DRC : WRITE on port A attempted while in SLEEP mode. Instance %m.", MODULE_NAME);
       end
       else begin
//         for (wb=0;wb<max_rd_loops;wb=wb+1) begin
         for (wb=0;wb<rd_loops_f;wb=wb+1) begin
           mem_rd_b_rf[wb]    <= mem [rd_addr_b+wb];
//           if (wb<max_rd_loops/8) begin
           if (wb<rd_loops_f/8) begin
               memp_rd_b_rf[wb]        <= memp [rd_addr_b/8+wb];
           end
         end
         for (wb=0;wb<wr_loops_b;wb=wb+1) begin
           if (mem_we_b[wb]) begin
             mem [wr_addr_b+wb] <= mem_wr_b[wb];
           end
         end
         if (WRITE_WIDTH_B_BIN > WRITE_WIDTH_B_4) begin
           for (wb=0;wb<wr_loops_b/8;wb=wb+1) begin
             if (memp_we_b[wb]) begin
               memp [(wr_addr_b/8)+wb] <= memp_wr_b[wb];
             end
           end
         end
         wr_b_event <= ~wr_b_event;
         if (WRITE_MODE_B_BIN == WRITE_MODE_B_WRITE_FIRST) wr_b_wf_event <= ~wr_b_wf_event;
       end
     end
   end

  assign mem_rm_douta = sdp_mode_rd ? {D_WIDTH{1'b0}} : {D_WIDTH{1'bx}}<<rd_loops_a;
  assign memp_rm_douta = sdp_mode_rd ? {DP_WIDTH{1'b0}} : {DP_WIDTH{1'bx}}<<rd_loops_a/8;
  assign mem_rm_doutb = sdp_mode_rd ? {D_WIDTH/2{1'b0}} : {D_WIDTH{1'bx}}<<rd_loops_b;
  assign memp_rm_doutb = sdp_mode_rd ? {DP_WIDTH/2{1'b0}} : {DP_WIDTH/2{1'bx}}<<rd_loops_b/8;
  always @(ADDRARDADDR_in or CLKARDCLK_in or ADDRENA_int or coll_win_rd_clk_a_max or coll_win_wr_clk_a_max) begin
    if (CLKARDCLK_in == 1'b0 && ADDRENA_int == 1'b1) begin
      if (coll_win_rd_clk_a_max == 1'b0) rd_addr_a = ADDRARDADDR_in & rd_addr_a_mask;
      if (coll_win_wr_clk_a_max == 1'b0) wr_addr_a = ADDRARDADDR_in & wr_addr_a_mask;
    end
  end

  always @(ADDRBWRADDR_in or ADDRARDADDR_in or CLKBWRCLK_in or ADDRENB_int or coll_win_rd_clk_b_max or coll_win_wr_clk_b_max) begin
    if (CLKBWRCLK_in == 1'b0 && ADDRENB_int == 1'b1) begin
      if (sdp_mode == 1'b1) begin
        if (coll_win_rd_clk_b_max == 1'b0) rd_addr_b = ADDRARDADDR_in & rd_addr_a_mask;
        end
      else begin
        if (coll_win_rd_clk_b_max == 1'b0) rd_addr_b = ADDRBWRADDR_in & rd_addr_b_mask;
        end
      if (coll_win_wr_clk_b_max == 1'b0) wr_addr_b = ADDRBWRADDR_in & wr_addr_b_mask;
    end
  end

  assign mem_rm_a = {D_WIDTH{1'b1}}>>(max_rd_loops-rd_loops_a);
  assign mem_rm_b = {D_WIDTH{1'b1}}>>(max_rd_loops-rd_loops_b);
  assign mem_wm_a = {D_WIDTH{1'b1}}>>(max_wr_loops-wr_loops_a);
  assign mem_wm_b = {D_WIDTH{1'b1}}>>(max_wr_loops-wr_loops_b);

  always @(*) begin
    if (~sdp_mode && mem_wr_en_a && mem_rd_en_b && ~mem_wr_en_b && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE)) begin
      if ((wr_addr_a & rd_addr_b_mask) == (rd_addr_b & wr_addr_a_mask)) wr_a_rd_b_addr_coll = 1'b1;
      else wr_a_rd_b_addr_coll = 1'b0;
    end
    else wr_a_rd_b_addr_coll = 1'b0;
  end

  always @(*) begin
    if (~sdp_mode && mem_wr_en_b && mem_wr_en_a && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE)) begin
      if ((wr_addr_a & wr_addr_b_mask) == (wr_addr_b & wr_addr_a_mask)) wr_addr_coll = 1'b1;
      else wr_addr_coll = 1'b0;
      end
    else wr_addr_coll = 1'b0;
  end

  always @(*) begin
    if (mem_wr_en_b && mem_rd_en_a && ~mem_wr_en_a && (SIM_COLLISION_CHECK_BIN != SIM_COLLISION_CHECK_NONE)) begin
      if ((wr_addr_b & rd_addr_a_mask) == (rd_addr_a & wr_addr_b_mask)) wr_b_rd_a_addr_coll = 1'b1;
      else wr_b_rd_a_addr_coll = 1'b0;
      end
    else wr_b_rd_a_addr_coll = 1'b0;
  end

  always @ (WEA_in or glblGSR) begin
    mem_we_a = {{8{WEA_in[1]}},{8{WEA_in[0]}}};
    if (WRITE_WIDTH_A_BIN > WRITE_WIDTH_A_4) memp_we_a = WEA_in;
    else memp_we_a = 2'b0;
  end
  always @ (WEBWE_in or glblGSR) begin
    mem_we_b = {{8{WEBWE_in[3]}},{8{WEBWE_in[2]}},{8{WEBWE_in[1]}},{8{WEBWE_in[0]}}};
    if (WRITE_WIDTH_B_BIN > WRITE_WIDTH_B_4) memp_we_b = WEBWE_in;
    else memp_we_b = 4'b0;
  end

  specify
    (CASDINA *> CASDOUTA) = (0:0:0, 0:0:0);
    (CASDINA *> DOUTADOUT) = (0:0:0, 0:0:0);
    (CASDINB *> CASDOUTB) = (0:0:0, 0:0:0);
    (CASDINB *> DOUTBDOUT) = (0:0:0, 0:0:0);
    (CASDINPA *> CASDOUTPA) = (0:0:0, 0:0:0);
    (CASDINPA *> DOUTPADOUTP) = (0:0:0, 0:0:0);
    (CASDINPB *> CASDOUTPB) = (0:0:0, 0:0:0);
    (CASDINPB *> DOUTPBDOUTP) = (0:0:0, 0:0:0);
    (CLKARDCLK *> CASDOUTA) = (0:0:0, 0:0:0);
    (CLKARDCLK *> CASDOUTB) = (0:0:0, 0:0:0);
    (CLKARDCLK *> CASDOUTPA) = (0:0:0, 0:0:0);
    (CLKARDCLK *> CASDOUTPB) = (0:0:0, 0:0:0);
    (CLKARDCLK *> DOUTADOUT) = (0:0:0, 0:0:0);
    (CLKARDCLK *> DOUTBDOUT) = (0:0:0, 0:0:0);
    (CLKARDCLK *> DOUTPADOUTP) = (0:0:0, 0:0:0);
    (CLKARDCLK *> DOUTPBDOUTP) = (0:0:0, 0:0:0);
    (CLKBWRCLK *> CASDOUTB) = (0:0:0, 0:0:0);
    (CLKBWRCLK *> CASDOUTPB) = (0:0:0, 0:0:0);
    (CLKBWRCLK *> DOUTBDOUT) = (0:0:0, 0:0:0);
    (CLKBWRCLK *> DOUTPBDOUTP) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge CLKARDCLK, 0:0:0, notifier);
    $period (negedge CLKBWRCLK, 0:0:0, notifier);
    $period (posedge CLKARDCLK, 0:0:0, notifier);
    $period (posedge CLKBWRCLK, 0:0:0, notifier);
    $setuphold (negedge CLKARDCLK, negedge ADDRARDADDR, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRARDADDR_delay);
    $setuphold (negedge CLKARDCLK, negedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRBWRADDR_delay);
    $setuphold (negedge CLKARDCLK, negedge ADDRENA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRENA_delay);
    $setuphold (negedge CLKARDCLK, negedge ADDRENB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRENB_delay);
    $setuphold (negedge CLKARDCLK, negedge CASDIMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDIMUXA_delay);
    $setuphold (negedge CLKARDCLK, negedge CASDIMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDIMUXB_delay);
    $setuphold (negedge CLKARDCLK, negedge CASDINA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINA_delay);
    $setuphold (negedge CLKARDCLK, negedge CASDINB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINB_delay);
    $setuphold (negedge CLKARDCLK, negedge CASDINPA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINPA_delay);
    $setuphold (negedge CLKARDCLK, negedge CASDINPB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINPB_delay);
    $setuphold (negedge CLKARDCLK, negedge CASDOMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXA_delay);
    $setuphold (negedge CLKARDCLK, negedge CASDOMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXB_delay);
    $setuphold (negedge CLKARDCLK, negedge CASDOMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXEN_A_delay);
    $setuphold (negedge CLKARDCLK, negedge CASDOMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXEN_B_delay);
    $setuphold (negedge CLKARDCLK, negedge CASOREGIMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXA_delay);
    $setuphold (negedge CLKARDCLK, negedge CASOREGIMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXB_delay);
    $setuphold (negedge CLKARDCLK, negedge CASOREGIMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXEN_A_delay);
    $setuphold (negedge CLKARDCLK, negedge CASOREGIMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXEN_B_delay);
    $setuphold (negedge CLKARDCLK, negedge DINADIN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, DINADIN_delay);
    $setuphold (negedge CLKARDCLK, negedge DINPADINP, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, DINPADINP_delay);
    $setuphold (negedge CLKARDCLK, negedge ENARDEN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ENARDEN_delay);
    $setuphold (negedge CLKARDCLK, negedge ENBWREN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ENBWREN_delay);
    $setuphold (negedge CLKARDCLK, negedge REGCEAREGCE, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, REGCEAREGCE_delay);
    $setuphold (negedge CLKARDCLK, negedge REGCEB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, REGCEB_delay);
    $setuphold (negedge CLKARDCLK, negedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
    $setuphold (negedge CLKARDCLK, negedge RSTRAMB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTRAMB_delay);
    $setuphold (negedge CLKARDCLK, negedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTREGARSTREG_delay);
    $setuphold (negedge CLKARDCLK, negedge RSTREGB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTREGB_delay);
    $setuphold (negedge CLKARDCLK, negedge SLEEP, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, SLEEP_delay);
    $setuphold (negedge CLKARDCLK, negedge WEA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, WEA_delay);
    $setuphold (negedge CLKARDCLK, negedge WEBWE, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, WEBWE_delay);
    $setuphold (negedge CLKARDCLK, posedge ADDRARDADDR, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRARDADDR_delay);
    $setuphold (negedge CLKARDCLK, posedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRBWRADDR_delay);
    $setuphold (negedge CLKARDCLK, posedge ADDRENA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRENA_delay);
    $setuphold (negedge CLKARDCLK, posedge ADDRENB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRENB_delay);
    $setuphold (negedge CLKARDCLK, posedge CASDIMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDIMUXA_delay);
    $setuphold (negedge CLKARDCLK, posedge CASDIMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDIMUXB_delay);
    $setuphold (negedge CLKARDCLK, posedge CASDINA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINA_delay);
    $setuphold (negedge CLKARDCLK, posedge CASDINB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINB_delay);
    $setuphold (negedge CLKARDCLK, posedge CASDINPA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINPA_delay);
    $setuphold (negedge CLKARDCLK, posedge CASDINPB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINPB_delay);
    $setuphold (negedge CLKARDCLK, posedge CASDOMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXA_delay);
    $setuphold (negedge CLKARDCLK, posedge CASDOMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXB_delay);
    $setuphold (negedge CLKARDCLK, posedge CASDOMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXEN_A_delay);
    $setuphold (negedge CLKARDCLK, posedge CASDOMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXEN_B_delay);
    $setuphold (negedge CLKARDCLK, posedge CASOREGIMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXA_delay);
    $setuphold (negedge CLKARDCLK, posedge CASOREGIMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXB_delay);
    $setuphold (negedge CLKARDCLK, posedge CASOREGIMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXEN_A_delay);
    $setuphold (negedge CLKARDCLK, posedge CASOREGIMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXEN_B_delay);
    $setuphold (negedge CLKARDCLK, posedge DINADIN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, DINADIN_delay);
    $setuphold (negedge CLKARDCLK, posedge DINPADINP, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, DINPADINP_delay);
    $setuphold (negedge CLKARDCLK, posedge ENARDEN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ENARDEN_delay);
    $setuphold (negedge CLKARDCLK, posedge ENBWREN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ENBWREN_delay);
    $setuphold (negedge CLKARDCLK, posedge REGCEAREGCE, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, REGCEAREGCE_delay);
    $setuphold (negedge CLKARDCLK, posedge REGCEB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, REGCEB_delay);
    $setuphold (negedge CLKARDCLK, posedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
    $setuphold (negedge CLKARDCLK, posedge RSTRAMB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTRAMB_delay);
    $setuphold (negedge CLKARDCLK, posedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTREGARSTREG_delay);
    $setuphold (negedge CLKARDCLK, posedge RSTREGB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTREGB_delay);
    $setuphold (negedge CLKARDCLK, posedge SLEEP, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, SLEEP_delay);
    $setuphold (negedge CLKARDCLK, posedge WEA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, WEA_delay);
    $setuphold (negedge CLKARDCLK, posedge WEBWE, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, WEBWE_delay);
    $setuphold (negedge CLKBWRCLK, negedge ADDRARDADDR, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRARDADDR_delay);
    $setuphold (negedge CLKBWRCLK, negedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRBWRADDR_delay);
    $setuphold (negedge CLKBWRCLK, negedge ADDRENA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRENA_delay);
    $setuphold (negedge CLKBWRCLK, negedge ADDRENB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRENB_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASDIMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDIMUXB_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASDINA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINA_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASDINB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINB_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASDINPA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINPA_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASDINPB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINPB_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASDOMUXA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXA_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASDOMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXB_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASDOMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXEN_A_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASDOMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXEN_B_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASOREGIMUXA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXA_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASOREGIMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXB_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASOREGIMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXEN_A_delay);
    $setuphold (negedge CLKBWRCLK, negedge CASOREGIMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXEN_B_delay);
    $setuphold (negedge CLKBWRCLK, negedge DINADIN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINADIN_delay);
    $setuphold (negedge CLKBWRCLK, negedge DINBDIN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINBDIN_delay);
    $setuphold (negedge CLKBWRCLK, negedge DINPADINP, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINPADINP_delay);
    $setuphold (negedge CLKBWRCLK, negedge DINPBDINP, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINPBDINP_delay);
    $setuphold (negedge CLKBWRCLK, negedge ENARDEN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ENARDEN_delay);
    $setuphold (negedge CLKBWRCLK, negedge ENBWREN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ENBWREN_delay);
    $setuphold (negedge CLKBWRCLK, negedge REGCEAREGCE, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, REGCEAREGCE_delay);
    $setuphold (negedge CLKBWRCLK, negedge REGCEB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, REGCEB_delay);
    $setuphold (negedge CLKBWRCLK, negedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTRAMARSTRAM_delay);
    $setuphold (negedge CLKBWRCLK, negedge RSTRAMB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTRAMB_delay);
    $setuphold (negedge CLKBWRCLK, negedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTREGARSTREG_delay);
    $setuphold (negedge CLKBWRCLK, negedge RSTREGB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTREGB_delay);
    $setuphold (negedge CLKBWRCLK, negedge WEA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, WEA_delay);
    $setuphold (negedge CLKBWRCLK, negedge WEBWE, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, WEBWE_delay);
    $setuphold (negedge CLKBWRCLK, posedge ADDRARDADDR, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRARDADDR_delay);
    $setuphold (negedge CLKBWRCLK, posedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRBWRADDR_delay);
    $setuphold (negedge CLKBWRCLK, posedge ADDRENA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRENA_delay);
    $setuphold (negedge CLKBWRCLK, posedge ADDRENB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRENB_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASDIMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDIMUXB_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASDINA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINA_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASDINB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINB_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASDINPA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINPA_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASDINPB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINPB_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASDOMUXA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXA_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASDOMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXB_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASDOMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXEN_A_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASDOMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXEN_B_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASOREGIMUXA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXA_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASOREGIMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXB_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASOREGIMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXEN_A_delay);
    $setuphold (negedge CLKBWRCLK, posedge CASOREGIMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXEN_B_delay);
    $setuphold (negedge CLKBWRCLK, posedge DINADIN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINADIN_delay);
    $setuphold (negedge CLKBWRCLK, posedge DINBDIN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINBDIN_delay);
    $setuphold (negedge CLKBWRCLK, posedge DINPADINP, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINPADINP_delay);
    $setuphold (negedge CLKBWRCLK, posedge DINPBDINP, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINPBDINP_delay);
    $setuphold (negedge CLKBWRCLK, posedge ENARDEN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ENARDEN_delay);
    $setuphold (negedge CLKBWRCLK, posedge ENBWREN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ENBWREN_delay);
    $setuphold (negedge CLKBWRCLK, posedge REGCEAREGCE, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, REGCEAREGCE_delay);
    $setuphold (negedge CLKBWRCLK, posedge REGCEB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, REGCEB_delay);
    $setuphold (negedge CLKBWRCLK, posedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTRAMARSTRAM_delay);
    $setuphold (negedge CLKBWRCLK, posedge RSTRAMB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTRAMB_delay);
    $setuphold (negedge CLKBWRCLK, posedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTREGARSTREG_delay);
    $setuphold (negedge CLKBWRCLK, posedge RSTREGB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTREGB_delay);
    $setuphold (negedge CLKBWRCLK, posedge WEA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, WEA_delay);
    $setuphold (negedge CLKBWRCLK, posedge WEBWE, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, WEBWE_delay);
    $setuphold (posedge CLKARDCLK, negedge ADDRARDADDR, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRARDADDR_delay);
    $setuphold (posedge CLKARDCLK, negedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRBWRADDR_delay);
    $setuphold (posedge CLKARDCLK, negedge ADDRENA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRENA_delay);
    $setuphold (posedge CLKARDCLK, negedge ADDRENB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRENB_delay);
    $setuphold (posedge CLKARDCLK, negedge CASDIMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDIMUXA_delay);
    $setuphold (posedge CLKARDCLK, negedge CASDIMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDIMUXB_delay);
    $setuphold (posedge CLKARDCLK, negedge CASDINA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINA_delay);
    $setuphold (posedge CLKARDCLK, negedge CASDINB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINB_delay);
    $setuphold (posedge CLKARDCLK, negedge CASDINPA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINPA_delay);
    $setuphold (posedge CLKARDCLK, negedge CASDINPB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINPB_delay);
    $setuphold (posedge CLKARDCLK, negedge CASDOMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXA_delay);
    $setuphold (posedge CLKARDCLK, negedge CASDOMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXB_delay);
    $setuphold (posedge CLKARDCLK, negedge CASDOMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXEN_A_delay);
    $setuphold (posedge CLKARDCLK, negedge CASDOMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXEN_B_delay);
    $setuphold (posedge CLKARDCLK, negedge CASOREGIMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXA_delay);
    $setuphold (posedge CLKARDCLK, negedge CASOREGIMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXB_delay);
    $setuphold (posedge CLKARDCLK, negedge CASOREGIMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXEN_A_delay);
    $setuphold (posedge CLKARDCLK, negedge CASOREGIMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXEN_B_delay);
    $setuphold (posedge CLKARDCLK, negedge DINADIN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, DINADIN_delay);
    $setuphold (posedge CLKARDCLK, negedge DINPADINP, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, DINPADINP_delay);
    $setuphold (posedge CLKARDCLK, negedge ENARDEN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ENARDEN_delay);
    $setuphold (posedge CLKARDCLK, negedge ENBWREN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ENBWREN_delay);
    $setuphold (posedge CLKARDCLK, negedge REGCEAREGCE, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, REGCEAREGCE_delay);
    $setuphold (posedge CLKARDCLK, negedge REGCEB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, REGCEB_delay);
    $setuphold (posedge CLKARDCLK, negedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
    $setuphold (posedge CLKARDCLK, negedge RSTRAMB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTRAMB_delay);
    $setuphold (posedge CLKARDCLK, negedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTREGARSTREG_delay);
    $setuphold (posedge CLKARDCLK, negedge RSTREGB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTREGB_delay);
    $setuphold (posedge CLKARDCLK, negedge SLEEP, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, SLEEP_delay);
    $setuphold (posedge CLKARDCLK, negedge WEA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, WEA_delay);
    $setuphold (posedge CLKARDCLK, negedge WEBWE, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, WEBWE_delay);
    $setuphold (posedge CLKARDCLK, posedge ADDRARDADDR, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRARDADDR_delay);
    $setuphold (posedge CLKARDCLK, posedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRBWRADDR_delay);
    $setuphold (posedge CLKARDCLK, posedge ADDRENA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRENA_delay);
    $setuphold (posedge CLKARDCLK, posedge ADDRENB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ADDRENB_delay);
    $setuphold (posedge CLKARDCLK, posedge CASDIMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDIMUXA_delay);
    $setuphold (posedge CLKARDCLK, posedge CASDIMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDIMUXB_delay);
    $setuphold (posedge CLKARDCLK, posedge CASDINA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINA_delay);
    $setuphold (posedge CLKARDCLK, posedge CASDINB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINB_delay);
    $setuphold (posedge CLKARDCLK, posedge CASDINPA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINPA_delay);
    $setuphold (posedge CLKARDCLK, posedge CASDINPB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDINPB_delay);
    $setuphold (posedge CLKARDCLK, posedge CASDOMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXA_delay);
    $setuphold (posedge CLKARDCLK, posedge CASDOMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXB_delay);
    $setuphold (posedge CLKARDCLK, posedge CASDOMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXEN_A_delay);
    $setuphold (posedge CLKARDCLK, posedge CASDOMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASDOMUXEN_B_delay);
    $setuphold (posedge CLKARDCLK, posedge CASOREGIMUXA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXA_delay);
    $setuphold (posedge CLKARDCLK, posedge CASOREGIMUXB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXB_delay);
    $setuphold (posedge CLKARDCLK, posedge CASOREGIMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXEN_A_delay);
    $setuphold (posedge CLKARDCLK, posedge CASOREGIMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, CASOREGIMUXEN_B_delay);
    $setuphold (posedge CLKARDCLK, posedge DINADIN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, DINADIN_delay);
    $setuphold (posedge CLKARDCLK, posedge DINPADINP, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, DINPADINP_delay);
    $setuphold (posedge CLKARDCLK, posedge ENARDEN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ENARDEN_delay);
    $setuphold (posedge CLKARDCLK, posedge ENBWREN, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, ENBWREN_delay);
    $setuphold (posedge CLKARDCLK, posedge REGCEAREGCE, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, REGCEAREGCE_delay);
    $setuphold (posedge CLKARDCLK, posedge REGCEB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, REGCEB_delay);
    $setuphold (posedge CLKARDCLK, posedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
    $setuphold (posedge CLKARDCLK, posedge RSTRAMB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTRAMB_delay);
    $setuphold (posedge CLKARDCLK, posedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTREGARSTREG_delay);
    $setuphold (posedge CLKARDCLK, posedge RSTREGB, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, RSTREGB_delay);
    $setuphold (posedge CLKARDCLK, posedge SLEEP, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, SLEEP_delay);
    $setuphold (posedge CLKARDCLK, posedge WEA, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, WEA_delay);
    $setuphold (posedge CLKARDCLK, posedge WEBWE, 0:0:0, 0:0:0, notifier,,, CLKARDCLK_delay, WEBWE_delay);
    $setuphold (posedge CLKBWRCLK, negedge ADDRARDADDR, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRARDADDR_delay);
    $setuphold (posedge CLKBWRCLK, negedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRBWRADDR_delay);
    $setuphold (posedge CLKBWRCLK, negedge ADDRENA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRENA_delay);
    $setuphold (posedge CLKBWRCLK, negedge ADDRENB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRENB_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASDIMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDIMUXB_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASDINA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINA_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASDINB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINB_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASDINPA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINPA_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASDINPB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINPB_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASDOMUXA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXA_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASDOMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXB_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASDOMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXEN_A_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASDOMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXEN_B_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASOREGIMUXA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXA_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASOREGIMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXB_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASOREGIMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXEN_A_delay);
    $setuphold (posedge CLKBWRCLK, negedge CASOREGIMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXEN_B_delay);
    $setuphold (posedge CLKBWRCLK, negedge DINADIN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINADIN_delay);
    $setuphold (posedge CLKBWRCLK, negedge DINBDIN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINBDIN_delay);
    $setuphold (posedge CLKBWRCLK, negedge DINPADINP, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINPADINP_delay);
    $setuphold (posedge CLKBWRCLK, negedge DINPBDINP, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINPBDINP_delay);
    $setuphold (posedge CLKBWRCLK, negedge ENARDEN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ENARDEN_delay);
    $setuphold (posedge CLKBWRCLK, negedge ENBWREN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ENBWREN_delay);
    $setuphold (posedge CLKBWRCLK, negedge REGCEAREGCE, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, REGCEAREGCE_delay);
    $setuphold (posedge CLKBWRCLK, negedge REGCEB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, REGCEB_delay);
    $setuphold (posedge CLKBWRCLK, negedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTRAMARSTRAM_delay);
    $setuphold (posedge CLKBWRCLK, negedge RSTRAMB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTRAMB_delay);
    $setuphold (posedge CLKBWRCLK, negedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTREGARSTREG_delay);
    $setuphold (posedge CLKBWRCLK, negedge RSTREGB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTREGB_delay);
    $setuphold (posedge CLKBWRCLK, negedge WEA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, WEA_delay);
    $setuphold (posedge CLKBWRCLK, negedge WEBWE, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, WEBWE_delay);
    $setuphold (posedge CLKBWRCLK, posedge ADDRARDADDR, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRARDADDR_delay);
    $setuphold (posedge CLKBWRCLK, posedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRBWRADDR_delay);
    $setuphold (posedge CLKBWRCLK, posedge ADDRENA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRENA_delay);
    $setuphold (posedge CLKBWRCLK, posedge ADDRENB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ADDRENB_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASDIMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDIMUXB_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASDINA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINA_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASDINB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINB_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASDINPA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINPA_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASDINPB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDINPB_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASDOMUXA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXA_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASDOMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXB_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASDOMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXEN_A_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASDOMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASDOMUXEN_B_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASOREGIMUXA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXA_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASOREGIMUXB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXB_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASOREGIMUXEN_A, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXEN_A_delay);
    $setuphold (posedge CLKBWRCLK, posedge CASOREGIMUXEN_B, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, CASOREGIMUXEN_B_delay);
    $setuphold (posedge CLKBWRCLK, posedge DINADIN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINADIN_delay);
    $setuphold (posedge CLKBWRCLK, posedge DINBDIN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINBDIN_delay);
    $setuphold (posedge CLKBWRCLK, posedge DINPADINP, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINPADINP_delay);
    $setuphold (posedge CLKBWRCLK, posedge DINPBDINP, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, DINPBDINP_delay);
    $setuphold (posedge CLKBWRCLK, posedge ENARDEN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ENARDEN_delay);
    $setuphold (posedge CLKBWRCLK, posedge ENBWREN, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, ENBWREN_delay);
    $setuphold (posedge CLKBWRCLK, posedge REGCEAREGCE, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, REGCEAREGCE_delay);
    $setuphold (posedge CLKBWRCLK, posedge REGCEB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, REGCEB_delay);
    $setuphold (posedge CLKBWRCLK, posedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTRAMARSTRAM_delay);
    $setuphold (posedge CLKBWRCLK, posedge RSTRAMB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTRAMB_delay);
    $setuphold (posedge CLKBWRCLK, posedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTREGARSTREG_delay);
    $setuphold (posedge CLKBWRCLK, posedge RSTREGB, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, RSTREGB_delay);
    $setuphold (posedge CLKBWRCLK, posedge WEA, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, WEA_delay);
    $setuphold (posedge CLKBWRCLK, posedge WEBWE, 0:0:0, 0:0:0, notifier,,, CLKBWRCLK_delay, WEBWE_delay);
    $width (negedge CLKARDCLK, 0:0:0, 0, notifier);
    $width (negedge CLKBWRCLK, 0:0:0, 0, notifier);
    $width (posedge CLKARDCLK, 0:0:0, 0, notifier);
    $width (posedge CLKBWRCLK, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
