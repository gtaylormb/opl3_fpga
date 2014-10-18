// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2008 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 11.1
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  32K-Bit Data and 4K-Bit Parity Dual Port Block RAM
// /___/   /\     Filename : RAMB36E1.v
// \   \  /  \    Timestamp : Tue Feb 26 13:49:08 PST 2008
//  \___\/\___\
//
// Revision:
//    02/26/08 - Initial version.
//    07/25/08 - Fixed ECC in register mode. (IR 477257)
//    07/30/08 - Updated to support SDP mode with smaller port width <= 36. (IR 477258) 
//    11/04/08 - Fixed incorrect output during first clock cycle. (CR 470964)
//    11/10/08 - Added DRC for invalid input parity for ECC (CR 482976).
//    11/20/08 - Changed RDADDRECC[12:0] to [8:0] (IR 496907).
//    03/11/09 - X's the unused bits of outputs (CR 511363).
//    03/12/09 - Removed parameter from specify block (CR 503821).
//    03/23/09 - Fixed unusual behavior of X's in the unused bits of outputs (CR 513167). 
//    04/10/09 - Implemented workaround for NCSim event triggering during initial time (CR 517450).
//    04/17/09 - Implemented X's in sbiterr and dbiterr outputs during collision in ECC mode (CR 508071).
//    08/03/09 - Updated collision behavior when both clocks are in phase/within 100 ps (CR 522327).
//    08/12/09 - Updated collision address check for none in phase clocks (CR 527010).
//    11/16/09 - Implemented DRC for ADDR[15] in non-cascade mode (CR 535882).
//    11/18/09 - Define tasks and functions before calling (CR 532610).
//    11/24/09 - Undo CR 535882, bitgen or map is going to tie off ADDR[15] instead.
//    12/16/09 - Enhanced memory initialization (CR 540764).
//    03/15/10 - Updated address collision for asynchronous clocks and read first mode (CR 527010).
//    04/01/10 - Fixed clocks detection for collision (CR 552123).
//    05/11/10 - Updated clocks detection for collision (CR 557624).
//             - Added attribute RDADDR_COLLISION_HWCONFIG (CR 557971).
//    05/25/10 - Added WRITE_FIRST support in SDP mode (CR 561807).
//    06/03/10 - Added functionality for attribute RDADDR_COLLISION_HWCONFIG (CR 557971).
//    07/08/10 - Added SIM_DEVICE attribute (CR 567633).
//    07/09/10 - Fixed INJECTSBITERR and INJECTDBITERR behaviors (CR 565234).
//    07/09/10 - Initialized memory to zero for INIT_FILE (CR 560672).
//    08/09/10 - Updated the model according to new address collision/overlap tables (CR 566507). 
//    09/16/10 - Updated from bit to bus timing (CR 575523).
//    10/14/10 - Removed NO_CHANGE support in SDP mode (CR 575924).
//    10/15/10 - Updated 7SERIES address overlap and address collision (CR 575953).
//    12/10/10 - Converted parameter to wire in specify block (CR 574534).
//    03/16/11 - Changed synchronous clock skew to 50ps for 7 series(CR 588053).
//    08/04/11 - Fixed address overlap when clocks are within 100ps (CR 611004).
//    09/12/11 - Fixed ECC error when clocks are within 100ps with address collision/overlap (CR 621942).
//    09/28/11 - Fixed ECC error when clocks are within 100ps with address collision/overlap, part 2 (CR 621942).
//    10/11/11 - Fixed collision with clocks rise at the same time (CR 628129).
//    10/17/11 - Fixed collision with clocks within 100ps in SDP mode (CR 620844).
//    10/28/11 - Removed all mention of internal block ram from messaging (CR 569190).
//    11/04/11 - Fixed collision with clock within 100ps in TDP mode (CR 627670).
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    02/05/12 - Fixed read width function when READ_WIDTH_A/B = 0 (CR 643482).
//    02/22/12 - Fixed mem/memp out of bounds warning messages (CR 584399).
//    02/23/12 - Fixed SDP mode when write width is 32 and read width is 64 (CR 647335).
//    03/06/12 - Fixed hierarchical error from CR 584399 (CR 648454).
//    03/15/12 - Reverted CR 584399 (CR 651279).
//    02/15/13 - Updated collision check to use clock period or 3ns (CR 694934).
//    07/25/13 - Added invertible pins support (CR 715417).
//    09/04/13 - Removed warning for memp (CR 728988).
//    03/24/14 - Balanced all iniputs with xor (CR778933).
//    08/29/14 - Added negative timing check (CR 821138).
//    End Revision

`timescale 1 ps/1 ps
`celldefine
    
module RAMB36E1 (CASCADEOUTA, CASCADEOUTB, DBITERR, DOADO, DOBDO, DOPADOP, DOPBDOP, ECCPARITY, RDADDRECC, SBITERR, 
		 ADDRARDADDR, ADDRBWRADDR, CASCADEINA, CASCADEINB, CLKARDCLK, CLKBWRCLK, DIADI, DIBDI, DIPADIP, DIPBDIP, ENARDEN, ENBWREN, INJECTDBITERR, INJECTSBITERR, REGCEAREGCE, REGCEB, RSTRAMARSTRAM, RSTRAMB, RSTREGARSTREG, RSTREGB, WEA, WEBWE);

    parameter integer DOA_REG = 0;
    parameter integer DOB_REG = 0;
    parameter EN_ECC_READ = "FALSE";
    parameter EN_ECC_WRITE = "FALSE";
    parameter INITP_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_40 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_41 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_42 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_43 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_44 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_45 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_46 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_47 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_48 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_49 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_50 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_51 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_52 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_53 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_54 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_55 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_56 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_57 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_58 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_59 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_60 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_61 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_62 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_63 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_64 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_65 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_66 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_67 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_68 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_69 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_70 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_71 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_72 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_73 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_74 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_75 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_76 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_77 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_78 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_79 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_A = 36'h0;
    parameter INIT_B = 36'h0;
    parameter INIT_FILE = "NONE";
    parameter IS_CLKARDCLK_INVERTED = 1'b0;
    parameter IS_CLKBWRCLK_INVERTED = 1'b0;
    parameter IS_ENARDEN_INVERTED = 1'b0;
    parameter IS_ENBWREN_INVERTED = 1'b0;
    parameter IS_RSTRAMARSTRAM_INVERTED = 1'b0;
    parameter IS_RSTRAMB_INVERTED = 1'b0;
    parameter IS_RSTREGARSTREG_INVERTED = 1'b0;
    parameter IS_RSTREGB_INVERTED = 1'b0;

`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif //  `ifdef XIL_TIMING
    
    parameter RAM_EXTENSION_A = "NONE";
    parameter RAM_EXTENSION_B = "NONE";
    parameter RAM_MODE = "TDP";
    parameter RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE";
    parameter integer READ_WIDTH_A = 0;
    parameter integer READ_WIDTH_B = 0;
    parameter RSTREG_PRIORITY_A = "RSTREG";
    parameter RSTREG_PRIORITY_B = "RSTREG";
    parameter SIM_COLLISION_CHECK = "ALL";
    parameter SIM_DEVICE = "VIRTEX6";
    parameter SRVAL_A = 36'h0;
    parameter SRVAL_B = 36'h0;
    parameter WRITE_MODE_A = "WRITE_FIRST";
    parameter WRITE_MODE_B = "WRITE_FIRST";
    parameter integer WRITE_WIDTH_A = 0;
    parameter integer WRITE_WIDTH_B = 0;
    
    localparam SETUP_ALL = 1000;
    localparam SETUP_READ_FIRST = 3000;
    
    output CASCADEOUTA;
    output CASCADEOUTB;
    output [31:0] DOADO;
    output [31:0] DOBDO;
    output [3:0] DOPADOP;
    output [3:0] DOPBDOP;
    output [7:0] ECCPARITY;
    output [8:0] RDADDRECC;
    output SBITERR, DBITERR;
    
    input ENARDEN, CLKARDCLK, RSTRAMARSTRAM, RSTREGARSTREG, CASCADEINA, REGCEAREGCE;
    input ENBWREN, CLKBWRCLK, RSTRAMB, RSTREGB, CASCADEINB, REGCEB;
    input INJECTDBITERR, INJECTSBITERR;
    input [15:0] ADDRARDADDR;
    input [15:0] ADDRBWRADDR;
    input [31:0] DIADI;
    input [31:0] DIBDI;
    input [3:0] DIPADIP;
    input [3:0] DIPBDIP;
    input [3:0] WEA;
    input [7:0] WEBWE;

    tri0 GSR = glbl.GSR;

    wire [3:0] dangle_out4;
    wire [31:0] dangle_out32;
    wire [31:0]	doado_wire, dobdo_wire;
    wire [3:0] dopadop_wire, dopbdop_wire;
    wire cascadeouta_wire, cascadeoutb_wire;
    reg [31:0] doado_out, dobdo_out;
    reg [3:0] dopadop_out, dopbdop_out;
    reg cascadeouta_out, cascadeoutb_out;
    reg notifier, notifier_a, notifier_b;
    reg notifier_addra0, notifier_addra1, notifier_addra2, notifier_addra3, notifier_addra4;
    reg notifier_addra5, notifier_addra6, notifier_addra7, notifier_addra8, notifier_addra9;
    reg notifier_addra10, notifier_addra11, notifier_addra12, notifier_addra13, notifier_addra14;
    reg notifier_addra15;
    reg notifier_addrb0, notifier_addrb1, notifier_addrb2, notifier_addrb3, notifier_addrb4;
    reg notifier_addrb5, notifier_addrb6, notifier_addrb7, notifier_addrb8, notifier_addrb9;
    reg notifier_addrb10, notifier_addrb11, notifier_addrb12, notifier_addrb13, notifier_addrb14;
    reg notifier_addrb15;
    reg	attr_err = 1'b0;

    wire cascadeina_in, regcearegce_in;
    wire cascadeinb_in, regceb_in;
    wire injectdbiterr_in, injectsbiterr_in;
    wire [15:0] addrardaddr_in;
    wire [15:0] addrbwraddr_in;
    wire [31:0] diadi_in;
    wire [31:0] dibdi_in;
    wire [3:0] dipadip_in;
    wire [3:0] dipbdip_in;
    wire [3:0] wea_in;
    wire [7:0] webwe_in;

   wire CASCADEINA_delay;
   wire CASCADEINB_delay;
   wire CLKARDCLK_delay;
   wire CLKBWRCLK_delay;
   wire ENARDEN_delay;
   wire ENBWREN_delay;
   wire INJECTDBITERR_delay;
   wire INJECTSBITERR_delay;
   wire REGCEAREGCE_delay;
   wire REGCEB_delay;
   wire RSTRAMARSTRAM_delay;
   wire RSTRAMB_delay;
   wire RSTREGARSTREG_delay;
   wire RSTREGB_delay;
   wire [15:0] ADDRARDADDR_delay;
   wire [15:0] ADDRBWRADDR_delay;
   wire [31:0] DIADI_delay;
   wire [31:0] DIBDI_delay;
   wire [3:0] DIPADIP_delay;
   wire [3:0] DIPBDIP_delay;
   wire [3:0] WEA_delay;
   wire [7:0] WEBWE_delay;

   wire cascadeina_tmp;
   wire cascadeinb_tmp;
   wire clkardclk_tmp;
   wire clkbwrclk_tmp;
   wire enarden_tmp;
   wire enbwren_tmp;
   wire injectdbiterr_tmp;
   wire injectsbiterr_tmp;
   wire regcearegce_tmp;
   wire regceb_tmp;
   wire rstramarstram_tmp;
   wire rstramb_tmp;
   wire rstregarstreg_tmp;
   wire rstregb_tmp;
   wire [15:0] addrardaddr_tmp;
   wire [15:0] addrbwraddr_tmp;
   wire [31:0] diadi_tmp;
   wire [31:0] dibdi_tmp;
   wire [3:0] dipadip_tmp;
   wire [3:0] dipbdip_tmp;
   wire [3:0] wea_tmp;
   wire [7:0] webwe_tmp;
   
`ifndef XIL_TIMING
   assign cascadeina_tmp = CASCADEINA;
   assign cascadeinb_tmp = CASCADEINB;
   assign regcearegce_tmp = REGCEAREGCE;
   assign regceb_tmp = REGCEB;
   assign injectdbiterr_tmp = INJECTDBITERR;
   assign injectsbiterr_tmp = INJECTSBITERR;
   assign addrardaddr_tmp = ADDRARDADDR;
   assign addrbwraddr_tmp = ADDRBWRADDR;
   assign diadi_tmp = DIADI;
   assign dibdi_tmp = DIBDI;
   assign dipadip_tmp = DIPADIP;
   assign dipbdip_tmp = DIPBDIP;
   assign wea_tmp = WEA;
   assign webwe_tmp = WEBWE;
   assign clkardclk_tmp = CLKARDCLK;
   assign clkbwrclk_tmp = CLKBWRCLK;
   assign enarden_tmp = ENARDEN;
   assign enbwren_tmp = ENBWREN;
   assign rstramarstram_tmp = RSTRAMARSTRAM;
   assign rstramb_tmp = RSTRAMB;
   assign rstregarstreg_tmp = RSTREGARSTREG;
   assign rstregb_tmp = RSTREGB;
`endif //  `ifndef XIL_TIMING

`ifdef XIL_TIMING
   assign cascadeina_tmp = CASCADEINA;
   assign cascadeinb_tmp = CASCADEINB;
   assign regcearegce_tmp = REGCEAREGCE_delay;
   assign regceb_tmp = REGCEB_delay;
   assign injectdbiterr_tmp = INJECTDBITERR_delay;
   assign injectsbiterr_tmp = INJECTSBITERR_delay;
   assign addrardaddr_tmp = ADDRARDADDR_delay;
   assign addrbwraddr_tmp = ADDRBWRADDR_delay;
   assign diadi_tmp = DIADI_delay;
   assign dibdi_tmp = DIBDI_delay;
   assign dipadip_tmp = DIPADIP_delay;
   assign dipbdip_tmp = DIPBDIP_delay;
   assign wea_tmp = WEA_delay;
   assign webwe_tmp = WEBWE_delay;
   assign clkardclk_tmp = CLKARDCLK_delay;
   assign clkbwrclk_tmp = CLKBWRCLK_delay;
   assign enarden_tmp = ENARDEN_delay;
   assign enbwren_tmp = ENBWREN_delay;
   assign rstramarstram_tmp = RSTRAMARSTRAM_delay;
   assign rstramb_tmp = RSTRAMB_delay;
   assign rstregarstreg_tmp = RSTREGARSTREG_delay;
   assign rstregb_tmp = RSTREGB_delay;
`endif //  `ifdef XIL_TIMING
   
   assign cascadeina_in = cascadeina_tmp ^ 1'b0;
   assign cascadeinb_in = cascadeinb_tmp ^ 1'b0;
   assign regcearegce_in = regcearegce_tmp ^ 1'b0;
   assign regceb_in = regceb_tmp ^ 1'b0;
   assign injectdbiterr_in = injectdbiterr_tmp ^ 1'b0;
   assign injectsbiterr_in = injectsbiterr_tmp ^ 1'b0;
   assign addrardaddr_in = addrardaddr_tmp ^ 16'h0000;
   assign addrbwraddr_in = addrbwraddr_tmp ^ 16'h0000;
   assign diadi_in = diadi_tmp ^ 32'h00000000;
   assign dibdi_in = dibdi_tmp ^ 32'h00000000;
   assign dipadip_in = dipadip_tmp ^ 4'h0;
   assign dipbdip_in = dipbdip_tmp ^ 4'h0;
   assign wea_in = wea_tmp ^ 4'h0;
   assign webwe_in = webwe_tmp ^ 8'h00;
   assign clkardclk_in = clkardclk_tmp ^ IS_CLKARDCLK_INVERTED;
   assign clkbwrclk_in = clkbwrclk_tmp ^ IS_CLKBWRCLK_INVERTED;
   assign enarden_in = enarden_tmp ^ IS_ENARDEN_INVERTED;
   assign enbwren_in = enbwren_tmp ^ IS_ENBWREN_INVERTED;
   assign rstramarstram_in = rstramarstram_tmp ^ IS_RSTRAMARSTRAM_INVERTED;
   assign rstramb_in = rstramb_tmp ^ IS_RSTRAMB_INVERTED;
   assign rstregarstreg_in = rstregarstreg_tmp ^ IS_RSTREGARSTREG_INVERTED;
   assign rstregb_in = rstregb_tmp ^ IS_RSTREGB_INVERTED;


   initial begin

          if (!((IS_CLKARDCLK_INVERTED >= 1'b0) && (IS_CLKARDCLK_INVERTED <= 1'b1))) begin
	     $display("Attribute Syntax Error : The attribute IS_CLKARDCLK_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_CLKARDCLK_INVERTED);
	     attr_err = 1'b1;
	  end

          if (!((IS_CLKBWRCLK_INVERTED >= 1'b0) && (IS_CLKBWRCLK_INVERTED <= 1'b1))) begin
	     $display("Attribute Syntax Error : The attribute IS_CLKBWRCLK_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_CLKBWRCLK_INVERTED);
	     attr_err = 1'b1;
	  end
      
          if (!((IS_ENARDEN_INVERTED >= 1'b0) && (IS_ENARDEN_INVERTED <= 1'b1))) begin
	     $display("Attribute Syntax Error : The attribute IS_ENARDEN_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_ENARDEN_INVERTED);
	     attr_err = 1'b1;
	  end

          if (!((IS_ENBWREN_INVERTED >= 1'b0) && (IS_ENBWREN_INVERTED <= 1'b1))) begin
	     $display("Attribute Syntax Error : The attribute IS_ENBWREN_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_ENBWREN_INVERTED);
	     attr_err = 1'b1;
	  end
      
          if (!((IS_RSTRAMARSTRAM_INVERTED >= 1'b0) && (IS_RSTRAMARSTRAM_INVERTED <= 1'b1))) begin
	     $display("Attribute Syntax Error : The attribute IS_RSTRAMARSTRAM_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RSTRAMARSTRAM_INVERTED);
	     attr_err = 1'b1;
	  end

          if (!((IS_RSTRAMB_INVERTED >= 1'b0) && (IS_RSTRAMB_INVERTED <= 1'b1))) begin
	     $display("Attribute Syntax Error : The attribute IS_RSTRAMB_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RSTRAMB_INVERTED);
	     attr_err = 1'b1;
	  end
      
          if (!((IS_RSTREGARSTREG_INVERTED >= 1'b0) && (IS_RSTREGARSTREG_INVERTED <= 1'b1))) begin
	     $display("Attribute Syntax Error : The attribute IS_RSTREGARSTREG_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RSTREGARSTREG_INVERTED);
	     attr_err = 1'b1;
	  end

          if (!((IS_RSTREGB_INVERTED >= 1'b0) && (IS_RSTREGB_INVERTED <= 1'b1))) begin
	     $display("Attribute Syntax Error : The attribute IS_RSTREGB_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RSTREGB_INVERTED);
	     attr_err = 1'b1;
	  end

          if (attr_err == 1'b1) $finish;

   end // initial begin


   
    // special handle for sdp width = 72 and < 72
    localparam init_sdp = (READ_WIDTH_A == 72) ? {INIT_B[35:32],INIT_A[35:32],INIT_B[31:0],INIT_A[31:0]} : {INIT_B, INIT_A};
    localparam srval_sdp = (READ_WIDTH_A == 72) ? {SRVAL_B[35:32],SRVAL_A[35:32],SRVAL_B[31:0],SRVAL_A[31:0]} : {SRVAL_B, SRVAL_A};

    
    generate
        case (RAM_MODE)
	    
	    "TDP" : begin
	
		RB36_INTERNAL_VLOG #(.RAM_MODE(RAM_MODE),
				  .INIT_A(INIT_A),
				  .INIT_B(INIT_B),
				  .INIT_FILE(INIT_FILE),
				  .SRVAL_A(SRVAL_A),
				  .SRVAL_B(SRVAL_B),
				  .READ_WIDTH_A(READ_WIDTH_A),
				  .READ_WIDTH_B(READ_WIDTH_B),
				  .WRITE_WIDTH_A(WRITE_WIDTH_A),
				  .WRITE_WIDTH_B(WRITE_WIDTH_B),
				  .WRITE_MODE_A(WRITE_MODE_A),
				  .WRITE_MODE_B(WRITE_MODE_B),
				  .RAM_EXTENSION_A(RAM_EXTENSION_A),
				  .RAM_EXTENSION_B(RAM_EXTENSION_B),
				  .RDADDR_COLLISION_HWCONFIG(RDADDR_COLLISION_HWCONFIG),
				  .SETUP_ALL(SETUP_ALL),
				  .SETUP_READ_FIRST(SETUP_READ_FIRST),
				  .SIM_COLLISION_CHECK(SIM_COLLISION_CHECK),
				  .SIM_DEVICE(SIM_DEVICE),
				  .EN_ECC_READ(EN_ECC_READ),
				  .EN_ECC_WRITE(EN_ECC_WRITE),
				  .DOA_REG(DOA_REG),
				  .DOB_REG(DOB_REG),
				  .RSTREG_PRIORITY_A(RSTREG_PRIORITY_A),
				  .RSTREG_PRIORITY_B(RSTREG_PRIORITY_B),
				  .INIT_00(INIT_00),
				  .INIT_01(INIT_01),
				  .INIT_02(INIT_02),
				  .INIT_03(INIT_03),
				  .INIT_04(INIT_04),
				  .INIT_05(INIT_05),
				  .INIT_06(INIT_06),
				  .INIT_07(INIT_07),
				  .INIT_08(INIT_08),
				  .INIT_09(INIT_09),
				  .INIT_0A(INIT_0A),
				  .INIT_0B(INIT_0B),
				  .INIT_0C(INIT_0C),
				  .INIT_0D(INIT_0D),
				  .INIT_0E(INIT_0E),
				  .INIT_0F(INIT_0F),
				  .INIT_10(INIT_10),
				  .INIT_11(INIT_11),
				  .INIT_12(INIT_12),
				  .INIT_13(INIT_13),
				  .INIT_14(INIT_14),
				  .INIT_15(INIT_15),
				  .INIT_16(INIT_16),
				  .INIT_17(INIT_17),
				  .INIT_18(INIT_18),
				  .INIT_19(INIT_19),
				  .INIT_1A(INIT_1A),
				  .INIT_1B(INIT_1B),
				  .INIT_1C(INIT_1C),
				  .INIT_1D(INIT_1D),
				  .INIT_1E(INIT_1E),
				  .INIT_1F(INIT_1F),
				  .INIT_20(INIT_20),
				  .INIT_21(INIT_21),
				  .INIT_22(INIT_22),
				  .INIT_23(INIT_23),
				  .INIT_24(INIT_24),
				  .INIT_25(INIT_25),
				  .INIT_26(INIT_26),
				  .INIT_27(INIT_27),
				  .INIT_28(INIT_28),
				  .INIT_29(INIT_29),
				  .INIT_2A(INIT_2A),
				  .INIT_2B(INIT_2B),
				  .INIT_2C(INIT_2C),
				  .INIT_2D(INIT_2D),
				  .INIT_2E(INIT_2E),
				  .INIT_2F(INIT_2F),
				  .INIT_30(INIT_30),
				  .INIT_31(INIT_31),
				  .INIT_32(INIT_32),
				  .INIT_33(INIT_33),
				  .INIT_34(INIT_34),
				  .INIT_35(INIT_35),
				  .INIT_36(INIT_36),
				  .INIT_37(INIT_37),
				  .INIT_38(INIT_38),
				  .INIT_39(INIT_39),
				  .INIT_3A(INIT_3A),
				  .INIT_3B(INIT_3B),
				  .INIT_3C(INIT_3C),
				  .INIT_3D(INIT_3D),
				  .INIT_3E(INIT_3E),
				  .INIT_3F(INIT_3F),
				  .INIT_40(INIT_40),
				  .INIT_41(INIT_41),
				  .INIT_42(INIT_42),
				  .INIT_43(INIT_43),
				  .INIT_44(INIT_44),
				  .INIT_45(INIT_45),
				  .INIT_46(INIT_46),
				  .INIT_47(INIT_47),
				  .INIT_48(INIT_48),
				  .INIT_49(INIT_49),
				  .INIT_4A(INIT_4A),
				  .INIT_4B(INIT_4B),
				  .INIT_4C(INIT_4C),
				  .INIT_4D(INIT_4D),
				  .INIT_4E(INIT_4E),
				  .INIT_4F(INIT_4F),
				  .INIT_50(INIT_50),
				  .INIT_51(INIT_51),
				  .INIT_52(INIT_52),
				  .INIT_53(INIT_53),
				  .INIT_54(INIT_54),
				  .INIT_55(INIT_55),
				  .INIT_56(INIT_56),
				  .INIT_57(INIT_57),
				  .INIT_58(INIT_58),
				  .INIT_59(INIT_59),
				  .INIT_5A(INIT_5A),
				  .INIT_5B(INIT_5B),
				  .INIT_5C(INIT_5C),
				  .INIT_5D(INIT_5D),
				  .INIT_5E(INIT_5E),
				  .INIT_5F(INIT_5F),
				  .INIT_60(INIT_60),
				  .INIT_61(INIT_61),
				  .INIT_62(INIT_62),
				  .INIT_63(INIT_63),
				  .INIT_64(INIT_64),
				  .INIT_65(INIT_65),
				  .INIT_66(INIT_66),
				  .INIT_67(INIT_67),
				  .INIT_68(INIT_68),
				  .INIT_69(INIT_69),
				  .INIT_6A(INIT_6A),
				  .INIT_6B(INIT_6B),
				  .INIT_6C(INIT_6C),
				  .INIT_6D(INIT_6D),
				  .INIT_6E(INIT_6E),
				  .INIT_6F(INIT_6F),
				  .INIT_70(INIT_70),
				  .INIT_71(INIT_71),
				  .INIT_72(INIT_72),
				  .INIT_73(INIT_73),
				  .INIT_74(INIT_74),
				  .INIT_75(INIT_75),
				  .INIT_76(INIT_76),
				  .INIT_77(INIT_77),
				  .INIT_78(INIT_78),
				  .INIT_79(INIT_79),
				  .INIT_7A(INIT_7A),
				  .INIT_7B(INIT_7B),
				  .INIT_7C(INIT_7C),
				  .INIT_7D(INIT_7D),
				  .INIT_7E(INIT_7E),
				  .INIT_7F(INIT_7F),
				  .INITP_00(INITP_00),
				  .INITP_01(INITP_01),
				  .INITP_02(INITP_02),
				  .INITP_03(INITP_03),
				  .INITP_04(INITP_04),
				  .INITP_05(INITP_05),
				  .INITP_06(INITP_06),
				  .INITP_07(INITP_07),
				  .INITP_08(INITP_08),
				  .INITP_09(INITP_09),
				  .INITP_0A(INITP_0A),
				  .INITP_0B(INITP_0B),
				  .INITP_0C(INITP_0C),
				  .INITP_0D(INITP_0D),
				  .INITP_0E(INITP_0E),
				  .INITP_0F(INITP_0F))
		
				  INT_RAMB_TDP (.ADDRA(addrardaddr_in), 
						.ADDRB(addrbwraddr_in), 
						.CASCADEINA(cascadeina_in), 
						.CASCADEINB(cascadeinb_in), 
						.CASCADEOUTA(cascadeouta_wire), 
						.CASCADEOUTB(cascadeoutb_wire), 
						.CLKA(clkardclk_in), 
						.CLKB(clkbwrclk_in), 
						.DBITERR(DBITERR), 
						.DIA({32'b0,diadi_in}), 
						.DIB({32'b0,dibdi_in}), 
						.DIPA(dipadip_in), 
						.DIPB({4'b0,dipbdip_in}), 
						.DOA({dangle_out32,doado_wire}), 
						.DOB(dobdo_wire), 
						.DOPA({dangle_out4,dopadop_wire}), 
						.DOPB(dopbdop_wire), 
						.ECCPARITY(ECCPARITY), 
						.ENA(enarden_in), 
						.ENB(enbwren_in), 
						.GSR(GSR), 
						.INJECTDBITERR(1'b0),
						.INJECTSBITERR(1'b0), 
						.RDADDRECC(RDADDRECC), 
						.REGCEA(regcearegce_in), 
						.REGCEB(regceb_in), 
						.RSTRAMA(rstramarstram_in), 
						.RSTRAMB(rstramb_in), 
						.RSTREGA(rstregarstreg_in), 
						.RSTREGB(rstregb_in), 
						.SBITERR(SBITERR), 
						.WEA({2{wea_in}}), 
						.WEB(webwe_in));

	    end // case: "TDP"
	    "SDP" : begin

		if (WRITE_WIDTH_B == 72) begin
		    
		    RB36_INTERNAL_VLOG #(.RAM_MODE(RAM_MODE),
				  .INIT_A(init_sdp),
				  .INIT_B(init_sdp),
				  .INIT_FILE(INIT_FILE),
				  .SRVAL_A(srval_sdp),
				  .SRVAL_B(srval_sdp),
				  .READ_WIDTH_A(READ_WIDTH_A),
				  .READ_WIDTH_B(READ_WIDTH_A),
				  .WRITE_WIDTH_A(WRITE_WIDTH_B),
				  .WRITE_WIDTH_B(WRITE_WIDTH_B),
				  .WRITE_MODE_A(WRITE_MODE_A),
				  .WRITE_MODE_B(WRITE_MODE_B),
				  .RAM_EXTENSION_A(RAM_EXTENSION_A),
				  .RAM_EXTENSION_B(RAM_EXTENSION_B),
				  .RDADDR_COLLISION_HWCONFIG(RDADDR_COLLISION_HWCONFIG),
				  .SETUP_ALL(SETUP_ALL),
				  .SETUP_READ_FIRST(SETUP_READ_FIRST),
				  .SIM_COLLISION_CHECK(SIM_COLLISION_CHECK),
				  .SIM_DEVICE(SIM_DEVICE),
				  .EN_ECC_READ(EN_ECC_READ),
				  .EN_ECC_WRITE(EN_ECC_WRITE),
				  .DOA_REG(DOA_REG),
				  .DOB_REG(DOB_REG),
				  .RSTREG_PRIORITY_A(RSTREG_PRIORITY_A),
				  .RSTREG_PRIORITY_B(RSTREG_PRIORITY_B),
				  .INIT_00(INIT_00),
				  .INIT_01(INIT_01),
				  .INIT_02(INIT_02),
				  .INIT_03(INIT_03),
				  .INIT_04(INIT_04),
				  .INIT_05(INIT_05),
				  .INIT_06(INIT_06),
				  .INIT_07(INIT_07),
				  .INIT_08(INIT_08),
				  .INIT_09(INIT_09),
				  .INIT_0A(INIT_0A),
				  .INIT_0B(INIT_0B),
				  .INIT_0C(INIT_0C),
				  .INIT_0D(INIT_0D),
				  .INIT_0E(INIT_0E),
				  .INIT_0F(INIT_0F),
				  .INIT_10(INIT_10),
				  .INIT_11(INIT_11),
				  .INIT_12(INIT_12),
				  .INIT_13(INIT_13),
				  .INIT_14(INIT_14),
				  .INIT_15(INIT_15),
				  .INIT_16(INIT_16),
				  .INIT_17(INIT_17),
				  .INIT_18(INIT_18),
				  .INIT_19(INIT_19),
				  .INIT_1A(INIT_1A),
				  .INIT_1B(INIT_1B),
				  .INIT_1C(INIT_1C),
				  .INIT_1D(INIT_1D),
				  .INIT_1E(INIT_1E),
				  .INIT_1F(INIT_1F),
				  .INIT_20(INIT_20),
				  .INIT_21(INIT_21),
				  .INIT_22(INIT_22),
				  .INIT_23(INIT_23),
				  .INIT_24(INIT_24),
				  .INIT_25(INIT_25),
				  .INIT_26(INIT_26),
				  .INIT_27(INIT_27),
				  .INIT_28(INIT_28),
				  .INIT_29(INIT_29),
				  .INIT_2A(INIT_2A),
				  .INIT_2B(INIT_2B),
				  .INIT_2C(INIT_2C),
				  .INIT_2D(INIT_2D),
				  .INIT_2E(INIT_2E),
				  .INIT_2F(INIT_2F),
				  .INIT_30(INIT_30),
				  .INIT_31(INIT_31),
				  .INIT_32(INIT_32),
				  .INIT_33(INIT_33),
				  .INIT_34(INIT_34),
				  .INIT_35(INIT_35),
				  .INIT_36(INIT_36),
				  .INIT_37(INIT_37),
				  .INIT_38(INIT_38),
				  .INIT_39(INIT_39),
				  .INIT_3A(INIT_3A),
				  .INIT_3B(INIT_3B),
				  .INIT_3C(INIT_3C),
				  .INIT_3D(INIT_3D),
				  .INIT_3E(INIT_3E),
				  .INIT_3F(INIT_3F),
				  .INIT_40(INIT_40),
				  .INIT_41(INIT_41),
				  .INIT_42(INIT_42),
				  .INIT_43(INIT_43),
				  .INIT_44(INIT_44),
				  .INIT_45(INIT_45),
				  .INIT_46(INIT_46),
				  .INIT_47(INIT_47),
				  .INIT_48(INIT_48),
				  .INIT_49(INIT_49),
				  .INIT_4A(INIT_4A),
				  .INIT_4B(INIT_4B),
				  .INIT_4C(INIT_4C),
				  .INIT_4D(INIT_4D),
				  .INIT_4E(INIT_4E),
				  .INIT_4F(INIT_4F),
				  .INIT_50(INIT_50),
				  .INIT_51(INIT_51),
				  .INIT_52(INIT_52),
				  .INIT_53(INIT_53),
				  .INIT_54(INIT_54),
				  .INIT_55(INIT_55),
				  .INIT_56(INIT_56),
				  .INIT_57(INIT_57),
				  .INIT_58(INIT_58),
				  .INIT_59(INIT_59),
				  .INIT_5A(INIT_5A),
				  .INIT_5B(INIT_5B),
				  .INIT_5C(INIT_5C),
				  .INIT_5D(INIT_5D),
				  .INIT_5E(INIT_5E),
				  .INIT_5F(INIT_5F),
				  .INIT_60(INIT_60),
				  .INIT_61(INIT_61),
				  .INIT_62(INIT_62),
				  .INIT_63(INIT_63),
				  .INIT_64(INIT_64),
				  .INIT_65(INIT_65),
				  .INIT_66(INIT_66),
				  .INIT_67(INIT_67),
				  .INIT_68(INIT_68),
				  .INIT_69(INIT_69),
				  .INIT_6A(INIT_6A),
				  .INIT_6B(INIT_6B),
				  .INIT_6C(INIT_6C),
				  .INIT_6D(INIT_6D),
				  .INIT_6E(INIT_6E),
				  .INIT_6F(INIT_6F),
				  .INIT_70(INIT_70),
				  .INIT_71(INIT_71),
				  .INIT_72(INIT_72),
				  .INIT_73(INIT_73),
				  .INIT_74(INIT_74),
				  .INIT_75(INIT_75),
				  .INIT_76(INIT_76),
				  .INIT_77(INIT_77),
				  .INIT_78(INIT_78),
				  .INIT_79(INIT_79),
				  .INIT_7A(INIT_7A),
				  .INIT_7B(INIT_7B),
				  .INIT_7C(INIT_7C),
				  .INIT_7D(INIT_7D),
				  .INIT_7E(INIT_7E),
				  .INIT_7F(INIT_7F),
				  .INITP_00(INITP_00),
				  .INITP_01(INITP_01),
				  .INITP_02(INITP_02),
				  .INITP_03(INITP_03),
				  .INITP_04(INITP_04),
				  .INITP_05(INITP_05),
				  .INITP_06(INITP_06),
				  .INITP_07(INITP_07),
				  .INITP_08(INITP_08),
				  .INITP_09(INITP_09),
				  .INITP_0A(INITP_0A),
				  .INITP_0B(INITP_0B),
				  .INITP_0C(INITP_0C),
				  .INITP_0D(INITP_0D),
				  .INITP_0E(INITP_0E),
				  .INITP_0F(INITP_0F))
		
				  INT_RAMB_SDP (.ADDRA(addrardaddr_in), 
						.ADDRB(addrbwraddr_in), 
						.CASCADEINA(cascadeina_in), 
						.CASCADEINB(cascadeinb_in), 
						.CASCADEOUTA(cascadeouta_wire), 
						.CASCADEOUTB(cascadeoutb_wire), 
						.CLKA(clkardclk_in), 
						.CLKB(clkbwrclk_in), 
						.DBITERR(DBITERR), 
						.DIA(64'b0), 
						.DIB({dibdi_in,diadi_in}), 
						.DIPA(4'b0), 
						.DIPB({dipbdip_in,dipadip_in}), 
						.DOA({dobdo_wire,doado_wire}), 
						.DOB(dangle_out32), 
						.DOPA({dopbdop_wire,dopadop_wire}), 
						.DOPB(dangle_out4), 
						.ECCPARITY(ECCPARITY), 
						.ENA(enarden_in), 
						.ENB(enbwren_in), 
						.GSR(GSR), 
						.INJECTDBITERR(injectdbiterr_in),
						.INJECTSBITERR(injectsbiterr_in), 
						.RDADDRECC(RDADDRECC), 
						.REGCEA(regcearegce_in), 
						.REGCEB(regceb_in), 
						.RSTRAMA(rstramarstram_in), 
						.RSTRAMB(rstramb_in), 
						.RSTREGA(rstregarstreg_in), 
						.RSTREGB(rstregb_in), 
						.SBITERR(SBITERR), 
						.WEA(8'b0), 
						.WEB(webwe_in));

		end // if (WRITE_WIDTH_B == 72)
		else begin

		    RB36_INTERNAL_VLOG #(.RAM_MODE(RAM_MODE),
				  .INIT_A(init_sdp),
				  .INIT_B(init_sdp),
				  .INIT_FILE(INIT_FILE),
				  .SRVAL_A(srval_sdp),
				  .SRVAL_B(srval_sdp),
				  .READ_WIDTH_A(READ_WIDTH_A),
				  .READ_WIDTH_B(READ_WIDTH_A),
				  .WRITE_WIDTH_A(WRITE_WIDTH_B),
				  .WRITE_WIDTH_B(WRITE_WIDTH_B),
				  .WRITE_MODE_A(WRITE_MODE_A),
				  .WRITE_MODE_B(WRITE_MODE_B),
				  .RAM_EXTENSION_A(RAM_EXTENSION_A),
				  .RAM_EXTENSION_B(RAM_EXTENSION_B),
				  .RDADDR_COLLISION_HWCONFIG(RDADDR_COLLISION_HWCONFIG),
				  .SETUP_ALL(SETUP_ALL),
				  .SETUP_READ_FIRST(SETUP_READ_FIRST),
				  .SIM_COLLISION_CHECK(SIM_COLLISION_CHECK),
				  .SIM_DEVICE(SIM_DEVICE),
				  .EN_ECC_READ(EN_ECC_READ),
				  .EN_ECC_WRITE(EN_ECC_WRITE),
				  .DOA_REG(DOA_REG),
				  .DOB_REG(DOB_REG),
				  .RSTREG_PRIORITY_A(RSTREG_PRIORITY_A),
				  .RSTREG_PRIORITY_B(RSTREG_PRIORITY_B),
				  .INIT_00(INIT_00),
				  .INIT_01(INIT_01),
				  .INIT_02(INIT_02),
				  .INIT_03(INIT_03),
				  .INIT_04(INIT_04),
				  .INIT_05(INIT_05),
				  .INIT_06(INIT_06),
				  .INIT_07(INIT_07),
				  .INIT_08(INIT_08),
				  .INIT_09(INIT_09),
				  .INIT_0A(INIT_0A),
				  .INIT_0B(INIT_0B),
				  .INIT_0C(INIT_0C),
				  .INIT_0D(INIT_0D),
				  .INIT_0E(INIT_0E),
				  .INIT_0F(INIT_0F),
				  .INIT_10(INIT_10),
				  .INIT_11(INIT_11),
				  .INIT_12(INIT_12),
				  .INIT_13(INIT_13),
				  .INIT_14(INIT_14),
				  .INIT_15(INIT_15),
				  .INIT_16(INIT_16),
				  .INIT_17(INIT_17),
				  .INIT_18(INIT_18),
				  .INIT_19(INIT_19),
				  .INIT_1A(INIT_1A),
				  .INIT_1B(INIT_1B),
				  .INIT_1C(INIT_1C),
				  .INIT_1D(INIT_1D),
				  .INIT_1E(INIT_1E),
				  .INIT_1F(INIT_1F),
				  .INIT_20(INIT_20),
				  .INIT_21(INIT_21),
				  .INIT_22(INIT_22),
				  .INIT_23(INIT_23),
				  .INIT_24(INIT_24),
				  .INIT_25(INIT_25),
				  .INIT_26(INIT_26),
				  .INIT_27(INIT_27),
				  .INIT_28(INIT_28),
				  .INIT_29(INIT_29),
				  .INIT_2A(INIT_2A),
				  .INIT_2B(INIT_2B),
				  .INIT_2C(INIT_2C),
				  .INIT_2D(INIT_2D),
				  .INIT_2E(INIT_2E),
				  .INIT_2F(INIT_2F),
				  .INIT_30(INIT_30),
				  .INIT_31(INIT_31),
				  .INIT_32(INIT_32),
				  .INIT_33(INIT_33),
				  .INIT_34(INIT_34),
				  .INIT_35(INIT_35),
				  .INIT_36(INIT_36),
				  .INIT_37(INIT_37),
				  .INIT_38(INIT_38),
				  .INIT_39(INIT_39),
				  .INIT_3A(INIT_3A),
				  .INIT_3B(INIT_3B),
				  .INIT_3C(INIT_3C),
				  .INIT_3D(INIT_3D),
				  .INIT_3E(INIT_3E),
				  .INIT_3F(INIT_3F),
				  .INIT_40(INIT_40),
				  .INIT_41(INIT_41),
				  .INIT_42(INIT_42),
				  .INIT_43(INIT_43),
				  .INIT_44(INIT_44),
				  .INIT_45(INIT_45),
				  .INIT_46(INIT_46),
				  .INIT_47(INIT_47),
				  .INIT_48(INIT_48),
				  .INIT_49(INIT_49),
				  .INIT_4A(INIT_4A),
				  .INIT_4B(INIT_4B),
				  .INIT_4C(INIT_4C),
				  .INIT_4D(INIT_4D),
				  .INIT_4E(INIT_4E),
				  .INIT_4F(INIT_4F),
				  .INIT_50(INIT_50),
				  .INIT_51(INIT_51),
				  .INIT_52(INIT_52),
				  .INIT_53(INIT_53),
				  .INIT_54(INIT_54),
				  .INIT_55(INIT_55),
				  .INIT_56(INIT_56),
				  .INIT_57(INIT_57),
				  .INIT_58(INIT_58),
				  .INIT_59(INIT_59),
				  .INIT_5A(INIT_5A),
				  .INIT_5B(INIT_5B),
				  .INIT_5C(INIT_5C),
				  .INIT_5D(INIT_5D),
				  .INIT_5E(INIT_5E),
				  .INIT_5F(INIT_5F),
				  .INIT_60(INIT_60),
				  .INIT_61(INIT_61),
				  .INIT_62(INIT_62),
				  .INIT_63(INIT_63),
				  .INIT_64(INIT_64),
				  .INIT_65(INIT_65),
				  .INIT_66(INIT_66),
				  .INIT_67(INIT_67),
				  .INIT_68(INIT_68),
				  .INIT_69(INIT_69),
				  .INIT_6A(INIT_6A),
				  .INIT_6B(INIT_6B),
				  .INIT_6C(INIT_6C),
				  .INIT_6D(INIT_6D),
				  .INIT_6E(INIT_6E),
				  .INIT_6F(INIT_6F),
				  .INIT_70(INIT_70),
				  .INIT_71(INIT_71),
				  .INIT_72(INIT_72),
				  .INIT_73(INIT_73),
				  .INIT_74(INIT_74),
				  .INIT_75(INIT_75),
				  .INIT_76(INIT_76),
				  .INIT_77(INIT_77),
				  .INIT_78(INIT_78),
				  .INIT_79(INIT_79),
				  .INIT_7A(INIT_7A),
				  .INIT_7B(INIT_7B),
				  .INIT_7C(INIT_7C),
				  .INIT_7D(INIT_7D),
				  .INIT_7E(INIT_7E),
				  .INIT_7F(INIT_7F),
				  .INITP_00(INITP_00),
				  .INITP_01(INITP_01),
				  .INITP_02(INITP_02),
				  .INITP_03(INITP_03),
				  .INITP_04(INITP_04),
				  .INITP_05(INITP_05),
				  .INITP_06(INITP_06),
				  .INITP_07(INITP_07),
				  .INITP_08(INITP_08),
				  .INITP_09(INITP_09),
				  .INITP_0A(INITP_0A),
				  .INITP_0B(INITP_0B),
				  .INITP_0C(INITP_0C),
				  .INITP_0D(INITP_0D),
				  .INITP_0E(INITP_0E),
				  .INITP_0F(INITP_0F))
		
				  INT_RAMB_SDP (.ADDRA(addrardaddr_in), 
						.ADDRB(addrbwraddr_in), 
						.CASCADEINA(cascadeina_in), 
						.CASCADEINB(cascadeinb_in), 
						.CASCADEOUTA(cascadeouta_wire), 
						.CASCADEOUTB(cascadeoutb_wire), 
						.CLKA(clkardclk_in), 
						.CLKB(clkbwrclk_in), 
						.DBITERR(DBITERR), 
						.DIA(64'b0), 
						.DIB({32'b0,dibdi_in}), 
						.DIPA(4'b0), 
						.DIPB({4'b0,dipbdip_in}), 
						.DOA({dobdo_wire,doado_wire}), 
						.DOB(dangle_out32), 
						.DOPA({dopbdop_wire,dopadop_wire}), 
						.DOPB(dangle_out4), 
						.ECCPARITY(ECCPARITY), 
						.ENA(enarden_in), 
						.ENB(enbwren_in), 
						.GSR(GSR), 
						.INJECTDBITERR(injectdbiterr_in),
						.INJECTSBITERR(injectsbiterr_in), 
						.RDADDRECC(RDADDRECC), 
						.REGCEA(regcearegce_in), 
						.REGCEB(regceb_in), 
						.RSTRAMA(rstramarstram_in), 
						.RSTRAMB(rstramb_in), 
						.RSTREGA(rstregarstreg_in), 
						.RSTREGB(rstregb_in), 
						.SBITERR(SBITERR), 
						.WEA(8'b0), 
						.WEB(webwe_in));

		end // else: !if(WRITE_WIDTH_B == 72)
		    
	    end // case: "SDP"
	    
	endcase // case(RAM_MODE)
    endgenerate

    
//*** Timing Checks Start here

    always @(doado_wire or clkardclk_in) doado_out = doado_wire;
    always @(dobdo_wire or clkbwrclk_in) dobdo_out = dobdo_wire;
    always @(dopadop_wire or clkardclk_in) dopadop_out = dopadop_wire;
    always @(dopbdop_wire or clkbwrclk_in) dopbdop_out = dopbdop_wire;
    always @(cascadeouta_wire or clkardclk_in) cascadeouta_out = cascadeouta_wire;
    always @(cascadeoutb_wire or clkbwrclk_in) cascadeoutb_out = cascadeoutb_wire;
    
    assign DOADO = doado_out;
    assign DOBDO = dobdo_out;
    assign DOPADOP = dopadop_out;
    assign DOPBDOP = dopbdop_out;
    assign CASCADEOUTA = cascadeouta_out;
    assign CASCADEOUTB = cascadeoutb_out;

`ifdef XIL_TIMING
   
    wire diadi0_enable = (RAM_MODE == "TDP") && enarden_in && wea_in[0];
    wire diadi1_enable = (RAM_MODE == "TDP") && enarden_in && wea_in[1];
    wire diadi2_enable = (RAM_MODE == "TDP") && enarden_in && wea_in[2];
    wire diadi3_enable = (RAM_MODE == "TDP") && enarden_in && wea_in[3];

    wire dibdi0_enable = (RAM_MODE == "TDP") ? (enbwren_in && webwe_in[0]) : (enbwren_in && webwe_in[4]) ;
    wire dibdi1_enable = (RAM_MODE == "TDP") ? (enbwren_in && webwe_in[1]) : (enbwren_in && webwe_in[5]) ;
    wire dibdi2_enable = (RAM_MODE == "TDP") ? (enbwren_in && webwe_in[2]) : (enbwren_in && webwe_in[6]) ;
    wire dibdi3_enable = (RAM_MODE == "TDP") ? (enbwren_in && webwe_in[3]) : (enbwren_in && webwe_in[7]) ;
    
    wire sdp_dia0_clkwr = (RAM_MODE == "SDP") && enbwren_in && webwe_in[0];
    wire sdp_dia1_clkwr = (RAM_MODE == "SDP") && enbwren_in && webwe_in[1];
    wire sdp_dia2_clkwr = (RAM_MODE == "SDP") && enbwren_in && webwe_in[2];
    wire sdp_dia3_clkwr = (RAM_MODE == "SDP") && enbwren_in && webwe_in[3];

    
    
    always @(notifier or notifier_a or notifier_addra0 or notifier_addra1 or notifier_addra2 or notifier_addra3 or notifier_addra4 or
             notifier_addra5 or notifier_addra6 or notifier_addra7 or notifier_addra8 or notifier_addra9 or notifier_addra10 or 
             notifier_addra11 or notifier_addra12 or notifier_addra13 or notifier_addra14 or notifier_addra15) begin    
	doado_out <= 32'hxxxxxxxx;
	dopadop_out <= 4'hx;
	cascadeouta_out <= 1'bx;
    end

    always @(notifier or notifier_b or notifier_addrb0 or notifier_addrb1 or notifier_addrb2 or notifier_addrb3 or notifier_addrb4 or
             notifier_addrb5 or notifier_addrb6 or notifier_addrb7 or notifier_addrb8 or notifier_addrb9 or notifier_addrb10 or 
             notifier_addrb11 or notifier_addrb12 or notifier_addrb13 or notifier_addrb14 or notifier_addrb15) begin
	dobdo_out <= 32'hxxxxxxxx;
	dopbdop_out <= 4'hx;
	cascadeoutb_out <= 1'bx;

	if (RAM_MODE == "SDP") begin
	    doado_out <= 32'hxxxxxxxx;
	    dopadop_out <= 4'hx;
	    cascadeouta_out <= 1'bx;
	end
	
    end


    always @(notifier_addra0) begin
	task_warn_msg ("ADDRARDADDR[0]", "CLKARDCLK");
    end

    always @(notifier_addra1) begin
	task_warn_msg ("ADDRARDADDR[1]", "CLKARDCLK");
    end
    
    always @(notifier_addra2) begin
	task_warn_msg ("ADDRARDADDR[2]", "CLKARDCLK");
    end
    
    always @(notifier_addra3) begin
	task_warn_msg ("ADDRARDADDR[3]", "CLKARDCLK");
    end
    
    always @(notifier_addra4) begin
	task_warn_msg ("ADDRARDADDR[4]", "CLKARDCLK");
    end

    always @(notifier_addra5) begin
	task_warn_msg ("ADDRARDADDR[5]", "CLKARDCLK");
    end
    
    always @(notifier_addra6) begin
	task_warn_msg ("ADDRARDADDR[6]", "CLKARDCLK");
    end
    
    always @(notifier_addra7) begin
	task_warn_msg ("ADDRARDADDR[7]", "CLKARDCLK");
    end   

    always @(notifier_addra8) begin
	task_warn_msg ("ADDRARDADDR[8]", "CLKARDCLK");
    end

    always @(notifier_addra9) begin
	task_warn_msg ("ADDRARDADDR[9]", "CLKARDCLK");
    end
    
    always @(notifier_addra10) begin
	task_warn_msg ("ADDRARDADDR[10]", "CLKARDCLK");
    end
    
    always @(notifier_addra11) begin
	task_warn_msg ("ADDRARDADDR[11]", "CLKARDCLK");
    end
    
     always @(notifier_addra12) begin
	task_warn_msg ("ADDRARDADDR[12]", "CLKARDCLK");
    end

    always @(notifier_addra13) begin
	task_warn_msg ("ADDRARDADDR[13]", "CLKARDCLK");
    end
    
    always @(notifier_addra14) begin
	task_warn_msg ("ADDRARDADDR[14]", "CLKARDCLK");
    end
    
    always @(notifier_addra15) begin
	task_warn_msg ("ADDRARDADDR[15]", "CLKARDCLK");
    end


    always @(notifier_addrb0) begin
	task_warn_msg ("ADDRBWRADDR[0]", "CLKBWRCLK");
    end

    always @(notifier_addrb1) begin
	task_warn_msg ("ADDRBWRADDR[1]", "CLKBWRCLK");
    end
    
    always @(notifier_addrb2) begin
	task_warn_msg ("ADDRBWRADDR[2]", "CLKBWRCLK");
    end
    
    always @(notifier_addrb3) begin
	task_warn_msg ("ADDRBWRADDR[3]", "CLKBWRCLK");
    end
    
    always @(notifier_addrb4) begin
	task_warn_msg ("ADDRBWRADDR[4]", "CLKBWRCLK");
    end

    always @(notifier_addrb5) begin
	task_warn_msg ("ADDRBWRADDR[5]", "CLKBWRCLK");
    end
    
    always @(notifier_addrb6) begin
	task_warn_msg ("ADDRBWRADDR[6]", "CLKBWRCLK");
    end
    
    always @(notifier_addrb7) begin
	task_warn_msg ("ADDRBWRADDR[7]", "CLKBWRCLK");
    end   

    always @(notifier_addrb8) begin
	task_warn_msg ("ADDRBWRADDR[8]", "CLKBWRCLK");
    end

    always @(notifier_addrb9) begin
	task_warn_msg ("ADDRBWRADDR[9]", "CLKBWRCLK");
    end
    
    always @(notifier_addrb10) begin
	task_warn_msg ("ADDRBWRADDR[10]", "CLKBWRCLK");
    end
    
    always @(notifier_addrb11) begin
	task_warn_msg ("ADDRBWRADDR[11]", "CLKBWRCLK");
    end
    
     always @(notifier_addrb12) begin
	task_warn_msg ("ADDRBWRADDR[12]", "CLKBWRCLK");
    end

    always @(notifier_addrb13) begin
	task_warn_msg ("ADDRBWRADDR[13]", "CLKBWRCLK");
    end
    
    always @(notifier_addrb14) begin
	task_warn_msg ("ADDRBWRADDR[14]", "CLKBWRCLK");
    end
    
    always @(notifier_addrb15) begin
	task_warn_msg ("ADDRBWRADDR[15]", "CLKBWRCLK");
    end

    
    task task_warn_msg;

        input [8*15:1] addr_str;
	input [8*9:1] clk_str;
	
	begin

	    $display("Error: Setup/Hold Violation on %s with respect to %s when memory has been enabled. The memory contents at %s of the RAM can be corrupted. This corruption is not modeled in this simulation model. Please take the necessary steps to recover from this data corruption in hardware.", addr_str, clk_str, addr_str);

	end
	
    endtask // task_warn_msg

`endif //  `ifdef XIL_TIMING


    wire ram_mode_wire = (RAM_MODE == "TDP") ? 1 : 0;

`ifdef XIL_TIMING
    wire ram_extension_a_wire = (RAM_EXTENSION_A == "UPPER") ? 1 : 0;
    wire ram_extension_b_wire = (RAM_EXTENSION_B == "UPPER") ? 1 : 0;
`endif //  `ifdef XIL_TIMING
    
    specify

        (CASCADEINA *> DOADO) = (0:0:0, 0:0:0);
        (CASCADEINB *> DOBDO) = (0:0:0, 0:0:0);
        (CLKARDCLK *> DOADO) = (100:100:100, 100:100:100);
        (CLKARDCLK *> DOPADOP) = (100:100:100, 100:100:100);
        (CLKARDCLK *> RDADDRECC) = (100:100:100, 100:100:100);
        (CLKARDCLK => DBITERR) = (100:100:100, 100:100:100);
        (CLKARDCLK => SBITERR) = (100:100:100, 100:100:100);
       	(CLKARDCLK => CASCADEOUTA) = (100:100:100, 100:100:100);

	if (ram_mode_wire == 0) (CLKARDCLK *> DOBDO) = (100:100:100, 100:100:100);
        if (ram_mode_wire == 0) (CLKARDCLK *> DOPBDOP) = (100:100:100, 100:100:100);
	
        if (ram_mode_wire == 1) (CLKBWRCLK *> DOBDO) = (100:100:100, 100:100:100);
        if (ram_mode_wire == 1) (CLKBWRCLK *> DOPBDOP) = (100:100:100, 100:100:100);
	(CLKBWRCLK *> ECCPARITY) = (100:100:100, 100:100:100);
	(CLKBWRCLK => CASCADEOUTB) = (100:100:100, 100:100:100);

`ifdef XIL_TIMING
	
	if (ram_extension_a_wire == 1) (CASCADEINA => DOADO[0]) = (0:0:0, 0:0:0);
	if (ram_extension_b_wire == 1) (CASCADEINB => DOBDO[0]) = (0:0:0, 0:0:0);

	$setuphold (posedge CLKARDCLK, posedge ADDRARDADDR &&& ENARDEN, 0:0:0, 0:0:0, notifier_addra0,,, CLKARDCLK_delay, ADDRARDADDR_delay);
       	$setuphold (posedge CLKARDCLK, negedge ADDRARDADDR &&& ENARDEN, 0:0:0, 0:0:0, notifier_addra0,,, CLKARDCLK_delay, ADDRARDADDR_delay);
       	$setuphold (posedge CLKARDCLK, posedge DIADI &&& diadi0_enable, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, DIADI_delay);
       	$setuphold (posedge CLKARDCLK, negedge DIADI &&& diadi0_enable, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, DIADI_delay);
       	$setuphold (posedge CLKARDCLK, posedge DIPADIP &&& diadi0_enable, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, DIPADIP_delay);
       	$setuphold (posedge CLKARDCLK, negedge DIPADIP &&& diadi0_enable, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, DIPADIP_delay);
	$setuphold (posedge CLKARDCLK, posedge ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, ENARDEN_delay);
       	$setuphold (posedge CLKARDCLK, negedge ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, ENARDEN_delay);
       	$setuphold (posedge CLKARDCLK, posedge RSTRAMARSTRAM &&& ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
       	$setuphold (posedge CLKARDCLK, negedge RSTRAMARSTRAM &&& ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
	$setuphold (posedge CLKARDCLK, posedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, RSTREGARSTREG_delay);
       	$setuphold (posedge CLKARDCLK, negedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, RSTREGARSTREG_delay);
	$setuphold (posedge CLKARDCLK, posedge REGCEAREGCE, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, REGCEAREGCE_delay);
       	$setuphold (posedge CLKARDCLK, negedge REGCEAREGCE, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, REGCEAREGCE_delay);
       	$setuphold (posedge CLKARDCLK, posedge WEA &&& ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, WEA_delay);
       	$setuphold (posedge CLKARDCLK, negedge WEA &&& ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, WEA_delay);

	$setuphold (posedge CLKBWRCLK, posedge ADDRBWRADDR &&& ENBWREN, 0:0:0, 0:0:0, notifier_addrb0,,, CLKBWRCLK_delay, ADDRBWRADDR_delay);
       	$setuphold (posedge CLKBWRCLK, negedge ADDRBWRADDR &&& ENBWREN, 0:0:0, 0:0:0, notifier_addrb0,,, CLKBWRCLK_delay, ADDRBWRADDR_delay);

       	$setuphold (posedge CLKBWRCLK, posedge DIADI &&& sdp_dia0_clkwr, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIADI_delay);
	$setuphold (posedge CLKBWRCLK, negedge DIADI &&& sdp_dia0_clkwr, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIADI_delay);
       	$setuphold (posedge CLKBWRCLK, posedge DIPADIP &&& sdp_dia0_clkwr, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIPADIP_delay);
       	$setuphold (posedge CLKBWRCLK, negedge DIPADIP &&& sdp_dia0_clkwr, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIPADIP_delay);
	$setuphold (posedge CLKBWRCLK, posedge DIBDI &&& dibdi0_enable, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIBDI_delay);
	$setuphold (posedge CLKBWRCLK, negedge DIBDI &&& dibdi0_enable, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIBDI_delay);
       	$setuphold (posedge CLKBWRCLK, posedge DIPBDIP &&& dibdi0_enable, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIPBDIP_delay);
       	$setuphold (posedge CLKBWRCLK, negedge DIPBDIP &&& dibdi0_enable, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIPBDIP_delay);
	$setuphold (posedge CLKBWRCLK, posedge ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, ENBWREN_delay);
       	$setuphold (posedge CLKBWRCLK, negedge ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, ENBWREN_delay);
	$setuphold (posedge CLKBWRCLK, posedge INJECTDBITERR, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, INJECTDBITERR_delay);
	$setuphold (posedge CLKBWRCLK, negedge INJECTDBITERR, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, INJECTDBITERR_delay);
	$setuphold (posedge CLKBWRCLK, posedge INJECTSBITERR, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, INJECTSBITERR_delay);
	$setuphold (posedge CLKBWRCLK, negedge INJECTSBITERR, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, INJECTSBITERR_delay);
	$setuphold (posedge CLKBWRCLK, posedge REGCEB, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, REGCEB_delay);
       	$setuphold (posedge CLKBWRCLK, negedge REGCEB, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, REGCEB_delay);
       	$setuphold (posedge CLKBWRCLK, posedge RSTRAMB &&& ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, RSTRAMB_delay);
       	$setuphold (posedge CLKBWRCLK, negedge RSTRAMB &&& ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, RSTRAMB_delay);
	$setuphold (posedge CLKBWRCLK, posedge RSTREGB, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, RSTREGB_delay);
       	$setuphold (posedge CLKBWRCLK, negedge RSTREGB, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, RSTREGB_delay);
       	$setuphold (posedge CLKBWRCLK, posedge WEBWE &&& ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, WEBWE_delay);
       	$setuphold (posedge CLKBWRCLK, negedge WEBWE &&& ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, WEBWE_delay);

       	$setuphold (negedge CLKARDCLK, posedge ADDRARDADDR &&& ENARDEN, 0:0:0, 0:0:0, notifier_addra0,,, CLKARDCLK_delay, ADDRARDADDR_delay);
       	$setuphold (negedge CLKARDCLK, negedge ADDRARDADDR &&& ENARDEN, 0:0:0, 0:0:0, notifier_addra0,,, CLKARDCLK_delay, ADDRARDADDR_delay);
       	$setuphold (negedge CLKARDCLK, posedge DIADI &&& diadi0_enable, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, DIADI_delay);
       	$setuphold (negedge CLKARDCLK, negedge DIADI &&& diadi0_enable, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, DIADI_delay);
       	$setuphold (negedge CLKARDCLK, posedge DIPADIP &&& diadi0_enable, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, DIPADIP_delay);
       	$setuphold (negedge CLKARDCLK, negedge DIPADIP &&& diadi0_enable, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, DIPADIP_delay);
	$setuphold (negedge CLKARDCLK, posedge ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, ENARDEN_delay);
       	$setuphold (negedge CLKARDCLK, negedge ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, ENARDEN_delay);
       	$setuphold (negedge CLKARDCLK, posedge RSTRAMARSTRAM &&& ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
       	$setuphold (negedge CLKARDCLK, negedge RSTRAMARSTRAM &&& ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
	$setuphold (negedge CLKARDCLK, posedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, RSTREGARSTREG_delay);
       	$setuphold (negedge CLKARDCLK, negedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, RSTREGARSTREG_delay);
	$setuphold (negedge CLKARDCLK, posedge REGCEAREGCE, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, REGCEAREGCE_delay);
       	$setuphold (negedge CLKARDCLK, negedge REGCEAREGCE, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, REGCEAREGCE_delay);
       	$setuphold (negedge CLKARDCLK, posedge WEA &&& ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, WEA_delay);
       	$setuphold (negedge CLKARDCLK, negedge WEA &&& ENARDEN, 0:0:0, 0:0:0, notifier_a,,, CLKARDCLK_delay, WEA_delay);

	$setuphold (negedge CLKBWRCLK, posedge ADDRBWRADDR &&& ENBWREN, 0:0:0, 0:0:0, notifier_addrb0,,, CLKBWRCLK_delay, ADDRBWRADDR_delay);
       	$setuphold (negedge CLKBWRCLK, negedge ADDRBWRADDR &&& ENBWREN, 0:0:0, 0:0:0, notifier_addrb0,,, CLKBWRCLK_delay, ADDRBWRADDR_delay);

       	$setuphold (negedge CLKBWRCLK, posedge DIADI &&& sdp_dia0_clkwr, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIADI_delay);
	$setuphold (negedge CLKBWRCLK, negedge DIADI &&& sdp_dia0_clkwr, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIADI_delay);
       	$setuphold (negedge CLKBWRCLK, posedge DIPADIP &&& sdp_dia0_clkwr, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIPADIP_delay);
       	$setuphold (negedge CLKBWRCLK, negedge DIPADIP &&& sdp_dia0_clkwr, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIPADIP_delay);
	$setuphold (negedge CLKBWRCLK, posedge DIBDI &&& dibdi0_enable, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIBDI_delay);
	$setuphold (negedge CLKBWRCLK, negedge DIBDI &&& dibdi0_enable, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIBDI_delay);
       	$setuphold (negedge CLKBWRCLK, posedge DIPBDIP &&& dibdi0_enable, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIPBDIP_delay);
       	$setuphold (negedge CLKBWRCLK, negedge DIPBDIP &&& dibdi0_enable, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, DIPBDIP_delay);
	$setuphold (negedge CLKBWRCLK, posedge ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, ENBWREN_delay);
       	$setuphold (negedge CLKBWRCLK, negedge ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, ENBWREN_delay);
	$setuphold (negedge CLKBWRCLK, posedge INJECTDBITERR, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, INJECTDBITERR_delay);
	$setuphold (negedge CLKBWRCLK, negedge INJECTDBITERR, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, INJECTDBITERR_delay);
	$setuphold (negedge CLKBWRCLK, posedge INJECTSBITERR, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, INJECTSBITERR_delay);
	$setuphold (negedge CLKBWRCLK, negedge INJECTSBITERR, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, INJECTSBITERR_delay);
	$setuphold (negedge CLKBWRCLK, posedge REGCEB, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, REGCEB_delay);
       	$setuphold (negedge CLKBWRCLK, negedge REGCEB, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, REGCEB_delay);
       	$setuphold (negedge CLKBWRCLK, posedge RSTRAMB &&& ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, RSTRAMB_delay);
       	$setuphold (negedge CLKBWRCLK, negedge RSTRAMB &&& ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, RSTRAMB_delay);
	$setuphold (negedge CLKBWRCLK, posedge RSTREGB, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, RSTREGB_delay);
       	$setuphold (negedge CLKBWRCLK, negedge RSTREGB, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, RSTREGB_delay);
       	$setuphold (negedge CLKBWRCLK, posedge WEBWE &&& ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, WEBWE_delay);
       	$setuphold (negedge CLKBWRCLK, negedge WEBWE &&& ENBWREN, 0:0:0, 0:0:0, notifier_b,,, CLKBWRCLK_delay, WEBWE_delay);
       
        $period (negedge CLKARDCLK, 0:0:0, notifier_a);
        $period (negedge CLKBWRCLK, 0:0:0, notifier_b);       
	$period (posedge CLKARDCLK, 0:0:0, notifier_a);
	$period (posedge CLKBWRCLK, 0:0:0, notifier_b);
	$width (posedge CLKARDCLK &&& ENARDEN, 0:0:0, 0, notifier_a);
        $width (negedge CLKARDCLK &&& ENARDEN, 0:0:0, 0, notifier_a);
        $width (posedge CLKBWRCLK &&& ENBWREN, 0:0:0, 0, notifier_b);
        $width (negedge CLKBWRCLK &&& ENBWREN, 0:0:0, 0, notifier_b);

`endif //  `ifdef XIL_TIMING
	
	specparam PATHPULSE$ = 0;

    endspecify

endmodule // RAMB36E1


// WARNING !!!: The following model is not an user primitive. 
//              Please do not modify any part of it. RAMB36E1 may not work properly if do so.
//
`timescale 1 ps/1 ps

module RB36_INTERNAL_VLOG (CASCADEOUTA, CASCADEOUTB, DBITERR, DOA, DOB, DOPA, DOPB, ECCPARITY, RDADDRECC, SBITERR, 
			 ADDRA, ADDRB, CASCADEINA, CASCADEINB, CLKA, CLKB, DIA, DIB, DIPA, DIPB, ENA, ENB, GSR, INJECTDBITERR, INJECTSBITERR, REGCEA, REGCEB, RSTRAMA, RSTRAMB, RSTREGA, RSTREGB, WEA, WEB);

    output CASCADEOUTA;
    output CASCADEOUTB;
    output SBITERR, DBITERR;
    output [8:0] RDADDRECC;
    output [63:0] DOA;
    output [31:0] DOB;
    output [7:0] DOPA;
    output [3:0] DOPB;
    output [7:0] ECCPARITY;
    
    input ENA, CLKA, CASCADEINA, REGCEA;
    input ENB, CLKB, CASCADEINB, REGCEB;
    input GSR;
    input RSTRAMA, RSTRAMB;
    input RSTREGA, RSTREGB;
    input INJECTDBITERR, INJECTSBITERR;
    input [15:0] ADDRA;
    input [15:0] ADDRB;
    input [63:0] DIA;
    input [63:0] DIB;
    input [3:0] DIPA;
    input [7:0] DIPB;
    input [7:0] WEA;
    input [7:0] WEB;

    parameter DOA_REG = 0;
    parameter DOB_REG = 0;
    parameter EN_ECC_READ = "FALSE";
    parameter EN_ECC_WRITE = "FALSE";
    parameter INIT_A = 72'h0;
    parameter INIT_B = 72'h0;
    parameter RAM_EXTENSION_A = "NONE";
    parameter RAM_EXTENSION_B = "NONE";
    parameter RAM_MODE = "TDP";
    parameter RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE";
    parameter READ_WIDTH_A = 0;
    parameter READ_WIDTH_B = 0;
    parameter RSTREG_PRIORITY_A = "RSTREG";
    parameter RSTREG_PRIORITY_B = "RSTREG";
    parameter SETUP_ALL = 1000;
    parameter SETUP_READ_FIRST = 3000;
    parameter SIM_COLLISION_CHECK = "ALL";
    parameter SIM_DEVICE = "VIRTEX6";
    parameter SRVAL_A = 72'h0;
    parameter SRVAL_B = 72'h0;
    parameter WRITE_MODE_A = "WRITE_FIRST";
    parameter WRITE_MODE_B = "WRITE_FIRST";
    parameter WRITE_WIDTH_A = 0;
    parameter WRITE_WIDTH_B = 0;
    parameter INIT_FILE = "NONE";
    
    parameter INIT_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_40 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_41 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_42 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_43 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_44 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_45 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_46 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_47 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_48 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_49 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_4F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_50 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_51 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_52 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_53 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_54 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_55 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_56 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_57 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_58 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_59 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_5F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_60 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_61 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_62 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_63 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_64 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_65 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_66 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_67 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_68 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_69 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_6F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_70 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_71 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_72 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_73 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_74 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_75 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_76 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_77 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_78 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_79 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_7F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;

// xilinx_internal_parameter on
    // WARNING !!!: This model may not work properly if the following parameters are changed.
    parameter BRAM_SIZE = 36;
// xilinx_internal_parameter off


    integer   count, countp, init_mult, initp_mult, large_width;
    integer count1, countp1, i, i1, j, j1, i_p, i_mem, init_offset, initp_offset;
    integer viol_time = 0;
    integer rdaddr_collision_hwconfig_int, rstreg_priority_a_int, rstreg_priority_b_int;
    integer ram_mode_int, en_ecc_write_int, en_ecc_read_int;
    integer chk_ox_same_clk = 0, chk_ox_msg = 0, chk_col_same_clk = 0;
    
    reg addra_in_15_reg_bram, addrb_in_15_reg_bram;
    reg addra_in_15_reg, addrb_in_15_reg;
    reg addra_in_15_reg1, addrb_in_15_reg1;
    reg junk1;
    reg [1:0] wr_mode_a, wr_mode_b, cascade_a, cascade_b;
    reg [63:0] doa_out = 64'b0, doa_buf = 64'b0, doa_outreg = 64'b0, doa_out_out;
    reg [31:0] dob_out = 32'b0, dob_buf = 32'b0, dob_outreg = 32'b0, dob_out_out;
    reg [3:0] dopb_out = 4'b0, dopb_buf = 4'b0, dopb_outreg = 4'b0, dopb_out_out;
    reg [7:0] dopa_out = 8'b0, dopa_buf = 8'b0, dopa_outreg = 8'b0, dopa_out_out;
    reg [63:0] doa_out_mux = 64'b0, doa_outreg_mux = 64'b0;
    reg [7:0]  dopa_out_mux = 8'b0, dopa_outreg_mux = 8'b0;
    reg [63:0] dob_out_mux = 64'b0, dob_outreg_mux = 64'b0;
    reg [7:0]  dopb_out_mux = 8'b0, dopb_outreg_mux = 8'b0;
    
    reg [7:0] eccparity_out = 8'b0;
    reg [7:0] dopr_ecc, syndrome = 8'b0;
    reg [7:0] dipb_in_ecc;
    reg [71:0] ecc_bit_position;
    reg [7:0] dip_ecc, dip_ecc_col, dipa_in_ecc_corrected;
    reg [63:0] dib_in_ecc, dib_ecc_col, dia_in_ecc_corrected, di_x = 64'bx;
    reg dbiterr_out = 0, sbiterr_out = 0;
    reg dbiterr_outreg = 0, sbiterr_outreg = 0;
    reg dbiterr_out_out = 0, sbiterr_out_out = 0;

    reg [7:0] wea_reg;
    reg enb_reg;
    reg [7:0] out_a = 8'b0, out_b = 8'b0, junk, web_reg;
    reg outp_a = 1'b0, outp_b = 1'b0, junkp;
    reg rising_clka = 1'b0, rising_clkb = 1'b0;
    reg [15:0] addra_reg, addrb_reg;

    reg [63:0] dia_reg, dib_reg;
    reg [3:0] dipa_reg;
    reg [7:0] dipb_reg;
    reg [1:0] viol_type = 2'b00;
    reg col_wr_wr_msg = 1, col_wra_rdb_msg = 1, col_wrb_rda_msg = 1;
    reg [8:0] rdaddrecc_out = 9'b0, rdaddrecc_outreg = 9'b0;
    reg [8:0] rdaddrecc_out_out = 9'b0;
    reg finish_error = 0;

    time time_port_a, time_port_b;

    wire [63:0] dib_in;
    wire [63:0] dia_in;
    wire [15:0] addra_in, addrb_in;
    wire clka_in, clkb_in;
    wire [7:0] dipb_in;
    wire [3:0] dipa_in;
    wire ena_in, enb_in, gsr_in, regcea_in, regceb_in, rstrama_in, rstramb_in;
    wire [7:0] wea_in;
    wire [7:0] web_in;
    wire cascadeina_in, cascadeinb_in;
    wire injectdbiterr_in, injectsbiterr_in;
    wire rstrega_in, rstregb_in;
    wire [15:0] ox_addra_reconstruct, ox_addrb_reconstruct;
    reg [15:0] ox_addra_reconstruct_reg, ox_addrb_reconstruct_reg;
    
    wire temp_wire;  // trigger NCsim at initial time
    assign temp_wire = 1;

    time time_clka_period, time_clkb_period, time_period;
    reg time_skew_a_flag = 0;
    reg time_skew_b_flag = 0;
   
    assign addra_in = ADDRA;
    assign addrb_in = ADDRB;
    assign clka_in = CLKA;
    assign clkb_in = CLKB;
    
    assign dia_in = DIA;
    assign dib_in = DIB;
    assign dipa_in = DIPA;
    assign dipb_in = DIPB;
    assign DOA = doa_out_out;

    assign DOPA = dopa_out_out;
    assign DOB = dob_out_out;
    assign DOPB = dopb_out_out;

    assign ena_in = ENA;
    assign enb_in = ENB;
    assign gsr_in = GSR;
    assign regcea_in = REGCEA;
    assign regceb_in = REGCEB;
    assign rstrama_in = RSTRAMA;
    assign rstramb_in = RSTRAMB;
    assign wea_in = WEA;
    assign web_in = WEB;
    assign cascadeina_in = CASCADEINA;
    assign cascadeinb_in = CASCADEINB;
    assign CASCADEOUTA = doa_out_out[0];
    assign CASCADEOUTB = dob_out_out[0];
    assign SBITERR = sbiterr_out_out;
    assign DBITERR = dbiterr_out_out;
    assign ECCPARITY = eccparity_out;
    assign RDADDRECC = rdaddrecc_out_out;
    assign injectdbiterr_in = INJECTDBITERR;
    assign injectsbiterr_in = INJECTSBITERR;
    assign rstrega_in = RSTREGA;
    assign rstregb_in = RSTREGB;

    
    localparam sync_clk_skew = (SIM_DEVICE == "7SERIES") ? 50 : 100;

    
    // Determine memory size
    localparam widest_width = (WRITE_WIDTH_A >= WRITE_WIDTH_B && WRITE_WIDTH_A >= READ_WIDTH_A && 
			       WRITE_WIDTH_A >= READ_WIDTH_B) ? WRITE_WIDTH_A : 
			      (WRITE_WIDTH_B >= WRITE_WIDTH_A && WRITE_WIDTH_B >= READ_WIDTH_A && 
			       WRITE_WIDTH_B >= READ_WIDTH_B) ? WRITE_WIDTH_B :
			      (READ_WIDTH_A >= WRITE_WIDTH_A && READ_WIDTH_A >= WRITE_WIDTH_B && 
			       READ_WIDTH_A >= READ_WIDTH_B) ? READ_WIDTH_A :
			      (READ_WIDTH_B >= WRITE_WIDTH_A && READ_WIDTH_B >= WRITE_WIDTH_B && 
			       READ_WIDTH_B >= READ_WIDTH_A) ? READ_WIDTH_B : 64;

    localparam wa_width = (WRITE_WIDTH_A == 1) ? 1 : (WRITE_WIDTH_A == 2) ? 2 : (WRITE_WIDTH_A == 4) ? 4 :
			  (WRITE_WIDTH_A == 9) ? 8 : (WRITE_WIDTH_A == 18) ? 16 : (WRITE_WIDTH_A == 36) ? 32 :
			  (WRITE_WIDTH_A == 72) ? 64 : 64;
    
    localparam wb_width = (WRITE_WIDTH_B == 1) ? 1 : (WRITE_WIDTH_B == 2) ? 2 : (WRITE_WIDTH_B == 4) ? 4 :
			  (WRITE_WIDTH_B == 9) ? 8 : (WRITE_WIDTH_B == 18) ? 16 : (WRITE_WIDTH_B == 36) ? 32 :
			  (WRITE_WIDTH_B == 72) ? 64 : 64;


    localparam wa_widthp = (WRITE_WIDTH_A == 9) ? 1 : (WRITE_WIDTH_A == 18) ? 2 : (WRITE_WIDTH_A == 36) ? 4 :
			   (WRITE_WIDTH_A == 72) ? 8 : 8;
    
    localparam wb_widthp = (WRITE_WIDTH_B == 9) ? 1 : (WRITE_WIDTH_B == 18) ? 2 : (WRITE_WIDTH_B == 36) ? 4 :
			   (WRITE_WIDTH_B == 72) ? 8 : 8;

    localparam ra_width = (READ_WIDTH_A == 1) ? 1 : (READ_WIDTH_A == 2) ? 2 : (READ_WIDTH_A == 4) ? 4 :
			  (READ_WIDTH_A == 9) ? 8 : (READ_WIDTH_A == 18) ? 16 : (READ_WIDTH_A == 36) ? 32 :
			  (READ_WIDTH_A == 72) ? 64 : (READ_WIDTH_A == 0) ? ((READ_WIDTH_B == 1) ? 1 : 
			  (READ_WIDTH_B == 2) ? 2 : (READ_WIDTH_B == 4) ? 4 : (READ_WIDTH_B == 9) ? 8 : 
			  (READ_WIDTH_B == 18) ? 16 : (READ_WIDTH_B == 36) ? 32 : (READ_WIDTH_B == 72) ? 64 : 64) : 64;

    localparam rb_width = (READ_WIDTH_B == 1) ? 1 : (READ_WIDTH_B == 2) ? 2 : (READ_WIDTH_B == 4) ? 4 :
			  (READ_WIDTH_B == 9) ? 8 : (READ_WIDTH_B == 18) ? 16 : (READ_WIDTH_B == 36) ? 32 :
			  (READ_WIDTH_B == 72) ? 64 : (READ_WIDTH_B == 0) ? ((READ_WIDTH_A == 1) ? 1 : 
                          (READ_WIDTH_A == 2) ? 2 : (READ_WIDTH_A == 4) ? 4 : (READ_WIDTH_A == 9) ? 8 : 
			  (READ_WIDTH_A == 18) ? 16 : (READ_WIDTH_A == 36) ? 32 : (READ_WIDTH_A == 72) ? 64 : 64) : 64;
    
    localparam ra_widthp = (READ_WIDTH_A == 9) ? 1 : (READ_WIDTH_A == 18) ? 2 : (READ_WIDTH_A == 36) ? 4 :
			   (READ_WIDTH_A == 72) ? 8 : 8;
    
    localparam rb_widthp = (READ_WIDTH_B == 9) ? 1 : (READ_WIDTH_B == 18) ? 2 : (READ_WIDTH_B == 36) ? 4 :
			   (READ_WIDTH_B == 72) ? 8 : 8;
    
    localparam col_addr_lsb = (widest_width == 1) ? 0 : (widest_width == 2) ? 1 : (widest_width == 4) ? 2 :
			      (widest_width == 9) ? 3 : (widest_width == 18) ? 4 : (widest_width == 36) ? 5 :
			      (widest_width == 72) ? 6 : 0;

    assign ox_addra_reconstruct[15:0] = (WRITE_MODE_A == "READ_FIRST" || WRITE_MODE_B == "READ_FIRST") ? 
					 ((BRAM_SIZE == 36) ? {1'b0,addra_in[14:8],8'b0} : 
					  (BRAM_SIZE == 18) ? {2'b0,addra_in[13:7],7'b0} : addra_in) : addra_in;

    assign ox_addrb_reconstruct[15:0] = (WRITE_MODE_A == "READ_FIRST" || WRITE_MODE_B == "READ_FIRST") ? 
					 ((BRAM_SIZE == 36) ? {1'b0,addrb_in[14:8],8'b0} : 
					  (BRAM_SIZE == 18) ? {2'b0,addrb_in[13:7],7'b0} : addrb_in) : addrb_in;

    localparam width = (widest_width == 1) ? 1 : (widest_width == 2) ? 2 : (widest_width == 4) ? 4 :
		       (widest_width == 9) ? 8 : (widest_width == 18) ? 16 : (widest_width == 36) ? 32 :
		       (widest_width == 72) ? 64 : 64;    

    localparam widthp = (widest_width == 9) ? 1 : (widest_width == 18) ? 2 : (widest_width == 36) ? 4 :
			(widest_width == 72) ? 8 : 8;


    localparam r_addra_lbit_124 = (READ_WIDTH_A == 1) ? 0 : (READ_WIDTH_A == 2) ? 1 : 
			       (READ_WIDTH_A == 4) ? 2 : (READ_WIDTH_A == 9) ? 3 : 
			       (READ_WIDTH_A == 18) ? 4 : (READ_WIDTH_A == 36) ? 5 : 
			       (READ_WIDTH_A == 72) ? 6 : (READ_WIDTH_A == 0) ? 
			       ((READ_WIDTH_B == 1) ? 0 : (READ_WIDTH_B == 2) ? 1 : 
			       (READ_WIDTH_B == 4) ? 2 : (READ_WIDTH_B == 9) ? 3 : 
			       (READ_WIDTH_B == 18) ? 4 : (READ_WIDTH_B == 36) ? 5 : 
			       (READ_WIDTH_B == 72) ? 6 : 10) : 10;
    
    localparam r_addrb_lbit_124 = (READ_WIDTH_B == 1) ? 0 : (READ_WIDTH_B == 2) ? 1 : 
			       (READ_WIDTH_B == 4) ? 2 : (READ_WIDTH_B == 9) ? 3 : 
			       (READ_WIDTH_B == 18) ? 4 : (READ_WIDTH_B == 36) ? 5 : 
			       (READ_WIDTH_B == 72) ? 6 : (READ_WIDTH_B == 0) ? 
			       ((READ_WIDTH_A == 1) ? 0 : (READ_WIDTH_A == 2) ? 1 : 
			       (READ_WIDTH_A == 4) ? 2 : (READ_WIDTH_A == 9) ? 3 : 
			       (READ_WIDTH_A == 18) ? 4 : (READ_WIDTH_A == 36) ? 5 : 
			       (READ_WIDTH_A == 72) ? 6 : 10) : 10;

    localparam addra_lbit_124 = (WRITE_WIDTH_A == 1) ? 0 : (WRITE_WIDTH_A == 2) ? 1 : 
			       (WRITE_WIDTH_A == 4) ? 2 : (WRITE_WIDTH_A == 9) ? 3 : 
			       (WRITE_WIDTH_A == 18) ? 4 : (WRITE_WIDTH_A == 36) ? 5 : 
			       (WRITE_WIDTH_A == 72) ? 6 : 10;
    
    localparam addrb_lbit_124 = (WRITE_WIDTH_B == 1) ? 0 : (WRITE_WIDTH_B == 2) ? 1 : 
			       (WRITE_WIDTH_B == 4) ? 2 : (WRITE_WIDTH_B == 9) ? 3 : 
			       (WRITE_WIDTH_B == 18) ? 4 : (WRITE_WIDTH_B == 36) ? 5 : 
			       (WRITE_WIDTH_B == 72) ? 6 : 10;
			       
    localparam addra_bit_124 = (WRITE_WIDTH_A == 1 && widest_width == 2) ? 0 : (WRITE_WIDTH_A == 1 && widest_width == 4) ? 1 : 
			      (WRITE_WIDTH_A == 1 && widest_width == 9) ? 2 : (WRITE_WIDTH_A == 1 && widest_width == 18) ? 3 :
			      (WRITE_WIDTH_A == 1 && widest_width == 36) ? 4 : (WRITE_WIDTH_A == 1 && widest_width == 72) ? 5 :
			      (WRITE_WIDTH_A == 2 && widest_width == 4) ? 1 : (WRITE_WIDTH_A == 2 && widest_width == 9) ? 2 : 
			      (WRITE_WIDTH_A == 2 && widest_width == 18) ? 3 : (WRITE_WIDTH_A == 2 && widest_width == 36) ? 4 :
			      (WRITE_WIDTH_A == 2 && widest_width == 72) ? 5 : (WRITE_WIDTH_A == 4 && widest_width == 9) ? 2 :
			      (WRITE_WIDTH_A == 4 && widest_width == 18) ? 3 : (WRITE_WIDTH_A == 4 && widest_width == 36) ? 4 : 
			      (WRITE_WIDTH_A == 4 && widest_width == 72) ? 5 : 10;
    
    localparam r_addra_bit_124 = (READ_WIDTH_A == 1 && widest_width == 2) ? 0 : (READ_WIDTH_A == 1 && widest_width == 4) ? 1 : 
			      (READ_WIDTH_A == 1 && widest_width == 9) ? 2 : (READ_WIDTH_A == 1 && widest_width == 18) ? 3 :
			      (READ_WIDTH_A == 1 && widest_width == 36) ? 4 : (READ_WIDTH_A == 1 && widest_width == 72) ? 5 :
			      (READ_WIDTH_A == 2 && widest_width == 4) ? 1 : (READ_WIDTH_A == 2 && widest_width == 9) ? 2 : 
			      (READ_WIDTH_A == 2 && widest_width == 18) ? 3 : (READ_WIDTH_A == 2 && widest_width == 36) ? 4 :
			      (READ_WIDTH_A == 2 && widest_width == 72) ? 5 : (READ_WIDTH_A == 4 && widest_width == 9) ? 2 :
			      (READ_WIDTH_A == 4 && widest_width == 18) ? 3 : (READ_WIDTH_A == 4 && widest_width == 36) ? 4 : 
			      (READ_WIDTH_A == 4 && widest_width == 72) ? 5 : (READ_WIDTH_A == 0) ? 
                              ((READ_WIDTH_B == 1 && widest_width == 2) ? 0 : (READ_WIDTH_B == 1 && widest_width == 4) ? 1 : 
			      (READ_WIDTH_B == 1 && widest_width == 9) ? 2 : (READ_WIDTH_B == 1 && widest_width == 18) ? 3 :
			      (READ_WIDTH_B == 1 && widest_width == 36) ? 4 : (READ_WIDTH_B == 1 && widest_width == 72) ? 5 :
			      (READ_WIDTH_B == 2 && widest_width == 4) ? 1 : (READ_WIDTH_B == 2 && widest_width == 9) ? 2 : 
			      (READ_WIDTH_B == 2 && widest_width == 18) ? 3 : (READ_WIDTH_B == 2 && widest_width == 36) ? 4 :
			      (READ_WIDTH_B == 2 && widest_width == 72) ? 5 : (READ_WIDTH_B == 4 && widest_width == 9) ? 2 :
			      (READ_WIDTH_B == 4 && widest_width == 18) ? 3 : (READ_WIDTH_B == 4 && widest_width == 36) ? 4 : 
			      (READ_WIDTH_B == 4 && widest_width == 72) ? 5 : 10) : 10;

    localparam addrb_bit_124 = (WRITE_WIDTH_B == 1 && widest_width == 2) ? 0 : (WRITE_WIDTH_B == 1 && widest_width == 4) ? 1 : 
			      (WRITE_WIDTH_B == 1 && widest_width == 9) ? 2 : (WRITE_WIDTH_B == 1 && widest_width == 18) ? 3 :
			      (WRITE_WIDTH_B == 1 && widest_width == 36) ? 4 : (WRITE_WIDTH_B == 1 && widest_width == 72) ? 5 :
			      (WRITE_WIDTH_B == 2 && widest_width == 4) ? 1 : (WRITE_WIDTH_B == 2 && widest_width == 9) ? 2 : 
			      (WRITE_WIDTH_B == 2 && widest_width == 18) ? 3 : (WRITE_WIDTH_B == 2 && widest_width == 36) ? 4 :
			      (WRITE_WIDTH_B == 2 && widest_width == 72) ? 5 : (WRITE_WIDTH_B == 4 && widest_width == 9) ? 2 :
			      (WRITE_WIDTH_B == 4 && widest_width == 18) ? 3 : (WRITE_WIDTH_B == 4 && widest_width == 36) ? 4 : 
			      (WRITE_WIDTH_B == 4 && widest_width == 72) ? 5 : 10;
    
    localparam r_addrb_bit_124 = (READ_WIDTH_B == 1 && widest_width == 2) ? 0 : (READ_WIDTH_B == 1 && widest_width == 4) ? 1 : 
			      (READ_WIDTH_B == 1 && widest_width == 9) ? 2 : (READ_WIDTH_B == 1 && widest_width == 18) ? 3 :
			      (READ_WIDTH_B == 1 && widest_width == 36) ? 4 : (READ_WIDTH_B == 1 && widest_width == 72) ? 5 :
			      (READ_WIDTH_B == 2 && widest_width == 4) ? 1 : (READ_WIDTH_B == 2 && widest_width == 9) ? 2 : 
			      (READ_WIDTH_B == 2 && widest_width == 18) ? 3 : (READ_WIDTH_B == 2 && widest_width == 36) ? 4 :
			      (READ_WIDTH_B == 2 && widest_width == 72) ? 5 : (READ_WIDTH_B == 4 && widest_width == 9) ? 2 :
			      (READ_WIDTH_B == 4 && widest_width == 18) ? 3 : (READ_WIDTH_B == 4 && widest_width == 36) ? 4 : 
			      (READ_WIDTH_B == 4 && widest_width == 72) ? 5 : (READ_WIDTH_B == 0) ? 
                              ((READ_WIDTH_A == 1 && widest_width == 2) ? 0 : (READ_WIDTH_A == 1 && widest_width == 4) ? 1 : 
			      (READ_WIDTH_A == 1 && widest_width == 9) ? 2 : (READ_WIDTH_A == 1 && widest_width == 18) ? 3 :
			      (READ_WIDTH_A == 1 && widest_width == 36) ? 4 : (READ_WIDTH_A == 1 && widest_width == 72) ? 5 :
			      (READ_WIDTH_A == 2 && widest_width == 4) ? 1 : (READ_WIDTH_A == 2 && widest_width == 9) ? 2 : 
			      (READ_WIDTH_A == 2 && widest_width == 18) ? 3 : (READ_WIDTH_A == 2 && widest_width == 36) ? 4 :
			      (READ_WIDTH_A == 2 && widest_width == 72) ? 5 : (READ_WIDTH_A == 4 && widest_width == 9) ? 2 :
			      (READ_WIDTH_A == 4 && widest_width == 18) ? 3 : (READ_WIDTH_A == 4 && widest_width == 36) ? 4 : 
			      (READ_WIDTH_A == 4 && widest_width == 72) ? 5 : 10) : 10;

    localparam addra_bit_8 = (WRITE_WIDTH_A == 9 && widest_width == 18) ? 3 : (WRITE_WIDTH_A == 9 && widest_width == 36) ? 4 :
			    (WRITE_WIDTH_A == 9 && widest_width == 72) ? 5 : 10;
    
    localparam addra_bit_16 = (WRITE_WIDTH_A == 18 && widest_width == 36) ? 4 : (WRITE_WIDTH_A == 18 && widest_width == 72) ? 5 : 10;

    localparam r_addra_bit_8 = (READ_WIDTH_A == 9 && widest_width == 18) ? 3 : (READ_WIDTH_A == 9 && widest_width == 36) ? 4 :
			    (READ_WIDTH_A == 9 && widest_width == 72) ? 5 : (READ_WIDTH_A == 0) ? ((READ_WIDTH_B == 9 && widest_width == 18) ? 3 :
			    (READ_WIDTH_B == 9 && widest_width == 36) ? 4 : (READ_WIDTH_B == 9 && widest_width == 72) ? 5 : 10) : 10;
    
    localparam r_addra_bit_16 = (READ_WIDTH_A == 18 && widest_width == 36) ? 4 : (READ_WIDTH_A == 18 && widest_width == 72) ? 5 : 
				(READ_WIDTH_A == 0) ? ((READ_WIDTH_B == 18 && widest_width == 36) ? 4 : 
                                (READ_WIDTH_B == 18 && widest_width == 72) ? 5 : 10) : 10;

    localparam r_addra_bit_32 = (READ_WIDTH_A == 36 && widest_width == 72) ? 5 : 
				(READ_WIDTH_A == 0) ? ((READ_WIDTH_B == 36 && widest_width == 72) ? 5 : 10) : 10;

    localparam addrb_bit_8 = (WRITE_WIDTH_B == 9 && widest_width == 18) ? 3 : (WRITE_WIDTH_B == 9 && widest_width == 36) ? 4 :
			    (WRITE_WIDTH_B == 9 && widest_width == 72) ? 5 : 10;
    
    localparam addrb_bit_16 = (WRITE_WIDTH_B == 18 && widest_width == 36) ? 4 : (WRITE_WIDTH_B == 18 && widest_width == 72) ? 5 : 10;

    localparam addrb_bit_32 = (WRITE_WIDTH_B == 36 && widest_width == 72) ? 5 : 10;

    localparam r_addrb_bit_8 = (READ_WIDTH_B == 9 && widest_width == 18) ? 3 : (READ_WIDTH_B == 9 && widest_width == 36) ? 4 :
			    (READ_WIDTH_B == 9 && widest_width == 72) ? 5 : (READ_WIDTH_B == 0) ? ((READ_WIDTH_A == 9 && widest_width == 18) ? 3 : 
                            (READ_WIDTH_A == 9 && widest_width == 36) ? 4 : (READ_WIDTH_A == 9 && widest_width == 72) ? 5 : 10) : 10;
    
    localparam r_addrb_bit_16 = (READ_WIDTH_B == 18 && widest_width == 36) ? 4 : (READ_WIDTH_B == 18 && widest_width == 72) ? 5 : 
				(READ_WIDTH_B == 0) ? ((READ_WIDTH_A == 18 && widest_width == 36) ? 4 : 
                                (READ_WIDTH_A == 18 && widest_width == 72) ? 5 : 10) : 10;

    localparam r_addrb_bit_32 = (READ_WIDTH_B == 36 && widest_width == 72) ? 5 : 
				(READ_WIDTH_B == 0) ? ((READ_WIDTH_A == 36 && widest_width == 72) ? 5 : 10) : 10;
    
    localparam mem_size1 = (BRAM_SIZE == 18) ? 16384 : (BRAM_SIZE == 36) ? 32768 : 32768;
    localparam mem_size2 = (BRAM_SIZE == 18) ? 8192 : (BRAM_SIZE == 36) ? 16384 : 16384;
    localparam mem_size4 = (BRAM_SIZE == 18) ? 4096 : (BRAM_SIZE == 36) ? 8192 : 8192;
    localparam mem_size9 = (BRAM_SIZE == 18) ? 2048 : (BRAM_SIZE == 36) ? 4096 : 4096;
    localparam mem_size18 = (BRAM_SIZE == 18) ? 1024 : (BRAM_SIZE == 36) ? 2048 : 2048;
    localparam mem_size36 = (BRAM_SIZE == 18) ? 512 : (BRAM_SIZE == 36) ? 1024 : 1024;
    localparam mem_size72 = (BRAM_SIZE == 18) ? 0 : (BRAM_SIZE == 36) ? 512 : 512;
    
    localparam mem_depth = (widest_width == 1) ? mem_size1 : (widest_width == 2) ? mem_size2 : (widest_width == 4) ? mem_size4 : 
			   (widest_width == 9) ? mem_size9 :(widest_width == 18) ? mem_size18 : (widest_width == 36) ? mem_size36 : 
			   (widest_width == 72) ? mem_size72 : 32768;
		
    localparam memp_depth = (widest_width == 9) ? mem_size9 :(widest_width == 18) ? mem_size18 : (widest_width == 36) ? mem_size36 : 
			    (widest_width == 72) ? mem_size72 : 4096;

    reg [widest_width-1:0] tmp_mem [mem_depth-1:0];
    
    reg [width-1:0] mem [mem_depth-1:0];
    reg [widthp-1:0] memp [memp_depth-1:0];
    
    integer index = 0;
   

/******************************************** task and function **************************************/
	
    task task_ram;

	input ram_we;
	input [7:0] ram_di;
	input ram_dip;
	inout [7:0] mem_task;
	inout memp_task;

	begin

	    if (ram_we == 1'b1) begin

		mem_task = ram_di;
		
		if (width >= 8)
		    memp_task = ram_dip;
	    end
	end

    endtask // task_ram

    
    task task_ram_col;

	input ram_col_we_o;
	input ram_col_we;
	input [7:0] ram_col_di;
	input ram_col_dip;
	inout [7:0] ram_col_mem_task;
	inout ram_col_memp_task;
	integer ram_col_i;
	
	begin

	    if (ram_col_we == 1'b1) begin

		for (ram_col_i = 0; ram_col_i < 8; ram_col_i = ram_col_i + 1)
		    if (ram_col_mem_task[ram_col_i] !== 1'bx || !(ram_col_we === ram_col_we_o && ram_col_we === 1'b1))
			ram_col_mem_task[ram_col_i] = ram_col_di[ram_col_i];
		
		if (width >= 8 && (ram_col_memp_task !== 1'bx || !(ram_col_we === ram_col_we_o && ram_col_we === 1'b1)))
		    ram_col_memp_task = ram_col_dip;
		
	    end
	end

    endtask // task_ram_col
    

    task task_ram_ox;

	input ram_ox_we_o;
	input ram_ox_we;
	input [7:0] ram_ox_di;
	input ram_ox_dip;
	inout [7:0] ram_ox_mem_task;
	inout ram_ox_memp_task;
	integer ram_ox_i;
	
	begin

	    if (ram_ox_we == 1'b1) begin

		for (ram_ox_i = 0; ram_ox_i < 8; ram_ox_i = ram_ox_i + 1)
		    ram_ox_mem_task[ram_ox_i] = ram_ox_di[ram_ox_i];
		
		if (width >= 8)
		    ram_ox_memp_task = ram_ox_dip;
		
	    end
	end

    endtask // task_ram_ox
    
    
    task task_x_buf;
	input [1:0] wr_rd_mode;
	input integer do_uindex;
	input integer do_lindex;
	input integer dop_index;	
	input [63:0] do_ltmp;
	inout [63:0] x_buf_do_tmp;
	input [7:0] dop_ltmp;
	inout [7:0] x_buf_dop_tmp;
	integer i;

	begin

	    if (wr_rd_mode == 2'b01) begin
		for (i = do_lindex; i <= do_uindex; i = i + 1) begin
		    if (do_ltmp[i] === 1'bx)
			x_buf_do_tmp[i] = 1'bx;
		end
		
		if (dop_ltmp[dop_index] === 1'bx)
		    x_buf_dop_tmp[dop_index] = 1'bx;
		
	    end // if (wr_rd_mode == 2'b01)
	    else begin
		x_buf_do_tmp[do_lindex +: 8] = do_ltmp[do_lindex +: 8];
		x_buf_dop_tmp[dop_index] = dop_ltmp[dop_index];

	    end // else: !if(wr_rd_mode == 2'b01)
	end
	
    endtask // task_x_buf
    
    
    task task_col_wr_ram_a;

	input [1:0] col_wr_ram_a_seq;
	input [7:0] col_wr_ram_a_web_tmp;
	input [7:0] col_wr_ram_a_wea_tmp;
	input [63:0] col_wr_ram_a_dia_tmp;
	input [7:0] col_wr_ram_a_dipa_tmp;
	input [15:0] col_wr_ram_a_addrb_tmp;
	input [15:0] col_wr_ram_a_addra_tmp;

	begin
	    
	    case (wa_width)

		1, 2, 4 : begin
		              if (!(col_wr_ram_a_wea_tmp[0] === 1'b1 && col_wr_ram_a_web_tmp[0] === 1'b1 && wa_width > wb_width) || col_wr_ram_a_seq == 2'b10) begin				  
				  if (wa_width >= width)
				      task_ram_col (col_wr_ram_a_web_tmp[0], col_wr_ram_a_wea_tmp[0], col_wr_ram_a_dia_tmp[wa_width-1:0], 1'b0, mem[col_wr_ram_a_addra_tmp[14:addra_lbit_124]], junk1);
				  else
				      task_ram_col (col_wr_ram_a_web_tmp[0], col_wr_ram_a_wea_tmp[0], col_wr_ram_a_dia_tmp[wa_width-1:0], 1'b0, mem[col_wr_ram_a_addra_tmp[14:addra_bit_124+1]][(col_wr_ram_a_addra_tmp[addra_bit_124:addra_lbit_124] * wa_width) +: wa_width], junk1);				      

				  if (col_wr_ram_a_seq == 2'b00)
				      chk_for_col_msg (col_wr_ram_a_wea_tmp[0], col_wr_ram_a_web_tmp[0], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);
		  
			      end // if (!(col_wr_ram_a_wea_tmp[0] === 1'b1 && col_wr_ram_a_web_tmp[0] === 1'b1 && wa_width > wb_width) || col_wr_ram_a_seq == 2'b10)
		          end // case: 1, 2, 4
		8 : begin
		        if (!(col_wr_ram_a_wea_tmp[0] === 1'b1 && col_wr_ram_a_web_tmp[0] === 1'b1 && wa_width > wb_width) || col_wr_ram_a_seq == 2'b10) begin				  
			    if (wa_width >= width)
				task_ram_col (col_wr_ram_a_web_tmp[0], col_wr_ram_a_wea_tmp[0], col_wr_ram_a_dia_tmp[7:0], col_wr_ram_a_dipa_tmp[0], mem[col_wr_ram_a_addra_tmp[14:3]], memp[col_wr_ram_a_addra_tmp[14:3]]);
			    else
				task_ram_col (col_wr_ram_a_web_tmp[0], col_wr_ram_a_wea_tmp[0], col_wr_ram_a_dia_tmp[7:0], col_wr_ram_a_dipa_tmp[0], mem[col_wr_ram_a_addra_tmp[14:addra_bit_8+1]][(col_wr_ram_a_addra_tmp[addra_bit_8:3] * 8) +: 8], memp[col_wr_ram_a_addra_tmp[14:addra_bit_8+1]][(col_wr_ram_a_addra_tmp[addra_bit_8:3] * 1) +: 1]);
			    
			    if (col_wr_ram_a_seq == 2'b00)
				chk_for_col_msg (col_wr_ram_a_wea_tmp[0], col_wr_ram_a_web_tmp[0], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);
				
			end // if (wa_width <= wb_width)
		     end // case: 8
		16 : begin
		         if (!(col_wr_ram_a_wea_tmp[0] === 1'b1 && col_wr_ram_a_web_tmp[0] === 1'b1 && wa_width > wb_width) || col_wr_ram_a_seq == 2'b10) begin				  
			     if (wa_width >= width)
				 task_ram_col (col_wr_ram_a_web_tmp[0], col_wr_ram_a_wea_tmp[0], col_wr_ram_a_dia_tmp[7:0], col_wr_ram_a_dipa_tmp[0], mem[col_wr_ram_a_addra_tmp[14:4]][0 +: 8], memp[col_wr_ram_a_addra_tmp[14:4]][(index)+:1]);
			     else
				 task_ram_col (col_wr_ram_a_web_tmp[0], col_wr_ram_a_wea_tmp[0], col_wr_ram_a_dia_tmp[7:0], col_wr_ram_a_dipa_tmp[0], mem[col_wr_ram_a_addra_tmp[14:addra_bit_16+1]][(col_wr_ram_a_addra_tmp[addra_bit_16:4] * 16) +: 8], memp[col_wr_ram_a_addra_tmp[14:addra_bit_16+1]][(col_wr_ram_a_addra_tmp[addra_bit_16:4] * 2) +: 1]);				     
			     
			     if (col_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (col_wr_ram_a_wea_tmp[0], col_wr_ram_a_web_tmp[0], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);

			     if (wa_width >= width)
				     task_ram_col (col_wr_ram_a_web_tmp[1], col_wr_ram_a_wea_tmp[1], col_wr_ram_a_dia_tmp[15:8], col_wr_ram_a_dipa_tmp[1], mem[col_wr_ram_a_addra_tmp[14:4]][8 +: 8], memp[col_wr_ram_a_addra_tmp[14:4]][(index+1)+:1]);
			     else
				 task_ram_col (col_wr_ram_a_web_tmp[1], col_wr_ram_a_wea_tmp[1], col_wr_ram_a_dia_tmp[15:8], col_wr_ram_a_dipa_tmp[1], mem[col_wr_ram_a_addra_tmp[14:addra_bit_16+1]][((col_wr_ram_a_addra_tmp[addra_bit_16:4] * 16) + 8) +: 8], memp[col_wr_ram_a_addra_tmp[14:addra_bit_16+1]][((col_wr_ram_a_addra_tmp[addra_bit_16:4] * 2) + 1) +: 1]);

			     if (col_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (col_wr_ram_a_wea_tmp[1], col_wr_ram_a_web_tmp[1], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);
			     
			 end // if (wa_width <= wb_width)
		     end // case: 16
		32 : begin
		         if (!(col_wr_ram_a_wea_tmp[0] === 1'b1 && col_wr_ram_a_web_tmp[0] === 1'b1 && wa_width > wb_width) || col_wr_ram_a_seq == 2'b10) begin				  
			     task_ram_col (col_wr_ram_a_web_tmp[0], col_wr_ram_a_wea_tmp[0], col_wr_ram_a_dia_tmp[7:0], col_wr_ram_a_dipa_tmp[0], mem[col_wr_ram_a_addra_tmp[14:5]][0 +: 8], memp[col_wr_ram_a_addra_tmp[14:5]][(index)+:1]);
			     if (col_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (col_wr_ram_a_wea_tmp[0], col_wr_ram_a_web_tmp[0], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);
			     
			     task_ram_col (col_wr_ram_a_web_tmp[1], col_wr_ram_a_wea_tmp[1], col_wr_ram_a_dia_tmp[15:8], col_wr_ram_a_dipa_tmp[1], mem[col_wr_ram_a_addra_tmp[14:5]][8 +: 8], memp[col_wr_ram_a_addra_tmp[14:5]][(index+1)+:1]);
			     if (col_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (col_wr_ram_a_wea_tmp[1], col_wr_ram_a_web_tmp[1], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);

			     task_ram_col (col_wr_ram_a_web_tmp[2], col_wr_ram_a_wea_tmp[2], col_wr_ram_a_dia_tmp[23:16], col_wr_ram_a_dipa_tmp[2], mem[col_wr_ram_a_addra_tmp[14:5]][16 +: 8], memp[col_wr_ram_a_addra_tmp[14:5]][(index+2)+:1]);
			     if (col_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (col_wr_ram_a_wea_tmp[2], col_wr_ram_a_web_tmp[2], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);
			     
			     task_ram_col (col_wr_ram_a_web_tmp[3], col_wr_ram_a_wea_tmp[3], col_wr_ram_a_dia_tmp[31:24], col_wr_ram_a_dipa_tmp[3], mem[col_wr_ram_a_addra_tmp[14:5]][24 +: 8], memp[col_wr_ram_a_addra_tmp[14:5]][(index+3)+:1]);
			     if (col_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (col_wr_ram_a_wea_tmp[3], col_wr_ram_a_web_tmp[3], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);
			     
			 end // if (wa_width <= wb_width)
		     end // case: 32
		64 : begin

		                 task_ram_col (col_wr_ram_a_web_tmp[0], col_wr_ram_a_wea_tmp[0], col_wr_ram_a_dia_tmp[7:0], col_wr_ram_a_dipa_tmp[0], mem[col_wr_ram_a_addra_tmp[14:6]][0 +: 8], memp[col_wr_ram_a_addra_tmp[14:6]][(index)+:1]);
		                 if (col_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_a_wea_tmp[0], col_wr_ram_a_web_tmp[0], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);

				 task_ram_col (col_wr_ram_a_web_tmp[1], col_wr_ram_a_wea_tmp[1], col_wr_ram_a_dia_tmp[15:8], col_wr_ram_a_dipa_tmp[1], mem[col_wr_ram_a_addra_tmp[14:6]][8 +: 8], memp[col_wr_ram_a_addra_tmp[14:6]][(index+1)+:1]);
				 if (col_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_a_wea_tmp[1], col_wr_ram_a_web_tmp[1], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);

				 task_ram_col (col_wr_ram_a_web_tmp[2], col_wr_ram_a_wea_tmp[2], col_wr_ram_a_dia_tmp[23:16], col_wr_ram_a_dipa_tmp[2], mem[col_wr_ram_a_addra_tmp[14:6]][16 +: 8], memp[col_wr_ram_a_addra_tmp[14:6]][(index+2)+:1]);
				 if (col_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_a_wea_tmp[2], col_wr_ram_a_web_tmp[2], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);

				 task_ram_col (col_wr_ram_a_web_tmp[3], col_wr_ram_a_wea_tmp[3], col_wr_ram_a_dia_tmp[31:24], col_wr_ram_a_dipa_tmp[3], mem[col_wr_ram_a_addra_tmp[14:6]][24 +: 8], memp[col_wr_ram_a_addra_tmp[14:6]][(index+3)+:1]);
				 if (col_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_a_wea_tmp[3], col_wr_ram_a_web_tmp[3], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);

		                 task_ram_col (col_wr_ram_a_web_tmp[4], col_wr_ram_a_wea_tmp[4], col_wr_ram_a_dia_tmp[39:32], col_wr_ram_a_dipa_tmp[4], mem[col_wr_ram_a_addra_tmp[14:6]][32 +: 8], memp[col_wr_ram_a_addra_tmp[14:6]][(index+4)+:1]);
				 if (col_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_a_wea_tmp[4], col_wr_ram_a_web_tmp[4], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);

		                 task_ram_col (col_wr_ram_a_web_tmp[5], col_wr_ram_a_wea_tmp[5], col_wr_ram_a_dia_tmp[47:40], col_wr_ram_a_dipa_tmp[5], mem[col_wr_ram_a_addra_tmp[14:6]][40 +: 8], memp[col_wr_ram_a_addra_tmp[14:6]][(index+5)+:1]);
				 if (col_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_a_wea_tmp[5], col_wr_ram_a_web_tmp[5], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);

				 task_ram_col (col_wr_ram_a_web_tmp[6], col_wr_ram_a_wea_tmp[6], col_wr_ram_a_dia_tmp[55:48], col_wr_ram_a_dipa_tmp[6], mem[col_wr_ram_a_addra_tmp[14:6]][48 +: 8], memp[col_wr_ram_a_addra_tmp[14:6]][(index+6)+:1]);
				 if (col_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_a_wea_tmp[6], col_wr_ram_a_web_tmp[6], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);

				 task_ram_col (col_wr_ram_a_web_tmp[7], col_wr_ram_a_wea_tmp[7], col_wr_ram_a_dia_tmp[63:56], col_wr_ram_a_dipa_tmp[7], mem[col_wr_ram_a_addra_tmp[14:6]][56 +: 8], memp[col_wr_ram_a_addra_tmp[14:6]][(index+7)+:1]);
				 if (col_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_a_wea_tmp[7], col_wr_ram_a_web_tmp[7], col_wr_ram_a_addra_tmp, col_wr_ram_a_addrb_tmp);
			     
		     end // case: 64
		
	    endcase // case(wa_width)

	end
	
    endtask // task_col_wr_ram_a


    task task_ox_wr_ram_a;

	input [1:0] ox_wr_ram_a_seq;
	input [7:0] ox_wr_ram_a_web_tmp;
	input [7:0] ox_wr_ram_a_wea_tmp;
	input [63:0] ox_wr_ram_a_dia_tmp;
	input [7:0] ox_wr_ram_a_dipa_tmp;
	input [15:0] ox_wr_ram_a_addrb_tmp;
	input [15:0] ox_wr_ram_a_addra_tmp;

	begin
	    
	    case (wa_width)

		1, 2, 4 : begin
		              if (!(ox_wr_ram_a_wea_tmp[0] === 1'b1 && ox_wr_ram_a_web_tmp[0] === 1'b1 && wa_width > wb_width) || ox_wr_ram_a_seq == 2'b10) begin				  
				  if (wa_width >= width)
				      task_ram_ox (ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_dia_tmp[wa_width-1:0], 1'b0, mem[ox_wr_ram_a_addra_tmp[14:addra_lbit_124]], junk1);
				  else
				      task_ram_ox (ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_dia_tmp[wa_width-1:0], 1'b0, mem[ox_wr_ram_a_addra_tmp[14:addra_bit_124+1]][(ox_wr_ram_a_addra_tmp[addra_bit_124:addra_lbit_124] * wa_width) +: wa_width], junk1);				      

				  if (ox_wr_ram_a_seq == 2'b00)
				      chk_for_col_msg (ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);
		  
			      end // if (!(ox_wr_ram_a_wea_tmp[0] === 1'b1 && ox_wr_ram_a_web_tmp[0] === 1'b1 && wa_width > wb_width) || ox_wr_ram_a_seq == 2'b10)
		          end // case: 1, 2, 4
		8 : begin
		        if (!(ox_wr_ram_a_wea_tmp[0] === 1'b1 && ox_wr_ram_a_web_tmp[0] === 1'b1 && wa_width > wb_width) || ox_wr_ram_a_seq == 2'b10) begin				  
			    if (wa_width >= width)
				task_ram_ox (ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_dia_tmp[7:0], ox_wr_ram_a_dipa_tmp[0], mem[ox_wr_ram_a_addra_tmp[14:3]], memp[ox_wr_ram_a_addra_tmp[14:3]]);
			    else
				task_ram_ox (ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_dia_tmp[7:0], ox_wr_ram_a_dipa_tmp[0], mem[ox_wr_ram_a_addra_tmp[14:addra_bit_8+1]][(ox_wr_ram_a_addra_tmp[addra_bit_8:3] * 8) +: 8], memp[ox_wr_ram_a_addra_tmp[14:addra_bit_8+1]][(ox_wr_ram_a_addra_tmp[addra_bit_8:3] * 1) +: 1]);
			    
			    if (ox_wr_ram_a_seq == 2'b00)
				chk_for_col_msg (ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);
				
			end // if (wa_width <= wb_width)
		     end // case: 8
		16 : begin
		         if (!(ox_wr_ram_a_wea_tmp[0] === 1'b1 && ox_wr_ram_a_web_tmp[0] === 1'b1 && wa_width > wb_width) || ox_wr_ram_a_seq == 2'b10) begin				  
			     if (wa_width >= width)
				 task_ram_ox (ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_dia_tmp[7:0], ox_wr_ram_a_dipa_tmp[0], mem[ox_wr_ram_a_addra_tmp[14:4]][0 +: 8], memp[ox_wr_ram_a_addra_tmp[14:4]][(index)+:1]);
			     else
				 task_ram_ox (ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_dia_tmp[7:0], ox_wr_ram_a_dipa_tmp[0], mem[ox_wr_ram_a_addra_tmp[14:addra_bit_16+1]][(ox_wr_ram_a_addra_tmp[addra_bit_16:4] * 16) +: 8], memp[ox_wr_ram_a_addra_tmp[14:addra_bit_16+1]][(ox_wr_ram_a_addra_tmp[addra_bit_16:4] * 2) +: 1]);				     
			     
			     if (ox_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);

			     if (wa_width >= width)
				     task_ram_ox (ox_wr_ram_a_web_tmp[1], ox_wr_ram_a_wea_tmp[1], ox_wr_ram_a_dia_tmp[15:8], ox_wr_ram_a_dipa_tmp[1], mem[ox_wr_ram_a_addra_tmp[14:4]][8 +: 8], memp[ox_wr_ram_a_addra_tmp[14:4]][(index+1)+:1]);
			     else
				 task_ram_ox (ox_wr_ram_a_web_tmp[1], ox_wr_ram_a_wea_tmp[1], ox_wr_ram_a_dia_tmp[15:8], ox_wr_ram_a_dipa_tmp[1], mem[ox_wr_ram_a_addra_tmp[14:addra_bit_16+1]][((ox_wr_ram_a_addra_tmp[addra_bit_16:4] * 16) + 8) +: 8], memp[ox_wr_ram_a_addra_tmp[14:addra_bit_16+1]][((ox_wr_ram_a_addra_tmp[addra_bit_16:4] * 2) + 1) +: 1]);

			     if (ox_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (ox_wr_ram_a_wea_tmp[1], ox_wr_ram_a_web_tmp[1], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);
			     
			 end // if (wa_width <= wb_width)
		     end // case: 16
		32 : begin
		         if (!(ox_wr_ram_a_wea_tmp[0] === 1'b1 && ox_wr_ram_a_web_tmp[0] === 1'b1 && wa_width > wb_width) || ox_wr_ram_a_seq == 2'b10) begin				  
			     task_ram_ox (ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_dia_tmp[7:0], ox_wr_ram_a_dipa_tmp[0], mem[ox_wr_ram_a_addra_tmp[14:5]][0 +: 8], memp[ox_wr_ram_a_addra_tmp[14:5]][(index)+:1]);
			     if (ox_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);
			     
			     task_ram_ox (ox_wr_ram_a_web_tmp[1], ox_wr_ram_a_wea_tmp[1], ox_wr_ram_a_dia_tmp[15:8], ox_wr_ram_a_dipa_tmp[1], mem[ox_wr_ram_a_addra_tmp[14:5]][8 +: 8], memp[ox_wr_ram_a_addra_tmp[14:5]][(index+1)+:1]);
			     if (ox_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (ox_wr_ram_a_wea_tmp[1], ox_wr_ram_a_web_tmp[1], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);

			     task_ram_ox (ox_wr_ram_a_web_tmp[2], ox_wr_ram_a_wea_tmp[2], ox_wr_ram_a_dia_tmp[23:16], ox_wr_ram_a_dipa_tmp[2], mem[ox_wr_ram_a_addra_tmp[14:5]][16 +: 8], memp[ox_wr_ram_a_addra_tmp[14:5]][(index+2)+:1]);
			     if (ox_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (ox_wr_ram_a_wea_tmp[2], ox_wr_ram_a_web_tmp[2], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);
			     
			     task_ram_ox (ox_wr_ram_a_web_tmp[3], ox_wr_ram_a_wea_tmp[3], ox_wr_ram_a_dia_tmp[31:24], ox_wr_ram_a_dipa_tmp[3], mem[ox_wr_ram_a_addra_tmp[14:5]][24 +: 8], memp[ox_wr_ram_a_addra_tmp[14:5]][(index+3)+:1]);
			     if (ox_wr_ram_a_seq == 2'b00)
				 chk_for_col_msg (ox_wr_ram_a_wea_tmp[3], ox_wr_ram_a_web_tmp[3], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);
			     
			 end // if (wa_width <= wb_width)
		     end // case: 32
		64 : begin

		                 task_ram_ox (ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_dia_tmp[7:0], ox_wr_ram_a_dipa_tmp[0], mem[ox_wr_ram_a_addra_tmp[14:6]][0 +: 8], memp[ox_wr_ram_a_addra_tmp[14:6]][(index)+:1]);
		                 if (ox_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_a_wea_tmp[0], ox_wr_ram_a_web_tmp[0], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);

				 task_ram_ox (ox_wr_ram_a_web_tmp[1], ox_wr_ram_a_wea_tmp[1], ox_wr_ram_a_dia_tmp[15:8], ox_wr_ram_a_dipa_tmp[1], mem[ox_wr_ram_a_addra_tmp[14:6]][8 +: 8], memp[ox_wr_ram_a_addra_tmp[14:6]][(index+1)+:1]);
				 if (ox_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_a_wea_tmp[1], ox_wr_ram_a_web_tmp[1], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);

				 task_ram_ox (ox_wr_ram_a_web_tmp[2], ox_wr_ram_a_wea_tmp[2], ox_wr_ram_a_dia_tmp[23:16], ox_wr_ram_a_dipa_tmp[2], mem[ox_wr_ram_a_addra_tmp[14:6]][16 +: 8], memp[ox_wr_ram_a_addra_tmp[14:6]][(index+2)+:1]);
				 if (ox_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_a_wea_tmp[2], ox_wr_ram_a_web_tmp[2], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);

				 task_ram_ox (ox_wr_ram_a_web_tmp[3], ox_wr_ram_a_wea_tmp[3], ox_wr_ram_a_dia_tmp[31:24], ox_wr_ram_a_dipa_tmp[3], mem[ox_wr_ram_a_addra_tmp[14:6]][24 +: 8], memp[ox_wr_ram_a_addra_tmp[14:6]][(index+3)+:1]);
				 if (ox_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_a_wea_tmp[3], ox_wr_ram_a_web_tmp[3], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);

				 task_ram_ox (ox_wr_ram_a_web_tmp[4], ox_wr_ram_a_wea_tmp[4], ox_wr_ram_a_dia_tmp[39:32], ox_wr_ram_a_dipa_tmp[4], mem[ox_wr_ram_a_addra_tmp[14:6]][32 +: 8], memp[ox_wr_ram_a_addra_tmp[14:6]][(index+4)+:1]);
				 if (ox_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_a_wea_tmp[4], ox_wr_ram_a_web_tmp[4], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);

				 task_ram_ox (ox_wr_ram_a_web_tmp[5], ox_wr_ram_a_wea_tmp[5], ox_wr_ram_a_dia_tmp[47:40], ox_wr_ram_a_dipa_tmp[5], mem[ox_wr_ram_a_addra_tmp[14:6]][40 +: 8], memp[ox_wr_ram_a_addra_tmp[14:6]][(index+5)+:1]);
				 if (ox_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_a_wea_tmp[5], ox_wr_ram_a_web_tmp[5], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);

				 task_ram_ox (ox_wr_ram_a_web_tmp[6], ox_wr_ram_a_wea_tmp[6], ox_wr_ram_a_dia_tmp[55:48], ox_wr_ram_a_dipa_tmp[6], mem[ox_wr_ram_a_addra_tmp[14:6]][48 +: 8], memp[ox_wr_ram_a_addra_tmp[14:6]][(index+6)+:1]);
				 if (ox_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_a_wea_tmp[6], ox_wr_ram_a_web_tmp[6], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);

				 task_ram_ox (ox_wr_ram_a_web_tmp[7], ox_wr_ram_a_wea_tmp[7], ox_wr_ram_a_dia_tmp[63:56], ox_wr_ram_a_dipa_tmp[7], mem[ox_wr_ram_a_addra_tmp[14:6]][56 +: 8], memp[ox_wr_ram_a_addra_tmp[14:6]][(index+7)+:1]);
				 if (ox_wr_ram_a_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_a_wea_tmp[7], ox_wr_ram_a_web_tmp[7], ox_wr_ram_a_addra_tmp, ox_wr_ram_a_addrb_tmp);
			     
		     end // case: 64
		
	    endcase // case(wa_width)

	end
	
    endtask // task_ox_wr_ram_a


    task task_col_wr_ram_b;

	input [1:0] col_wr_ram_b_seq;
	input [7:0] col_wr_ram_b_wea_tmp;
	input [7:0] col_wr_ram_b_web_tmp;
	input [63:0] col_wr_ram_b_dib_tmp;
	input [7:0] col_wr_ram_b_dipb_tmp;
	input [15:0] col_wr_ram_b_addra_tmp;
	input [15:0] col_wr_ram_b_addrb_tmp;

	begin

	    case (wb_width)

		1, 2, 4 : begin
		              if (!(col_wr_ram_b_wea_tmp[0] === 1'b1 && col_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || col_wr_ram_b_seq == 2'b10) begin				  
				  if (wb_width >= width)
				      task_ram_col (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_dib_tmp[wb_width-1:0], 1'b0, mem[col_wr_ram_b_addrb_tmp[14:addrb_lbit_124]], junk1);
				  else
				      task_ram_col (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_dib_tmp[wb_width-1:0], 1'b0, mem[col_wr_ram_b_addrb_tmp[14:addrb_bit_124+1]][(col_wr_ram_b_addrb_tmp[addrb_bit_124:addrb_lbit_124] * wb_width) +: wb_width], junk1);				      
				  
				  if (col_wr_ram_b_seq == 2'b00)
				      chk_for_col_msg (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);
		    
			      end // if (wb_width <= wa_width)
		          end // case: 1, 2, 4
		8 : begin
       	                if (!(col_wr_ram_b_wea_tmp[0] === 1'b1 && col_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || col_wr_ram_b_seq == 2'b10) begin				  
			    if (wb_width >= width)
				task_ram_col (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_dib_tmp[7:0], col_wr_ram_b_dipb_tmp[0], mem[col_wr_ram_b_addrb_tmp[14:3]], memp[col_wr_ram_b_addrb_tmp[14:3]]);
			    else
				task_ram_col (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_dib_tmp[7:0], col_wr_ram_b_dipb_tmp[0], mem[col_wr_ram_b_addrb_tmp[14:addrb_bit_8+1]][(col_wr_ram_b_addrb_tmp[addrb_bit_8:3] * 8) +: 8], memp[col_wr_ram_b_addrb_tmp[14:addrb_bit_8+1]][(col_wr_ram_b_addrb_tmp[addrb_bit_8:3] * 1) +: 1]);
			    
			    if (col_wr_ram_b_seq == 2'b00)
				chk_for_col_msg (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);
				
			end // if (wb_width <= wa_width)
		     end // case: 8
		16 : begin
	                 if (!(col_wr_ram_b_wea_tmp[0] === 1'b1 && col_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || col_wr_ram_b_seq == 2'b10) begin				  
			     if (wb_width >= width)
				 task_ram_col (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_dib_tmp[7:0], col_wr_ram_b_dipb_tmp[0], mem[col_wr_ram_b_addrb_tmp[14:4]][0 +: 8], memp[col_wr_ram_b_addrb_tmp[14:4]][(index)+:1]);
			     else
				 task_ram_col (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_dib_tmp[7:0], col_wr_ram_b_dipb_tmp[0], mem[col_wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][(col_wr_ram_b_addrb_tmp[addrb_bit_16:4] * 16) +: 8], memp[col_wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][(col_wr_ram_b_addrb_tmp[addrb_bit_16:4] * 2) +: 1]);				     
			     
			     if (col_wr_ram_b_seq == 2'b00)
				 chk_for_col_msg (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);


			     if (wb_width >= width)
				 task_ram_col (col_wr_ram_b_wea_tmp[1], col_wr_ram_b_web_tmp[1], col_wr_ram_b_dib_tmp[15:8], col_wr_ram_b_dipb_tmp[1], mem[col_wr_ram_b_addrb_tmp[14:4]][8 +: 8], memp[col_wr_ram_b_addrb_tmp[14:4]][(index+1)+:1]);
			     else
				 task_ram_col (col_wr_ram_b_wea_tmp[1], col_wr_ram_b_web_tmp[1], col_wr_ram_b_dib_tmp[15:8], col_wr_ram_b_dipb_tmp[1], mem[col_wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][((col_wr_ram_b_addrb_tmp[addrb_bit_16:4] * 16) + 8) +: 8], memp[col_wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][((col_wr_ram_b_addrb_tmp[addrb_bit_16:4] * 2) + 1) +: 1]);
			     
			     if (col_wr_ram_b_seq == 2'b00)
				 chk_for_col_msg (col_wr_ram_b_wea_tmp[1], col_wr_ram_b_web_tmp[1], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);

			 end // if (!(col_wr_ram_b_wea_tmp[0] === 1'b1 && col_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || col_wr_ram_b_seq == 2'b10)
		     end // case: 16
		32 : begin

			if (!(col_wr_ram_b_wea_tmp[0] === 1'b1 && col_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || col_wr_ram_b_seq == 2'b10) begin

			    if (wb_width >= width)
				task_ram_col (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_dib_tmp[7:0], col_wr_ram_b_dipb_tmp[0], mem[col_wr_ram_b_addrb_tmp[14:5]][0 +: 8], memp[col_wr_ram_b_addrb_tmp[14:5]][(index)+:1]);
			    else
				task_ram_col (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_dib_tmp[7:0], col_wr_ram_b_dipb_tmp[0], mem[col_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][(col_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) +: 8], memp[col_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][(col_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) +: 1]);				     

			    if (col_wr_ram_b_seq == 2'b00)
				chk_for_col_msg (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);		    
			    
			    if (wb_width >= width)
				task_ram_col (col_wr_ram_b_wea_tmp[1], col_wr_ram_b_web_tmp[1], col_wr_ram_b_dib_tmp[15:8], col_wr_ram_b_dipb_tmp[1], mem[col_wr_ram_b_addrb_tmp[14:5]][8 +: 8], memp[col_wr_ram_b_addrb_tmp[14:5]][(index+1)+:1]);
			    else
				task_ram_col (col_wr_ram_b_wea_tmp[1], col_wr_ram_b_web_tmp[1], col_wr_ram_b_dib_tmp[15:8], col_wr_ram_b_dipb_tmp[1], mem[col_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((col_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) + 8) +: 8], memp[col_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((col_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) + 1) +: 1]);
			    
			    if (col_wr_ram_b_seq == 2'b00)
				chk_for_col_msg (col_wr_ram_b_wea_tmp[1], col_wr_ram_b_web_tmp[1], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);
			    
			    if (wb_width >= width)
				task_ram_col (col_wr_ram_b_wea_tmp[2], col_wr_ram_b_web_tmp[2], col_wr_ram_b_dib_tmp[23:16], col_wr_ram_b_dipb_tmp[2], mem[col_wr_ram_b_addrb_tmp[14:5]][16 +: 8], memp[col_wr_ram_b_addrb_tmp[14:5]][(index+2)+:1]);
			    else
				task_ram_col (col_wr_ram_b_wea_tmp[2], col_wr_ram_b_web_tmp[2], col_wr_ram_b_dib_tmp[23:16], col_wr_ram_b_dipb_tmp[2], mem[col_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((col_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) + 16) +: 8], memp[col_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((col_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) + 2) +: 1]);
			    
			    if (col_wr_ram_b_seq == 2'b00)
				chk_for_col_msg (col_wr_ram_b_wea_tmp[2], col_wr_ram_b_web_tmp[2], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);

			    if (wb_width >= width)
				task_ram_col (col_wr_ram_b_wea_tmp[3], col_wr_ram_b_web_tmp[3], col_wr_ram_b_dib_tmp[31:24], col_wr_ram_b_dipb_tmp[3], mem[col_wr_ram_b_addrb_tmp[14:5]][24 +: 8], memp[col_wr_ram_b_addrb_tmp[14:5]][(index+3)+:1]);
			    else
				task_ram_col (col_wr_ram_b_wea_tmp[3], col_wr_ram_b_web_tmp[3], col_wr_ram_b_dib_tmp[31:24], col_wr_ram_b_dipb_tmp[3], mem[col_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((col_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) + 24) +: 8], memp[col_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((col_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) + 3) +: 1]);

			    if (col_wr_ram_b_seq == 2'b00)
				chk_for_col_msg (col_wr_ram_b_wea_tmp[3], col_wr_ram_b_web_tmp[3], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);

			end // if (!(col_wr_ram_b_wea_tmp[0] === 1'b1 && col_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || col_wr_ram_b_seq == 2'b10)

		     end // case: 32
		64 : begin

				 task_ram_col (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_dib_tmp[7:0], col_wr_ram_b_dipb_tmp[0], mem[col_wr_ram_b_addrb_tmp[14:6]][0 +: 8], memp[col_wr_ram_b_addrb_tmp[14:6]][(index)+:1]);
		                 if (col_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_b_wea_tmp[0], col_wr_ram_b_web_tmp[0], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);

				 task_ram_col (col_wr_ram_b_wea_tmp[1], col_wr_ram_b_web_tmp[1], col_wr_ram_b_dib_tmp[15:8], col_wr_ram_b_dipb_tmp[1], mem[col_wr_ram_b_addrb_tmp[14:6]][8 +: 8], memp[col_wr_ram_b_addrb_tmp[14:6]][(index+1)+:1]);
				 if (col_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_b_wea_tmp[1], col_wr_ram_b_web_tmp[1], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);

				 task_ram_col (col_wr_ram_b_wea_tmp[2], col_wr_ram_b_web_tmp[2], col_wr_ram_b_dib_tmp[23:16], col_wr_ram_b_dipb_tmp[2], mem[col_wr_ram_b_addrb_tmp[14:6]][16 +: 8], memp[col_wr_ram_b_addrb_tmp[14:6]][(index+2)+:1]);
				 if (col_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_b_wea_tmp[2], col_wr_ram_b_web_tmp[2], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);

				 task_ram_col (col_wr_ram_b_wea_tmp[3], col_wr_ram_b_web_tmp[3], col_wr_ram_b_dib_tmp[31:24], col_wr_ram_b_dipb_tmp[3], mem[col_wr_ram_b_addrb_tmp[14:6]][24 +: 8], memp[col_wr_ram_b_addrb_tmp[14:6]][(index+3)+:1]);
				 if (col_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_b_wea_tmp[3], col_wr_ram_b_web_tmp[3], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);

				 task_ram_col (col_wr_ram_b_wea_tmp[4], col_wr_ram_b_web_tmp[4], col_wr_ram_b_dib_tmp[39:32], col_wr_ram_b_dipb_tmp[4], mem[col_wr_ram_b_addrb_tmp[14:6]][32 +: 8], memp[col_wr_ram_b_addrb_tmp[14:6]][(index+4)+:1]);
				 if (col_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_b_wea_tmp[4], col_wr_ram_b_web_tmp[4], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);

				 task_ram_col (col_wr_ram_b_wea_tmp[5], col_wr_ram_b_web_tmp[5], col_wr_ram_b_dib_tmp[47:40], col_wr_ram_b_dipb_tmp[5], mem[col_wr_ram_b_addrb_tmp[14:6]][40 +: 8], memp[col_wr_ram_b_addrb_tmp[14:6]][(index+5)+:1]);
				 if (col_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_b_wea_tmp[5], col_wr_ram_b_web_tmp[5], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);

				 task_ram_col (col_wr_ram_b_wea_tmp[6], col_wr_ram_b_web_tmp[6], col_wr_ram_b_dib_tmp[55:48], col_wr_ram_b_dipb_tmp[6], mem[col_wr_ram_b_addrb_tmp[14:6]][48 +: 8], memp[col_wr_ram_b_addrb_tmp[14:6]][(index+6)+:1]);
				 if (col_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_b_wea_tmp[6], col_wr_ram_b_web_tmp[6], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);

				 task_ram_col (col_wr_ram_b_wea_tmp[7], col_wr_ram_b_web_tmp[7], col_wr_ram_b_dib_tmp[63:56], col_wr_ram_b_dipb_tmp[7], mem[col_wr_ram_b_addrb_tmp[14:6]][56 +: 8], memp[col_wr_ram_b_addrb_tmp[14:6]][(index+7)+:1]);
				 if (col_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (col_wr_ram_b_wea_tmp[7], col_wr_ram_b_web_tmp[7], col_wr_ram_b_addra_tmp, col_wr_ram_b_addrb_tmp);
			     
		     end // case: 64
		
	    endcase // case(wb_width)

	end
	
    endtask // task_col_wr_ram_b


    task task_ox_wr_ram_b;

	input [1:0] ox_wr_ram_b_seq;
	input [7:0] ox_wr_ram_b_wea_tmp;
	input [7:0] ox_wr_ram_b_web_tmp;
	input [63:0] ox_wr_ram_b_dib_tmp;
	input [7:0] ox_wr_ram_b_dipb_tmp;
	input [15:0] ox_wr_ram_b_addra_tmp;
	input [15:0] ox_wr_ram_b_addrb_tmp;

	begin

	    case (wb_width)

		1, 2, 4 : begin
		              if (!(ox_wr_ram_b_wea_tmp[0] === 1'b1 && ox_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || ox_wr_ram_b_seq == 2'b10) begin				  
				  if (wb_width >= width)
				      task_ram_ox (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_dib_tmp[wb_width-1:0], 1'b0, mem[ox_wr_ram_b_addrb_tmp[14:addrb_lbit_124]], junk1);
				  else
				      task_ram_ox (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_dib_tmp[wb_width-1:0], 1'b0, mem[ox_wr_ram_b_addrb_tmp[14:addrb_bit_124+1]][(ox_wr_ram_b_addrb_tmp[addrb_bit_124:addrb_lbit_124] * wb_width) +: wb_width], junk1);				      
				  
				  if (ox_wr_ram_b_seq == 2'b00)
				      chk_for_col_msg (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);
		    
			      end // if (wb_width <= wa_width)
		          end // case: 1, 2, 4
		8 : begin
       	                if (!(ox_wr_ram_b_wea_tmp[0] === 1'b1 && ox_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || ox_wr_ram_b_seq == 2'b10) begin				  
			    if (wb_width >= width)
				task_ram_ox (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_dib_tmp[7:0], ox_wr_ram_b_dipb_tmp[0], mem[ox_wr_ram_b_addrb_tmp[14:3]], memp[ox_wr_ram_b_addrb_tmp[14:3]]);
			    else
				task_ram_ox (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_dib_tmp[7:0], ox_wr_ram_b_dipb_tmp[0], mem[ox_wr_ram_b_addrb_tmp[14:addrb_bit_8+1]][(ox_wr_ram_b_addrb_tmp[addrb_bit_8:3] * 8) +: 8], memp[ox_wr_ram_b_addrb_tmp[14:addrb_bit_8+1]][(ox_wr_ram_b_addrb_tmp[addrb_bit_8:3] * 1) +: 1]);
			    
			    if (ox_wr_ram_b_seq == 2'b00)
				chk_for_col_msg (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);
				
			end // if (wb_width <= wa_width)
		     end // case: 8
		16 : begin
	                 if (!(ox_wr_ram_b_wea_tmp[0] === 1'b1 && ox_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || ox_wr_ram_b_seq == 2'b10) begin				  
			     if (wb_width >= width)
				 task_ram_ox (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_dib_tmp[7:0], ox_wr_ram_b_dipb_tmp[0], mem[ox_wr_ram_b_addrb_tmp[14:4]][0 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:4]][(index)+:1]);
			     else
				 task_ram_ox (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_dib_tmp[7:0], ox_wr_ram_b_dipb_tmp[0], mem[ox_wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][(ox_wr_ram_b_addrb_tmp[addrb_bit_16:4] * 16) +: 8], memp[ox_wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][(ox_wr_ram_b_addrb_tmp[addrb_bit_16:4] * 2) +: 1]);				     
			     
			     if (ox_wr_ram_b_seq == 2'b00)
				 chk_for_col_msg (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);


			     if (wb_width >= width)
				 task_ram_ox (ox_wr_ram_b_wea_tmp[1], ox_wr_ram_b_web_tmp[1], ox_wr_ram_b_dib_tmp[15:8], ox_wr_ram_b_dipb_tmp[1], mem[ox_wr_ram_b_addrb_tmp[14:4]][8 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:4]][(index+1)+:1]);
			     else
				 task_ram_ox (ox_wr_ram_b_wea_tmp[1], ox_wr_ram_b_web_tmp[1], ox_wr_ram_b_dib_tmp[15:8], ox_wr_ram_b_dipb_tmp[1], mem[ox_wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][((ox_wr_ram_b_addrb_tmp[addrb_bit_16:4] * 16) + 8) +: 8], memp[ox_wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][((ox_wr_ram_b_addrb_tmp[addrb_bit_16:4] * 2) + 1) +: 1]);
			     
			     if (ox_wr_ram_b_seq == 2'b00)
				 chk_for_col_msg (ox_wr_ram_b_wea_tmp[1], ox_wr_ram_b_web_tmp[1], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);

			 end // if (!(ox_wr_ram_b_wea_tmp[0] === 1'b1 && ox_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || ox_wr_ram_b_seq == 2'b10)
		     end // case: 16
		32 : begin

			if (!(ox_wr_ram_b_wea_tmp[0] === 1'b1 && ox_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || ox_wr_ram_b_seq == 2'b10) begin				  
			    
			    if (wb_width >= width)
				task_ram_ox (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_dib_tmp[7:0], ox_wr_ram_b_dipb_tmp[0], mem[ox_wr_ram_b_addrb_tmp[14:5]][0 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:5]][(index)+:1]);
			    else
				task_ram_ox (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_dib_tmp[7:0], ox_wr_ram_b_dipb_tmp[0], mem[ox_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][(ox_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) +: 8], memp[ox_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][(ox_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) +: 1]);				     

			    if (ox_wr_ram_b_seq == 2'b00)
				chk_for_col_msg (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);		    
			    
			    if (wb_width >= width)
				task_ram_ox (ox_wr_ram_b_wea_tmp[1], ox_wr_ram_b_web_tmp[1], ox_wr_ram_b_dib_tmp[15:8], ox_wr_ram_b_dipb_tmp[1], mem[ox_wr_ram_b_addrb_tmp[14:5]][8 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:5]][(index+1)+:1]);
			    else
				task_ram_ox (ox_wr_ram_b_wea_tmp[1], ox_wr_ram_b_web_tmp[1], ox_wr_ram_b_dib_tmp[15:8], ox_wr_ram_b_dipb_tmp[1], mem[ox_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((ox_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) + 8) +: 8], memp[ox_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((ox_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) + 1) +: 1]);
			    
			    if (ox_wr_ram_b_seq == 2'b00)
				chk_for_col_msg (ox_wr_ram_b_wea_tmp[1], ox_wr_ram_b_web_tmp[1], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);
			    
			    if (wb_width >= width)
				task_ram_ox (ox_wr_ram_b_wea_tmp[2], ox_wr_ram_b_web_tmp[2], ox_wr_ram_b_dib_tmp[23:16], ox_wr_ram_b_dipb_tmp[2], mem[ox_wr_ram_b_addrb_tmp[14:5]][16 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:5]][(index+2)+:1]);
			    else
				task_ram_ox (ox_wr_ram_b_wea_tmp[2], ox_wr_ram_b_web_tmp[2], ox_wr_ram_b_dib_tmp[23:16], ox_wr_ram_b_dipb_tmp[2], mem[ox_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((ox_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) + 16) +: 8], memp[ox_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((ox_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) + 2) +: 1]);
			    
			    if (ox_wr_ram_b_seq == 2'b00)
				chk_for_col_msg (ox_wr_ram_b_wea_tmp[2], ox_wr_ram_b_web_tmp[2], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);

			    if (wb_width >= width)
				task_ram_ox (ox_wr_ram_b_wea_tmp[3], ox_wr_ram_b_web_tmp[3], ox_wr_ram_b_dib_tmp[31:24], ox_wr_ram_b_dipb_tmp[3], mem[ox_wr_ram_b_addrb_tmp[14:5]][24 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:5]][(index+3)+:1]);
			    else
				task_ram_ox (ox_wr_ram_b_wea_tmp[3], ox_wr_ram_b_web_tmp[3], ox_wr_ram_b_dib_tmp[31:24], ox_wr_ram_b_dipb_tmp[3], mem[ox_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((ox_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) + 24) +: 8], memp[ox_wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((ox_wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) + 3) +: 1]);

			    if (ox_wr_ram_b_seq == 2'b00)
				chk_for_col_msg (ox_wr_ram_b_wea_tmp[3], ox_wr_ram_b_web_tmp[3], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);

			end // if (!(ox_wr_ram_b_wea_tmp[0] === 1'b1 && ox_wr_ram_b_web_tmp[0] === 1'b1 && wb_width > wa_width) || ox_wr_ram_b_seq == 2'b10)

		     end // case: 32
		64 : begin

				 task_ram_ox (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_dib_tmp[7:0], ox_wr_ram_b_dipb_tmp[0], mem[ox_wr_ram_b_addrb_tmp[14:6]][0 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:6]][(index)+:1]);
		                 if (ox_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_b_wea_tmp[0], ox_wr_ram_b_web_tmp[0], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);

				 task_ram_ox (ox_wr_ram_b_wea_tmp[1], ox_wr_ram_b_web_tmp[1], ox_wr_ram_b_dib_tmp[15:8], ox_wr_ram_b_dipb_tmp[1], mem[ox_wr_ram_b_addrb_tmp[14:6]][8 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:6]][(index+1)+:1]);
				 if (ox_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_b_wea_tmp[1], ox_wr_ram_b_web_tmp[1], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);

				 task_ram_ox (ox_wr_ram_b_wea_tmp[2], ox_wr_ram_b_web_tmp[2], ox_wr_ram_b_dib_tmp[23:16], ox_wr_ram_b_dipb_tmp[2], mem[ox_wr_ram_b_addrb_tmp[14:6]][16 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:6]][(index+2)+:1]);
				 if (ox_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_b_wea_tmp[2], ox_wr_ram_b_web_tmp[2], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);

				 task_ram_ox (ox_wr_ram_b_wea_tmp[3], ox_wr_ram_b_web_tmp[3], ox_wr_ram_b_dib_tmp[31:24], ox_wr_ram_b_dipb_tmp[3], mem[ox_wr_ram_b_addrb_tmp[14:6]][24 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:6]][(index+3)+:1]);
				 if (ox_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_b_wea_tmp[3], ox_wr_ram_b_web_tmp[3], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);

				 task_ram_ox (ox_wr_ram_b_wea_tmp[4], ox_wr_ram_b_web_tmp[4], ox_wr_ram_b_dib_tmp[39:32], ox_wr_ram_b_dipb_tmp[4], mem[ox_wr_ram_b_addrb_tmp[14:6]][32 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:6]][(index+4)+:1]);
				 if (ox_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_b_wea_tmp[4], ox_wr_ram_b_web_tmp[4], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);

				 task_ram_ox (ox_wr_ram_b_wea_tmp[5], ox_wr_ram_b_web_tmp[5], ox_wr_ram_b_dib_tmp[47:40], ox_wr_ram_b_dipb_tmp[5], mem[ox_wr_ram_b_addrb_tmp[14:6]][40 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:6]][(index+5)+:1]);
				 if (ox_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_b_wea_tmp[5], ox_wr_ram_b_web_tmp[5], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);

				 task_ram_ox (ox_wr_ram_b_wea_tmp[6], ox_wr_ram_b_web_tmp[6], ox_wr_ram_b_dib_tmp[55:48], ox_wr_ram_b_dipb_tmp[6], mem[ox_wr_ram_b_addrb_tmp[14:6]][48 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:6]][(index+6)+:1]);
				 if (ox_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_b_wea_tmp[6], ox_wr_ram_b_web_tmp[6], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);

				 task_ram_ox (ox_wr_ram_b_wea_tmp[7], ox_wr_ram_b_web_tmp[7], ox_wr_ram_b_dib_tmp[63:56], ox_wr_ram_b_dipb_tmp[7], mem[ox_wr_ram_b_addrb_tmp[14:6]][56 +: 8], memp[ox_wr_ram_b_addrb_tmp[14:6]][(index+7)+:1]);
				 if (ox_wr_ram_b_seq == 2'b00)
				     chk_for_col_msg (ox_wr_ram_b_wea_tmp[7], ox_wr_ram_b_web_tmp[7], ox_wr_ram_b_addra_tmp, ox_wr_ram_b_addrb_tmp);
			     
		     end // case: 64
		
	    endcase // case(wb_width)

	end
	
    endtask // task_ox_wr_ram_b
    

    task task_wr_ram_a;

	input [7:0] wr_ram_a_wea_tmp;
	input [63:0] dia_tmp;
	input [7:0] dipa_tmp;
	input [15:0] wr_ram_a_addra_tmp;

	begin
	    
	    case (wa_width)

		1, 2, 4 : begin

		              if (wa_width >= width)
				  task_ram (wr_ram_a_wea_tmp[0], dia_tmp[wa_width-1:0], 1'b0, mem[wr_ram_a_addra_tmp[14:addra_lbit_124]], junk1);
			      else
				  task_ram (wr_ram_a_wea_tmp[0], dia_tmp[wa_width-1:0], 1'b0, mem[wr_ram_a_addra_tmp[14:addra_bit_124+1]][(wr_ram_a_addra_tmp[addra_bit_124:addra_lbit_124] * wa_width) +: wa_width], junk1);

		          end
		8 : begin

		        if (wa_width >= width)
			    task_ram (wr_ram_a_wea_tmp[0], dia_tmp[7:0], dipa_tmp[0], mem[wr_ram_a_addra_tmp[14:3]], memp[wr_ram_a_addra_tmp[14:3]]);
			else
			    task_ram (wr_ram_a_wea_tmp[0], dia_tmp[7:0], dipa_tmp[0], mem[wr_ram_a_addra_tmp[14:addra_bit_8+1]][(wr_ram_a_addra_tmp[addra_bit_8:3] * 8) +: 8], memp[wr_ram_a_addra_tmp[14:addra_bit_8+1]][(wr_ram_a_addra_tmp[addra_bit_8:3] * 1) +: 1]);

		    end
		16 : begin

		         if (wa_width >= width) begin
				 task_ram (wr_ram_a_wea_tmp[0], dia_tmp[7:0], dipa_tmp[0], mem[wr_ram_a_addra_tmp[14:4]][0 +: 8], memp[wr_ram_a_addra_tmp[14:4]][(index)+:1]);
				 task_ram (wr_ram_a_wea_tmp[1], dia_tmp[15:8], dipa_tmp[1], mem[wr_ram_a_addra_tmp[14:4]][8 +: 8], memp[wr_ram_a_addra_tmp[14:4]][(index+1)+:1]);
			 end 
			 else begin
				 task_ram (wr_ram_a_wea_tmp[0], dia_tmp[7:0], dipa_tmp[0], mem[wr_ram_a_addra_tmp[14:addra_bit_16+1]][(wr_ram_a_addra_tmp[addra_bit_16:4] * 16) +: 8], memp[wr_ram_a_addra_tmp[14:addra_bit_16+1]][(wr_ram_a_addra_tmp[addra_bit_16:4] * 2) +: 1]);
				 task_ram (wr_ram_a_wea_tmp[1], dia_tmp[15:8], dipa_tmp[1], mem[wr_ram_a_addra_tmp[14:addra_bit_16+1]][((wr_ram_a_addra_tmp[addra_bit_16:4] * 16) + 8) +: 8], memp[wr_ram_a_addra_tmp[14:addra_bit_16+1]][((wr_ram_a_addra_tmp[addra_bit_16:4] * 2) + 1) +: 1]);
			 end // else: !if(wa_width >= wb_width)

		    end // case: 16
		32 : begin

		         task_ram (wr_ram_a_wea_tmp[0], dia_tmp[7:0], dipa_tmp[0], mem[wr_ram_a_addra_tmp[14:5]][0 +: 8], memp[wr_ram_a_addra_tmp[14:5]][(index)+:1]);
		         task_ram (wr_ram_a_wea_tmp[1], dia_tmp[15:8], dipa_tmp[1], mem[wr_ram_a_addra_tmp[14:5]][8 +: 8], memp[wr_ram_a_addra_tmp[14:5]][(index+1)+:1]);
		         task_ram (wr_ram_a_wea_tmp[2], dia_tmp[23:16], dipa_tmp[2], mem[wr_ram_a_addra_tmp[14:5]][16 +: 8], memp[wr_ram_a_addra_tmp[14:5]][(index+2)+:1]);
		         task_ram (wr_ram_a_wea_tmp[3], dia_tmp[31:24], dipa_tmp[3], mem[wr_ram_a_addra_tmp[14:5]][24 +: 8], memp[wr_ram_a_addra_tmp[14:5]][(index+3)+:1]);
		    
		     end // case: 32
	    endcase // case(wa_width)
	end
	
    endtask // task_wr_ram_a
    
    
    task task_wr_ram_b;

	input [7:0] wr_ram_b_web_tmp;
	input [63:0] dib_tmp;
	input [7:0] dipb_tmp;
	input [15:0] wr_ram_b_addrb_tmp;

	begin
	    
	    case (wb_width)

		1, 2, 4 : begin

		              if (wb_width >= width)
				  task_ram (wr_ram_b_web_tmp[0], dib_tmp[wb_width-1:0], 1'b0, mem[wr_ram_b_addrb_tmp[14:addrb_lbit_124]], junk1);
			      else
				  task_ram (wr_ram_b_web_tmp[0], dib_tmp[wb_width-1:0], 1'b0, mem[wr_ram_b_addrb_tmp[14:addrb_bit_124+1]][(wr_ram_b_addrb_tmp[addrb_bit_124:addrb_lbit_124] * wb_width) +: wb_width], junk1);
		          end
		8 : begin

		        if (wb_width >= width)
			    task_ram (wr_ram_b_web_tmp[0], dib_tmp[7:0], dipb_tmp[0], mem[wr_ram_b_addrb_tmp[14:3]], memp[wr_ram_b_addrb_tmp[14:3]]);
			else
			    task_ram (wr_ram_b_web_tmp[0], dib_tmp[7:0], dipb_tmp[0], mem[wr_ram_b_addrb_tmp[14:addrb_bit_8+1]][(wr_ram_b_addrb_tmp[addrb_bit_8:3] * 8) +: 8], memp[wr_ram_b_addrb_tmp[14:addrb_bit_8+1]][(wr_ram_b_addrb_tmp[addrb_bit_8:3] * 1) +: 1]);

		    end
		16 : begin

		         if (wb_width >= width) begin
			     task_ram (wr_ram_b_web_tmp[0], dib_tmp[7:0], dipb_tmp[0], mem[wr_ram_b_addrb_tmp[14:4]][0 +: 8], memp[wr_ram_b_addrb_tmp[14:4]][(index)+:1]);
			     task_ram (wr_ram_b_web_tmp[1], dib_tmp[15:8], dipb_tmp[1], mem[wr_ram_b_addrb_tmp[14:4]][8 +: 8], memp[wr_ram_b_addrb_tmp[14:4]][(index+1)+:1]);
			 end 
			 else begin
			     task_ram (wr_ram_b_web_tmp[0], dib_tmp[7:0], dipb_tmp[0], mem[wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][(wr_ram_b_addrb_tmp[addrb_bit_16:4] * 16) +: 8], memp[wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][(wr_ram_b_addrb_tmp[addrb_bit_16:4] * 2) +: 1]);
			     task_ram (wr_ram_b_web_tmp[1], dib_tmp[15:8], dipb_tmp[1], mem[wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][((wr_ram_b_addrb_tmp[addrb_bit_16:4] * 16) + 8) +: 8], memp[wr_ram_b_addrb_tmp[14:addrb_bit_16+1]][((wr_ram_b_addrb_tmp[addrb_bit_16:4] * 2) + 1) +: 1]);
			 end

 		     end // case: 16
		32 : begin
		    
		         if (wb_width >= width) begin
		             task_ram (wr_ram_b_web_tmp[0], dib_tmp[7:0], dipb_tmp[0], mem[wr_ram_b_addrb_tmp[14:5]][0 +: 8], memp[wr_ram_b_addrb_tmp[14:5]][(index)+:1]);
		             task_ram (wr_ram_b_web_tmp[1], dib_tmp[15:8], dipb_tmp[1], mem[wr_ram_b_addrb_tmp[14:5]][8 +: 8], memp[wr_ram_b_addrb_tmp[14:5]][(index+1)+:1]);
		             task_ram (wr_ram_b_web_tmp[2], dib_tmp[23:16], dipb_tmp[2], mem[wr_ram_b_addrb_tmp[14:5]][16 +: 8], memp[wr_ram_b_addrb_tmp[14:5]][(index+2)+:1]);
		             task_ram (wr_ram_b_web_tmp[3], dib_tmp[31:24], dipb_tmp[3], mem[wr_ram_b_addrb_tmp[14:5]][24 +: 8], memp[wr_ram_b_addrb_tmp[14:5]][(index+3)+:1]);
			 end
			 else begin
			     task_ram (wr_ram_b_web_tmp[0], dib_tmp[7:0], dipb_tmp[0], mem[wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][(wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) +: 8], memp[wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][(wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) +: 1]);
			     task_ram (wr_ram_b_web_tmp[1], dib_tmp[15:8], dipb_tmp[1], mem[wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) + 8) +: 8], memp[wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) + 1) +: 1]);
			     task_ram (wr_ram_b_web_tmp[2], dib_tmp[23:16], dipb_tmp[2], mem[wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) + 16) +: 8], memp[wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) + 2) +: 1]);
			     task_ram (wr_ram_b_web_tmp[3], dib_tmp[31:24], dipb_tmp[3], mem[wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((wr_ram_b_addrb_tmp[addrb_bit_32:5] * 32) + 24) +: 8], memp[wr_ram_b_addrb_tmp[14:addrb_bit_32+1]][((wr_ram_b_addrb_tmp[addrb_bit_32:5] * 4) + 3) +: 1]);
			 end // else: !if(wb_width >= width)
			     
		     end // case: 32
		64 : begin  // only valid with ECC single bit correction for 64 bits

			     task_ram (wr_ram_b_web_tmp[0], dib_tmp[7:0], dipb_tmp[0], mem[wr_ram_b_addrb_tmp[14:6]][0 +: 8], memp[wr_ram_b_addrb_tmp[14:6]][(index)+:1]);
			     task_ram (wr_ram_b_web_tmp[1], dib_tmp[15:8], dipb_tmp[1], mem[wr_ram_b_addrb_tmp[14:6]][8 +: 8], memp[wr_ram_b_addrb_tmp[14:6]][(index+1)+:1]);
			     task_ram (wr_ram_b_web_tmp[2], dib_tmp[23:16], dipb_tmp[2], mem[wr_ram_b_addrb_tmp[14:6]][16 +: 8], memp[wr_ram_b_addrb_tmp[14:6]][(index+2)+:1]);
			     task_ram (wr_ram_b_web_tmp[3], dib_tmp[31:24], dipb_tmp[3], mem[wr_ram_b_addrb_tmp[14:6]][24 +: 8], memp[wr_ram_b_addrb_tmp[14:6]][(index+3)+:1]);
			     task_ram (wr_ram_b_web_tmp[4], dib_tmp[39:32], dipb_tmp[4], mem[wr_ram_b_addrb_tmp[14:6]][32 +: 8], memp[wr_ram_b_addrb_tmp[14:6]][(index+4)+:1]);
			     task_ram (wr_ram_b_web_tmp[5], dib_tmp[47:40], dipb_tmp[5], mem[wr_ram_b_addrb_tmp[14:6]][40 +: 8], memp[wr_ram_b_addrb_tmp[14:6]][(index+5)+:1]);
			     task_ram (wr_ram_b_web_tmp[6], dib_tmp[55:48], dipb_tmp[6], mem[wr_ram_b_addrb_tmp[14:6]][48 +: 8], memp[wr_ram_b_addrb_tmp[14:6]][(index+6)+:1]);
			     task_ram (wr_ram_b_web_tmp[7], dib_tmp[63:56], dipb_tmp[7], mem[wr_ram_b_addrb_tmp[14:6]][56 +: 8], memp[wr_ram_b_addrb_tmp[14:6]][(index+7)+:1]);
			     
		     end // case: 64
	    endcase // case(wb_width)
	end
	
    endtask // task_wr_ram_b

    
    task task_col_rd_ram_a;

	input [1:0] col_rd_ram_a_seq;   // 1 is bypass
	input [7:0] col_rd_ram_a_web_tmp;
	input [7:0] col_rd_ram_a_wea_tmp;
	input [15:0] col_rd_ram_a_addra_tmp;
	inout [63:0] col_rd_ram_a_doa_tmp;
	inout [7:0] col_rd_ram_a_dopa_tmp;
	reg [63:0] doa_ltmp;
	reg [7:0] dopa_ltmp;
	
	begin

	    doa_ltmp= 64'b0;
	    dopa_ltmp= 8'b0;
	    
	    case (ra_width)
		1, 2, 4 : begin

		              if ((col_rd_ram_a_web_tmp[0] === 1'b1 && col_rd_ram_a_wea_tmp[0] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[0] === 1'b1 && col_rd_ram_a_wea_tmp[0] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[0] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[0] !== 1'b1)) begin
				  if (ra_width >= width)
				      doa_ltmp = mem[col_rd_ram_a_addra_tmp[14:r_addra_lbit_124]];
				  else
				      doa_ltmp = mem[col_rd_ram_a_addra_tmp[14:r_addra_bit_124+1]][(col_rd_ram_a_addra_tmp[r_addra_bit_124:r_addra_lbit_124] * ra_width) +: ra_width];
				  task_x_buf (wr_mode_a, 3, 0, 0, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);			  
			      end
 		          end // case: 1, 2, 4
		8 : begin

		        if ((col_rd_ram_a_web_tmp[0] === 1'b1 && col_rd_ram_a_wea_tmp[0] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[0] === 1'b1 && col_rd_ram_a_wea_tmp[0] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[0] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[0] !== 1'b1)) begin
		            if (ra_width >= width) begin
				doa_ltmp = mem[col_rd_ram_a_addra_tmp[14:3]];
				dopa_ltmp =  memp[col_rd_ram_a_addra_tmp[14:3]];
			    end
			    else begin
				doa_ltmp = mem[col_rd_ram_a_addra_tmp[14:r_addra_bit_8+1]][(col_rd_ram_a_addra_tmp[r_addra_bit_8:3] * 8) +: 8];
				dopa_ltmp = memp[col_rd_ram_a_addra_tmp[14:r_addra_bit_8+1]][(col_rd_ram_a_addra_tmp[r_addra_bit_8:3] * 1) +: 1];
			    end
			    
			    task_x_buf (wr_mode_a, 7, 0, 0, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);			  

			end
		     end // case: 8
		16 : begin

		         if ((col_rd_ram_a_web_tmp[0] === 1'b1 && col_rd_ram_a_wea_tmp[0] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[0] === 1'b1 && col_rd_ram_a_wea_tmp[0] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[0] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[0] !== 1'b1)) begin
		             if (ra_width >= width) begin
				 doa_ltmp[7:0] = mem[col_rd_ram_a_addra_tmp[14:4]][7:0];
				 dopa_ltmp[0:0] = memp[col_rd_ram_a_addra_tmp[14:4]][(index)+:1];
			     end
			     else begin
				 doa_ltmp[7:0] = mem[col_rd_ram_a_addra_tmp[14:r_addra_bit_16+1]][(col_rd_ram_a_addra_tmp[r_addra_bit_16:4] * 16) +: 8];
				 dopa_ltmp[0:0] = memp[col_rd_ram_a_addra_tmp[14:r_addra_bit_16+1]][(col_rd_ram_a_addra_tmp[r_addra_bit_16:4] * 2) +: 1];
			     end
			     task_x_buf (wr_mode_a, 7, 0, 0, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			 end

		         if ((col_rd_ram_a_web_tmp[1] === 1'b1 && col_rd_ram_a_wea_tmp[1] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[1] === 1'b1 && col_rd_ram_a_wea_tmp[1] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[1] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[1] !== 1'b1)) begin
			     if (ra_width >= width) begin
				 doa_ltmp[15:8] = mem[col_rd_ram_a_addra_tmp[14:4]][15:8];
				 dopa_ltmp[1:1] = memp[col_rd_ram_a_addra_tmp[14:4]][(index+1)+:1];
			     end 
			     else begin
				 doa_ltmp[15:8] = mem[col_rd_ram_a_addra_tmp[14:r_addra_bit_16+1]][((col_rd_ram_a_addra_tmp[r_addra_bit_16:4] * 16) + 8) +: 8];
				 dopa_ltmp[1:1] = memp[col_rd_ram_a_addra_tmp[14:r_addra_bit_16+1]][((col_rd_ram_a_addra_tmp[r_addra_bit_16:4] * 2) + 1) +: 1];
			     end
			     task_x_buf (wr_mode_a, 15, 8, 1, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			 end
		    
		     end
		32 : begin
		         if (ra_width >= width) begin

			     if ((col_rd_ram_a_web_tmp[0] === 1'b1 && col_rd_ram_a_wea_tmp[0] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[0] === 1'b1 && col_rd_ram_a_wea_tmp[0] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[0] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[0] !== 1'b1)) begin
				 doa_ltmp[7:0] = mem[col_rd_ram_a_addra_tmp[14:5]][7:0];
				 dopa_ltmp[0:0] = memp[col_rd_ram_a_addra_tmp[14:5]][(index)+:1];
				 task_x_buf (wr_mode_a, 7, 0, 0, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			     end

			     if ((col_rd_ram_a_web_tmp[1] === 1'b1 && col_rd_ram_a_wea_tmp[1] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[1] === 1'b1 && col_rd_ram_a_wea_tmp[1] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[1] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[1] !== 1'b1)) begin
				 doa_ltmp[15:8] = mem[col_rd_ram_a_addra_tmp[14:5]][15:8];
				 dopa_ltmp[1:1] = memp[col_rd_ram_a_addra_tmp[14:5]][(index+1)+:1];
				 task_x_buf (wr_mode_a, 15, 8, 1, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			     end

			     if ((col_rd_ram_a_web_tmp[2] === 1'b1 && col_rd_ram_a_wea_tmp[2] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[2] === 1'b1 && col_rd_ram_a_wea_tmp[2] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[2] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[2] !== 1'b1)) begin
				 doa_ltmp[23:16] = mem[col_rd_ram_a_addra_tmp[14:5]][23:16];
				 dopa_ltmp[2:2] = memp[col_rd_ram_a_addra_tmp[14:5]][(index+2)+:1];
				 task_x_buf (wr_mode_a, 23, 16, 2, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			     end

			     if ((col_rd_ram_a_web_tmp[3] === 1'b1 && col_rd_ram_a_wea_tmp[3] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[3] === 1'b1 && col_rd_ram_a_wea_tmp[3] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[3] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[3] !== 1'b1)) begin
				 doa_ltmp[31:24] = mem[col_rd_ram_a_addra_tmp[14:5]][31:24];
				 dopa_ltmp[3:3] = memp[col_rd_ram_a_addra_tmp[14:5]][(index+3)+:1];
				 task_x_buf (wr_mode_a, 31, 24, 3, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			     end

			 end // if (ra_width >= width)
		     end
		64 : begin

		         if ((col_rd_ram_a_web_tmp[0] === 1'b1 && col_rd_ram_a_wea_tmp[0] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[0] === 1'b1 && col_rd_ram_a_wea_tmp[0] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[0] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[0] !== 1'b1)) begin
			     doa_ltmp[7:0] = mem[col_rd_ram_a_addra_tmp[14:6]][7:0];
			     dopa_ltmp[0:0] = memp[col_rd_ram_a_addra_tmp[14:6]][(index)+:1];
			     task_x_buf (wr_mode_a, 7, 0, 0, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			 end
			     
		         if ((col_rd_ram_a_web_tmp[1] === 1'b1 && col_rd_ram_a_wea_tmp[1] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[1] === 1'b1 && col_rd_ram_a_wea_tmp[1] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[1] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[1] !== 1'b1)) begin
			     doa_ltmp[15:8] = mem[col_rd_ram_a_addra_tmp[14:6]][15:8];
			     dopa_ltmp[1:1] = memp[col_rd_ram_a_addra_tmp[14:6]][(index+1)+:1];
			     task_x_buf (wr_mode_a, 15, 8, 1, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			 end
		    
		         if ((col_rd_ram_a_web_tmp[2] === 1'b1 && col_rd_ram_a_wea_tmp[2] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[2] === 1'b1 && col_rd_ram_a_wea_tmp[2] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[2] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[2] !== 1'b1)) begin
			     doa_ltmp[23:16] = mem[col_rd_ram_a_addra_tmp[14:6]][23:16];
			     dopa_ltmp[2:2] = memp[col_rd_ram_a_addra_tmp[14:6]][(index+2)+:1];
			     task_x_buf (wr_mode_a, 23, 16, 2, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			 end
		    
		         if ((col_rd_ram_a_web_tmp[3] === 1'b1 && col_rd_ram_a_wea_tmp[3] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[3] === 1'b1 && col_rd_ram_a_wea_tmp[3] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[3] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[3] !== 1'b1)) begin
			     doa_ltmp[31:24] = mem[col_rd_ram_a_addra_tmp[14:6]][31:24];
			     dopa_ltmp[3:3] = memp[col_rd_ram_a_addra_tmp[14:6]][(index+3)+:1];
			     task_x_buf (wr_mode_a, 31, 24, 3, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			 end

		         if ((col_rd_ram_a_web_tmp[4] === 1'b1 && col_rd_ram_a_wea_tmp[4] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[4] === 1'b1 && col_rd_ram_a_wea_tmp[4] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[4] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[4] !== 1'b1)) begin
			     doa_ltmp[39:32] = mem[col_rd_ram_a_addra_tmp[14:6]][39:32];
			     dopa_ltmp[4:4] = memp[col_rd_ram_a_addra_tmp[14:6]][(index+4)+:1];
			     task_x_buf (wr_mode_a, 39, 32, 4, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			 end
			     
		         if ((col_rd_ram_a_web_tmp[5] === 1'b1 && col_rd_ram_a_wea_tmp[5] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[5] === 1'b1 && col_rd_ram_a_wea_tmp[5] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[5] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[5] !== 1'b1)) begin
			     doa_ltmp[47:40] = mem[col_rd_ram_a_addra_tmp[14:6]][47:40];
			     dopa_ltmp[5:5] = memp[col_rd_ram_a_addra_tmp[14:6]][(index+5)+:1];
			     task_x_buf (wr_mode_a, 47, 40, 5, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			 end
		    
		         if ((col_rd_ram_a_web_tmp[6] === 1'b1 && col_rd_ram_a_wea_tmp[6] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[6] === 1'b1 && col_rd_ram_a_wea_tmp[6] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[6] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[6] !== 1'b1)) begin
			     doa_ltmp[55:48] = mem[col_rd_ram_a_addra_tmp[14:6]][55:48];
			     dopa_ltmp[6:6] = memp[col_rd_ram_a_addra_tmp[14:6]][(index+6)+:1];
			     task_x_buf (wr_mode_a, 55, 48, 6, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			 end
		    
		         if ((col_rd_ram_a_web_tmp[7] === 1'b1 && col_rd_ram_a_wea_tmp[7] === 1'b1) || (col_rd_ram_a_seq == 2'b01 && col_rd_ram_a_web_tmp[7] === 1'b1 && col_rd_ram_a_wea_tmp[7] === 1'b0 && viol_type == 2'b10) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a != 2'b01 && wr_mode_b != 2'b01) || (col_rd_ram_a_seq == 2'b01 && wr_mode_a == 2'b01 && wr_mode_b != 2'b01 && col_rd_ram_a_web_tmp[7] === 1'b1) || (col_rd_ram_a_seq == 2'b11 && wr_mode_a == 2'b00 && col_rd_ram_a_web_tmp[7] !== 1'b1)) begin
			     doa_ltmp[63:56] = mem[col_rd_ram_a_addra_tmp[14:6]][63:56];
			     dopa_ltmp[7:7] = memp[col_rd_ram_a_addra_tmp[14:6]][(index+7)+:1];
			     task_x_buf (wr_mode_a, 63, 56, 7, doa_ltmp, col_rd_ram_a_doa_tmp, dopa_ltmp, col_rd_ram_a_dopa_tmp);
			 end

		     end
	    endcase // case(ra_width)
	end
    endtask // task_col_rd_ram_a


    task task_col_rd_ram_b;

	input [1:0] col_rd_ram_b_seq;   // 1 is bypass
	input [7:0] col_rd_ram_b_wea_tmp;
	input [7:0] col_rd_ram_b_web_tmp;
	input [15:0] col_rd_ram_b_addrb_tmp;
	inout [63:0] col_rd_ram_b_dob_tmp;
	inout [7:0] col_rd_ram_b_dopb_tmp;
	reg [63:0] col_rd_ram_b_dob_ltmp;
	reg [7:0] col_rd_ram_b_dopb_ltmp;
	
	begin

	    col_rd_ram_b_dob_ltmp= 64'b0;
	    col_rd_ram_b_dopb_ltmp= 8'b0;
	    
	    case (rb_width)
		1, 2, 4 : begin

		              if ((col_rd_ram_b_web_tmp[0] === 1'b1 && col_rd_ram_b_wea_tmp[0] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[0] === 1'b1 && col_rd_ram_b_web_tmp[0] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[0] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[0] !== 1'b1)) begin
				  if (rb_width >= width)
				      col_rd_ram_b_dob_ltmp = mem[col_rd_ram_b_addrb_tmp[14:r_addrb_lbit_124]];
				  else
				      col_rd_ram_b_dob_ltmp = mem[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_124+1]][(col_rd_ram_b_addrb_tmp[r_addrb_bit_124:r_addrb_lbit_124] * rb_width) +: rb_width];

				  task_x_buf (wr_mode_b, 3, 0, 0, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);

			      end
		          end // case: 1, 2, 4
		8 : begin

		        if ((col_rd_ram_b_web_tmp[0] === 1'b1 && col_rd_ram_b_wea_tmp[0] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[0] === 1'b1 && col_rd_ram_b_web_tmp[0] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[0] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[0] !== 1'b1)) begin
		    
		            if (rb_width >= width) begin
				col_rd_ram_b_dob_ltmp = mem[col_rd_ram_b_addrb_tmp[14:3]];
				col_rd_ram_b_dopb_ltmp =  memp[col_rd_ram_b_addrb_tmp[14:3]];
			    end
			    else begin
				col_rd_ram_b_dob_ltmp = mem[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_8+1]][(col_rd_ram_b_addrb_tmp[r_addrb_bit_8:3] * 8) +: 8];
				col_rd_ram_b_dopb_ltmp = memp[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_8+1]][(col_rd_ram_b_addrb_tmp[r_addrb_bit_8:3] * 1) +: 1];
			    end
			    
			    task_x_buf (wr_mode_b, 7, 0, 0, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);

			end
		     end // case: 8
		16 : begin
		    
		         if ((col_rd_ram_b_web_tmp[0] === 1'b1 && col_rd_ram_b_wea_tmp[0] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[0] === 1'b1 && col_rd_ram_b_web_tmp[0] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[0] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[0] !== 1'b1)) begin
		             if (rb_width >= width) begin
				 col_rd_ram_b_dob_ltmp[7:0] = mem[col_rd_ram_b_addrb_tmp[14:4]][7:0];
				 col_rd_ram_b_dopb_ltmp[0:0] = memp[col_rd_ram_b_addrb_tmp[14:4]][(index)+:1];
			     end
			     else begin
				 col_rd_ram_b_dob_ltmp[7:0] = mem[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_16+1]][(col_rd_ram_b_addrb_tmp[r_addrb_bit_16:4] * 16) +: 8];
				 col_rd_ram_b_dopb_ltmp[0:0] = memp[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_16+1]][(col_rd_ram_b_addrb_tmp[r_addrb_bit_16:4] * 2) +: 1];
			     end
			     task_x_buf (wr_mode_b, 7, 0, 0, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end
		    

		         if ((col_rd_ram_b_web_tmp[1] === 1'b1 && col_rd_ram_b_wea_tmp[1] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[1] === 1'b1 && col_rd_ram_b_web_tmp[1] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[1] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[1] !== 1'b1)) begin	    

		             if (rb_width >= width) begin
				 col_rd_ram_b_dob_ltmp[15:8] = mem[col_rd_ram_b_addrb_tmp[14:4]][15:8];
				 col_rd_ram_b_dopb_ltmp[1:1] = memp[col_rd_ram_b_addrb_tmp[14:4]][(index+1)+:1];
			     end 
			     else begin
				 col_rd_ram_b_dob_ltmp[15:8] = mem[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_16+1]][((col_rd_ram_b_addrb_tmp[r_addrb_bit_16:4] * 16) + 8) +: 8];
				 col_rd_ram_b_dopb_ltmp[1:1] = memp[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_16+1]][((col_rd_ram_b_addrb_tmp[r_addrb_bit_16:4] * 2) + 1) +: 1];
			     end
			     task_x_buf (wr_mode_b, 15, 8, 1, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end

		     end
		32 : begin

		         if ((col_rd_ram_b_web_tmp[0] === 1'b1 && col_rd_ram_b_wea_tmp[0] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[0] === 1'b1 && col_rd_ram_b_web_tmp[0] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[0] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[0] !== 1'b1)) begin
			     if (rb_width >= width) begin
				 col_rd_ram_b_dob_ltmp[7:0] = mem[col_rd_ram_b_addrb_tmp[14:5]][7:0];
				 col_rd_ram_b_dopb_ltmp[0:0] = memp[col_rd_ram_b_addrb_tmp[14:5]][(index)+:1];
			     end
			     else begin
				 col_rd_ram_b_dob_ltmp[7:0] = mem[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_32+1]][(col_rd_ram_b_addrb_tmp[r_addrb_bit_32:5] * 32) +: 8];
				 col_rd_ram_b_dopb_ltmp[0:0] = memp[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_32+1]][(col_rd_ram_b_addrb_tmp[r_addrb_bit_32:5] * 4) +: 1];
			     end
			     task_x_buf (wr_mode_b, 7, 0, 0, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end
		    

		         if ((col_rd_ram_b_web_tmp[1] === 1'b1 && col_rd_ram_b_wea_tmp[1] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[1] === 1'b1 && col_rd_ram_b_web_tmp[1] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[1] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[1] !== 1'b1)) begin		    
			     if (rb_width >= width) begin
				 col_rd_ram_b_dob_ltmp[15:8] = mem[col_rd_ram_b_addrb_tmp[14:5]][15:8];
				 col_rd_ram_b_dopb_ltmp[1:1] = memp[col_rd_ram_b_addrb_tmp[14:5]][(index+1)+:1];
			     end
			     else begin
				 col_rd_ram_b_dob_ltmp[15:8] = mem[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_32+1]][((col_rd_ram_b_addrb_tmp[r_addrb_bit_32:5] * 32) + 8) +: 8];
				 col_rd_ram_b_dopb_ltmp[1:1] = memp[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_32+1]][((col_rd_ram_b_addrb_tmp[r_addrb_bit_32:5] * 4) + 1) +: 1];
			     end
			     task_x_buf (wr_mode_b, 15, 8, 1, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end
		    

		         if ((col_rd_ram_b_web_tmp[2] === 1'b1 && col_rd_ram_b_wea_tmp[2] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[2] === 1'b1 && col_rd_ram_b_web_tmp[2] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[2] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[2] !== 1'b1)) begin		    
			     if (rb_width >= width) begin
				 col_rd_ram_b_dob_ltmp[23:16] = mem[col_rd_ram_b_addrb_tmp[14:5]][23:16];
				 col_rd_ram_b_dopb_ltmp[2:2] = memp[col_rd_ram_b_addrb_tmp[14:5]][(index+2)+:1];
			     end
			     else begin
				 col_rd_ram_b_dob_ltmp[23:16] = mem[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_32+1]][((col_rd_ram_b_addrb_tmp[r_addrb_bit_32:5] * 32) + 16) +: 8];
				 col_rd_ram_b_dopb_ltmp[2:2] = memp[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_32+1]][((col_rd_ram_b_addrb_tmp[r_addrb_bit_32:5] * 4) + 2) +: 1];
			     end
			     task_x_buf (wr_mode_b, 23, 16, 2, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end
		    
		    
		         if ((col_rd_ram_b_web_tmp[3] === 1'b1 && col_rd_ram_b_wea_tmp[3] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[3] === 1'b1 && col_rd_ram_b_web_tmp[3] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[3] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[3] !== 1'b1)) begin		    
			     if (rb_width >= width) begin
				 col_rd_ram_b_dob_ltmp[31:24] = mem[col_rd_ram_b_addrb_tmp[14:5]][31:24];
				 col_rd_ram_b_dopb_ltmp[3:3] = memp[col_rd_ram_b_addrb_tmp[14:5]][(index+3)+:1];
			     end
			     else begin
				 col_rd_ram_b_dob_ltmp[31:24] = mem[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_32+1]][((col_rd_ram_b_addrb_tmp[r_addrb_bit_32:5] * 32) + 24) +: 8];
				 col_rd_ram_b_dopb_ltmp[3:3] = memp[col_rd_ram_b_addrb_tmp[14:r_addrb_bit_32+1]][((col_rd_ram_b_addrb_tmp[r_addrb_bit_32:5] * 4) + 3) +: 1];
			     end
			     task_x_buf (wr_mode_b, 31, 24, 3, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);		    
			 end
		     end
		64 : begin

		         if ((col_rd_ram_b_web_tmp[0] === 1'b1 && col_rd_ram_b_wea_tmp[0] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[0] === 1'b1 && col_rd_ram_b_web_tmp[0] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[0] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[0] !== 1'b1)) begin
			     col_rd_ram_b_dob_ltmp[7:0] = mem[col_rd_ram_b_addrb_tmp[14:6]][7:0];
			     col_rd_ram_b_dopb_ltmp[0:0] = memp[col_rd_ram_b_addrb_tmp[14:6]][(index)+:1];
			     task_x_buf (wr_mode_b, 7, 0, 0, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end
			     
			 if ((col_rd_ram_b_web_tmp[1] === 1'b1 && col_rd_ram_b_wea_tmp[1] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[1] === 1'b1 && col_rd_ram_b_web_tmp[1] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[1] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[1] !== 1'b1)) begin		    
			     col_rd_ram_b_dob_ltmp[15:8] = mem[col_rd_ram_b_addrb_tmp[14:6]][15:8];
			     col_rd_ram_b_dopb_ltmp[1:1] = memp[col_rd_ram_b_addrb_tmp[14:6]][(index+1)+:1];
			     task_x_buf (wr_mode_b, 15, 8, 1, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end
		    
			 if ((col_rd_ram_b_web_tmp[2] === 1'b1 && col_rd_ram_b_wea_tmp[2] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[2] === 1'b1 && col_rd_ram_b_web_tmp[2] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[2] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[2] !== 1'b1)) begin		    
			     col_rd_ram_b_dob_ltmp[23:16] = mem[col_rd_ram_b_addrb_tmp[14:6]][23:16];
			     col_rd_ram_b_dopb_ltmp[2:2] = memp[col_rd_ram_b_addrb_tmp[14:6]][(index+2)+:1];
			     task_x_buf (wr_mode_b, 23, 16, 2, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end
		    
			 if ((col_rd_ram_b_web_tmp[3] === 1'b1 && col_rd_ram_b_wea_tmp[3] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[3] === 1'b1 && col_rd_ram_b_web_tmp[3] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[3] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[3] !== 1'b1)) begin		    
			     col_rd_ram_b_dob_ltmp[31:24] = mem[col_rd_ram_b_addrb_tmp[14:6]][31:24];
			     col_rd_ram_b_dopb_ltmp[3:3] = memp[col_rd_ram_b_addrb_tmp[14:6]][(index+3)+:1];
			     task_x_buf (wr_mode_b, 31, 24, 3, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end

			 if ((col_rd_ram_b_web_tmp[4] === 1'b1 && col_rd_ram_b_wea_tmp[4] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[4] === 1'b1 && col_rd_ram_b_web_tmp[4] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[4] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[4] !== 1'b1)) begin		    
			     col_rd_ram_b_dob_ltmp[39:32] = mem[col_rd_ram_b_addrb_tmp[14:6]][39:32];
			     col_rd_ram_b_dopb_ltmp[4:4] = memp[col_rd_ram_b_addrb_tmp[14:6]][(index+4)+:1];
			     task_x_buf (wr_mode_b, 39, 32, 4, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end
			     
			 if ((col_rd_ram_b_web_tmp[5] === 1'b1 && col_rd_ram_b_wea_tmp[5] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[5] === 1'b1 && col_rd_ram_b_web_tmp[5] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[5] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[5] !== 1'b1)) begin		    
			     col_rd_ram_b_dob_ltmp[47:40] = mem[col_rd_ram_b_addrb_tmp[14:6]][47:40];
			     col_rd_ram_b_dopb_ltmp[5:5] = memp[col_rd_ram_b_addrb_tmp[14:6]][(index+5)+:1];
			     task_x_buf (wr_mode_b, 47, 40, 5, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end
		    
			 if ((col_rd_ram_b_web_tmp[6] === 1'b1 && col_rd_ram_b_wea_tmp[6] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[6] === 1'b1 && col_rd_ram_b_web_tmp[6] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[6] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[6] !== 1'b1)) begin		    
			     col_rd_ram_b_dob_ltmp[55:48] = mem[col_rd_ram_b_addrb_tmp[14:6]][55:48];
			     col_rd_ram_b_dopb_ltmp[6:6] = memp[col_rd_ram_b_addrb_tmp[14:6]][(index+6)+:1];
			     task_x_buf (wr_mode_b, 55, 48, 6, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end
		    
			 if ((col_rd_ram_b_web_tmp[7] === 1'b1 && col_rd_ram_b_wea_tmp[7] === 1'b1) || (col_rd_ram_b_seq == 2'b01 && col_rd_ram_b_wea_tmp[7] === 1'b1 && col_rd_ram_b_web_tmp[7] === 1'b0 && viol_type == 2'b11) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b != 2'b01 && wr_mode_a != 2'b01) || (col_rd_ram_b_seq == 2'b01 && wr_mode_b == 2'b01 && wr_mode_a != 2'b01 && col_rd_ram_b_wea_tmp[7] === 1'b1) || (col_rd_ram_b_seq == 2'b11 && wr_mode_b == 2'b00 && col_rd_ram_b_wea_tmp[7] !== 1'b1)) begin		    
			     col_rd_ram_b_dob_ltmp[63:56] = mem[col_rd_ram_b_addrb_tmp[14:6]][63:56];
			     col_rd_ram_b_dopb_ltmp[7:7] = memp[col_rd_ram_b_addrb_tmp[14:6]][(index+7)+:1];
			     task_x_buf (wr_mode_b, 63, 56, 7, col_rd_ram_b_dob_ltmp, col_rd_ram_b_dob_tmp, col_rd_ram_b_dopb_ltmp, col_rd_ram_b_dopb_tmp);
			 end

		     end
	    endcase // case(rb_width)
	end
    endtask // task_col_rd_ram_b


    task task_rd_ram_a;

	input [15:0] rd_ram_a_addra_tmp;
	inout [63:0] doa_tmp;
	inout [7:0] dopa_tmp;

	begin

	    case (ra_width)
		1, 2, 4 : begin
		              if (ra_width >= width)
				  doa_tmp = mem[rd_ram_a_addra_tmp[14:r_addra_lbit_124]];

			      else
				  doa_tmp = mem[rd_ram_a_addra_tmp[14:r_addra_bit_124+1]][(rd_ram_a_addra_tmp[r_addra_bit_124:r_addra_lbit_124] * ra_width) +: ra_width];
		          end
		8 : begin
		        if (ra_width >= width) begin
			    doa_tmp = mem[rd_ram_a_addra_tmp[14:3]];
			    dopa_tmp =  memp[rd_ram_a_addra_tmp[14:3]];
			end
			else begin
			    doa_tmp = mem[rd_ram_a_addra_tmp[14:r_addra_bit_8+1]][(rd_ram_a_addra_tmp[r_addra_bit_8:3] * 8) +: 8];
			    dopa_tmp = memp[rd_ram_a_addra_tmp[14:r_addra_bit_8+1]][(rd_ram_a_addra_tmp[r_addra_bit_8:3] * 1) +: 1];
			end
		    end
		16 : begin
		         if (ra_width >= width) begin
			     doa_tmp = mem[rd_ram_a_addra_tmp[14:4]];
			     dopa_tmp = memp[rd_ram_a_addra_tmp[14:4]];
			 end 
			 else begin
			     doa_tmp = mem[rd_ram_a_addra_tmp[14:r_addra_bit_16+1]][(rd_ram_a_addra_tmp[r_addra_bit_16:4] * 16) +: 16];
			     dopa_tmp = memp[rd_ram_a_addra_tmp[14:r_addra_bit_16+1]][(rd_ram_a_addra_tmp[r_addra_bit_16:4] * 2) +: 2];
			 end
		     end
		32 : begin
		         if (ra_width >= width) begin
			     doa_tmp = mem[rd_ram_a_addra_tmp[14:5]];
			     dopa_tmp = memp[rd_ram_a_addra_tmp[14:5]];
			 end 
			 else begin
			     doa_tmp = mem[rd_ram_a_addra_tmp[14:r_addra_bit_32+1]][(rd_ram_a_addra_tmp[r_addra_bit_32:5] * 32) +: 32];
			     dopa_tmp = memp[rd_ram_a_addra_tmp[14:r_addra_bit_32+1]][(rd_ram_a_addra_tmp[r_addra_bit_32:5] * 4) +: 4];
			 end
		     end
		64 : begin
		         if (ra_width >= width) begin
			     doa_tmp = mem[rd_ram_a_addra_tmp[14:6]];
			     dopa_tmp = memp[rd_ram_a_addra_tmp[14:6]];
			 end 
		     end				 
	    endcase // case(ra_width)

	end
    endtask // task_rd_ram_a
    

    task task_rd_ram_b;

	input [15:0] rd_ram_b_addrb_tmp;
	inout [31:0] dob_tmp;
	inout [3:0] dopb_tmp;

	begin
	    
	    case (rb_width)
		1, 2, 4 : begin
		              if (rb_width >= width)
				  dob_tmp = mem[rd_ram_b_addrb_tmp[14:r_addrb_lbit_124]];
			      else
				  dob_tmp = mem[rd_ram_b_addrb_tmp[14:r_addrb_bit_124+1]][(rd_ram_b_addrb_tmp[r_addrb_bit_124:r_addrb_lbit_124] * rb_width) +: rb_width];
               	          end
		8 : begin
		        if (rb_width >= width) begin
			    dob_tmp = mem[rd_ram_b_addrb_tmp[14:3]];
			    dopb_tmp =  memp[rd_ram_b_addrb_tmp[14:3]];
			end
			else begin
			    dob_tmp = mem[rd_ram_b_addrb_tmp[14:r_addrb_bit_8+1]][(rd_ram_b_addrb_tmp[r_addrb_bit_8:3] * 8) +: 8];
			    dopb_tmp = memp[rd_ram_b_addrb_tmp[14:r_addrb_bit_8+1]][(rd_ram_b_addrb_tmp[r_addrb_bit_8:3] * 1) +: 1];
			end
		    end
		16 : begin
		         if (rb_width >= width) begin
			     dob_tmp = mem[rd_ram_b_addrb_tmp[14:4]];
			     dopb_tmp = memp[rd_ram_b_addrb_tmp[14:4]];
			 end 
			 else begin
			     dob_tmp = mem[rd_ram_b_addrb_tmp[14:r_addrb_bit_16+1]][(rd_ram_b_addrb_tmp[r_addrb_bit_16:4] * 16) +: 16];
			     dopb_tmp = memp[rd_ram_b_addrb_tmp[14:r_addrb_bit_16+1]][(rd_ram_b_addrb_tmp[r_addrb_bit_16:4] * 2) +: 2];
			 end
		      end
		32 : begin
		         dob_tmp = mem[rd_ram_b_addrb_tmp[14:5]];
		         dopb_tmp = memp[rd_ram_b_addrb_tmp[14:5]];
		     end
		64 : begin
		     if (rb_width >= width) begin
			     dob_tmp = mem[rd_ram_b_addrb_tmp[14:6]];
			     dopb_tmp = memp[rd_ram_b_addrb_tmp[14:6]];
			 end 
		     end
	    endcase
	end
    endtask // task_rd_ram_b    


    task chk_for_col_msg;

	input wea_tmp;
	input web_tmp;
	input [15:0] addra_tmp;
	input [15:0] addrb_tmp;
	
	begin

	    if (SIM_COLLISION_CHECK == "ALL" || SIM_COLLISION_CHECK == "WARNING_ONLY")
		
		if (wea_tmp === 1'b1 && web_tmp === 1'b1 && col_wr_wr_msg == 1) begin

		    if (chk_ox_msg == 1) begin

			if (!(rdaddr_collision_hwconfig_int == 0 && chk_ox_same_clk == 1))
			    $display("Address Overlap Error on RAMB36E1 : %m at simulation time %.3f ns.\nA write was requested to the overlapped address simultaneously at both port A and port B of the RAM. The contents written to the RAM at address location %h (hex) of port A and address location %h (hex) of port B are unknown.", $time/1000.0, addra_tmp, addrb_tmp);

			
		    end
		    else
			$display("Memory Collision Error on RAMB36E1 : %m at simulation time %.3f ns.\nA write was requested to the same address simultaneously at both port A and port B of the RAM. The contents written to the RAM at address location %h (hex) of port A and address location %h (hex) of port B are unknown.", $time/1000.0, addra_tmp, addrb_tmp);
		    
		    col_wr_wr_msg = 0;

		end // if (wea_tmp === 1'b1 && web_tmp === 1'b1 && col_wr_wr_msg == 1)
		else if (wea_tmp === 1'b1 && web_tmp === 1'b0 && col_wra_rdb_msg == 1) begin

		    if (chk_ox_msg == 1) begin
			
			if (!(rdaddr_collision_hwconfig_int == 0 && chk_ox_same_clk == 1))
			    $display("Address Overlap Error on RAMB36E1 : %m at simulation time %.3f ns.\nA read was performed on address %h (hex) of port B while a write was requested to the overlapped address %h (hex) of port A.  The write will be unsuccessful and the contents of the RAM at both address locations of port A and B became unknown.", $time/1000.0, addrb_tmp, addra_tmp);	
			
		    end
		    else begin
			
			if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (!(chk_col_same_clk == 1 && rdaddr_collision_hwconfig_int == 0) && SIM_DEVICE == "VIRTEX6"))
  			    $display("Memory Collision Error on RAMB36E1 : %m at simulation time %.3f ns.\nA read was performed on address %h (hex) of port B while a write was requested to the same address on port A.  The write will be unsuccessful and the contents of the RAM at both address locations of port A and B became unknown.", $time/1000.0, addrb_tmp);
			else if (wr_mode_a != 2'b01 || (viol_type == 2'b11 && wr_mode_a == 2'b01))
			    $display("Memory Collision Error on RAMB36E1 : %m at simulation time %.3f ns.\nA read was performed on address %h (hex) of port B while a write was requested to the same address on port A.  The write will be successful however the read value on port B is unknown until the next CLKB cycle.", $time/1000.0, addrb_tmp);

		    end // else: !if(chk_ox_msg == 1)
		    
		    col_wra_rdb_msg = 0;

		end
		else if (wea_tmp === 1'b0 && web_tmp === 1'b1 && col_wrb_rda_msg == 1) begin

		    if (chk_ox_msg == 1) begin
				
			if (!(rdaddr_collision_hwconfig_int == 0 && chk_ox_same_clk == 1))
			    $display("Address Overlap Error on RAMB36E1 : %m at simulation time %.3f ns.\nA read was performed on address %h (hex) of port A while a write was requested to the overlapped address %h (hex) of port B.  The write will be unsuccessful and the contents of the RAM at both address locations of port A and B became unknown.", $time/1000.0, addra_tmp, addrb_tmp);

		    end
		    else begin
			
			if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (!(chk_col_same_clk == 1 && rdaddr_collision_hwconfig_int == 0) && SIM_DEVICE == "VIRTEX6"))
  			    $display("Memory Collision Error on RAMB36E1 : %m at simulation time %.3f ns.\nA read was performed on address %h (hex) of port A while a write was requested to the same address on port B.  The write will be unsuccessful and the contents of the RAM at both address locations of port A and B became unknown.", $time/1000.0, addrb_tmp);
			else if (wr_mode_b != 2'b01 || (viol_type == 2'b10 && wr_mode_b == 2'b01))
		    	    $display("Memory Collision Error on RAMB36E1 : %m at simulation time %.3f ns.\nA read was performed on address %h (hex) of port A while a write was requested to the same address on port B.  The write will be successful however the read value on port A is unknown until the next CLKA cycle.", $time/1000.0, addra_tmp);
			
		    end // else: !if(chk_ox_msg == 1)
			
		    col_wrb_rda_msg = 0;

		end // if (wea_tmp === 1'b0 && web_tmp === 1'b1 && col_wrb_rda_msg == 1)
	    
	end

    endtask // chk_for_col_msg


    task task_col_ecc_read;

    inout [63:0] do_tmp;
    inout [7:0] dop_tmp;
    input [15:0] addr_tmp;
	
    reg [71:0] task_ecc_bit_position;
    reg [7:0] task_dopr_ecc, task_syndrome;
    reg [63:0] task_di_in_ecc_corrected;
    reg [7:0] task_dip_in_ecc_corrected;
    
    begin

	if (|do_tmp === 1'bx) begin // if there is collision
	    dbiterr_out <= 1'bx;
	    sbiterr_out <= 1'bx;
	end
	else begin
	    
	    task_dopr_ecc = fn_dip_ecc(1'b0, do_tmp, dop_tmp);
	    
	    task_syndrome = task_dopr_ecc ^ dop_tmp;
	    
	    if (task_syndrome !== 0) begin
		
		if (task_syndrome[7]) begin  // dectect single bit error
		    
		    task_ecc_bit_position = {do_tmp[63:57], dop_tmp[6], do_tmp[56:26], dop_tmp[5], do_tmp[25:11], dop_tmp[4], do_tmp[10:4], dop_tmp[3], do_tmp[3:1], dop_tmp[2], do_tmp[0], dop_tmp[1:0], dop_tmp[7]};
		    
		    
		    if (task_syndrome[6:0] > 71) begin
			$display ("DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code.");
			$finish;
		    end
		    
		    task_ecc_bit_position[task_syndrome[6:0]] = ~task_ecc_bit_position[task_syndrome[6:0]]; // correct single bit error in the output 
		    
		    task_di_in_ecc_corrected = {task_ecc_bit_position[71:65], task_ecc_bit_position[63:33], task_ecc_bit_position[31:17], task_ecc_bit_position[15:9], task_ecc_bit_position[7:5], task_ecc_bit_position[3]}; // correct single bit error in the memory
		    
		    do_tmp = task_di_in_ecc_corrected;
		    
		    task_dip_in_ecc_corrected = {task_ecc_bit_position[0], task_ecc_bit_position[64], task_ecc_bit_position[32], task_ecc_bit_position[16], task_ecc_bit_position[8], task_ecc_bit_position[4], task_ecc_bit_position[2:1]}; // correct single bit error in the parity memory
		    
		    dop_tmp = task_dip_in_ecc_corrected;
		    
		    dbiterr_out <= 0;
		    sbiterr_out <= 1;
		    
		end
		else if (!task_syndrome[7]) begin  // double bit error
		    sbiterr_out <= 0;
		    dbiterr_out <= 1;
		    
		end
	    end // if (task_syndrome !== 0)
	    else begin
		dbiterr_out <= 0;
		sbiterr_out <= 0;
		
	    end // else: !if(task_syndrome !== 0)
	  
	end
  
    end
	
    endtask // task_col_ecc_read
    
    
    function [7:0] fn_dip_ecc;

	input encode;
	input [63:0] di_in;
	input [7:0] dip_in;

	begin

	    fn_dip_ecc[0] = di_in[0]^di_in[1]^di_in[3]^di_in[4]^di_in[6]^di_in[8]
		     ^di_in[10]^di_in[11]^di_in[13]^di_in[15]^di_in[17]^di_in[19]
		     ^di_in[21]^di_in[23]^di_in[25]^di_in[26]^di_in[28]
            	     ^di_in[30]^di_in[32]^di_in[34]^di_in[36]^di_in[38]
		     ^di_in[40]^di_in[42]^di_in[44]^di_in[46]^di_in[48]
		     ^di_in[50]^di_in[52]^di_in[54]^di_in[56]^di_in[57]^di_in[59]
		     ^di_in[61]^di_in[63];

	    fn_dip_ecc[1] = di_in[0]^di_in[2]^di_in[3]^di_in[5]^di_in[6]^di_in[9]
                     ^di_in[10]^di_in[12]^di_in[13]^di_in[16]^di_in[17]
                     ^di_in[20]^di_in[21]^di_in[24]^di_in[25]^di_in[27]^di_in[28]
                     ^di_in[31]^di_in[32]^di_in[35]^di_in[36]^di_in[39]
                     ^di_in[40]^di_in[43]^di_in[44]^di_in[47]^di_in[48]
                     ^di_in[51]^di_in[52]^di_in[55]^di_in[56]^di_in[58]^di_in[59]
                     ^di_in[62]^di_in[63];

	    fn_dip_ecc[2] = di_in[1]^di_in[2]^di_in[3]^di_in[7]^di_in[8]^di_in[9]
                     ^di_in[10]^di_in[14]^di_in[15]^di_in[16]^di_in[17]
                     ^di_in[22]^di_in[23]^di_in[24]^di_in[25]^di_in[29]
                     ^di_in[30]^di_in[31]^di_in[32]^di_in[37]^di_in[38]^di_in[39]
                     ^di_in[40]^di_in[45]^di_in[46]^di_in[47]^di_in[48]
                     ^di_in[53]^di_in[54]^di_in[55]^di_in[56]
                     ^di_in[60]^di_in[61]^di_in[62]^di_in[63];
	
	    fn_dip_ecc[3] = di_in[4]^di_in[5]^di_in[6]^di_in[7]^di_in[8]^di_in[9]
		     ^di_in[10]^di_in[18]^di_in[19]
                     ^di_in[20]^di_in[21]^di_in[22]^di_in[23]^di_in[24]^di_in[25]
                     ^di_in[33]^di_in[34]^di_in[35]^di_in[36]^di_in[37]^di_in[38]^di_in[39]
                     ^di_in[40]^di_in[49]
                     ^di_in[50]^di_in[51]^di_in[52]^di_in[53]^di_in[54]^di_in[55]^di_in[56];

	    fn_dip_ecc[4] = di_in[11]^di_in[12]^di_in[13]^di_in[14]^di_in[15]^di_in[16]^di_in[17]^di_in[18]^di_in[19]
                     ^di_in[20]^di_in[21]^di_in[22]^di_in[23]^di_in[24]^di_in[25]
                     ^di_in[41]^di_in[42]^di_in[43]^di_in[44]^di_in[45]^di_in[46]^di_in[47]^di_in[48]^di_in[49]
                     ^di_in[50]^di_in[51]^di_in[52]^di_in[53]^di_in[54]^di_in[55]^di_in[56];


	    fn_dip_ecc[5] = di_in[26]^di_in[27]^di_in[28]^di_in[29]
                     ^di_in[30]^di_in[31]^di_in[32]^di_in[33]^di_in[34]^di_in[35]^di_in[36]^di_in[37]^di_in[38]^di_in[39]
                     ^di_in[40]^di_in[41]^di_in[42]^di_in[43]^di_in[44]^di_in[45]^di_in[46]^di_in[47]^di_in[48]^di_in[49]
                     ^di_in[50]^di_in[51]^di_in[52]^di_in[53]^di_in[54]^di_in[55]^di_in[56];

	    fn_dip_ecc[6] = di_in[57]^di_in[58]^di_in[59]
                     ^di_in[60]^di_in[61]^di_in[62]^di_in[63];

	    if (encode == 1'b1)
		
		fn_dip_ecc[7] = fn_dip_ecc[0]^fn_dip_ecc[1]^fn_dip_ecc[2]^fn_dip_ecc[3]^fn_dip_ecc[4]^fn_dip_ecc[5]^fn_dip_ecc[6]
                     ^di_in[0]^di_in[1]^di_in[2]^di_in[3]^di_in[4]^di_in[5]^di_in[6]^di_in[7]^di_in[8]^di_in[9]
                     ^di_in[10]^di_in[11]^di_in[12]^di_in[13]^di_in[14]^di_in[15]^di_in[16]^di_in[17]^di_in[18]^di_in[19]
                     ^di_in[20]^di_in[21]^di_in[22]^di_in[23]^di_in[24]^di_in[25]^di_in[26]^di_in[27]^di_in[28]^di_in[29]
                     ^di_in[30]^di_in[31]^di_in[32]^di_in[33]^di_in[34]^di_in[35]^di_in[36]^di_in[37]^di_in[38]^di_in[39]
                     ^di_in[40]^di_in[41]^di_in[42]^di_in[43]^di_in[44]^di_in[45]^di_in[46]^di_in[47]^di_in[48]^di_in[49]
                     ^di_in[50]^di_in[51]^di_in[52]^di_in[53]^di_in[54]^di_in[55]^di_in[56]^di_in[57]^di_in[58]^di_in[59]
                     ^di_in[60]^di_in[61]^di_in[62]^di_in[63];
	    else
		fn_dip_ecc[7] = dip_in[0]^dip_in[1]^dip_in[2]^dip_in[3]^dip_in[4]^dip_in[5]^dip_in[6]
                     ^di_in[0]^di_in[1]^di_in[2]^di_in[3]^di_in[4]^di_in[5]^di_in[6]^di_in[7]^di_in[8]^di_in[9]
                     ^di_in[10]^di_in[11]^di_in[12]^di_in[13]^di_in[14]^di_in[15]^di_in[16]^di_in[17]^di_in[18]^di_in[19]
                     ^di_in[20]^di_in[21]^di_in[22]^di_in[23]^di_in[24]^di_in[25]^di_in[26]^di_in[27]^di_in[28]^di_in[29]
                     ^di_in[30]^di_in[31]^di_in[32]^di_in[33]^di_in[34]^di_in[35]^di_in[36]^di_in[37]^di_in[38]^di_in[39]
                     ^di_in[40]^di_in[41]^di_in[42]^di_in[43]^di_in[44]^di_in[45]^di_in[46]^di_in[47]^di_in[48]^di_in[49]
                     ^di_in[50]^di_in[51]^di_in[52]^di_in[53]^di_in[54]^di_in[55]^di_in[56]^di_in[57]^di_in[58]^di_in[59]
                     ^di_in[60]^di_in[61]^di_in[62]^di_in[63];
	    
	end
	
    endfunction // fn_dip_ecc

/******************************************** END task and function **************************************/    

    
    initial begin

	if (INIT_FILE == "NONE") begin // memory initialization from attributes
	
	    init_mult = 256/width;
	    
	    for (count = 0; count < init_mult; count = count + 1) begin

		init_offset = count * width;
		
		mem[count] = INIT_00[init_offset +:width];
		mem[count + (init_mult * 1)] = INIT_01[init_offset +:width];
		mem[count + (init_mult * 2)] = INIT_02[init_offset +:width];
		mem[count + (init_mult * 3)] = INIT_03[init_offset +:width];
		mem[count + (init_mult * 4)] = INIT_04[init_offset +:width];
		mem[count + (init_mult * 5)] = INIT_05[init_offset +:width];
		mem[count + (init_mult * 6)] = INIT_06[init_offset +:width];
		mem[count + (init_mult * 7)] = INIT_07[init_offset +:width];
		mem[count + (init_mult * 8)] = INIT_08[init_offset +:width];
		mem[count + (init_mult * 9)] = INIT_09[init_offset +:width];
		mem[count + (init_mult * 10)] = INIT_0A[init_offset +:width];
		mem[count + (init_mult * 11)] = INIT_0B[init_offset +:width];
		mem[count + (init_mult * 12)] = INIT_0C[init_offset +:width];
		mem[count + (init_mult * 13)] = INIT_0D[init_offset +:width];
		mem[count + (init_mult * 14)] = INIT_0E[init_offset +:width];
		mem[count + (init_mult * 15)] = INIT_0F[init_offset +:width];
		mem[count + (init_mult * 16)] = INIT_10[init_offset +:width];
		mem[count + (init_mult * 17)] = INIT_11[init_offset +:width];
		mem[count + (init_mult * 18)] = INIT_12[init_offset +:width];
		mem[count + (init_mult * 19)] = INIT_13[init_offset +:width];
		mem[count + (init_mult * 20)] = INIT_14[init_offset +:width];
		mem[count + (init_mult * 21)] = INIT_15[init_offset +:width];
		mem[count + (init_mult * 22)] = INIT_16[init_offset +:width];
		mem[count + (init_mult * 23)] = INIT_17[init_offset +:width];
		mem[count + (init_mult * 24)] = INIT_18[init_offset +:width];
		mem[count + (init_mult * 25)] = INIT_19[init_offset +:width];
		mem[count + (init_mult * 26)] = INIT_1A[init_offset +:width];
		mem[count + (init_mult * 27)] = INIT_1B[init_offset +:width];
		mem[count + (init_mult * 28)] = INIT_1C[init_offset +:width];
		mem[count + (init_mult * 29)] = INIT_1D[init_offset +:width];
		mem[count + (init_mult * 30)] = INIT_1E[init_offset +:width];
		mem[count + (init_mult * 31)] = INIT_1F[init_offset +:width];
		mem[count + (init_mult * 32)] = INIT_20[init_offset +:width];
		mem[count + (init_mult * 33)] = INIT_21[init_offset +:width];
		mem[count + (init_mult * 34)] = INIT_22[init_offset +:width];
		mem[count + (init_mult * 35)] = INIT_23[init_offset +:width];
		mem[count + (init_mult * 36)] = INIT_24[init_offset +:width];
		mem[count + (init_mult * 37)] = INIT_25[init_offset +:width];
		mem[count + (init_mult * 38)] = INIT_26[init_offset +:width];
		mem[count + (init_mult * 39)] = INIT_27[init_offset +:width];
		mem[count + (init_mult * 40)] = INIT_28[init_offset +:width];
		mem[count + (init_mult * 41)] = INIT_29[init_offset +:width];
		mem[count + (init_mult * 42)] = INIT_2A[init_offset +:width];
		mem[count + (init_mult * 43)] = INIT_2B[init_offset +:width];
		mem[count + (init_mult * 44)] = INIT_2C[init_offset +:width];
		mem[count + (init_mult * 45)] = INIT_2D[init_offset +:width];
		mem[count + (init_mult * 46)] = INIT_2E[init_offset +:width];
		mem[count + (init_mult * 47)] = INIT_2F[init_offset +:width];
		mem[count + (init_mult * 48)] = INIT_30[init_offset +:width];
		mem[count + (init_mult * 49)] = INIT_31[init_offset +:width];
		mem[count + (init_mult * 50)] = INIT_32[init_offset +:width];
		mem[count + (init_mult * 51)] = INIT_33[init_offset +:width];
		mem[count + (init_mult * 52)] = INIT_34[init_offset +:width];
		mem[count + (init_mult * 53)] = INIT_35[init_offset +:width];
		mem[count + (init_mult * 54)] = INIT_36[init_offset +:width];
		mem[count + (init_mult * 55)] = INIT_37[init_offset +:width];
		mem[count + (init_mult * 56)] = INIT_38[init_offset +:width];
		mem[count + (init_mult * 57)] = INIT_39[init_offset +:width];
		mem[count + (init_mult * 58)] = INIT_3A[init_offset +:width];
		mem[count + (init_mult * 59)] = INIT_3B[init_offset +:width];
		mem[count + (init_mult * 60)] = INIT_3C[init_offset +:width];
		mem[count + (init_mult * 61)] = INIT_3D[init_offset +:width];
		mem[count + (init_mult * 62)] = INIT_3E[init_offset +:width];
		mem[count + (init_mult * 63)] = INIT_3F[init_offset +:width];

		if (BRAM_SIZE == 36) begin
		    mem[count + (init_mult * 64)] = INIT_40[init_offset +:width];
		    mem[count + (init_mult * 65)] = INIT_41[init_offset +:width];
		    mem[count + (init_mult * 66)] = INIT_42[init_offset +:width];
		    mem[count + (init_mult * 67)] = INIT_43[init_offset +:width];
		    mem[count + (init_mult * 68)] = INIT_44[init_offset +:width];
		    mem[count + (init_mult * 69)] = INIT_45[init_offset +:width];
		    mem[count + (init_mult * 70)] = INIT_46[init_offset +:width];
		    mem[count + (init_mult * 71)] = INIT_47[init_offset +:width];
		    mem[count + (init_mult * 72)] = INIT_48[init_offset +:width];
		    mem[count + (init_mult * 73)] = INIT_49[init_offset +:width];
		    mem[count + (init_mult * 74)] = INIT_4A[init_offset +:width];
		    mem[count + (init_mult * 75)] = INIT_4B[init_offset +:width];
		    mem[count + (init_mult * 76)] = INIT_4C[init_offset +:width];
		    mem[count + (init_mult * 77)] = INIT_4D[init_offset +:width];
		    mem[count + (init_mult * 78)] = INIT_4E[init_offset +:width];
		    mem[count + (init_mult * 79)] = INIT_4F[init_offset +:width];
		    mem[count + (init_mult * 80)] = INIT_50[init_offset +:width];
		    mem[count + (init_mult * 81)] = INIT_51[init_offset +:width];
		    mem[count + (init_mult * 82)] = INIT_52[init_offset +:width];
		    mem[count + (init_mult * 83)] = INIT_53[init_offset +:width];
		    mem[count + (init_mult * 84)] = INIT_54[init_offset +:width];
		    mem[count + (init_mult * 85)] = INIT_55[init_offset +:width];
		    mem[count + (init_mult * 86)] = INIT_56[init_offset +:width];
		    mem[count + (init_mult * 87)] = INIT_57[init_offset +:width];
		    mem[count + (init_mult * 88)] = INIT_58[init_offset +:width];
		    mem[count + (init_mult * 89)] = INIT_59[init_offset +:width];
		    mem[count + (init_mult * 90)] = INIT_5A[init_offset +:width];
		    mem[count + (init_mult * 91)] = INIT_5B[init_offset +:width];
		    mem[count + (init_mult * 92)] = INIT_5C[init_offset +:width];
		    mem[count + (init_mult * 93)] = INIT_5D[init_offset +:width];
		    mem[count + (init_mult * 94)] = INIT_5E[init_offset +:width];
		    mem[count + (init_mult * 95)] = INIT_5F[init_offset +:width];
		    mem[count + (init_mult * 96)] = INIT_60[init_offset +:width];
		    mem[count + (init_mult * 97)] = INIT_61[init_offset +:width];
		    mem[count + (init_mult * 98)] = INIT_62[init_offset +:width];
		    mem[count + (init_mult * 99)] = INIT_63[init_offset +:width];
		    mem[count + (init_mult * 100)] = INIT_64[init_offset +:width];
		    mem[count + (init_mult * 101)] = INIT_65[init_offset +:width];
		    mem[count + (init_mult * 102)] = INIT_66[init_offset +:width];
		    mem[count + (init_mult * 103)] = INIT_67[init_offset +:width];
		    mem[count + (init_mult * 104)] = INIT_68[init_offset +:width];
		    mem[count + (init_mult * 105)] = INIT_69[init_offset +:width];
		    mem[count + (init_mult * 106)] = INIT_6A[init_offset +:width];
		    mem[count + (init_mult * 107)] = INIT_6B[init_offset +:width];
		    mem[count + (init_mult * 108)] = INIT_6C[init_offset +:width];
		    mem[count + (init_mult * 109)] = INIT_6D[init_offset +:width];
		    mem[count + (init_mult * 110)] = INIT_6E[init_offset +:width];
		    mem[count + (init_mult * 111)] = INIT_6F[init_offset +:width];
		    mem[count + (init_mult * 112)] = INIT_70[init_offset +:width];
		    mem[count + (init_mult * 113)] = INIT_71[init_offset +:width];
		    mem[count + (init_mult * 114)] = INIT_72[init_offset +:width];
		    mem[count + (init_mult * 115)] = INIT_73[init_offset +:width];
		    mem[count + (init_mult * 116)] = INIT_74[init_offset +:width];
		    mem[count + (init_mult * 117)] = INIT_75[init_offset +:width];
		    mem[count + (init_mult * 118)] = INIT_76[init_offset +:width];
		    mem[count + (init_mult * 119)] = INIT_77[init_offset +:width];
		    mem[count + (init_mult * 120)] = INIT_78[init_offset +:width];
		    mem[count + (init_mult * 121)] = INIT_79[init_offset +:width];
		    mem[count + (init_mult * 122)] = INIT_7A[init_offset +:width];
		    mem[count + (init_mult * 123)] = INIT_7B[init_offset +:width];
		    mem[count + (init_mult * 124)] = INIT_7C[init_offset +:width];
		    mem[count + (init_mult * 125)] = INIT_7D[init_offset +:width];
		    mem[count + (init_mult * 126)] = INIT_7E[init_offset +:width];
		    mem[count + (init_mult * 127)] = INIT_7F[init_offset +:width];
		end // if (BRAM_SIZE == 36)
	    end // for (count = 0; count < init_mult; count = count + 1)
	    
		
	    
	    if (width >= 8) begin
	    	
		initp_mult = 256/widthp;
		
		for (countp = 0; countp < initp_mult; countp = countp + 1) begin

		    initp_offset = countp * widthp;

		    memp[countp]                    = INITP_00[initp_offset +:widthp];
		    memp[countp + (initp_mult * 1)] = INITP_01[initp_offset +:widthp];
		    memp[countp + (initp_mult * 2)] = INITP_02[initp_offset +:widthp];
		    memp[countp + (initp_mult * 3)] = INITP_03[initp_offset +:widthp];
		    memp[countp + (initp_mult * 4)] = INITP_04[initp_offset +:widthp];
		    memp[countp + (initp_mult * 5)] = INITP_05[initp_offset +:widthp];
		    memp[countp + (initp_mult * 6)] = INITP_06[initp_offset +:widthp];
		    memp[countp + (initp_mult * 7)] = INITP_07[initp_offset +:widthp];
		    
		    if (BRAM_SIZE == 36) begin
			memp[countp + (initp_mult * 8)] = INITP_08[initp_offset +:widthp];
			memp[countp + (initp_mult * 9)] = INITP_09[initp_offset +:widthp];
			memp[countp + (initp_mult * 10)] = INITP_0A[initp_offset +:widthp];
			memp[countp + (initp_mult * 11)] = INITP_0B[initp_offset +:widthp];
			memp[countp + (initp_mult * 12)] = INITP_0C[initp_offset +:widthp];
			memp[countp + (initp_mult * 13)] = INITP_0D[initp_offset +:widthp];
			memp[countp + (initp_mult * 14)] = INITP_0E[initp_offset +:widthp];
			memp[countp + (initp_mult * 15)] = INITP_0F[initp_offset +:widthp];
		    end
		end // for (countp = 0; countp < initp_mult; countp = countp + 1)
	    end // if (width >= 8)
	    
	end // if (INIT_FILE == "NONE")
	
	else begin // memory initialization from memory file

	    for (j = 0; j < mem_depth; j = j + 1) begin
		for (j1 = 0; j1 < widest_width; j1 = j1 + 1) begin
		    tmp_mem[j][j1] = 1'b0;
		end
	    end
	    
	    $readmemh (INIT_FILE, tmp_mem);

	    case (widest_width)

		1, 2, 4 : for (i_mem = 0; i_mem <= mem_depth; i_mem = i_mem + 1)
		              mem[i_mem] = tmp_mem [i_mem];
		
		9 : for (i_mem = 0; i_mem <= mem_depth; i_mem = i_mem + 1) begin
		        mem[i_mem] = tmp_mem[i_mem][0 +: 8];
		        memp[i_mem] = tmp_mem[i_mem][8 +: 1];
	            end

		18 : for (i_mem = 0; i_mem <= mem_depth; i_mem = i_mem + 1) begin
		         mem[i_mem] = tmp_mem[i_mem][0 +: 16];
		         memp[i_mem] = tmp_mem[i_mem][16 +: 2];
	             end
	    
		36 : for (i_mem = 0; i_mem <= mem_depth; i_mem = i_mem + 1) begin
		         mem[i_mem] = tmp_mem[i_mem][0 +: 32];
		         memp[i_mem] = tmp_mem[i_mem][32 +: 4];
	             end

		72 : for (i_mem = 0; i_mem <= mem_depth; i_mem = i_mem + 1) begin
		         mem[i_mem] = tmp_mem[i_mem][0 +: 64];
		         memp[i_mem] = tmp_mem[i_mem][64 +: 8];
	             end

	    endcase // case(widest_width)
	    
	end // else: !if(INIT_FILE == "NONE")


	case (EN_ECC_WRITE)
	    "TRUE"  : en_ecc_write_int = 1;
	    "FALSE" : en_ecc_write_int = 0;
	    default : begin
	       	          $display("Attribute Syntax Error : The attribute EN_ECC_WRITE on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", EN_ECC_WRITE);
		          finish_error = 1;
		      end
	endcase

	
	case (EN_ECC_READ)
	    "TRUE"  : en_ecc_read_int = 1;
	    "FALSE" : en_ecc_read_int = 0;
	    default : begin
	       	          $display("Attribute Syntax Error : The attribute EN_ECC_READ on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", EN_ECC_READ);
		          finish_error = 1;
		      end
	endcase

	
	case (RAM_MODE)
	    "TDP" : begin
		        ram_mode_int = 1;

		        if (en_ecc_write_int == 1) begin
			    $display("DRC Error : The attribute EN_ECC_WRITE on RAMB36E1 instance %m is set to %s which requires RAM_MODE = SDP.", EN_ECC_WRITE);
			    finish_error = 1;
			end

		        if (en_ecc_read_int == 1) begin
			    $display("DRC Error : The attribute EN_ECC_READ on RAMB36E1 instance %m is set to %s which requires RAM_MODE = SDP.", EN_ECC_READ);
			    finish_error = 1;
			end

	    end // case: "TDP"
	    "SDP" : begin
		        ram_mode_int = 0;

		        if ((WRITE_MODE_A != WRITE_MODE_B) || WRITE_MODE_A == "NO_CHANGE" || WRITE_MODE_B == "NO_CHANGE") begin
		    
			    $display("DRC Error : Both attributes WRITE_MODE_A and WRITE_MODE_B must be set to READ_FIRST or both attributes must be set to WRITE_FIRST when RAM_MODE = SDP on RAMB36E1 instance %m.");

			    finish_error = 1;

			end
		
		
		        if (BRAM_SIZE == 18) begin
			    if (!(WRITE_WIDTH_B == 36 || READ_WIDTH_A == 36)) begin

				$display("DRC Error : One of the attribute WRITE_WIDTH_B or READ_WIDTH_A must set to 36 when RAM_MODE = SDP.");
				
				finish_error = 1;
			    end
			end
			else begin
				
		            if (!(WRITE_WIDTH_B == 72 || READ_WIDTH_A == 72)) begin
				$display("DRC Error : One of the attribute WRITE_WIDTH_B or READ_WIDTH_A must set to 72 when RAM_MODE = SDP.");
				finish_error = 1;
			    end
			end // else: !if(BRAM_SIZE == 18)

	    end // case: "SDP"
	    default : begin
	       	          $display("Attribute Syntax Error : The attribute RAM_MODE on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are TDP or SDP.", RAM_MODE);
		          finish_error = 1;
	              end
	endcase

	
	case (WRITE_WIDTH_A)

	    0, 1, 2, 4, 9, 18 : ;
	    36 : begin 
		     if (BRAM_SIZE == 18 && ram_mode_int == 1) begin
			 $display("Attribute Syntax Error : The attribute WRITE_WIDTH_A on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", WRITE_WIDTH_A);
			 finish_error = 1;
		     end
		 end
	    72 : begin
		     if (BRAM_SIZE == 18) begin
			 $display("Attribute Syntax Error : The attribute WRITE_WIDTH_A on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", WRITE_WIDTH_A);
			 finish_error = 1;
		     end
		     else if (BRAM_SIZE == 36 && ram_mode_int == 1) begin
			 $display("Attribute Syntax Error : The attribute WRITE_WIDTH_A on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9, 18 or 36.", WRITE_WIDTH_A);
			 finish_error = 1;
		     end
	         end
	    default : begin
		          if (BRAM_SIZE == 18 && ram_mode_int == 1) begin
			      $display("Attribute Syntax Error : The attribute WRITE_WIDTH_A on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", WRITE_WIDTH_A);
			      finish_error = 1;
			  end
			  else if (BRAM_SIZE == 36 || (BRAM_SIZE == 18 && ram_mode_int == 0)) begin
			      $display("Attribute Syntax Error : The attribute WRITE_WIDTH_A on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9, 18 or 36.", WRITE_WIDTH_A);
			      finish_error = 1;
			  end
	               end

	endcase // case(WRITE_WIDTH_A)


    	case (WRITE_WIDTH_B)

	    0, 1, 2, 4, 9, 18 : ;
	    36 : begin 
		     if (BRAM_SIZE == 18 && ram_mode_int == 1) begin
			 $display("Attribute Syntax Error : The attribute WRITE_WIDTH_B on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", WRITE_WIDTH_B);
			 finish_error = 1;
		     end
		 end
	    72 : begin
		     if (BRAM_SIZE == 18) begin
			 $display("Attribute Syntax Error : The attribute WRITE_WIDTH_B on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", WRITE_WIDTH_B);
			 finish_error = 1;
		     end
		     else if (BRAM_SIZE == 36 && ram_mode_int == 1) begin
			 $display("Attribute Syntax Error : The attribute WRITE_WIDTH_B on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9, 18 or 36.", WRITE_WIDTH_B);
			 finish_error = 1;
		     end
	         end
	    default : begin
		          if (BRAM_SIZE == 18 && ram_mode_int == 1) begin
			      $display("Attribute Syntax Error : The attribute WRITE_WIDTH_B on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", WRITE_WIDTH_B);
			      finish_error = 1;
			  end
			  else if (BRAM_SIZE == 36 || (BRAM_SIZE == 18 && ram_mode_int == 0)) begin
			      $display("Attribute Syntax Error : The attribute WRITE_WIDTH_B on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9, 18 or 36.", WRITE_WIDTH_B);
			      finish_error = 1;
			  end
	               end

	endcase // case(WRITE_WIDTH_B)


	case (READ_WIDTH_A)

	    0, 1, 2, 4, 9, 18 : ;
	    36 : begin 
		     if (BRAM_SIZE == 18 && ram_mode_int == 1) begin
			 $display("Attribute Syntax Error : The attribute READ_WIDTH_A on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", READ_WIDTH_A);
			 finish_error = 1;
		     end
		 end
	    72 : begin
		     if (BRAM_SIZE == 18) begin
			 $display("Attribute Syntax Error : The attribute READ_WIDTH_A on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", READ_WIDTH_A);
			 finish_error = 1;
		     end
		     else if (BRAM_SIZE == 36 && ram_mode_int == 1) begin
			 $display("Attribute Syntax Error : The attribute READ_WIDTH_A on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9, 18 or 36.", READ_WIDTH_A);
			 finish_error = 1;
		     end
	         end
	    default : begin
		          if (BRAM_SIZE == 18 && ram_mode_int == 1) begin
			      $display("Attribute Syntax Error : The attribute READ_WIDTH_A on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", READ_WIDTH_A);
			      finish_error = 1;
			  end
			  else if (BRAM_SIZE == 36 || (BRAM_SIZE == 18 && ram_mode_int == 0)) begin
			      $display("Attribute Syntax Error : The attribute READ_WIDTH_A on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9, 18 or 36.", READ_WIDTH_A);
			      finish_error = 1;
			  end
	               end

	endcase // case(READ_WIDTH_A)


    	case (READ_WIDTH_B)

	    0, 1, 2, 4, 9, 18 : ;
	    36 : begin 
		     if (BRAM_SIZE == 18 && ram_mode_int == 1) begin
			 $display("Attribute Syntax Error : The attribute READ_WIDTH_B on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", READ_WIDTH_B);
			 finish_error = 1;
		     end
		 end
	    72 : begin
		     if (BRAM_SIZE == 18) begin
			 $display("Attribute Syntax Error : The attribute READ_WIDTH_B on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", READ_WIDTH_B);
			 finish_error = 1;
		     end
		     else if (BRAM_SIZE == 36 && ram_mode_int == 1) begin
			 $display("Attribute Syntax Error : The attribute READ_WIDTH_B on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9, 18 or 36.", READ_WIDTH_B);
			 finish_error = 1;
		     end
	         end
	    default : begin
		          if (BRAM_SIZE == 18 && ram_mode_int == 1) begin
			      $display("Attribute Syntax Error : The attribute READ_WIDTH_B on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9 or 18.", READ_WIDTH_B);
			      finish_error = 1;
			  end
			  else if (BRAM_SIZE == 36 || (BRAM_SIZE == 18 && ram_mode_int == 0)) begin
			      $display("Attribute Syntax Error : The attribute READ_WIDTH_B on RAMB36E1 instance %m is set to %d.  Legal values for this attribute are 0, 1, 2, 4, 9, 18 or 36.", READ_WIDTH_B);
			      finish_error = 1;
			  end
	               end

	endcase // case(READ_WIDTH_B)

	
	if ((RAM_EXTENSION_A == "LOWER" || RAM_EXTENSION_A == "UPPER") && READ_WIDTH_A != 1) begin
	    $display("Attribute Syntax Error : If attribute RAM_EXTENSION_A on RAMB36E1 instance %m is set to either LOWER or UPPER, then READ_WIDTH_A has to be set to 1.");
	    finish_error = 1;
	end

	
	if ((RAM_EXTENSION_A == "LOWER" || RAM_EXTENSION_A == "UPPER") && WRITE_WIDTH_A != 1) begin
	    $display("Attribute Syntax Error : If attribute RAM_EXTENSION_A on RAMB36E1 instance %m is set to either LOWER or UPPER, then WRITE_WIDTH_A has to be set to 1.");
	    finish_error = 1;
	end


	 if ((RAM_EXTENSION_B == "LOWER" || RAM_EXTENSION_B == "UPPER") && READ_WIDTH_B != 1) begin
	    $display("Attribute Syntax Error : If attribute RAM_EXTENSION_B on RAMB36E1 instance %m is set to either LOWER or UPPER, then READ_WIDTH_B has to be set to 1.");
	    finish_error = 1;
	end


	if ((RAM_EXTENSION_B == "LOWER" || RAM_EXTENSION_B == "UPPER") && WRITE_WIDTH_B != 1) begin
	    $display("Attribute Syntax Error : If attribute RAM_EXTENSION_B on RAMB36E1 instance %m is set to either LOWER or UPPER, then WRITE_WIDTH_B has to be set to 1.");
	    finish_error = 1;
	end


	if (READ_WIDTH_A == 0 && READ_WIDTH_B == 0) begin
	    $display("Attribute Syntax Error : Attributes READ_WIDTH_A and READ_WIDTH_B on RAMB36E1 instance %m, both can not be 0.");
	    finish_error = 1;
	end

	       
	case (WRITE_MODE_A)
	    "WRITE_FIRST" : wr_mode_a = 2'b00;
	    "READ_FIRST"  : wr_mode_a = 2'b01;
	    "NO_CHANGE"   : wr_mode_a = 2'b10;
	    default       : begin
				$display("Attribute Syntax Error : The Attribute WRITE_MODE_A on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are WRITE_FIRST, READ_FIRST or NO_CHANGE.", WRITE_MODE_A);
				finish_error = 1;
			    end
	endcase


	case (WRITE_MODE_B)
	    "WRITE_FIRST" : wr_mode_b = 2'b00;
	    "READ_FIRST"  : wr_mode_b = 2'b01;
	    "NO_CHANGE"   : wr_mode_b = 2'b10;
	    default       : begin
				$display("Attribute Syntax Error : The Attribute WRITE_MODE_B on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are WRITE_FIRST, READ_FIRST or NO_CHANGE.", WRITE_MODE_B);
				finish_error = 1;
			    end
	endcase

	case (RAM_EXTENSION_A)
	    "UPPER" : cascade_a = 2'b11;
	    "LOWER" : cascade_a = 2'b01;
	    "NONE"  : cascade_a = 2'b00;
	    default : begin
	       	          $display("Attribute Syntax Error : The attribute RAM_EXTENSION_A on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are LOWER, NONE or UPPER.", RAM_EXTENSION_A);
		          finish_error = 1;
		      end
	endcase


	case (RAM_EXTENSION_B)
	    "UPPER" : cascade_b = 2'b11;
	    "LOWER" : cascade_b = 2'b01;
	    "NONE"  : cascade_b = 2'b00;
	    default : begin
	       	          $display("Attribute Syntax Error : The attribute RAM_EXTENSION_B on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are LOWER, NONE or UPPER.", RAM_EXTENSION_B);
		          finish_error = 1;
		      end
	endcase

	
	if ((SIM_COLLISION_CHECK != "ALL") && (SIM_COLLISION_CHECK != "NONE") && (SIM_COLLISION_CHECK != "WARNING_ONLY") && (SIM_COLLISION_CHECK != "GENERATE_X_ONLY")) begin
	    
	    $display("Attribute Syntax Error : The attribute SIM_COLLISION_CHECK on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are ALL, NONE, WARNING_ONLY or GENERATE_X_ONLY.", SIM_COLLISION_CHECK);
	    finish_error = 1;

	end

	
	case (RSTREG_PRIORITY_A)
	    "RSTREG" : rstreg_priority_a_int = 1;
	    "REGCE"  : rstreg_priority_a_int = 0;
	    default : begin
	       	          $display("Attribute Syntax Error : The attribute RSTREG_PRIORITY_A on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are RSTREG or REGCE.", RSTREG_PRIORITY_A);
		          finish_error = 1;
		      end
	endcase


	case (RSTREG_PRIORITY_B)
	    "RSTREG" : rstreg_priority_b_int = 1;
	    "REGCE"  : rstreg_priority_b_int = 0;
	    default : begin
	       	          $display("Attribute Syntax Error : The attribute RSTREG_PRIORITY_B on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are RSTREG or REGCE.", RSTREG_PRIORITY_B);
		          finish_error = 1;
	              end
	endcase


	if ((en_ecc_write_int == 1 || en_ecc_read_int == 1) && (WRITE_WIDTH_B != 72 || READ_WIDTH_A != 72)) begin 
	    $display("DRC Error : Attributes WRITE_WIDTH_B and READ_WIDTH_A have to be set to 72 on RAMB36E1 instance %m when either attribute EN_ECC_WRITE or EN_ECC_READ is set to TRUE.");
	    finish_error = 1;
	end


	case (RDADDR_COLLISION_HWCONFIG)
	    "DELAYED_WRITE" : rdaddr_collision_hwconfig_int = 0;
	    "PERFORMANCE"   : rdaddr_collision_hwconfig_int = 1;
	    default : begin
	       	          $display("Attribute Syntax Error : The attribute RDADDR_COLLISION_HWCONFIG on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are DELAYED_WRITE or PERFORMANCE.", RDADDR_COLLISION_HWCONFIG);
		          finish_error = 1;
	              end
	endcase
	

	if (!(SIM_DEVICE == "VIRTEX6" || SIM_DEVICE == "7SERIES")) begin
	    $display("Attribute Syntax Error : The Attribute SIM_DEVICE on RAMB36E1 instance %m is set to %s.  Legal values for this attribute are VIRTEX6, or 7SERIES.", SIM_DEVICE);
	    finish_error = 1;
	end
	
	
	if (finish_error == 1)
	    $finish;

	
    end // initial begin

    
    // GSR
    always @(gsr_in)
	if (gsr_in) begin
	    
	    assign doa_out = INIT_A[0 +: ra_width];
		
	    if (ra_width >= 8) begin
		assign dopa_out = INIT_A[ra_width +: ra_widthp];
	    end

	    assign dob_out = INIT_B[0 +: rb_width];
		
	    if (rb_width >= 8) begin
		assign dopb_out = INIT_B[rb_width +: rb_widthp];
	    end

	    assign dbiterr_out = 0;
	    assign sbiterr_out = 0;
	    assign rdaddrecc_out = 9'b0;
	    
	end
	else begin
	    deassign doa_out;
	    deassign dopa_out;
	    deassign dob_out;
	    deassign dopb_out;
	    deassign dbiterr_out;
	    deassign sbiterr_out;
	    deassign rdaddrecc_out;
 
	end

   
   always @(time_clka_period or time_clkb_period) begin
      
      if (time_clka_period != 0 && time_clkb_period != 0) begin

	 if (time_clka_period <= time_clkb_period) begin
	    
	    if (time_clka_period <= SETUP_READ_FIRST) begin
	       time_period = time_clka_period;
	    end
	    else begin
	       time_period = SETUP_READ_FIRST;
	    end
	    
	 end
	 else if (time_clkb_period <= SETUP_READ_FIRST)
   	   time_period = time_clkb_period;
	 else
	   time_period = SETUP_READ_FIRST;
	 
      end
   end
   
    // registering signals
    always @(posedge clka_in) begin

       rising_clka = 1;

       if ($time > 110000 && time_skew_a_flag == 0) begin
	  time_clka_period = $time - time_port_a;
	  time_skew_a_flag = 1;
       end
       
       
       if (ena_in === 1'b1) begin
	  time_port_a = $time;
	  addra_reg = addra_in;
	  wea_reg = wea_in;
	  dia_reg = dia_in;
	  dipa_reg = dipa_in;
	  ox_addra_reconstruct_reg = ox_addra_reconstruct;
       end

    end

    always @(posedge clkb_in) begin

       rising_clkb = 1;
       
       if ($time > 110000 && time_skew_b_flag == 0) begin
	  time_clkb_period = $time - time_port_b;
	  time_skew_b_flag = 1;
       end
       
       
       if (enb_in === 1'b1) begin
	  time_port_b = $time;
	  addrb_reg = addrb_in;
	  web_reg = web_in;
	  enb_reg = enb_in;
	  dib_reg = dib_in;
	  dipb_reg = dipb_in;
	  ox_addrb_reconstruct_reg = ox_addrb_reconstruct;
       end
       
    end // always @ (posedge clkb_in)


    // CLKA and CLKB
    always @(posedge rising_clka or posedge rising_clkb) begin

	// Registering addr[15] for cascade mode
	if (rising_clka)
	    if (cascade_a[1])
		addra_in_15_reg_bram = ~addra_in[15];
	    else
		addra_in_15_reg_bram = addra_in[15];

	if (rising_clkb)
	    if (cascade_b[1])
		addrb_in_15_reg_bram = ~addrb_in[15];
	    else
		addrb_in_15_reg_bram = addrb_in[15];
	
	if ((cascade_a == 2'b00 || (addra_in_15_reg_bram == 1'b0 && cascade_a != 2'b00)) && (cascade_b == 2'b00 || (addrb_in_15_reg_bram == 1'b0 && cascade_b != 2'b00)))  begin

/************************************* Collision starts *****************************************/

	  if (SIM_COLLISION_CHECK != "NONE") begin
	    
	    if (gsr_in === 1'b0) begin

		if (time_port_a > time_port_b) begin
		    
		    if (time_port_a - time_port_b <= sync_clk_skew) begin
			viol_time = 1;
		    end
		    else if (time_port_a - time_port_b <= time_period) begin
			viol_time = 2;
		    end
		end
		else begin
			
		    if (time_port_b - time_port_a <= sync_clk_skew) begin
			viol_time = 1;
		    end
		    else if (time_port_b - time_port_a <= time_period) begin
			viol_time = 2;
		    end

		end // else: !if(time_port_a > time_port_b)

		
		if (ena_in === 1'b0 || enb_in === 1'b0)
		    viol_time = 0;

		
		if ((WRITE_WIDTH_A <= 9 && wea_in[0] === 1'b0) || (WRITE_WIDTH_A == 18 && wea_in[1:0] === 2'b00) || ((WRITE_WIDTH_A == 36 || WRITE_WIDTH_A == 72) && wea_in[3:0] === 4'b0000))
		    if ((WRITE_WIDTH_B <= 9 && web_in[0] === 1'b0) || (WRITE_WIDTH_B == 18 && web_in[1:0] === 2'b00) || (WRITE_WIDTH_B == 36 && web_in[3:0] === 4'b0000) || (WRITE_WIDTH_B == 72 && web_in[7:0] === 8'h00))
			viol_time = 0;
		 
		
		if (viol_time != 0) begin

		  if (SIM_DEVICE == "VIRTEX6") begin
			
		    // Clka and clkb rise at the same time
		    if ((rising_clka && rising_clkb) || viol_time == 1) begin

			if (addra_in[15:col_addr_lsb] === addrb_in[15:col_addr_lsb]) begin
		    
			    viol_type = 2'b01;
			    chk_col_same_clk = 1;


			    if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (time_port_a > time_port_b)) begin
				doa_buf = dob_buf;
				dopa_buf = dopb_buf;
			    end
			    else if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (time_port_b > time_port_a)) begin
				dob_buf = doa_buf;
				dopb_buf = dopa_buf;
			    end
			    else begin
				task_rd_ram_a (addra_in, doa_buf, dopa_buf);
				task_rd_ram_b (addrb_in, dob_buf, dopb_buf);
			    end
			    

			    task_col_wr_ram_a (2'b00, web_in, wea_in, di_x, di_x[7:0], addrb_in, addra_in);
			    task_col_wr_ram_b (2'b00, wea_in, web_in, di_x, di_x[7:0], addra_in, addrb_in);
			    chk_col_same_clk = 0;
			    
			    task_col_rd_ram_a (2'b01, web_in, wea_in, addra_in, doa_buf, dopa_buf);
			    task_col_rd_ram_b (2'b01, wea_in, web_in, addrb_in, dob_buf, dopb_buf);

			    task_col_wr_ram_a (2'b10, web_in, wea_in, dia_in, dipa_in, addrb_in, addra_in);

				   		    
   			    dib_ecc_col = dib_in;
			    
			    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin
				
				if (injectdbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				    dib_ecc_col[62] = ~dib_ecc_col[62];
				end
				else if (injectsbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				end

			    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
			    
			    
			    if (ram_mode_int == 0 && en_ecc_write_int == 1 && enb_in === 1'b1) begin
		    
				dip_ecc_col = fn_dip_ecc(1'b1, dib_in, dipb_in);				
				eccparity_out = dip_ecc_col;
				task_col_wr_ram_b (2'b10, wea_in, web_in, dib_ecc_col, dip_ecc_col, addra_in, addrb_in);

			    end
			    else
				task_col_wr_ram_b (2'b10, wea_in, web_in, dib_ecc_col, dipb_in, addra_in, addrb_in);

			    
			    if (wr_mode_a != 2'b01)
				task_col_rd_ram_a (2'b11, web_in, wea_in, addra_in, doa_buf, dopa_buf);
			    if (wr_mode_b != 2'b01)
				task_col_rd_ram_b (2'b11, wea_in, web_in, addrb_in, dob_buf, dopb_buf);


			    if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && rdaddr_collision_hwconfig_int == 1) begin
				task_col_wr_ram_a (2'b10, web_in, wea_in, di_x, di_x[7:0], addrb_in, addra_in);
				task_col_wr_ram_b (2'b10, wea_in, web_in, di_x, di_x[7:0], addra_in, addrb_in);
			    end

			    if ((ram_mode_int == 0 && en_ecc_read_int == 1) && ((time_port_a > time_port_b) || (rising_clka && rising_clkb)))
				task_col_ecc_read (doa_buf, dopa_buf, addra_in);
				
			end // if (addra_in[15:col_addr_lsb] === addrb_in[15:col_addr_lsb])
			else if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (ox_addra_reconstruct[15:col_addr_lsb] === ox_addrb_reconstruct[15:col_addr_lsb])) begin
			    
			    viol_type = 2'b01;
			    chk_ox_msg = 1;
			    chk_ox_same_clk = 1;
			    
			    if (time_port_a > time_port_b)
				task_rd_ram_a (addra_in, doa_buf, dopa_buf);
			    else if (time_port_b > time_port_a)
				task_rd_ram_b (addrb_in, dob_buf, dopb_buf);
			    else begin
				task_rd_ram_a (addra_in, doa_buf, dopa_buf);
				task_rd_ram_b (addrb_in, dob_buf, dopb_buf);
			    end
			    
			    task_col_wr_ram_a (2'b00, web_in, wea_in, di_x, di_x[7:0], addrb_in, addra_in);
			    task_col_wr_ram_b (2'b00, wea_in, web_in, di_x, di_x[7:0], addra_in, addrb_in);

			    chk_ox_msg = 0;
			    chk_ox_same_clk = 0;
			    
			    task_ox_wr_ram_a (2'b10, web_in, wea_in, dia_in, dipa_in, addrb_in, addra_in);

				   		    
   			    dib_ecc_col = dib_in;
			    
			    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin
				
				if (injectdbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				    dib_ecc_col[62] = ~dib_ecc_col[62];
				end
				else if (injectsbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				end

			    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
			    
			    
			    if (ram_mode_int == 0 && en_ecc_write_int == 1 && enb_in === 1'b1) begin
		    
				dip_ecc_col = fn_dip_ecc(1'b1, dib_in, dipb_in);				
				eccparity_out = dip_ecc_col;
				task_ox_wr_ram_b (2'b10, wea_in, web_in, dib_ecc_col, dip_ecc_col, addra_in, addrb_in);

			    end
			    else
				task_ox_wr_ram_b (2'b10, wea_in, web_in, dib_ecc_col, dipb_in, addra_in, addrb_in);

			    
			    if (wr_mode_a != 2'b01)
				task_col_rd_ram_a (2'b11, web_in, wea_in, addra_in, doa_buf, dopa_buf);
			    if (wr_mode_b != 2'b01)
				task_col_rd_ram_b (2'b11, wea_in, web_in, addrb_in, dob_buf, dopb_buf);


			    if (rdaddr_collision_hwconfig_int == 1) begin
				task_col_wr_ram_a (2'b10, web_in, 8'hff, di_x, di_x[7:0], addrb_in, addra_in);
				task_col_wr_ram_b (2'b10, wea_in, 8'hff, di_x, di_x[7:0], addra_in, addrb_in);
			    end

			    if ((ram_mode_int == 0 && en_ecc_read_int == 1) && ((time_port_a > time_port_b) || (rising_clka && rising_clkb)))
				task_col_ecc_read (doa_buf, dopa_buf, addra_in);
				
			end // if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (ox_addra_reconstruct[15:col_addr_lsb] === ox_addrb_reconstruct[15:col_addr_lsb]))
			else
			    viol_time = 0;

			
		    end // if (rising_clka && rising_clkb)
		    // Clkb before clka
		    else if (rising_clka && !rising_clkb) begin


			if (addra_in[15:col_addr_lsb] === addrb_reg[15:col_addr_lsb]) begin

			    viol_type = 2'b10;

			    task_rd_ram_a (addra_in, doa_buf, dopa_buf);
			    
			    task_col_wr_ram_a (2'b00, web_reg, wea_in, di_x, di_x[7:0], addrb_reg, addra_in);
			    task_col_wr_ram_b (2'b00, wea_in, web_reg, di_x, di_x[7:0], addra_in, addrb_reg);
			    
			    task_col_rd_ram_a (2'b01, web_reg, wea_in, addra_in, doa_buf, dopa_buf);
			    task_col_rd_ram_b (2'b01, wea_in, web_reg, addrb_reg, dob_buf, dopb_buf);

			    task_col_wr_ram_a (2'b10, web_reg, wea_in, dia_in, dipa_in, addrb_reg, addra_in);

			   				   		    
   			    dib_ecc_col = dib_reg;

			    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin
			    
				if (injectdbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				    dib_ecc_col[62] = ~dib_ecc_col[62];
				end
				else if (injectsbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				end

			    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
			    
 
			    if (ram_mode_int == 0 && en_ecc_write_int == 1 && enb_reg === 1'b1) begin

				dip_ecc_col = fn_dip_ecc(1'b1, dib_reg, dipb_reg);				
				eccparity_out = dip_ecc_col;
				task_col_wr_ram_b (2'b10, wea_in, web_reg, dib_ecc_col, dip_ecc_col, addra_in, addrb_reg);

			    end
			    else
				task_col_wr_ram_b (2'b10, wea_in, web_reg, dib_ecc_col, dipb_reg, addra_in, addrb_reg);
			    

			    if (wr_mode_a != 2'b01)
				task_col_rd_ram_a (2'b11, web_reg, wea_in, addra_in, doa_buf, dopa_buf);
			    if (wr_mode_b != 2'b01)
				task_col_rd_ram_b (2'b11, wea_in, web_reg, addrb_reg, dob_buf, dopb_buf);

			    
			    if (wr_mode_a == 2'b01 || wr_mode_b == 2'b01) begin
				task_col_wr_ram_a (2'b10, web_reg, wea_in, di_x, di_x[7:0], addrb_reg, addra_in);
				task_col_wr_ram_b (2'b10, wea_in, web_reg, di_x, di_x[7:0], addra_in, addrb_reg);
			    end

			    
			    if (ram_mode_int == 0 && en_ecc_read_int == 1)
				task_col_ecc_read (doa_buf, dopa_buf, addra_in);

			end // if (addra_in[15:col_addr_lsb] === addrb_reg[15:col_addr_lsb])
			else if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (ox_addra_reconstruct[15:col_addr_lsb] === ox_addrb_reconstruct_reg[15:col_addr_lsb])) begin
			    
			    viol_type = 2'b10;
			    chk_ox_msg = 1;
			    
			    task_rd_ram_a (addra_in, doa_buf, dopa_buf);

			    // get msg
			    task_col_wr_ram_a (2'b00, web_reg, wea_in, di_x, di_x[7:0], addrb_reg, addra_in);
			    task_col_wr_ram_b (2'b00, wea_in, web_reg, di_x, di_x[7:0], addra_in, addrb_reg);
			    chk_ox_msg = 0;
		    
			    task_ox_wr_ram_a (2'b10, web_reg, wea_in, dia_in, dipa_in, addrb_reg, addra_in);

			   				   		    
   			    dib_ecc_col = dib_reg;

			    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin
			    
				if (injectdbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				    dib_ecc_col[62] = ~dib_ecc_col[62];
				end
				else if (injectsbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				end

			    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
			    
 
			    if (ram_mode_int == 0 && en_ecc_write_int == 1 && enb_reg === 1'b1) begin

				dip_ecc_col = fn_dip_ecc(1'b1, dib_reg, dipb_reg);				
				eccparity_out = dip_ecc_col;
				task_ox_wr_ram_b (2'b10, wea_in, web_reg, dib_ecc_col, dip_ecc_col, addra_in, addrb_reg);

			    end
			    else
				task_ox_wr_ram_b (2'b10, wea_in, web_reg, dib_ecc_col, dipb_reg, addra_in, addrb_reg);
			    

			    if (wr_mode_a != 2'b01)
				task_col_rd_ram_a (2'b11, web_reg, wea_in, addra_in, doa_buf, dopa_buf);
			    if (wr_mode_b != 2'b01)
				task_col_rd_ram_b (2'b11, wea_in, web_reg, addrb_reg, dob_buf, dopb_buf);


			    task_col_wr_ram_a (2'b10, web_reg, 8'hff, di_x, di_x[7:0], addrb_reg, addra_in);
			    task_col_wr_ram_b (2'b10, wea_in, 8'hff, di_x, di_x[7:0], addra_in, addrb_reg);

			    
			    if (ram_mode_int == 0 && en_ecc_read_int == 1)
				task_col_ecc_read (doa_buf, dopa_buf, addra_in);


			end // if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (ox_addra_reconstruct[15:col_addr_lsb] === ox_addrb_reconstruct_reg[15:col_addr_lsb]))
			else
			    viol_time = 0;

			
		    end // if (rising_clka && !rising_clkb)
		    // Clka before clkb
		    else if (!rising_clka && rising_clkb) begin

			
			if (addra_reg[15:col_addr_lsb] === addrb_in[15:col_addr_lsb]) begin
	    
			    viol_type = 2'b11;

			    task_rd_ram_b (addrb_in, dob_buf, dopb_buf);

			    task_col_wr_ram_a (2'b00, web_in, wea_reg, di_x, di_x[7:0], addrb_in, addra_reg);
			    task_col_wr_ram_b (2'b00, wea_reg, web_in, di_x, di_x[7:0], addra_reg, addrb_in);
			    
			    task_col_rd_ram_a (2'b01, web_in, wea_reg, addra_reg, doa_buf, dopa_buf);
			    task_col_rd_ram_b (2'b01, wea_reg, web_in, addrb_in, dob_buf, dopb_buf);

			    task_col_wr_ram_a (2'b10, web_in, wea_reg, dia_reg, dipa_reg, addrb_in, addra_reg);

				   		    
   			    dib_ecc_col = dib_in;


			    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin			    

				if (injectdbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				    dib_ecc_col[62] = ~dib_ecc_col[62];
				end
				else if (injectsbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				end

			    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
			    
			    
			    if (ram_mode_int == 0 && en_ecc_write_int == 1 && enb_in === 1'b1) begin

				dip_ecc_col = fn_dip_ecc(1'b1, dib_in, dipb_in);				
				eccparity_out = dip_ecc_col;
				task_col_wr_ram_b (2'b10, wea_reg, web_in, dib_ecc_col, dip_ecc_col, addra_reg, addrb_in);
				
			    end
			    else
				task_col_wr_ram_b (2'b10, wea_reg, web_in, dib_ecc_col, dipb_in, addra_reg, addrb_in);
			    

			    if (wr_mode_a != 2'b01)			    
				task_col_rd_ram_a (2'b11, web_in, wea_reg, addra_reg, doa_buf, dopa_buf);
			    if (wr_mode_b != 2'b01)
				task_col_rd_ram_b (2'b11, wea_reg, web_in, addrb_in, dob_buf, dopb_buf);


			    if (wr_mode_a == 2'b01 || wr_mode_b == 2'b01) begin
				task_col_wr_ram_a (2'b10, web_in, wea_reg, di_x, di_x[7:0], addrb_in, addra_reg);
				task_col_wr_ram_b (2'b10, wea_reg, web_in, di_x, di_x[7:0], addra_reg, addrb_in);
			    end

			    
			    if (ram_mode_int == 0 && en_ecc_read_int == 1)
				task_col_ecc_read (doa_buf, dopa_buf, addra_reg);

			end // if (addra_reg[15:col_addr_lsb] === addrb_in[15:col_addr_lsb])
			else if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (ox_addra_reconstruct_reg[15:col_addr_lsb] === ox_addrb_reconstruct[15:col_addr_lsb])) begin

			    viol_type = 2'b11;
			    chk_ox_msg = 1;

			    task_rd_ram_b (addrb_in, dob_buf, dopb_buf);

			    // get msg
			    task_col_wr_ram_a (2'b00, web_in, wea_reg, di_x, di_x[7:0], addrb_in, addra_reg);
			    task_col_wr_ram_b (2'b00, wea_reg, web_in, di_x, di_x[7:0], addra_reg, addrb_in);
			    chk_ox_msg = 0;
			    
			    task_ox_wr_ram_a (2'b10, web_in, wea_reg, dia_reg, dipa_reg, addrb_in, addra_reg);

				   		    
   			    dib_ecc_col = dib_in;


			    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin			    

				if (injectdbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				    dib_ecc_col[62] = ~dib_ecc_col[62];
				end
				else if (injectsbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				end

			    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
			    
			    
			    if (ram_mode_int == 0 && en_ecc_write_int == 1 && enb_in === 1'b1) begin

				dip_ecc_col = fn_dip_ecc(1'b1, dib_in, dipb_in);				
				eccparity_out = dip_ecc_col;
				task_ox_wr_ram_b (2'b10, wea_reg, web_in, dib_ecc_col, dip_ecc_col, addra_reg, addrb_in);
				
			    end
			    else
				task_ox_wr_ram_b (2'b10, wea_reg, web_in, dib_ecc_col, dipb_in, addra_reg, addrb_in);
			    

			    if (wr_mode_a != 2'b01)
				task_col_rd_ram_a (2'b11, web_in, wea_reg, addra_reg, doa_buf, dopa_buf);
			    if (wr_mode_b != 2'b01)
				task_col_rd_ram_b (2'b11, wea_reg, web_in, addrb_in, dob_buf, dopb_buf);


			    task_col_wr_ram_a (2'b10, web_in, 8'hff, di_x, di_x[7:0], addrb_in, addra_reg);
			    task_col_wr_ram_b (2'b10, wea_reg, 8'hff, di_x, di_x[7:0], addra_reg, addrb_in);

			    
			    if (ram_mode_int == 0 && en_ecc_read_int == 1)
				task_col_ecc_read (doa_buf, dopa_buf, addra_reg);

			end // if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (ox_addra_reconstruct_reg[15:col_addr_lsb] === ox_addrb_reconstruct[15:col_addr_lsb]))
			else
			    viol_time = 0;

			
		    end // if (!rising_clka && rising_clkb)

		      
		  end // if (SIM_DEVICE == "VIRTEX6")
		  else begin  // 7series

		      
		    // Clka and clkb rise at the same time
		    if ((rising_clka && rising_clkb) || viol_time == 1) begin

			if (addra_in[15:col_addr_lsb] === addrb_in[15:col_addr_lsb]) begin
		    
			    viol_type = 2'b01;
			    chk_col_same_clk = 1;

			    if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (time_port_a > time_port_b)) begin
				doa_buf = dob_buf;
				dopa_buf = dopb_buf;
			    end
			    else if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (time_port_b > time_port_a)) begin
				dob_buf = doa_buf;
				dopb_buf = dopa_buf;
			    end
			    else begin
				task_rd_ram_a (addra_in, doa_buf, dopa_buf);
				task_rd_ram_b (addrb_in, dob_buf, dopb_buf);
			    end

			    
			    task_col_wr_ram_a (2'b00, web_in, wea_in, di_x, di_x[7:0], addrb_in, addra_in);
			    task_col_wr_ram_b (2'b00, wea_in, web_in, di_x, di_x[7:0], addra_in, addrb_in);
			    chk_col_same_clk = 0;
			    
			    task_col_rd_ram_a (2'b01, web_in, wea_in, addra_in, doa_buf, dopa_buf);
			    task_col_rd_ram_b (2'b01, wea_in, web_in, addrb_in, dob_buf, dopb_buf);

			    task_col_wr_ram_a (2'b10, web_in, wea_in, dia_in, dipa_in, addrb_in, addra_in);

				   		    
   			    dib_ecc_col = dib_in;
			    
			    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin
				
				if (injectdbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				    dib_ecc_col[62] = ~dib_ecc_col[62];
				end
				else if (injectsbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				end

			    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
			    
			    
			    if (ram_mode_int == 0 && en_ecc_write_int == 1 && enb_in === 1'b1) begin
		    
				dip_ecc_col = fn_dip_ecc(1'b1, dib_in, dipb_in);				
				eccparity_out = dip_ecc_col;
				task_col_wr_ram_b (2'b10, wea_in, web_in, dib_ecc_col, dip_ecc_col, addra_in, addrb_in);

			    end
			    else
				task_col_wr_ram_b (2'b10, wea_in, web_in, dib_ecc_col, dipb_in, addra_in, addrb_in);

			    
			    if (wr_mode_a != 2'b01)
				task_col_rd_ram_a (2'b11, web_in, wea_in, addra_in, doa_buf, dopa_buf);
			    if (wr_mode_b != 2'b01)
				task_col_rd_ram_b (2'b11, wea_in, web_in, addrb_in, dob_buf, dopb_buf);

			    if ((ram_mode_int == 0 && en_ecc_read_int == 1) && ((time_port_a > time_port_b) || (rising_clka && rising_clkb)))
			    	task_col_ecc_read (doa_buf, dopa_buf, addra_in);
				
			end // if (addra_in[15:col_addr_lsb] === addrb_in[15:col_addr_lsb])
			else if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (ox_addra_reconstruct[15:col_addr_lsb] === ox_addrb_reconstruct[15:col_addr_lsb]) && rdaddr_collision_hwconfig_int == 1) begin
			
			    $display ("Address Overlap Error on RAMB36E1 : %m at simulation time %.3f ns.\nA read/write/write was performed on address %h (hex) of port A while a write/read/write was requested to the overlapped address %h (hex) of port B with RDADDR_COLLISION_HWCONFIG set to %s and WRITE_MODE_A set %s and WRITE_MODE_B set to %s .  The write will be unsuccessful and the contents of the RAM at both address locations of port A and B became unknown.  To correct this issue, either evaluate changing RDADDR_COLLISION_HWCONFIG to DELAYED_WRITE, change both WITRE_MODEs to something other than READ_FIRST or control addressing to not incur address overlap.", $time/1000.0, addra_in, addrb_in, RDADDR_COLLISION_HWCONFIG, WRITE_MODE_A, WRITE_MODE_B );

			    $finish;
			
			end
			else
			    viol_time = 0;

			
		    end // if ((rising_clka && rising_clkb) || viol_time == 1)
		    // Clkb before clka
		    else if (rising_clka && !rising_clkb) begin


			if (addra_in[15:col_addr_lsb] === addrb_reg[15:col_addr_lsb]) begin

			    viol_type = 2'b10;

			    task_rd_ram_a (addra_in, doa_buf, dopa_buf);
			    
			    task_col_wr_ram_a (2'b00, web_reg, wea_in, di_x, di_x[7:0], addrb_reg, addra_in);
			    task_col_wr_ram_b (2'b00, wea_in, web_reg, di_x, di_x[7:0], addra_in, addrb_reg);
			    
			    task_col_rd_ram_a (2'b01, web_reg, wea_in, addra_in, doa_buf, dopa_buf);
			    task_col_rd_ram_b (2'b01, wea_in, web_reg, addrb_reg, dob_buf, dopb_buf);

			    task_col_wr_ram_a (2'b10, web_reg, wea_in, dia_in, dipa_in, addrb_reg, addra_in);

			   				   		    
   			    dib_ecc_col = dib_reg;

			    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin
			    
				if (injectdbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				    dib_ecc_col[62] = ~dib_ecc_col[62];
				end
				else if (injectsbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				end

			    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
			    
 
			    if (ram_mode_int == 0 && en_ecc_write_int == 1 && enb_reg === 1'b1) begin

				dip_ecc_col = fn_dip_ecc(1'b1, dib_reg, dipb_reg);				
				eccparity_out = dip_ecc_col;
				task_col_wr_ram_b (2'b10, wea_in, web_reg, dib_ecc_col, dip_ecc_col, addra_in, addrb_reg);

			    end
			    else
				task_col_wr_ram_b (2'b10, wea_in, web_reg, dib_ecc_col, dipb_reg, addra_in, addrb_reg);
			    

			    if (wr_mode_a != 2'b01)
				task_col_rd_ram_a (2'b11, web_reg, wea_in, addra_in, doa_buf, dopa_buf);
			    if (wr_mode_b != 2'b01)
				task_col_rd_ram_b (2'b11, wea_in, web_reg, addrb_reg, dob_buf, dopb_buf);

			    
			    if (ram_mode_int == 0 && en_ecc_read_int == 1)
				task_col_ecc_read (doa_buf, dopa_buf, addra_in);

			    
			end // if (addra_in[15:col_addr_lsb] === addrb_reg[15:col_addr_lsb])
			else if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (ox_addra_reconstruct[15:col_addr_lsb] === ox_addrb_reconstruct_reg[15:col_addr_lsb]) && rdaddr_collision_hwconfig_int == 1) begin

			    $display ("Address Overlap Error on RAMB36E1 : %m at simulation time %.3f ns.\nA read/write/write was performed on address %h (hex) of port A while a write/read/write was requested to the overlapped address %h (hex) of port B with RDADDR_COLLISION_HWCONFIG set to %s and WRITE_MODE_A set %s and WRITE_MODE_B set to %s .  The write will be unsuccessful and the contents of the RAM at both address locations of port A and B became unknown.  To correct this issue, either evaluate changing RDADDR_COLLISION_HWCONFIG to DELAYED_WRITE, change both WITRE_MODEs to something other than READ_FIRST or control addressing to not incur address overlap.", $time/1000.0, addra_in, addrb_reg, RDADDR_COLLISION_HWCONFIG, WRITE_MODE_A, WRITE_MODE_B );

			    $finish;
			
			end
			else
			    viol_time = 0;


		    end // if (rising_clka && !rising_clkb)
		    // Clka before clkb
		    else if (!rising_clka && rising_clkb) begin
			
			
			if (addra_reg[15:col_addr_lsb] === addrb_in[15:col_addr_lsb]) begin

			    viol_type = 2'b11;

			    task_rd_ram_b (addrb_in, dob_buf, dopb_buf);

			    task_col_wr_ram_a (2'b00, web_in, wea_reg, di_x, di_x[7:0], addrb_in, addra_reg);
			    task_col_wr_ram_b (2'b00, wea_reg, web_in, di_x, di_x[7:0], addra_reg, addrb_in);
			    
			    task_col_rd_ram_a (2'b01, web_in, wea_reg, addra_reg, doa_buf, dopa_buf);
			    task_col_rd_ram_b (2'b01, wea_reg, web_in, addrb_in, dob_buf, dopb_buf);

			    task_col_wr_ram_a (2'b10, web_in, wea_reg, dia_reg, dipa_reg, addrb_in, addra_reg);

				   		    
   			    dib_ecc_col = dib_in;


			    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin			    

				if (injectdbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				    dib_ecc_col[62] = ~dib_ecc_col[62];
				end
				else if (injectsbiterr_in === 1) begin
				    dib_ecc_col[30] = ~dib_ecc_col[30];
				end

			    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
			    
			    
			    if (ram_mode_int == 0 && en_ecc_write_int == 1 && enb_in === 1'b1) begin

				dip_ecc_col = fn_dip_ecc(1'b1, dib_in, dipb_in);				
				eccparity_out = dip_ecc_col;
				task_col_wr_ram_b (2'b10, wea_reg, web_in, dib_ecc_col, dip_ecc_col, addra_reg, addrb_in);
				
			    end
			    else
				task_col_wr_ram_b (2'b10, wea_reg, web_in, dib_ecc_col, dipb_in, addra_reg, addrb_in);
			    

			    if (wr_mode_a != 2'b01)			    
				task_col_rd_ram_a (2'b11, web_in, wea_reg, addra_reg, doa_buf, dopa_buf);
			    if (wr_mode_b != 2'b01)
				task_col_rd_ram_b (2'b11, wea_reg, web_in, addrb_in, dob_buf, dopb_buf);


			    if (ram_mode_int == 0 && en_ecc_read_int == 1)
				task_col_ecc_read (doa_buf, dopa_buf, addra_reg);

			    
			end // if (addra_reg[15:col_addr_lsb] === addrb_in[15:col_addr_lsb])
			else if ((wr_mode_a == 2'b01 || wr_mode_b == 2'b01) && (ox_addra_reconstruct_reg[15:col_addr_lsb] === ox_addrb_reconstruct[15:col_addr_lsb]) && rdaddr_collision_hwconfig_int == 1) begin

			    $display ("Address Overlap Error on RAMB36E1 : %m at simulation time %.3f ns.\nA read/write/write was performed on address %h (hex) of port A while a write/read/write was requested to the overlapped address %h (hex) of port B with RDADDR_COLLISION_HWCONFIG set to %s and WRITE_MODE_A set %s and WRITE_MODE_B set to %s .  The write will be unsuccessful and the contents of the RAM at both address locations of port A and B became unknown.  To correct this issue, either evaluate changing RDADDR_COLLISION_HWCONFIG to DELAYED_WRITE, change both WITRE_MODEs to something other than READ_FIRST or control addressing to not incur address overlap.", $time/1000.0, addra_reg, addrb_in, RDADDR_COLLISION_HWCONFIG, WRITE_MODE_A, WRITE_MODE_B );   

			    $finish;
			
			end
			else
			    viol_time = 0;
			
			
		    end // if (!rising_clka && rising_clkb)

		      
		  end // else: !if(SIM_DEVICE == "VIRTEX6")
		    

		      
		end // if (viol_time != 0)
	    end // if (gsr_in === 1'b0)
	      
	    if (SIM_COLLISION_CHECK == "WARNING_ONLY")
		viol_time = 0;
	    
	  end // if (SIM_COLLISION_CHECK != "NONE")

	
/*************************************** end collision ********************************/

	end // if ((cascade_a == 2'b00 || (addra_in_15_reg_bram == 1'b0 && cascade_a != 2'b00)) && (cascade_b == 2'b00 || (addrb_in_15_reg_bram == 1'b0 && cascade_b != 2'b00)))
	
	
/**************************** Port A ****************************************/
	if (rising_clka) begin

	    // DRC
	    if (rstrama_in === 1 && ram_mode_int == 0 && (en_ecc_write_int == 1 || en_ecc_read_int == 1))
		$display("DRC Warning : SET/RESET (RSTRAM) is not supported in ECC mode on RAMB36E1 instance %m.");

	    // end DRC

	    
	    // registering addra_in[15] the second time
	    if (regcea_in)
		addra_in_15_reg1 = addra_in_15_reg;   
	    
	
	    if (ena_in && (wr_mode_a != 2'b10 || wea_in[0] == 0 || rstrama_in == 1'b1))
		if (cascade_a[1])
		    addra_in_15_reg = ~addra_in[15];
		else
		    addra_in_15_reg = addra_in[15];
	
	
	    if (gsr_in == 1'b0 && ena_in == 1'b1 && (cascade_a == 2'b00 || (addra_in_15_reg_bram == 1'b0 && cascade_a != 2'b00))) begin

		// SRVAL
		if (rstrama_in === 1'b1) begin
		    
		    doa_buf = SRVAL_A[0 +: ra_width];
		    doa_out = SRVAL_A[0 +: ra_width];
		    
		    if (ra_width >= 8) begin
			dopa_buf = SRVAL_A[ra_width +: ra_widthp];
			dopa_out = SRVAL_A[ra_width +: ra_widthp];
		    end
		end
		

		if (viol_time == 0) begin

		    // Read first
		    if (wr_mode_a == 2'b01 || (ram_mode_int == 0 && en_ecc_read_int == 1)) begin
			task_rd_ram_a (addra_in, doa_buf, dopa_buf);
			

			// ECC decode
			if (ram_mode_int == 0 && en_ecc_read_int == 1) begin
				
			    dopr_ecc = fn_dip_ecc(1'b0, doa_buf, dopa_buf);

			    syndrome = dopr_ecc ^ dopa_buf;
				
			    if (syndrome !== 0) begin
				    
				if (syndrome[7]) begin  // dectect single bit error
					
				    ecc_bit_position = {doa_buf[63:57], dopa_buf[6], doa_buf[56:26], dopa_buf[5], doa_buf[25:11], dopa_buf[4], doa_buf[10:4], dopa_buf[3], doa_buf[3:1], dopa_buf[2], doa_buf[0], dopa_buf[1:0], dopa_buf[7]};
				    	
				    if (syndrome[6:0] > 71) begin
					$display ("DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code.");
					$finish;
				    end
				    
				    ecc_bit_position[syndrome[6:0]] = ~ecc_bit_position[syndrome[6:0]]; // correct single bit error in the output 
				    
				    dia_in_ecc_corrected = {ecc_bit_position[71:65], ecc_bit_position[63:33], ecc_bit_position[31:17], ecc_bit_position[15:9], ecc_bit_position[7:5], ecc_bit_position[3]}; // correct single bit error in the memory
				    
				    doa_buf = dia_in_ecc_corrected;
				    
				    dipa_in_ecc_corrected = {ecc_bit_position[0], ecc_bit_position[64], ecc_bit_position[32], ecc_bit_position[16], ecc_bit_position[8], ecc_bit_position[4], ecc_bit_position[2:1]}; // correct single bit error in the parity memory
				    
				    dopa_buf = dipa_in_ecc_corrected;
					
				    dbiterr_out <= 0;
				    sbiterr_out <= 1;
				    
				end
				else if (!syndrome[7]) begin  // double bit error
				    sbiterr_out <= 0;
				    dbiterr_out <= 1;
				    
				end
			    end // if (syndrome !== 0)
			    else begin
				dbiterr_out <= 0;
				sbiterr_out <= 0;
				
			    end // else: !if(syndrome !== 0)
			    
			    
			    // output of rdaddrecc
			    rdaddrecc_out[8:0] <= addra_in[14:6];
			    
			end // if (ram_mode_int == 0 && en_ecc_read_int == 1)
		    end // if (wr_mode_a == 2'b01)
		    
		    
		    // Write
		    task_wr_ram_a (wea_in, dia_in, dipa_in, addra_in);

		    // Read if not read first
		    if (wr_mode_a != 2'b01 && !(ram_mode_int == 0 && en_ecc_read_int == 1))
			    task_rd_ram_a (addra_in, doa_buf, dopa_buf);

		end // if (viol_time == 0)
		
	    end // if (gsr_in == 1'b0 && ena_in == 1'b1 && (cascade_a == 2'b00 || (addra_in_15_reg_bram == 1'b0 && cascade_a != 2'b00)))
	    
	end // if (rising_clka)
	// end of port A


/************************************** port B ***************************************************************/	
	if (rising_clkb) begin

	    // DRC
	    if (rstramb_in === 1 && ram_mode_int == 0 && (en_ecc_write_int == 1 || en_ecc_read_int == 1))
		$display("DRC Warning : SET/RESET (RSTRAM) is not supported in ECC mode on RAMB36E1 instance %m.");

	    if (!(en_ecc_write_int == 1 || en_ecc_read_int == 1)) begin

		if (injectsbiterr_in === 1)
		    $display("DRC Warning : INJECTSBITERR is not supported when neither EN_ECC_WRITE nor EN_ECC_READ = TRUE on RAMB36E1 instance %m.");

		if (injectdbiterr_in === 1)
		    $display("DRC Warning : INJECTDBITERR is not supported when neither EN_ECC_WRITE nor EN_ECC_READ = TRUE on RAMB36E1 instance %m.");

	    end	    	    
	    // End DRC
	    
	    
	    if (regceb_in)
		addrb_in_15_reg1 = addrb_in_15_reg;   
	    
	    
	    if (enb_in && (wr_mode_b != 2'b10 || web_in[0] == 0 || rstramb_in == 1'b1))
		if (cascade_b[1])
		    addrb_in_15_reg = ~addrb_in[15];
		else
		    addrb_in_15_reg = addrb_in[15];
	    
	
	    if (gsr_in == 1'b0 && enb_in == 1'b1 && (cascade_b == 2'b00 || (addrb_in_15_reg_bram == 1'b0 && cascade_b != 2'b00))) begin

		// SRVAL
		if (rstramb_in === 1'b1) begin
		    
		    dob_buf = SRVAL_B[0 +: rb_width];
		    dob_out = SRVAL_B[0 +: rb_width];
		    
		    if (rb_width >= 8) begin
			dopb_buf = SRVAL_B[rb_width +: rb_widthp];
			dopb_out = SRVAL_B[rb_width +: rb_widthp];
		    end
		end


		if (viol_time == 0) begin

		    // ECC encode
		    if (ram_mode_int == 0 && en_ecc_write_int == 1) begin
			dip_ecc = fn_dip_ecc(1'b1, dib_in, dipb_in);
			eccparity_out = dip_ecc;
			dipb_in_ecc = dip_ecc;
		    end
		    else
			dipb_in_ecc = dipb_in;

		    
		    dib_in_ecc = dib_in;

		    
		    // injecting error
		    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin			    
		    
			if (injectdbiterr_in === 1) begin  // double bit
			    dib_in_ecc[30] = ~dib_in_ecc[30];
			    dib_in_ecc[62] = ~dib_in_ecc[62];
			end
			else if (injectsbiterr_in === 1) begin // single bit
			    dib_in_ecc[30] = ~dib_in_ecc[30];
			end

		    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
		    
		    
		    // Read first
		     if (wr_mode_b == 2'b01 && rstramb_in === 1'b0)
			task_rd_ram_b (addrb_in, dob_buf, dopb_buf);		
			    

		    // Write
		    task_wr_ram_b (web_in, dib_in_ecc, dipb_in_ecc, addrb_in);
		    
			
		    // Read if not read first
		    if (wr_mode_b != 2'b01 && rstramb_in === 1'b0)
			task_rd_ram_b (addrb_in, dob_buf, dopb_buf);
		
		end // if (viol_time == 0)
		
	    
	    end // if (gsr_in == 1'b0 && enb_in == 1'b1 && (cascade_b == 2'b00 || addrb_in_15_reg_bram == 1'b0))
	    
	end // if (rising_clkb)
	// end of port B
	

	if (gsr_in == 1'b0) begin
	    
	    // writing outputs of port A	
	    if (ena_in && (rising_clka || viol_time != 0)) begin
		
		if (rstrama_in === 1'b0 && (wr_mode_a != 2'b10 || (WRITE_WIDTH_A <= 9 && wea_in[0] === 1'b0) || (WRITE_WIDTH_A == 18 && wea_in[1:0] === 2'b00) || ((WRITE_WIDTH_A == 36 || WRITE_WIDTH_A == 72) && wea_in[3:0] === 4'b0000))) begin
		    
		    doa_out <= doa_buf;

		    if (ra_width >= 8)
			dopa_out <= dopa_buf;
		    
		end
		
	    end
	    
	    
	    // writing outputs of port B	
	    if (enb_in && (rising_clkb || viol_time != 0)) begin
		
		if (rstramb_in === 1'b0 && (wr_mode_b != 2'b10 || (WRITE_WIDTH_B <= 9 && web_in[0] === 1'b0) || (WRITE_WIDTH_B == 18 && web_in[1:0] === 2'b00) || (WRITE_WIDTH_B == 36 && web_in[3:0] === 4'b0000) || (WRITE_WIDTH_B == 72 && web_in[7:0] === 8'h00))) begin
		    
		    dob_out <= dob_buf;

		    if (rb_width >= 8)
			dopb_out <= dopb_buf;

		end
		
	    end

	end // if (gsr_in == 1'b0)
	
	
	viol_time = 0;
	rising_clka = 0;
	rising_clkb = 0;
	viol_type = 2'b00;
	col_wr_wr_msg = 1;
	col_wra_rdb_msg = 1;
	col_wrb_rda_msg = 1;

    end // always @ (posedge rising_clka or posedge rising_clkb)


    // ********* Cascade  Port A ********
    always @(posedge clka_in or cascadeina_in or addra_in_15_reg or doa_out or dopa_out) begin

	if (cascade_a[1] == 1'b1 && addra_in_15_reg == 1'b1) begin
	    doa_out_mux[0] = cascadeina_in;
	end
	else begin
	    doa_out_mux = doa_out;

	    if (ra_width >= 8)
		dopa_out_mux = dopa_out;
	    
	end
	
    end

    // output register mode
    always @(posedge clka_in or cascadeina_in or addra_in_15_reg1 or doa_outreg or dopa_outreg) begin

	if (cascade_a[1] == 1'b1 && addra_in_15_reg1 == 1'b1) begin
	    doa_outreg_mux[0] = cascadeina_in;
	end
	else begin
	    doa_outreg_mux = doa_outreg;

	    if (ra_width >= 8)
		dopa_outreg_mux = dopa_outreg;
	    
	end
	
    end

    
    // ********* Cascade  Port B ********
    always @(posedge clkb_in or cascadeinb_in or addrb_in_15_reg or dob_out or dopb_out) begin

	if (cascade_b[1] == 1'b1 && addrb_in_15_reg == 1'b1) begin
	    dob_out_mux[0] = cascadeinb_in;
	end
	else begin
	    dob_out_mux = dob_out;

	    if (rb_width >= 8)
		dopb_out_mux = dopb_out;
	    
	end
	
    end

    // output register mode
    always @(posedge clkb_in or cascadeinb_in or addrb_in_15_reg1 or dob_outreg or dopb_outreg) begin

	if (cascade_b[1] == 1'b1 && addrb_in_15_reg1 == 1'b1) begin
	    dob_outreg_mux[0] = cascadeinb_in;
	end
	else begin
	    dob_outreg_mux = dob_outreg;

	    if (rb_width >= 8)
		dopb_outreg_mux = dopb_outreg;
	    
	end

    end // always @ (posedge regclkb_in or cascadeinregb_in or addrb_in_15_reg1 or dob_outreg or dopb_outreg)

    
    // ***** Output Registers **** Port A *****
    always @(posedge clka_in or posedge gsr_in) begin
	
	if (DOA_REG == 1) begin

	    if (gsr_in == 1'b1) begin

		rdaddrecc_outreg <= 9'b0;
		dbiterr_outreg <= 0;
		sbiterr_outreg <= 0;
		doa_outreg <= INIT_A[0 +: ra_width];

		if (ra_width >= 8)
		    dopa_outreg <= INIT_A[ra_width +: ra_widthp];
		
	    end
	    else if (gsr_in == 1'b0) begin

		if (regcea_in === 1'b1) begin
		    dbiterr_outreg <= dbiterr_out;
		    sbiterr_outreg <= sbiterr_out;
		    rdaddrecc_outreg <= rdaddrecc_out;
		end
		
		
		if (rstreg_priority_a_int == 0) begin // Virtex5 behavior
		
		    if (regcea_in == 1'b1) begin
 			if (rstrega_in == 1'b1) begin
			    
			    doa_outreg <= SRVAL_A[0 +: ra_width];
			    
			    if (ra_width >= 8)
				dopa_outreg <= SRVAL_A[ra_width +: ra_widthp];
			    
			end
			else if (rstrega_in == 1'b0) begin
			    
			    doa_outreg <= doa_out;

			    if (ra_width >= 8)
				dopa_outreg <= dopa_out;
			    
			end
		    end // if (regcea_in == 1'b1)

		end // if (rstreg_priority_a_int == 1'b0)
		else begin

 		    if (rstrega_in == 1'b1) begin
			
			doa_outreg <= SRVAL_A[0 +: ra_width];
			
			if (ra_width >= 8)
			    dopa_outreg <= SRVAL_A[ra_width +: ra_widthp];
			
			end

		    else if (rstrega_in == 1'b0) begin

			if (regcea_in == 1'b1) begin
			    
			    doa_outreg <= doa_out;

			    if (ra_width >= 8)
				dopa_outreg <= dopa_out;
			    
			end
		    end
		end // else: !if(rstreg_priority_a_int == 1'b0)
		    
	    end // if (gsr_in == 1'b0)

	end // if (DOA_REG == 1)

    end // always @ (posedge clka_in or posedge gsr_in)
    

    always @(temp_wire or doa_out_mux or dopa_out_mux or doa_outreg_mux or dopa_outreg_mux or dbiterr_out or dbiterr_outreg or sbiterr_out or sbiterr_outreg or rdaddrecc_out or rdaddrecc_outreg) begin

	case (DOA_REG)

	    0 : begin
		    dbiterr_out_out = dbiterr_out;
		    sbiterr_out_out = sbiterr_out;
		    rdaddrecc_out_out = rdaddrecc_out;
	            doa_out_out[0 +: ra_width] = doa_out_mux[0 +: ra_width];

		    if (ra_width >= 8)
			dopa_out_out[0 +: ra_widthp] = dopa_out_mux[0 +: ra_widthp];

	        end
	    1 : begin
		    dbiterr_out_out = dbiterr_outreg;
		    sbiterr_out_out = sbiterr_outreg;
	            doa_out_out[0 +: ra_width] = doa_outreg_mux[0 +: ra_width];
		    rdaddrecc_out_out = rdaddrecc_outreg;
		
		    if (ra_width >= 8)
			dopa_out_out[0 +: ra_widthp] = dopa_outreg_mux[0 +: ra_widthp];

	        end
	    default : begin
	                  $display("Attribute Syntax Error : The attribute DOA_REG on RAMB36E1 instance %m is set to %2d.  Legal values for this attribute are 0 or 1.", DOA_REG);
	                  $finish;
	              end

	endcase

    end // always @ (doa_out_mux or dopa_out_mux or doa_outreg_mux or dopa_outreg_mux or dbiterr_out or dbiterr_outreg or sbiterr_out or sbiterr_outreg)
    

// ***** Output Registers **** Port B *****
    always @(posedge clkb_in or posedge gsr_in) begin

	if (DOB_REG == 1) begin
	
	    if (gsr_in == 1'b1) begin

		dob_outreg <= INIT_B[0 +: rb_width];
		
		if (rb_width >= 8)
		    dopb_outreg <= INIT_B[rb_width +: rb_widthp];
		
	    end
	    else if (gsr_in == 1'b0) begin

		if (rstreg_priority_b_int == 0) begin // Virtex5 behavior
		
		    if (regceb_in == 1'b1) begin
 			if (rstregb_in == 1'b1) begin
			    
			    dob_outreg <= SRVAL_B[0 +: rb_width];
			    
			    if (rb_width >= 8)
				dopb_outreg <= SRVAL_B[rb_width +: rb_widthp];
			    
			end
			else if (rstregb_in == 1'b0) begin
			    
			    dob_outreg <= dob_out;

			    if (rb_width >= 8)
				dopb_outreg <= dopb_out;
			    
			end
		    end // if (regceb_in == 1'b1)

		end // if (rstreg_priority_b_int == 1'b0)
		else begin

 		    if (rstregb_in == 1'b1) begin
			
			dob_outreg <= SRVAL_B[0 +: rb_width];
			
			if (rb_width >= 8)
			    dopb_outreg <= SRVAL_B[rb_width +: rb_widthp];
			
			end

		    else if (rstregb_in == 1'b0) begin

			if (regceb_in == 1'b1) begin
			    
			    dob_outreg <= dob_out;

			    if (rb_width >= 8)
				dopb_outreg <= dopb_out;
			    
			end
		    end
		end // else: !if(rstreg_priority_b_int == 1'b0)

	    end // if (gsr_in == 1'b0)

	end // if (DOB_REG == 1)

    end // always @ (posedge clkb_in or posedge gsr_in)
    

    always @(temp_wire or dob_out_mux or dopb_out_mux or dob_outreg_mux or dopb_outreg_mux) begin

	case (DOB_REG)
	    
	    0 : begin
                    dob_out_out[0 +: rb_width] = dob_out_mux[0 +: rb_width];
		
		    if (rb_width >= 8)
			dopb_out_out[0 +: rb_widthp] = dopb_out_mux[0 +: rb_widthp];
	        end
	    1 : begin
	            dob_out_out[0 +: rb_width] = dob_outreg_mux[0 +: rb_width];
		    
		    if (rb_width >= 8)
			dopb_out_out[0 +: rb_widthp] = dopb_outreg_mux[0 +: rb_widthp];

	        end
	    default : begin
	                  $display("Attribute Syntax Error : The attribute DOB_REG on RAMB36E1 instance %m is set to %2d.  Legal values for this attribute are 0 or 1.", DOB_REG);
	                  $finish;
	              end

	endcase

    end // always @ (dob_out_mux or dopb_out_mux or dob_outreg_mux or dopb_outreg_mux)

    
endmodule // RB36_INTERNAL_VLOG

`endcelldefine
    
// end of RB36_INTERNAL_VLOG - Note: Not an user primitive
