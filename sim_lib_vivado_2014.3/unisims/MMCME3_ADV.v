///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor      : Xilinx
// \   \   \/     Version     : 2014.3
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                       Advanced Mixed Mode Clock Manager (MMCM)
// /___/   /\     Filename    : MMCME3_ADV.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  03/21/2013   - YML changes
//  03/22/2013   - 708090 - Change error to Warning
//  03/27/2013   - Update with writer notation
//  04/04/2013   - 709484 - Add PFD check
//  04/04/2013   - 709093 - Fix periods after DRP
//  04/12/2013   - invertible pin changes
//  04/22/2013   - 713991 - Fix cddcdone assertion
//  04/24/2013   - 709726 - fix vcoflag
//  05/07/2013   - 714319 - fix phase warning
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module MMCME3_ADV #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter BANDWIDTH = "OPTIMIZED",
  parameter real CLKFBOUT_MULT_F = 5.000,
  parameter real CLKFBOUT_PHASE = 0.000,
  parameter CLKFBOUT_USE_FINE_PS = "FALSE",
  parameter real CLKIN1_PERIOD = 0.000,
  parameter real CLKIN2_PERIOD = 0.000,
`ifdef XIL_TIMING
  parameter real CLKIN_FREQ_MAX = 1066.000,
  parameter real CLKIN_FREQ_MIN = 10.000,
`endif
  parameter real CLKOUT0_DIVIDE_F = 1.000,
  parameter real CLKOUT0_DUTY_CYCLE = 0.500,
  parameter real CLKOUT0_PHASE = 0.000,
  parameter CLKOUT0_USE_FINE_PS = "FALSE",
  parameter integer CLKOUT1_DIVIDE = 1,
  parameter real CLKOUT1_DUTY_CYCLE = 0.500,
  parameter real CLKOUT1_PHASE = 0.000,
  parameter CLKOUT1_USE_FINE_PS = "FALSE",
  parameter integer CLKOUT2_DIVIDE = 1,
  parameter real CLKOUT2_DUTY_CYCLE = 0.500,
  parameter real CLKOUT2_PHASE = 0.000,
  parameter CLKOUT2_USE_FINE_PS = "FALSE",
  parameter integer CLKOUT3_DIVIDE = 1,
  parameter real CLKOUT3_DUTY_CYCLE = 0.500,
  parameter real CLKOUT3_PHASE = 0.000,
  parameter CLKOUT3_USE_FINE_PS = "FALSE",
  parameter CLKOUT4_CASCADE = "FALSE",
  parameter integer CLKOUT4_DIVIDE = 1,
  parameter real CLKOUT4_DUTY_CYCLE = 0.500,
  parameter real CLKOUT4_PHASE = 0.000,
  parameter CLKOUT4_USE_FINE_PS = "FALSE",
  parameter integer CLKOUT5_DIVIDE = 1,
  parameter real CLKOUT5_DUTY_CYCLE = 0.500,
  parameter real CLKOUT5_PHASE = 0.000,
  parameter CLKOUT5_USE_FINE_PS = "FALSE",
  parameter integer CLKOUT6_DIVIDE = 1,
  parameter real CLKOUT6_DUTY_CYCLE = 0.500,
  parameter real CLKOUT6_PHASE = 0.000,
  parameter CLKOUT6_USE_FINE_PS = "FALSE",
`ifdef XIL_TIMING
  parameter real CLKPFD_FREQ_MAX = 550.000,
  parameter real CLKPFD_FREQ_MIN = 10.000,
`endif
  parameter COMPENSATION = "AUTO",
  parameter integer DIVCLK_DIVIDE = 1,
  parameter [0:0] IS_CLKFBIN_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN1_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN2_INVERTED = 1'b0,
  parameter [0:0] IS_CLKINSEL_INVERTED = 1'b0,
  parameter [0:0] IS_PSEN_INVERTED = 1'b0,
  parameter [0:0] IS_PSINCDEC_INVERTED = 1'b0,
  parameter [0:0] IS_PWRDWN_INVERTED = 1'b0,
  parameter [0:0] IS_RST_INVERTED = 1'b0,
  parameter real REF_JITTER1 = 0.010,
  parameter real REF_JITTER2 = 0.010,
  parameter SS_EN = "FALSE",
  parameter SS_MODE = "CENTER_HIGH",
  parameter integer SS_MOD_PERIOD = 10000,
`ifdef XIL_TIMING
  parameter STARTUP_WAIT = "FALSE",
  parameter real VCOCLK_FREQ_MAX = 1600.000,
  parameter real VCOCLK_FREQ_MIN = 600.000
`else
  parameter STARTUP_WAIT = "FALSE"
`endif
)(
  output CDDCDONE,
  output CLKFBOUT,
  output CLKFBOUTB,
  output CLKFBSTOPPED,
  output CLKINSTOPPED,
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
  output [15:0] DO,
  output DRDY,
  output LOCKED,
  output PSDONE,

  input CDDCREQ,
  input CLKFBIN,
  input CLKIN1,
  input CLKIN2,
  input CLKINSEL,
  input [6:0] DADDR,
  input DCLK,
  input DEN,
  input [15:0] DI,
  input DWE,
  input PSCLK,
  input PSEN,
  input PSINCDEC,
  input PWRDWN,
  input RST
);
  
// define constants
  localparam MODULE_NAME = "MMCME3_ADV";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  localparam BANDWIDTH_HIGH = 1;
  localparam BANDWIDTH_LOW = 2;
  localparam BANDWIDTH_OPTIMIZED = 0;
  localparam CLKFBOUT_USE_FINE_PS_FALSE = 0;
  localparam CLKFBOUT_USE_FINE_PS_TRUE = 1;
  localparam CLKOUT0_USE_FINE_PS_FALSE = 0;
  localparam CLKOUT0_USE_FINE_PS_TRUE = 1;
  localparam CLKOUT1_USE_FINE_PS_FALSE = 0;
  localparam CLKOUT1_USE_FINE_PS_TRUE = 1;
  localparam CLKOUT2_USE_FINE_PS_FALSE = 0;
  localparam CLKOUT2_USE_FINE_PS_TRUE = 1;
  localparam CLKOUT3_USE_FINE_PS_FALSE = 0;
  localparam CLKOUT3_USE_FINE_PS_TRUE = 1;
  localparam CLKOUT4_CASCADE_FALSE = 0;
  localparam CLKOUT4_CASCADE_TRUE = 1;
  localparam CLKOUT4_USE_FINE_PS_FALSE = 0;
  localparam CLKOUT4_USE_FINE_PS_TRUE = 1;
  localparam CLKOUT5_USE_FINE_PS_FALSE = 0;
  localparam CLKOUT5_USE_FINE_PS_TRUE = 1;
  localparam CLKOUT6_USE_FINE_PS_FALSE = 0;
  localparam CLKOUT6_USE_FINE_PS_TRUE = 1;
  localparam COMPENSATION_AUTO = 0;
  localparam COMPENSATION_BUF_IN = 1;
  localparam COMPENSATION_EXTERNAL = 2;
  localparam COMPENSATION_INTERNAL = 3;
  localparam COMPENSATION_ZHOLD = 4;
  localparam SS_EN_FALSE = 0;
  localparam SS_EN_TRUE = 1;
  localparam SS_MODE_CENTER_HIGH = 0;
  localparam SS_MODE_CENTER_LOW = 1;
  localparam SS_MODE_DOWN_HIGH = 2;
  localparam SS_MODE_DOWN_LOW = 3;
  localparam STARTUP_WAIT_FALSE = 0;
  localparam STARTUP_WAIT_TRUE = 1;

`ifndef XIL_TIMING
  localparam real CLKIN_FREQ_MAX = 1066.0;
  localparam real CLKIN_FREQ_MIN = 10.0;
  localparam real CLKPFD_FREQ_MAX = 550.0;
  localparam real CLKPFD_FREQ_MIN = 10.0;
  localparam real VCOCLK_FREQ_MAX = 1600.0;
  localparam real VCOCLK_FREQ_MIN = 600.0;
`endif

// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
`ifdef XIL_DR
  `include "MMCME3_ADV_dr.v"
`else
  localparam [72:1] BANDWIDTH_REG = BANDWIDTH;
  localparam real CLKFBOUT_MULT_F_REG = CLKFBOUT_MULT_F;
  localparam real CLKFBOUT_PHASE_REG = CLKFBOUT_PHASE;
  localparam [40:1] CLKFBOUT_USE_FINE_PS_REG = CLKFBOUT_USE_FINE_PS;
  localparam real CLKIN1_PERIOD_REG = CLKIN1_PERIOD;
  localparam real CLKIN2_PERIOD_REG = CLKIN2_PERIOD;
  localparam real CLKIN_FREQ_MAX_REG = CLKIN_FREQ_MAX;
  localparam real CLKIN_FREQ_MIN_REG = CLKIN_FREQ_MIN;
  localparam real CLKOUT0_DIVIDE_F_REG = CLKOUT0_DIVIDE_F;
  localparam real CLKOUT0_DUTY_CYCLE_REG = CLKOUT0_DUTY_CYCLE;
  localparam real CLKOUT0_PHASE_REG = CLKOUT0_PHASE;
  localparam [40:1] CLKOUT0_USE_FINE_PS_REG = CLKOUT0_USE_FINE_PS;
  localparam [7:0] CLKOUT1_DIVIDE_REG = CLKOUT1_DIVIDE;
  localparam real CLKOUT1_DUTY_CYCLE_REG = CLKOUT1_DUTY_CYCLE;
  localparam real CLKOUT1_PHASE_REG = CLKOUT1_PHASE;
  localparam [40:1] CLKOUT1_USE_FINE_PS_REG = CLKOUT1_USE_FINE_PS;
  localparam [7:0] CLKOUT2_DIVIDE_REG = CLKOUT2_DIVIDE;
  localparam real CLKOUT2_DUTY_CYCLE_REG = CLKOUT2_DUTY_CYCLE;
  localparam real CLKOUT2_PHASE_REG = CLKOUT2_PHASE;
  localparam [40:1] CLKOUT2_USE_FINE_PS_REG = CLKOUT2_USE_FINE_PS;
  localparam [7:0] CLKOUT3_DIVIDE_REG = CLKOUT3_DIVIDE;
  localparam real CLKOUT3_DUTY_CYCLE_REG = CLKOUT3_DUTY_CYCLE;
  localparam real CLKOUT3_PHASE_REG = CLKOUT3_PHASE;
  localparam [40:1] CLKOUT3_USE_FINE_PS_REG = CLKOUT3_USE_FINE_PS;
  localparam [40:1] CLKOUT4_CASCADE_REG = CLKOUT4_CASCADE;
  localparam [7:0] CLKOUT4_DIVIDE_REG = CLKOUT4_DIVIDE;
  localparam real CLKOUT4_DUTY_CYCLE_REG = CLKOUT4_DUTY_CYCLE;
  localparam real CLKOUT4_PHASE_REG = CLKOUT4_PHASE;
  localparam [40:1] CLKOUT4_USE_FINE_PS_REG = CLKOUT4_USE_FINE_PS;
  localparam [7:0] CLKOUT5_DIVIDE_REG = CLKOUT5_DIVIDE;
  localparam real CLKOUT5_DUTY_CYCLE_REG = CLKOUT5_DUTY_CYCLE;
  localparam real CLKOUT5_PHASE_REG = CLKOUT5_PHASE;
  localparam [40:1] CLKOUT5_USE_FINE_PS_REG = CLKOUT5_USE_FINE_PS;
  localparam [7:0] CLKOUT6_DIVIDE_REG = CLKOUT6_DIVIDE;
  localparam real CLKOUT6_DUTY_CYCLE_REG = CLKOUT6_DUTY_CYCLE;
  localparam real CLKOUT6_PHASE_REG = CLKOUT6_PHASE;
  localparam [40:1] CLKOUT6_USE_FINE_PS_REG = CLKOUT6_USE_FINE_PS;
  localparam real CLKPFD_FREQ_MAX_REG = CLKPFD_FREQ_MAX;
  localparam real CLKPFD_FREQ_MIN_REG = CLKPFD_FREQ_MIN;
  localparam [64:1] COMPENSATION_REG = COMPENSATION;
  localparam [6:0] DIVCLK_DIVIDE_REG = DIVCLK_DIVIDE;
  localparam [0:0] IS_CLKFBIN_INVERTED_REG = IS_CLKFBIN_INVERTED;
  localparam [0:0] IS_CLKIN1_INVERTED_REG = IS_CLKIN1_INVERTED;
  localparam [0:0] IS_CLKIN2_INVERTED_REG = IS_CLKIN2_INVERTED;
  localparam [0:0] IS_CLKINSEL_INVERTED_REG = IS_CLKINSEL_INVERTED;
  localparam [0:0] IS_PSEN_INVERTED_REG = IS_PSEN_INVERTED;
  localparam [0:0] IS_PSINCDEC_INVERTED_REG = IS_PSINCDEC_INVERTED;
  localparam [0:0] IS_PWRDWN_INVERTED_REG = IS_PWRDWN_INVERTED;
  localparam [0:0] IS_RST_INVERTED_REG = IS_RST_INVERTED;
  localparam real REF_JITTER1_REG = REF_JITTER1;
  localparam real REF_JITTER2_REG = REF_JITTER2;
  localparam [40:1] SS_EN_REG = SS_EN;
  localparam [88:1] SS_MODE_REG = SS_MODE;
  localparam [15:0] SS_MOD_PERIOD_REG = SS_MOD_PERIOD;
  localparam [40:1] STARTUP_WAIT_REG = STARTUP_WAIT;
  localparam real VCOCLK_FREQ_MAX_REG = VCOCLK_FREQ_MAX;
  localparam real VCOCLK_FREQ_MIN_REG = VCOCLK_FREQ_MIN;
`endif

  wire IS_CLKFBIN_INVERTED_BIN;
  wire IS_CLKIN1_INVERTED_BIN;
  wire IS_CLKIN2_INVERTED_BIN;
  wire IS_CLKINSEL_INVERTED_BIN;
  wire IS_PSEN_INVERTED_BIN;
  wire IS_PSINCDEC_INVERTED_BIN;
  wire IS_PWRDWN_INVERTED_BIN;
  wire IS_RST_INVERTED_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;
  tri0 glblGSR = glbl.GSR;
  reg trig_attr_chk=1'b0;

  reg CDDCDONE_out;
  wire CLKFBOUTB_out;
  reg CLKFBOUT_out;
  reg CLKFBSTOPPED_out = 0;
  reg CLKINSTOPPED_out = 0;
  wire CLKOUT0B_out;
  reg CLKOUT0_out;
  wire CLKOUT1B_out;
  reg CLKOUT1_out;
  wire CLKOUT2B_out;
  reg CLKOUT2_out;
  wire CLKOUT3B_out;
  reg CLKOUT3_out;
  reg CLKOUT4_out;
  reg CLKOUT5_out;
  reg CLKOUT6_out;
  reg DRDY_out;
  reg LOCKED_out = 1'b0;
  reg PSDONE_out;
  reg [15:0] DO_out;

  wire CDDCREQ_in;
  wire CLKFBIN_in;
  wire CLKIN1_in;
  wire CLKIN2_in;
  wire CLKINSEL_in;
  wire DCLK_in;
  wire DEN_in;
  wire DWE_in;
  wire PSCLK_in;
  wire PSEN_in;
  wire PSINCDEC_in;
  wire PWRDWN_in;
  wire RST_in;
  wire [15:0] DI_in;
  wire [6:0] DADDR_in;

  wire CDDCREQ_delay;
  wire CLKFBIN_delay;
  wire CLKIN1_delay;
  wire CLKIN2_delay;
  wire CLKINSEL_delay;
  wire DCLK_delay;
  wire DEN_delay;
  wire DWE_delay;
  wire PSCLK_delay;
  wire PSEN_delay;
  wire PSINCDEC_delay;
  wire PWRDWN_delay;
  wire RST_delay;
  wire [15:0] DI_delay;
  wire [6:0] DADDR_delay;

  assign CDDCDONE = CDDCDONE_out;
  assign CLKFBOUT = CLKFBOUT_out;
  assign CLKFBOUTB = ~CLKFBOUT_out;
  assign CLKINSTOPPED = CLKINSTOPPED_out;
  assign CLKFBSTOPPED = CLKFBSTOPPED_out;
  assign CLKOUT0 =  CLKOUT0_out;
  assign CLKOUT0B =  ~CLKOUT0_out;
  assign CLKOUT1 =  CLKOUT1_out;
  assign CLKOUT1B =  ~CLKOUT1_out;
  assign CLKOUT2 =  CLKOUT2_out;
  assign CLKOUT2B =  ~CLKOUT2_out;
  assign CLKOUT3 =  CLKOUT3_out;
  assign CLKOUT3B =  ~CLKOUT3_out;
  assign CLKOUT4 =  CLKOUT4_out;
  assign CLKOUT5 =  CLKOUT5_out;
  assign CLKOUT6 =  CLKOUT6_out;
  assign DO = DO_out;
  assign DRDY = DRDY_out;
  assign LOCKED = LOCKED_out;
  assign PSDONE = PSDONE_out;

`ifdef XIL_TIMING
  reg notifier;
`endif

`ifndef XIL_TIMING // inputs with timing checks
  assign #(inclk_delay) DCLK_delay = DCLK;
  assign #(inclk_delay) PSCLK_delay = PSCLK;

  assign #(in_delay) DADDR_delay = DADDR;
  assign #(in_delay) DEN_delay = DEN;
  assign #(in_delay) DI_delay = DI;
  assign #(in_delay) DWE_delay = DWE;
  assign #(in_delay) PSEN_delay = PSEN;
  assign #(in_delay) PSINCDEC_delay = PSINCDEC;
`endif

// inputs with no timing checks
  assign #(in_delay) CDDCREQ_delay = CDDCREQ;
  assign #(in_delay) CLKFBIN_delay = CLKFBIN;
  assign #(in_delay) CLKIN1_delay = CLKIN1;
  assign #(in_delay) CLKIN2_delay = CLKIN2;
  assign #(in_delay) CLKINSEL_delay = CLKINSEL;
  assign #(in_delay) PWRDWN_delay = PWRDWN;
  assign #(in_delay) RST_delay = RST;

  assign CDDCREQ_in = (CDDCREQ !== 1'bz) && CDDCREQ_delay; // rv 0
  assign CLKFBIN_in = (CLKFBIN !== 1'bz) && (CLKFBIN_delay ^ IS_CLKFBIN_INVERTED_BIN); // rv 0
  assign CLKIN1_in = (CLKIN1 !== 1'bz) && (CLKIN1_delay ^ IS_CLKIN1_INVERTED_BIN); // rv 0
  assign CLKIN2_in = (CLKIN2 !== 1'bz) && (CLKIN2_delay ^ IS_CLKIN2_INVERTED_BIN); // rv 0
  assign CLKINSEL_in = (CLKINSEL === 1'bz) || (CLKINSEL_delay ^ IS_CLKINSEL_INVERTED_BIN); // rv 1
  assign DADDR_in[0] = (DADDR[0] !== 1'bz) && DADDR_delay[0]; // rv 0
  assign DADDR_in[1] = (DADDR[1] !== 1'bz) && DADDR_delay[1]; // rv 0
  assign DADDR_in[2] = (DADDR[2] !== 1'bz) && DADDR_delay[2]; // rv 0
  assign DADDR_in[3] = (DADDR[3] !== 1'bz) && DADDR_delay[3]; // rv 0
  assign DADDR_in[4] = (DADDR[4] !== 1'bz) && DADDR_delay[4]; // rv 0
  assign DADDR_in[5] = (DADDR[5] !== 1'bz) && DADDR_delay[5]; // rv 0
  assign DADDR_in[6] = (DADDR[6] !== 1'bz) && DADDR_delay[6]; // rv 0
  assign DCLK_in = (DCLK !== 1'bz) && DCLK_delay; // rv 0
  assign DEN_in = (DEN !== 1'bz) && DEN_delay; // rv 0
  assign DI_in[0] = (DI[0] !== 1'bz) && DI_delay[0]; // rv 0
  assign DI_in[10] = (DI[10] !== 1'bz) && DI_delay[10]; // rv 0
  assign DI_in[11] = (DI[11] !== 1'bz) && DI_delay[11]; // rv 0
  assign DI_in[12] = (DI[12] !== 1'bz) && DI_delay[12]; // rv 0
  assign DI_in[13] = (DI[13] !== 1'bz) && DI_delay[13]; // rv 0
  assign DI_in[14] = (DI[14] !== 1'bz) && DI_delay[14]; // rv 0
  assign DI_in[15] = (DI[15] !== 1'bz) && DI_delay[15]; // rv 0
  assign DI_in[1] = (DI[1] !== 1'bz) && DI_delay[1]; // rv 0
  assign DI_in[2] = (DI[2] !== 1'bz) && DI_delay[2]; // rv 0
  assign DI_in[3] = (DI[3] !== 1'bz) && DI_delay[3]; // rv 0
  assign DI_in[4] = (DI[4] !== 1'bz) && DI_delay[4]; // rv 0
  assign DI_in[5] = (DI[5] !== 1'bz) && DI_delay[5]; // rv 0
  assign DI_in[6] = (DI[6] !== 1'bz) && DI_delay[6]; // rv 0
  assign DI_in[7] = (DI[7] !== 1'bz) && DI_delay[7]; // rv 0
  assign DI_in[8] = (DI[8] !== 1'bz) && DI_delay[8]; // rv 0
  assign DI_in[9] = (DI[9] !== 1'bz) && DI_delay[9]; // rv 0
  assign DWE_in = (DWE !== 1'bz) && DWE_delay; // rv 0
  assign PSCLK_in = (PSCLK !== 1'bz) && PSCLK_delay; // rv 0
  assign PSEN_in = (PSEN !== 1'bz) && (PSEN_delay ^ IS_PSEN_INVERTED_BIN); // rv 0
  assign PSINCDEC_in = (PSINCDEC !== 1'bz) && (PSINCDEC_delay ^ IS_PSINCDEC_INVERTED_BIN); // rv 0
  assign PWRDWN_in = (PWRDWN !== 1'bz) && (PWRDWN_delay ^ IS_PWRDWN_INVERTED_BIN); // rv 0
  assign RST_in = (RST !== 1'bz) && (RST_delay ^ IS_RST_INVERTED_BIN); // rv 0

  tri1 p_up;
  wire glock;
  localparam VCOCLK_FREQ_TARGET = 1000;
  localparam M_MIN = 2.000;
  localparam M_MAX = 64.000;
  localparam D_MIN = 1;
  localparam D_MAX = 106;
  localparam O_MIN = 1;
  localparam O_MAX = 128;
  localparam O_MAX_HT_LT = 64;
  localparam REF_CLK_JITTER_MAX = 1000;
  localparam REF_CLK_JITTER_SCALE = 0.1;
  localparam MAX_FEEDBACK_DELAY = 3.0;
  localparam MAX_FEEDBACK_DELAY_SCALE = 1.0;
  localparam ps_max = 55;
  localparam OSC_P2 = 250;

  real CLKOUT0_DIVIDE_F_RND;
  real CLKFBOUT_MULT_F_RND;

  integer pchk_tmp1, pchk_tmp2;
  integer clkfb_div_frac_int, clk0_div_frac_int, clkfb_div_fint, clk0_div_fint, clkvco_div_fint;
  integer clkfb_div_fint_tmp1, clkfb_div_fint_odd;
  integer clk0_div_fint_tmp1, clk0_div_fint_odd;
  real clkfb_div_frac, clk0_div_frac, clkvco_div_frac, clkfb_div_check, clkfb_div_check_diff, clk0_div_check, clk0_div_check_diff;
  reg clk0_frac_out, clkfbm1_frac_out;
  reg clk0_nf_out, clkfbm1_nf_out;
  integer  clk0_frac_en;
  integer  clkfb_frac_en;
  integer  clkfb_div_check_int, clk0_div_check_int, clkfb_div_adj, clk0_div_adj;
  integer  clkvco_frac_en;
  integer ps_in_init;
  reg psdone_out1;
  wire clk0_fps_en, clk1_fps_en, clk2_fps_en, clk3_fps_en, clk4_fps_en;
  wire clk5_fps_en, clk6_fps_en, clkfb_fps_en;
  reg fps_en=0, fps_clk_en=0;
  reg clkinstopped_out1;
  reg  clkin_hold_f = 0;
  reg clkinstopped_out_dly2 = 0, clkin_stop_f = 0;
  integer  period_avg_stpi = 0,  period_avg_stp = 0;
  real tmp_stp1, tmp_stp2;
  reg pd_stp_p = 0;
  reg vco_stp_f = 0;
  reg  psen_w = 0;
  reg clkinstopped_out_dly = 0;
  reg clkfb_stop_tmp, clkfbstopped_out1, clkin_stop_tmp;
  reg rst_clkinstopped = 0, rst_clkfbstopped = 0, rst_clkinstopped_tm = 0;
  reg rst_clkinstopped_rc = 0;
  reg rst_clkinstopped_lk, rst_clkfbstopped_lk;
  integer clkin_lost_cnt, clkfb_lost_cnt;
  reg  clkinstopped_hold = 0;
  integer ps_in_ps, ps_cnt;
  integer ps_in_ps_neg, ps_cnt_neg;
  reg clkout_ps, clkout_ps_tmp1, clkout_ps_tmp2;
  time clkout_ps_eg = 0;
  time clkout_ps_peg = 0;
  time clkout_ps_w = 0;
  reg clkvco_ps_tmp1, clkvco_ps_tmp2;
  reg  clkvco_ps_tmp2_en;
  wire clkout4_cascade_int;
  reg [6:0] daddr_lat;
  reg valid_daddr;
  reg drdy_out1;
  reg drp_lock;
  integer drp_lock_lat = 4;
  integer drp_lock_lat_cnt;
  reg [15:0] dr_sram [127:0];
  reg [160:0] tmp_string;
  reg rst_int;
  reg pwron_int;
  wire orig_rst_in,rst_in_o;
  reg locked_out1;
  wire locked_out_tmp;
  wire clk0_out, clkfbm1_out;
  reg  clk1_out, clk2_out, clk3_out, clk4_out, clk5_out;
  reg clkout_en, clkout_en1, clkout_en0, clkout_en0_tmp, clkout_en0_tmp1;
  integer clkout_en_val, clkout_en_t;
  integer  clkin_lock_cnt;
  integer clkout_en_time, locked_en_time, lock_cnt_max;
  integer pll_lock_time, lock_period_time;
  reg clkvco_lk_osc,  clkvco, clkvco_lk_tmp, clkvco_lk_tmp_en;
  reg clkvco_ps_tmp2_pg;
  reg clkvco_lk_dly_tmp;
  reg clkvco_lk_en;
  reg clkvco_lk;
  reg fbclk_tmp;
  reg clk_osc, clkin_p, clkfb_p;
  reg clkinstopped_vco_f;
  time rst_edge, rst_ht;
  reg fb_delay_found, fb_delay_found_tmp;
  reg clkfb_tst;
  real fb_delay_max;
  time fb_delay, clkvco_delay, val_tmp, dly_tmp, fbm1_comp_delay, fbm1_comp_delay_tmp;
  time dly_tmp1, tmp_ps_val2;
  integer dly_tmp_int, tmp_ps_val1;
  time clkin_edge, delay_edge;
  real     period_clkin, clkin_period_tmp;
  integer  clkin_period_tmp_t;
  integer  clkin_period [4:0];
  integer  period_vco, period_vco_half, period_vco_half1, period_vco_half_rm;
  real     period_vco_rl;
  integer  period_vco_half_rm1, period_vco_half_rm2;
  real     cmpvco = 0.0;
  real     clkvco_pdrm;
  integer  period_vco_mf;
  integer  period_vco_tmp;
  integer  period_vco_rm, period_vco_cmp_cnt, clkvco_rm_cnt;
  integer  period_vco_cmp_flag;
  integer  period_vco_max, period_vco_min;
  integer  period_vco1, period_vco2, period_vco3, period_vco4;
  integer  period_vco5, period_vco6, period_vco7;
  integer  period_vco_target, period_vco_target_half;
  integer  period_fb, period_avg;
  integer  clk0_frac_lt, clk0_frac_ht;
  integer  clkfb_frac_lt, clkfb_frac_ht;
  integer period_ps, period_ps_old;
  reg  ps_lock, ps_lock_dly;
  real    clkfbm1pm_rl;
  real    tmp_real;
  integer ik0, ik1, ik2, ik3, ik4, ib, i, j;
  integer md_product, m_product, m_product2,  clkin_stop_max, clkfb_stop_max;
  integer mf_product, clk0f_product;
  integer clkin_lost_val, clkfb_lost_val, clkin_lost_val_lk;
  time pll_locked_delay, clkin_dly_t, clkfb_dly_t;
  wire pll_unlock, pll_unlock1;
  reg pll_locked_tmp1, pll_locked_tmp2;
  reg lock_period;
  reg pll_locked_tm, unlock_recover;
  reg clkpll_jitter_unlock;
  integer  clkin_jit, REF_CLK_JITTER_MAX_tmp;
  wire init_trig,  clkpll_r, clk0in, clk1in, clk2in, clk3in, clk4in, clk5in, clk6in;
  reg clkpll_tmp1, clkpll;
  wire clkfbm1in, clkfbm1ps_en;
  reg chk_ok;
  wire clk0ps_en, clk1ps_en, clk2ps_en, clk3ps_en, clk4ps_en, clk5ps_en, clk6ps_en;
  reg [7:0] clkout_mux, clkout_ps_mux;
  wire [7:0] clk0_sel_mux, clkfb_sel_mux;
  reg [2:0] clk0pm_sel, clk1pm_sel, clk2pm_sel, clk3pm_sel, clk4pm_sel, clk5pm_sel;
  reg [2:0] clk0pmf_sel, clk0pmr_sel, clkfbm1pmf_sel, clkfbm1pmr_sel;
  reg       clkfbout_frac_wf_r, clk0_frac_wf_r, clk0_frac_wf_f, clkfbout_frac_wf_f;
  reg       clkfbin_edge, clkfbin_nocnt;
  reg [2:0] clkfb_frac, clk0_frac;
  reg clk0_cddcen, clk1_cddcen, clk2_cddcen, clk3_cddcen, clk4_cddcen, clk5_cddcen, clk6_cddcen;
  integer clkfbm1_odd_frac, clk0_odd_frac;
  real tmp_fbp;
  real tmp_f0p;
  integer tmp_fbo, tmp_fbq;
  integer tmp_f0o, tmp_f0q;
  real clk0_f_div;
  reg [5:0] clkfbin_ht, clkfbin_lt;
  reg [2:0] clk5fpm_sel, clk6fpm_sel;
  wire [2:0] clk0pm_sel1, clk5pm_sel1, clk6pm_sel1, clkfbm1pm_sel1;
  reg [2:0] clk6pm_sel, clkfbm1pm_sel;
  reg [2:0]  clkfbm1r_sel, clk0pm_fsel, clk0pm_rsel, clkfbm1f_sel;
  integer clk0pm_sel_int, clkfbm1pm_sel_int;
  reg clk0_edge, clk1_edge, clk2_edge, clk3_edge, clk4_edge, clk5_edge, clk6_edge;
  reg clkfbm1_edge, clkfbm2_edge, clkind_edge;
  reg clk0_nocnt, clk1_nocnt, clk2_nocnt, clk3_nocnt, clk4_nocnt, clk5_nocnt;
  reg clk6_nocnt, clkfbm1_nocnt, clkfbm2_nocnt, clkind_nocnt;
  reg clkfbtmp_nocnti;
  reg clkind_edgei, clkind_nocnti;
  reg [5:0] clkfbm1_fht, clkfbm1_flt;
  reg [5:0] clk0_fht, clk0_flt;
  reg [5:0] clk0_dly_cnt, clkout0_dly;
  reg [5:0] clk1_dly_cnt, clkout1_dly;
  reg [5:0] clk2_dly_cnt, clkout2_dly;
  reg [5:0] clk3_dly_cnt, clkout3_dly;
  reg [5:0] clk4_dly_cnt, clkout4_dly;
  reg [5:0] clk5_dly_cnt, clkout5_dly;
  reg [5:0] clk6_dly_cnt, clkout6_dly;
  reg [6:0] clk0_ht, clk0_lt;
  reg [6:0] clk1_ht, clk1_lt;
  reg [6:0] clk2_ht, clk2_lt;
  reg [6:0] clk3_ht, clk3_lt;
  reg [6:0] clk4_ht, clk4_lt;
  reg [6:0] clk5_ht, clk5_lt;
  reg [6:0] clk6_ht, clk6_lt;
  reg [5:0] clkfbm1_dly_cnt, clkfbm1_dly;
  reg [6:0] clkfbm1_ht, clkfbm1_lt;
  reg [6:0] clkfbm2_ht, clkfbm2_lt;
  reg [7:0] clkind_ht, clkind_lt;
  reg [7:0] clkind_hti, clkind_lti;
  reg [7:0] clk0_ht1, clk0_cnt, clk0_div, clk0_div1;
  reg [7:0] clk1_ht1, clk1_cnt, clk1_div, clk1_div1;
  reg [7:0] clk2_ht1, clk2_cnt, clk2_div, clk2_div1;
  reg [7:0] clk3_ht1, clk3_cnt, clk3_div, clk3_div1;
  reg [7:0] clk4_ht1, clk4_cnt, clk4_div, clk4_div1;
  reg [7:0] clk5_ht1, clk5_cnt, clk5_div, clk5_div1;
  reg [7:0] clk6_ht1, clk6_cnt, clk6_div, clk6_div1;
  reg [7:0] clkfbm1_ht1, clkfbm1_cnt, clkfbm1_div, clkfbm1_div1;
  real  clkfbm1_f_div, clkfbm1_div_t;
  integer clkfbm1_div_t_int;
  reg [7:0] clkfbtmp_divi, clkfbtmp_hti, clkfbtmp_lti;
  reg [7:0] clkfbm2_ht1, clkfbm2_cnt, clkfbm2_div, clkfbm2_div1;
  reg [7:0]  clkind_div, clkind_divi, clkind_div1, clkind_cnt, clkind_ht1;
  reg       clkind_out, clkind_out_tmp;
  reg [3:0] pll_cp, pll_res;
  reg [1:0] pll_lfhf;
  reg [1:0] pll_cpres = 2'b01;
  reg [4:0] drp_lock_ref_dly;
  reg [4:0] drp_lock_fb_dly;
  reg [9:0] drp_lock_cnt;
  reg [9:0] drp_unlock_cnt;
  reg [9:0] drp_lock_sat_high;
  wire  clkinsel_tmp;
  reg init_chk;
  real  clkin_chk_t1, clkin_chk_t2;
  real  clkin_chk_t1_r, clkin_chk_t2_r;
  integer   clkin_chk_t1_i, clkin_chk_t2_i;
  real    clkvco_freq_init_chk;
  real    clkpfd_freq_init_chk;
  reg rst_clkinsel_flag = 0;
  reg clkfbm2_out, clkfbm2_out_tmp, clk6_out;
  wire startup_wait_sig;
  wire [15:0] do_out1;
  wire pwrdwn_in1;
  reg pwrdwn_in1_h = 0;
  reg rst_input_r_h = 0;
  reg pchk_clr = 0;
  reg psincdec_chg = 0;
  reg psincdec_chg_tmp = 0;
  wire rst_input;
  real clkfb_sdivide;
  integer clkfb_sdivide_int, clkfb_sevent_part_high;
  integer clkfb_sevent_part_low, clkfb_sodd, clkfb_sodd_and_frac;
  integer clkfb_slt, clkfb_sht, clkfb_sfrac_2;
  reg [2:0] clkfbpmf_sel, clkfbpmr_sel;
  real clkfb_sa, clkfb_sb, clkfb_sphase;
  integer clkfb_sdt_tmp;
  integer clkfb_sdt, clkfb_pm_rise_overwriting, clkfb_pm_fall_overwriting;
  integer clkfb_pm_fall_overwriting_2nd, clkfb_pm_rise_overwriting_2nd;
  real clk0_sdivide;
  integer clk0_sdivide_int, clk0_sevent_part_high;
  integer clk0_sevent_part_low, clk0_sodd, clk0_sodd_and_frac;
  integer clk0_slt, clk0_sht, clk0_sfrac_2;
  reg clk0out_frac_wf_r, clk0out_frac_wf_f;
  real clk0_sa, clk0_sb, clk0_sphase;
  integer clk0_sdt_tmp, clk0_sdt, clk0_pm_rise_overwriting, clk0_pm_fall_overwriting;
  integer clk0_pm_fall_overwriting_2nd, clk0_pm_rise_overwriting_2nd;
  reg vcoflag = 0;


  always @(locked_out1)
    LOCKED_out =  locked_out1;
  always @(drdy_out1)
    DRDY_out =  drdy_out1;
  always @(do_out1)
    DO_out =  do_out1;
  always @(psdone_out1)
    PSDONE_out =  psdone_out1;

  assign BANDWIDTH_BIN =
    (BANDWIDTH_REG == "OPTIMIZED") ? BANDWIDTH_OPTIMIZED :
    (BANDWIDTH_REG == "HIGH") ? BANDWIDTH_HIGH :
    (BANDWIDTH_REG == "LOW") ? BANDWIDTH_LOW :
     BANDWIDTH_OPTIMIZED;

  assign CLKFBOUT_MULT_F_BIN = CLKFBOUT_MULT_F_REG * 1000;

  assign CLKFBOUT_PHASE_BIN = CLKFBOUT_PHASE_REG * 1000;

  assign clkfb_fps_en =
    (CLKFBOUT_USE_FINE_PS_REG == "FALSE") ? CLKFBOUT_USE_FINE_PS_FALSE :
    (CLKFBOUT_USE_FINE_PS_REG == "TRUE") ? CLKFBOUT_USE_FINE_PS_TRUE :
     CLKFBOUT_USE_FINE_PS_FALSE;

  assign CLKIN1_PERIOD_BIN = CLKIN1_PERIOD_REG * 1000;

  assign CLKIN2_PERIOD_BIN = CLKIN2_PERIOD_REG * 1000;

  assign CLKIN_FREQ_MAX_BIN = CLKIN_FREQ_MAX_REG * 1000;

  assign CLKIN_FREQ_MIN_BIN = CLKIN_FREQ_MIN_REG * 1000;

  assign CLKOUT0_DIVIDE_F_BIN = CLKOUT0_DIVIDE_F_REG * 1000;

  assign CLKOUT0_DUTY_CYCLE_BIN = CLKOUT0_DUTY_CYCLE_REG * 1000;

  assign CLKOUT0_PHASE_BIN = CLKOUT0_PHASE_REG * 1000;

  assign clk0_fps_en =
    (CLKOUT0_USE_FINE_PS_REG == "FALSE") ? CLKOUT0_USE_FINE_PS_FALSE :
    (CLKOUT0_USE_FINE_PS_REG == "TRUE") ? CLKOUT0_USE_FINE_PS_TRUE :
     CLKOUT0_USE_FINE_PS_FALSE;

  assign CLKOUT1_DIVIDE_BIN = CLKOUT1_DIVIDE_REG;

  assign CLKOUT1_DUTY_CYCLE_BIN = CLKOUT1_DUTY_CYCLE_REG * 1000;

  assign CLKOUT1_PHASE_BIN = CLKOUT1_PHASE_REG * 1000;

  assign clk1_fps_en =
    (CLKOUT1_USE_FINE_PS_REG == "FALSE") ? CLKOUT1_USE_FINE_PS_FALSE :
    (CLKOUT1_USE_FINE_PS_REG == "TRUE") ? CLKOUT1_USE_FINE_PS_TRUE :
     CLKOUT1_USE_FINE_PS_FALSE;

  assign CLKOUT2_DIVIDE_BIN = CLKOUT2_DIVIDE_REG;

  assign CLKOUT2_DUTY_CYCLE_BIN = CLKOUT2_DUTY_CYCLE_REG * 1000;

  assign CLKOUT2_PHASE_BIN = CLKOUT2_PHASE_REG * 1000;

  assign clk2_fps_en =
    (CLKOUT2_USE_FINE_PS_REG == "FALSE") ? CLKOUT2_USE_FINE_PS_FALSE :
    (CLKOUT2_USE_FINE_PS_REG == "TRUE") ? CLKOUT2_USE_FINE_PS_TRUE :
     CLKOUT2_USE_FINE_PS_FALSE;

  assign CLKOUT3_DIVIDE_BIN = CLKOUT3_DIVIDE_REG;

  assign CLKOUT3_DUTY_CYCLE_BIN = CLKOUT3_DUTY_CYCLE_REG * 1000;

  assign CLKOUT3_PHASE_BIN = CLKOUT3_PHASE_REG * 1000;

  assign clk3_fps_en =
    (CLKOUT3_USE_FINE_PS_REG == "FALSE") ? CLKOUT3_USE_FINE_PS_FALSE :
    (CLKOUT3_USE_FINE_PS_REG == "TRUE") ? CLKOUT3_USE_FINE_PS_TRUE :
     CLKOUT3_USE_FINE_PS_FALSE;

  assign clkout4_cascade_int =
    (CLKOUT4_CASCADE_REG == "FALSE") ? CLKOUT4_CASCADE_FALSE :
    (CLKOUT4_CASCADE_REG == "TRUE") ? CLKOUT4_CASCADE_TRUE :
     CLKOUT4_CASCADE_FALSE;

  assign CLKOUT4_DIVIDE_BIN = CLKOUT4_DIVIDE_REG;

  assign CLKOUT4_DUTY_CYCLE_BIN = CLKOUT4_DUTY_CYCLE_REG * 1000;

  assign CLKOUT4_PHASE_BIN = CLKOUT4_PHASE_REG * 1000;

  assign clk4_fps_en =
    (CLKOUT4_USE_FINE_PS_REG == "FALSE") ? CLKOUT4_USE_FINE_PS_FALSE :
    (CLKOUT4_USE_FINE_PS_REG == "TRUE") ? CLKOUT4_USE_FINE_PS_TRUE :
     CLKOUT4_USE_FINE_PS_FALSE;

  assign CLKOUT5_DIVIDE_BIN = CLKOUT5_DIVIDE_REG;

  assign CLKOUT5_DUTY_CYCLE_BIN = CLKOUT5_DUTY_CYCLE_REG * 1000;

  assign CLKOUT5_PHASE_BIN = CLKOUT5_PHASE_REG * 1000;

  assign clk5_fps_en =
    (CLKOUT5_USE_FINE_PS_REG == "FALSE") ? CLKOUT5_USE_FINE_PS_FALSE :
    (CLKOUT5_USE_FINE_PS_REG == "TRUE") ? CLKOUT5_USE_FINE_PS_TRUE :
     CLKOUT5_USE_FINE_PS_FALSE;

  assign CLKOUT6_DIVIDE_BIN = CLKOUT6_DIVIDE_REG;

  assign CLKOUT6_DUTY_CYCLE_BIN = CLKOUT6_DUTY_CYCLE_REG * 1000;

  assign CLKOUT6_PHASE_BIN = CLKOUT6_PHASE_REG * 1000;

  assign clk6_fps_en =
    (CLKOUT6_USE_FINE_PS_REG == "FALSE") ? CLKOUT6_USE_FINE_PS_FALSE :
    (CLKOUT6_USE_FINE_PS_REG == "TRUE") ? CLKOUT6_USE_FINE_PS_TRUE :
     CLKOUT6_USE_FINE_PS_FALSE;

  assign CLKPFD_FREQ_MAX_BIN = CLKPFD_FREQ_MAX_REG * 1000;

  assign CLKPFD_FREQ_MIN_BIN = CLKPFD_FREQ_MIN_REG * 1000;

  assign COMPENSATION_BIN =
    (COMPENSATION_REG == "AUTO") ? COMPENSATION_AUTO :
    (COMPENSATION_REG == "BUF_IN") ? COMPENSATION_BUF_IN :
    (COMPENSATION_REG == "EXTERNAL") ? COMPENSATION_EXTERNAL :
    (COMPENSATION_REG == "INTERNAL") ? COMPENSATION_INTERNAL :
    (COMPENSATION_REG == "ZHOLD") ? COMPENSATION_ZHOLD :
     COMPENSATION_AUTO;

  assign DIVCLK_DIVIDE_BIN = DIVCLK_DIVIDE_REG;

  assign IS_CLKFBIN_INVERTED_BIN = IS_CLKFBIN_INVERTED_REG;

  assign IS_CLKIN1_INVERTED_BIN = IS_CLKIN1_INVERTED_REG;

  assign IS_CLKIN2_INVERTED_BIN = IS_CLKIN2_INVERTED_REG;

  assign IS_CLKINSEL_INVERTED_BIN = IS_CLKINSEL_INVERTED_REG;

  assign IS_PSEN_INVERTED_BIN = IS_PSEN_INVERTED_REG;

  assign IS_PSINCDEC_INVERTED_BIN = IS_PSINCDEC_INVERTED_REG;

  assign IS_PWRDWN_INVERTED_BIN = IS_PWRDWN_INVERTED_REG;

  assign IS_RST_INVERTED_BIN = IS_RST_INVERTED_REG;

  assign REF_JITTER1_BIN = REF_JITTER1_REG * 1000;

  assign REF_JITTER2_BIN = REF_JITTER2_REG * 1000;

  assign SS_EN_BIN =
    (SS_EN_REG == "FALSE") ? SS_EN_FALSE :
    (SS_EN_REG == "TRUE") ? SS_EN_TRUE :
     SS_EN_FALSE;

  assign SS_MODE_BIN =
    (SS_MODE_REG == "CENTER_HIGH") ? SS_MODE_CENTER_HIGH :
    (SS_MODE_REG == "CENTER_LOW") ? SS_MODE_CENTER_LOW :
    (SS_MODE_REG == "DOWN_HIGH") ? SS_MODE_DOWN_HIGH :
    (SS_MODE_REG == "DOWN_LOW") ? SS_MODE_DOWN_LOW :
     SS_MODE_CENTER_HIGH;

  assign SS_MOD_PERIOD_BIN = SS_MOD_PERIOD_REG;

  assign startup_wait_sig =
    (STARTUP_WAIT_REG == "FALSE") ? STARTUP_WAIT_FALSE :
    (STARTUP_WAIT_REG == "TRUE") ? STARTUP_WAIT_TRUE :
     STARTUP_WAIT_FALSE;

  assign VCOCLK_FREQ_MAX_BIN = VCOCLK_FREQ_MAX_REG * 1000;

  assign VCOCLK_FREQ_MIN_BIN = VCOCLK_FREQ_MIN_REG * 1000;

  initial begin
  #1;
  trig_attr = ~trig_attr;
  trig_attr_chk = 1'b1;
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
         ((CLKOUT1_DIVIDE_REG < 1) || (CLKOUT1_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-113] CLKOUT1_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 128. Instance: %m", MODULE_NAME, CLKOUT1_DIVIDE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((CLKOUT2_DIVIDE_REG < 1) || (CLKOUT2_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-117] CLKOUT2_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 128. Instance: %m", MODULE_NAME, CLKOUT2_DIVIDE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((CLKOUT3_DIVIDE_REG < 1) || (CLKOUT3_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-121] CLKOUT3_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 128. Instance: %m", MODULE_NAME, CLKOUT3_DIVIDE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((CLKOUT4_DIVIDE_REG < 1) || (CLKOUT4_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-126] CLKOUT4_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 128. Instance: %m", MODULE_NAME, CLKOUT4_DIVIDE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((CLKOUT5_DIVIDE_REG < 1) || (CLKOUT5_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-130] CLKOUT5_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 128. Instance: %m", MODULE_NAME, CLKOUT5_DIVIDE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((CLKOUT6_DIVIDE_REG < 1) || (CLKOUT6_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-134] CLKOUT6_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 128. Instance: %m", MODULE_NAME, CLKOUT6_DIVIDE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((DIVCLK_DIVIDE_REG < 1) || (DIVCLK_DIVIDE_REG > 106))) begin
      $display("Error: [Unisim %s-141] DIVCLK_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 106. Instance: %m", MODULE_NAME, DIVCLK_DIVIDE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SS_MOD_PERIOD_REG < 4000) || (SS_MOD_PERIOD_REG > 40000))) begin
      $display("Error: [Unisim %s-154] SS_MOD_PERIOD attribute is set to %d.  Legal values for this attribute are 4000 to 40000. Instance: %m", MODULE_NAME, SS_MOD_PERIOD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BANDWIDTH_REG != "OPTIMIZED") &&
         (BANDWIDTH_REG != "HIGH") &&
         (BANDWIDTH_REG != "LOW"))) begin
      $display("Error: [Unisim %s-101] BANDWIDTH attribute is set to %s.  Legal values for this attribute are OPTIMIZED, HIGH or LOW. Instance: %m", MODULE_NAME, BANDWIDTH_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLKFBOUT_USE_FINE_PS_REG != "FALSE") &&
         (CLKFBOUT_USE_FINE_PS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-104] CLKFBOUT_USE_FINE_PS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLKFBOUT_USE_FINE_PS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLKOUT0_USE_FINE_PS_REG != "FALSE") &&
         (CLKOUT0_USE_FINE_PS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-112] CLKOUT0_USE_FINE_PS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLKOUT0_USE_FINE_PS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLKOUT1_USE_FINE_PS_REG != "FALSE") &&
         (CLKOUT1_USE_FINE_PS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-116] CLKOUT1_USE_FINE_PS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLKOUT1_USE_FINE_PS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLKOUT2_USE_FINE_PS_REG != "FALSE") &&
         (CLKOUT2_USE_FINE_PS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-120] CLKOUT2_USE_FINE_PS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLKOUT2_USE_FINE_PS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLKOUT3_USE_FINE_PS_REG != "FALSE") &&
         (CLKOUT3_USE_FINE_PS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-124] CLKOUT3_USE_FINE_PS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLKOUT3_USE_FINE_PS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLKOUT4_CASCADE_REG != "FALSE") &&
         (CLKOUT4_CASCADE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-125] CLKOUT4_CASCADE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLKOUT4_CASCADE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLKOUT4_USE_FINE_PS_REG != "FALSE") &&
         (CLKOUT4_USE_FINE_PS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-129] CLKOUT4_USE_FINE_PS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLKOUT4_USE_FINE_PS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLKOUT5_USE_FINE_PS_REG != "FALSE") &&
         (CLKOUT5_USE_FINE_PS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-133] CLKOUT5_USE_FINE_PS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLKOUT5_USE_FINE_PS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CLKOUT6_USE_FINE_PS_REG != "FALSE") &&
         (CLKOUT6_USE_FINE_PS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-137] CLKOUT6_USE_FINE_PS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLKOUT6_USE_FINE_PS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((COMPENSATION_REG != "AUTO") &&
         (COMPENSATION_REG != "BUF_IN") &&
         (COMPENSATION_REG != "EXTERNAL") &&
         (COMPENSATION_REG != "INTERNAL") &&
         (COMPENSATION_REG != "ZHOLD"))) begin
      $display("Error: [Unisim %s-140] COMPENSATION attribute is set to %s.  Legal values for this attribute are AUTO, BUF_IN, EXTERNAL, INTERNAL or ZHOLD. Instance: %m", MODULE_NAME, COMPENSATION_REG);
      attr_err = 1'b1;
    end

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
        ((IS_CLKIN2_INVERTED_REG !== 1'b0) && (IS_CLKIN2_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-144] IS_CLKIN2_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLKIN2_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLKINSEL_INVERTED_REG !== 1'b0) && (IS_CLKINSEL_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-145] IS_CLKINSEL_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLKINSEL_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_PSEN_INVERTED_REG !== 1'b0) && (IS_PSEN_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-146] IS_PSEN_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_PSEN_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_PSINCDEC_INVERTED_REG !== 1'b0) && (IS_PSINCDEC_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-147] IS_PSINCDEC_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_PSINCDEC_INVERTED_REG);
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

    if ((attr_test == 1'b1) ||
        ((SS_EN_REG != "FALSE") &&
         (SS_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-152] SS_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SS_EN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SS_MODE_REG != "CENTER_HIGH") &&
         (SS_MODE_REG != "CENTER_LOW") &&
         (SS_MODE_REG != "DOWN_HIGH") &&
         (SS_MODE_REG != "DOWN_LOW"))) begin
      $display("Error: [Unisim %s-153] SS_MODE attribute is set to %s.  Legal values for this attribute are CENTER_HIGH, CENTER_LOW, DOWN_HIGH or DOWN_LOW. Instance: %m", MODULE_NAME, SS_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((STARTUP_WAIT_REG != "FALSE") &&
         (STARTUP_WAIT_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-155] STARTUP_WAIT attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, STARTUP_WAIT_REG);
      attr_err = 1'b1;
    end

    if (CLKFBOUT_MULT_F_REG < 2.000 || CLKFBOUT_MULT_F_REG > 64.000) begin
    $display("Error: [Unisim %s-102] CLKFBOUT_MULT_F attribute is set to %f.  Legal values for this attribute are 2.000 to 64.000. Instance: %m", MODULE_NAME, CLKFBOUT_MULT_F_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKFBOUT_MULT_F";
//    chk_ok = para_real_range_chk(CLKFBOUT_MULT_F_REG, tmp_string, 2.000, 64.000);

    if (CLKFBOUT_PHASE_REG < -360.000 || CLKFBOUT_PHASE_REG > 360.000) begin
    $display("Error: [Unisim %s-103] CLKFBOUT_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKFBOUT_PHASE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKFBOUT_PHASE";
//    chk_ok = para_real_range_chk(CLKFBOUT_PHASE_REG, tmp_string, -360.0, 360.0);

    if (CLKIN1_PERIOD_REG < 0.000 || CLKIN1_PERIOD_REG > 100.000) begin
    $display("Error: [Unisim %s-105] CLKIN1_PERIOD attribute is set to %f.  Legal values for this attribute are 0.000 to 100.000. Instance: %m", MODULE_NAME, CLKIN1_PERIOD_REG);
    attr_err = 1'b1;
    end

    if (CLKIN2_PERIOD_REG < 0.000 || CLKIN2_PERIOD_REG > 100.000) begin
    $display("Error: [Unisim %s-106] CLKIN2_PERIOD attribute is set to %f.  Legal values for this attribute are 0.000 to 100.000. Instance: %m", MODULE_NAME, CLKIN2_PERIOD_REG);
    attr_err = 1'b1;
    end

    if (CLKIN_FREQ_MAX_REG < 800.000 || CLKIN_FREQ_MAX_REG > 1066.000) begin
    $display("Error: [Unisim %s-107] CLKIN_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 800.000 to 1066.000. Instance: %m", MODULE_NAME, CLKIN_FREQ_MAX_REG);
    attr_err = 1'b1;
    end

    if (CLKIN_FREQ_MIN_REG < 10.000 || CLKIN_FREQ_MIN_REG > 10.000) begin
    $display("Error: [Unisim %s-108] CLKIN_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 10.000 to 10.000. Instance: %m", MODULE_NAME, CLKIN_FREQ_MIN_REG);
    attr_err = 1'b1;
    end

    if (CLKOUT0_DIVIDE_F_REG < 1.000 || CLKOUT0_DIVIDE_F_REG > 128.000) begin
    $display("Error: [Unisim %s-109] CLKOUT0_DIVIDE_F attribute is set to %f.  Legal values for this attribute are 1.000 to 128.000. Instance: %m", MODULE_NAME, CLKOUT0_DIVIDE_F_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT0_DIVIDE_F";
//    chk_ok = para_real_range_chk(CLKOUT0_DIVIDE_F_REG, tmp_string, 1.000, 128.000);

    if (CLKOUT0_DUTY_CYCLE_REG < 0.001 || CLKOUT0_DUTY_CYCLE_REG > 0.999) begin
    $display("Error: [Unisim %s-110] CLKOUT0_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT0_DUTY_CYCLE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT0_DUTY_CYCLE";
//    chk_ok = para_real_range_chk(CLKOUT0_DUTY_CYCLE_REG, tmp_string, 0.001, 0.999);

    if (CLKOUT0_PHASE_REG < -360.000 || CLKOUT0_PHASE_REG > 360.000) begin
    $display("Error: [Unisim %s-111] CLKOUT0_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT0_PHASE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT0_PHASE";
//    chk_ok = para_real_range_chk(CLKOUT0_PHASE_REG, tmp_string, -360.0, 360.0);

    if (CLKOUT1_DUTY_CYCLE_REG < 0.001 || CLKOUT1_DUTY_CYCLE_REG > 0.999) begin
    $display("Error: [Unisim %s-114] CLKOUT1_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT1_DUTY_CYCLE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT1_DUTY_CYCLE";
//    chk_ok = para_real_range_chk(CLKOUT1_DUTY_CYCLE_REG, tmp_string, 0.001, 0.999);

    if (CLKOUT1_PHASE_REG < -360.000 || CLKOUT1_PHASE_REG > 360.000) begin
    $display("Error: [Unisim %s-115] CLKOUT1_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT1_PHASE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT1_PHASE";
//    chk_ok = para_real_range_chk(CLKOUT1_PHASE_REG, tmp_string, -360.0, 360.0);

    if (CLKOUT2_DUTY_CYCLE_REG < 0.001 || CLKOUT2_DUTY_CYCLE_REG > 0.999) begin
    $display("Error: [Unisim %s-118] CLKOUT2_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT2_DUTY_CYCLE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT2_DUTY_CYCLE";
//    chk_ok = para_real_range_chk(CLKOUT2_DUTY_CYCLE_REG, tmp_string, 0.001, 0.999);

    if (CLKOUT2_PHASE_REG < -360.000 || CLKOUT2_PHASE_REG > 360.000) begin
    $display("Error: [Unisim %s-119] CLKOUT2_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT2_PHASE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT2_PHASE";
//    chk_ok = para_real_range_chk(CLKOUT2_PHASE_REG, tmp_string, -360.0, 360.0);

    if (CLKOUT3_DUTY_CYCLE_REG < 0.001 || CLKOUT3_DUTY_CYCLE_REG > 0.999) begin
    $display("Error: [Unisim %s-122] CLKOUT3_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT3_DUTY_CYCLE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT3_DUTY_CYCLE";
//    chk_ok = para_real_range_chk(CLKOUT3_DUTY_CYCLE_REG, tmp_string, 0.001, 0.999);

    if (CLKOUT3_PHASE_REG < -360.000 || CLKOUT3_PHASE_REG > 360.000) begin
    $display("Error: [Unisim %s-123] CLKOUT3_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT3_PHASE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT3_PHASE";
//    chk_ok = para_real_range_chk(CLKOUT3_PHASE_REG, tmp_string, -360.0, 360.0);

    if (CLKOUT4_DUTY_CYCLE_REG < 0.001 || CLKOUT4_DUTY_CYCLE_REG > 0.999) begin
    $display("Error: [Unisim %s-127] CLKOUT4_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT4_DUTY_CYCLE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT4_DUTY_CYCLE";
//    chk_ok = para_real_range_chk(CLKOUT4_DUTY_CYCLE_REG, tmp_string,  0.001, 0.999);

    if (CLKOUT4_PHASE_REG < -360.000 || CLKOUT4_PHASE_REG > 360.000) begin
    $display("Error: [Unisim %s-128] CLKOUT4_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT4_PHASE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT4_PHASE";
//    chk_ok = para_real_range_chk(CLKOUT4_PHASE_REG, tmp_string,  -360.0, 360.0);

    if (CLKOUT5_DUTY_CYCLE_REG < 0.001 || CLKOUT5_DUTY_CYCLE_REG > 0.999) begin
    $display("Error: [Unisim %s-131] CLKOUT5_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT5_DUTY_CYCLE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT5_DUTY_CYCLE";
//    chk_ok = para_real_range_chk (CLKOUT5_DUTY_CYCLE_REG, tmp_string,  0.001, 0.999);

    if (CLKOUT5_PHASE_REG < -360.000 || CLKOUT5_PHASE_REG > 360.000) begin
    $display("Error: [Unisim %s-132] CLKOUT5_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT5_PHASE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT5_PHASE";
//    chk_ok = para_real_range_chk(CLKOUT5_PHASE_REG, tmp_string, -360.0, 360.0);

    if (CLKOUT6_DUTY_CYCLE_REG < 0.001 || CLKOUT6_DUTY_CYCLE_REG > 0.999) begin
    $display("Error: [Unisim %s-135] CLKOUT6_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT6_DUTY_CYCLE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT6_DUTY_CYCLE";
//    chk_ok = para_real_range_chk (CLKOUT6_DUTY_CYCLE_REG, tmp_string,  0.001, 0.999);

    if (CLKOUT6_PHASE_REG < -360.000 || CLKOUT6_PHASE_REG > 360.000) begin
    $display("Error: [Unisim %s-136] CLKOUT6_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT6_PHASE_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "CLKOUT6_PHASE";
//    chk_ok = para_real_range_chk(CLKOUT6_PHASE_REG, tmp_string, -360.0, 360.0);

    if (CLKPFD_FREQ_MAX_REG < 450.000 || CLKPFD_FREQ_MAX_REG > 550.000) begin
    $display("Error: [Unisim %s-138] CLKPFD_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 450.000 to 550.000. Instance: %m", MODULE_NAME, CLKPFD_FREQ_MAX_REG);
    attr_err = 1'b1;
    end

    if (CLKPFD_FREQ_MIN_REG < 10.000 || CLKPFD_FREQ_MIN_REG > 10.000) begin
    $display("Error: [Unisim %s-139] CLKPFD_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 10.000 to 10.000. Instance: %m", MODULE_NAME, CLKPFD_FREQ_MIN_REG);
    attr_err = 1'b1;
    end

    if (REF_JITTER1_REG < 0.000 || REF_JITTER1_REG > 0.999) begin
    $display("Error: [Unisim %s-150] REF_JITTER1 attribute is set to %f.  Legal values for this attribute are 0.000 to 0.999. Instance: %m", MODULE_NAME, REF_JITTER1_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "REF_JITTER1";
//    chk_ok = para_real_range_chk (REF_JITTER1_REG, tmp_string, 0.000, 0.999);

    if (REF_JITTER2_REG < 0.000 || REF_JITTER2_REG > 0.999) begin
    $display("Error: [Unisim %s-151] REF_JITTER2 attribute is set to %f.  Legal values for this attribute are 0.000 to 0.999. Instance: %m", MODULE_NAME, REF_JITTER2_REG);
    attr_err = 1'b1;
    end
//    tmp_string = "REF_JITTER2";
//    chk_ok = para_real_range_chk (REF_JITTER2_REG, tmp_string, 0.000, 0.999);

    if (VCOCLK_FREQ_MAX_REG < 1200.000 || VCOCLK_FREQ_MAX_REG > 1600.000) begin
    $display("Error: [Unisim %s-156] VCOCLK_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 1200.000 to 1600.000. Instance: %m", MODULE_NAME, VCOCLK_FREQ_MAX_REG);
    attr_err = 1'b1;
    end

    if (VCOCLK_FREQ_MIN_REG < 600.000 || VCOCLK_FREQ_MIN_REG > 600.000) begin
    $display("Error: [Unisim %s-157] VCOCLK_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 600.000 to 600.000. Instance: %m", MODULE_NAME, VCOCLK_FREQ_MIN_REG);
    attr_err = 1'b1;
    end

    if (CLKOUT0_DIVIDE_F_REG > 1.0000 && CLKOUT0_DIVIDE_F_REG < 2.0000)
      $display("Error: [Unisim %s-2] The Attribute CLKOUT0_DIVIDE_F is set to %f.  Values in range of greater than 1 and less than 2 are not allowed. Instance %m", MODULE_NAME, CLKOUT0_DIVIDE_F_REG);

    if (attr_err == 1'b1) $finish;

    clkfbm1_f_div = CLKFBOUT_MULT_F_REG;
    clkfb_div_fint = $rtoi(CLKFBOUT_MULT_F_REG);
    clkfb_div_frac = CLKFBOUT_MULT_F_REG - clkfb_div_fint;
    clkfb_div_check = clkfb_div_frac/ 0.125;
    clkfb_div_check_int = clkfb_div_frac/ 0.125;
    clkfb_div_check_diff = clkfb_div_check - clkfb_div_check_int;
    if (clkfb_div_frac > 0.000)
         clkfb_frac_en = 1;
    else
         clkfb_frac_en = 0;
    if (clkfb_frac_en == 1 && clkfb_div_check_diff == 0.000)
    clkfb_div_adj =  0;
    else
    clkfb_div_adj =  1;
    if (clkfb_frac_en)
        clkfbm1_div_t = clkfbm1_f_div;
    else
        clkfbm1_div_t = clkfbm1_div;
    clkfb_div_frac_int = $rtoi(clkfb_div_frac * 8);
    clkfb_div_fint_tmp1 = clkfb_div_fint / 2;
    clkfb_div_fint_odd = clkfb_div_fint - clkfb_div_fint_tmp1 -clkfb_div_fint_tmp1;


    clkfb_sdivide = CLKFBOUT_MULT_F_REG;
    clkfb_sdivide_int = clkfb_div_fint;
    clkfb_frac = clkfb_div_frac_int;
    clkfb_sevent_part_high = clkfb_div_fint_tmp1;
    clkfb_sevent_part_low = clkfb_sevent_part_high;
    clkfb_sodd = clkfb_div_fint_odd;
    clkfb_sodd_and_frac = 8 * clkfb_sodd + clkfb_frac;
    if (clkfb_sodd_and_frac >= 9)
       clkfbm1_lt = clkfb_sevent_part_high;
    else
       clkfbm1_lt = clkfb_sevent_part_high - 1;
    if (clkfb_sodd_and_frac > 8)
       clkfbm1_ht = clkfb_sevent_part_low;
    else
       clkfbm1_ht = clkfb_sevent_part_low - 1;
    clkfb_sfrac_2 = clkfb_div_frac_int / 2;
    clkfbpmf_sel = 4 * clkfb_sodd + clkfb_sfrac_2;
    clkfbpmr_sel = 3'b0;
    if (CLKFBOUT_MULT_F_REG == 2.125)
       clkfbout_frac_wf_f = 1;
    else begin
      if (clkfb_sodd_and_frac >= 2 && clkfb_sodd_and_frac <= 9)
         clkfbout_frac_wf_f = 1;
      else
         clkfbout_frac_wf_f = 0;
    end
    if (clkfb_sodd_and_frac >= 1 && clkfb_sodd_and_frac <= 8)
       clkfbout_frac_wf_r = 1;
    else
       clkfbout_frac_wf_r = 0;
    if (CLKFBOUT_PHASE_REG < 0.000)
       clkfb_sphase = CLKFBOUT_PHASE_REG + 360;
    else
       clkfb_sphase = CLKFBOUT_PHASE_REG;
    clkfb_sdt = $rtoi(CLKFBOUT_PHASE_REG * clkfb_sdivide / 360.0);
    clkfb_sa = CLKFBOUT_PHASE_REG * clkfb_sdivide / 360.0 - clkfb_sdt;
    clkfb_sb = clkfb_sa;
    clkfb_pm_rise_overwriting = $rtoi(clkfb_sb / 0.125);
    if (clkfb_pm_rise_overwriting > 7)
       clkfb_pm_rise_overwriting_2nd = clkfb_pm_rise_overwriting - 8;
    else
       clkfb_pm_rise_overwriting_2nd = clkfb_pm_rise_overwriting;
    clkfb_pm_fall_overwriting = clkfbpmf_sel + clkfb_pm_rise_overwriting_2nd;
    if (clkfb_pm_fall_overwriting > 7)
       clkfb_pm_fall_overwriting_2nd = clkfb_pm_fall_overwriting - 8;
    else
       clkfb_pm_fall_overwriting_2nd = clkfb_pm_fall_overwriting;

    clkfb_sdt_tmp = clkfb_sdt;
    if (clkfb_pm_rise_overwriting > 7)
      clkfb_sdt = clkfb_sdt_tmp + 1;

//    mf_product = clkfb_div_fint * 8 + clkfb_div_frac_int;
    clk0_div_fint = $rtoi(CLKOUT0_DIVIDE_F_REG);
    clk0_div_frac = CLKOUT0_DIVIDE_F_REG - clk0_div_fint;
    if (clk0_div_frac > 0.000 && clk0_div_fint >= 2)
         clk0_frac_en = 1;
    else
         clk0_frac_en = 0;
    clk0_div_check = clk0_div_frac/ 0.125;
    clk0_div_check_int = clk0_div_frac/ 0.125;
    clk0_div_check_diff = clk0_div_check - clk0_div_check_int;
    if (clk0_frac_en == 1 && clk0_div_check_diff == 0.000)
    clk0_div_adj =  0;
    else
    clk0_div_adj =  1;
    clk0_div_frac_int = $rtoi(clk0_div_frac * 8);
    clk0_div_fint_tmp1 = clk0_div_fint / 2;
    clk0_div_fint_odd = clk0_div_fint - clk0_div_fint_tmp1 -clk0_div_fint_tmp1;
    clk0_sdivide = CLKOUT0_DIVIDE_F_REG;
    clk0_sdivide_int = clk0_div_fint;
    clk0_frac = clk0_div_frac_int;
    clk0_sevent_part_high = clk0_div_fint_tmp1;
    clk0_sevent_part_low = clk0_sevent_part_high;
    clk0_sodd = clk0_div_fint_odd;
    clk0_sodd_and_frac = 8 * clk0_sodd + clk0_frac;
    if (clk0_sodd_and_frac >= 9)
       clk0_lt = clk0_sevent_part_high;
    else
       clk0_lt = clk0_sevent_part_high - 1;
    if (clk0_sodd_and_frac > 8)
       clk0_ht = clk0_sevent_part_low;
    else
       clk0_ht = clk0_sevent_part_low - 1;
    clk0_sfrac_2 = clk0_div_frac_int / 2;
    clk0pmf_sel = 4 * clk0_sodd + clk0_sfrac_2;
    clk0pmr_sel = 3'b0;
    if (CLKOUT0_DIVIDE_F_REG == 2.125)
       clk0_frac_wf_f = 1;
    else begin
      if (clk0_sodd_and_frac >= 2 && clk0_sodd_and_frac <= 9)
         clk0_frac_wf_f = 1;
      else
         clk0_frac_wf_f = 0;
    end
    if (clk0_sodd_and_frac >= 1 && clk0_sodd_and_frac <= 8)
       clk0_frac_wf_r = 1;
    else
       clk0_frac_wf_r = 0;
    if (CLKOUT0_PHASE_REG < 0.000)
       clk0_sphase = CLKOUT0_PHASE_REG + 360;
    else
       clk0_sphase = CLKOUT0_PHASE_REG;
    clk0_sdt = $rtoi(CLKOUT0_PHASE_REG * clk0_sdivide / 360.0);
    clk0_sa = CLKOUT0_PHASE_REG * clk0_sdivide / 360.0 - clk0_sdt;
    clk0_sb = clk0_sa;
    clk0_pm_rise_overwriting = $rtoi(clk0_sb / 0.125);
    if (clk0_pm_rise_overwriting > 7)
       clk0_pm_rise_overwriting_2nd = clk0_pm_rise_overwriting - 8;
    else
       clk0_pm_rise_overwriting_2nd = clk0_pm_rise_overwriting;
    clk0_pm_fall_overwriting = clk0pmf_sel + clk0_pm_rise_overwriting_2nd;
    if (clk0_pm_fall_overwriting > 7)
       clk0_pm_fall_overwriting_2nd = clk0_pm_fall_overwriting - 8;
    else
       clk0_pm_fall_overwriting_2nd = clk0_pm_fall_overwriting;

    clk0_sdt_tmp = clk0_sdt;
    if (clk0_pm_rise_overwriting > 7)
      clk0_sdt = clk0_sdt_tmp + 1;

    ps_in_init = 0;
    ps_in_ps = ps_in_init;
    ps_cnt = 0;

    fps_en = clk0_fps_en || clk1_fps_en || clk2_fps_en || clk3_fps_en
             || clk4_fps_en || clk5_fps_en || clk6_fps_en || clkfb_fps_en;


    if (clk0_frac_en == 1) begin
      if (CLKOUT0_DUTY_CYCLE_REG != 0.5) begin
        $display("Error: [Unisim %s-3] The Attribute CLKOUT0_DUTY_CYCLE is set to %f.  This attribute should be set to 0.5 when CLKOUT0_DIVIDE_F has fraction part. Instance %m", MODULE_NAME, CLKOUT0_DUTY_CYCLE_REG);
        #100
        $finish;
      end
    end

    pll_lfhf = 2'b00;

  if (BANDWIDTH_REG === "HIGH")
    case (clkfb_div_fint)
       2 :  begin pll_cp = 32'd4 ; pll_res = 32'd15 ; end
       3 :  begin pll_cp = 32'd5 ; pll_res = 32'd11 ; end
       4 :  begin pll_cp = 32'd7 ; pll_res = 32'd7 ; end
       5 :  begin pll_cp = 32'd13 ; pll_res = 32'd7 ; end
       6 :  begin pll_cp = 32'd14 ; pll_res = 32'd11 ; end
       7 :  begin pll_cp = 32'd14 ; pll_res = 32'd13 ; end
       8 :  begin pll_cp = 32'd15 ; pll_res = 32'd3 ; end
       9 :  begin pll_cp = 32'd14 ; pll_res = 32'd5 ; end
       10 :  begin pll_cp = 32'd15 ; pll_res = 32'd5 ; end
       11 :  begin pll_cp = 32'd15 ; pll_res = 32'd9 ; end
       12 :  begin pll_cp = 32'd13 ; pll_res = 32'd1 ; end
       13 :  begin pll_cp = 32'd14 ; pll_res = 32'd1 ; end
       14 :  begin pll_cp = 32'd15 ; pll_res = 32'd1 ; end
       15 :  begin pll_cp = 32'd15 ; pll_res = 32'd1 ; end
       16 :  begin pll_cp = 32'd15 ; pll_res = 32'd1 ; end
       17 :  begin pll_cp = 32'd14 ; pll_res = 32'd6 ; end
       18 :  begin pll_cp = 32'd15 ; pll_res = 32'd6 ; end
       19 :  begin pll_cp = 32'd14 ; pll_res = 32'd10 ; end
       20 :  begin pll_cp = 32'd14 ; pll_res = 32'd10 ; end
       21 :  begin pll_cp = 32'd15 ; pll_res = 32'd10 ; end
       22 :  begin pll_cp = 32'd15 ; pll_res = 32'd10 ; end
       23 :  begin pll_cp = 32'd15 ; pll_res = 32'd10 ; end
       24 :  begin pll_cp = 32'd15 ; pll_res = 32'd10 ; end
       25 :  begin pll_cp = 32'd7 ; pll_res = 32'd2 ; end
       26 :  begin pll_cp = 32'd7 ; pll_res = 32'd2 ; end
       27 :  begin pll_cp = 32'd14 ; pll_res = 32'd10; end
       28 :  begin pll_cp = 32'd6 ; pll_res = 32'd2 ; end
       29 :  begin pll_cp = 32'd6 ; pll_res = 32'd2 ; end
       30 :  begin pll_cp = 32'd6 ; pll_res = 32'd2 ; end
       31 :  begin pll_cp = 32'd4 ; pll_res = 32'd4 ; end
       32 :  begin pll_cp = 32'd13 ; pll_res = 32'd6 ; end
       33 :  begin pll_cp = 32'd13 ; pll_res = 32'd6 ; end
       34 :  begin pll_cp = 32'd5 ; pll_res = 32'd2 ; end
       35 :  begin pll_cp = 32'd5 ; pll_res = 32'd2 ; end
       36 :  begin pll_cp = 32'd5 ; pll_res = 32'd2 ; end
       37 :  begin pll_cp = 32'd3 ; pll_res = 32'd4 ; end
       38 :  begin pll_cp = 32'd3 ; pll_res = 32'd4 ; end
       39 :  begin pll_cp = 32'd3 ; pll_res = 32'd4 ; end
       40 :  begin pll_cp = 32'd3 ; pll_res = 32'd4 ; end
       41 :  begin pll_cp = 32'd3 ; pll_res = 32'd4 ; end
       42 :  begin pll_cp = 32'd2 ; pll_res = 32'd8 ; end
       43 :  begin pll_cp = 32'd2 ; pll_res = 32'd8 ; end
       44 :  begin pll_cp = 32'd2 ; pll_res = 32'd8 ; end
       45 :  begin pll_cp = 32'd2 ; pll_res = 32'd8 ; end
       46 :  begin pll_cp = 32'd2 ; pll_res = 32'd8 ; end
       47 :  begin pll_cp = 32'd7 ; pll_res = 32'd1 ; end
       48 :  begin pll_cp = 32'd7 ; pll_res = 32'd1 ; end
       49 :  begin pll_cp = 32'd4 ; pll_res = 32'd12 ; end
       50 :  begin pll_cp = 32'd4 ; pll_res = 32'd12 ; end
       51 :  begin pll_cp = 32'd4 ; pll_res = 32'd12 ; end
       52 :  begin pll_cp = 32'd4 ; pll_res = 32'd12 ; end
       53 :  begin pll_cp = 32'd6 ; pll_res = 32'd1 ; end
       54 :  begin pll_cp = 32'd6 ; pll_res = 32'd1 ; end
       55 :  begin pll_cp = 32'd5 ; pll_res = 32'd6 ; end
       56 :  begin pll_cp = 32'd5 ; pll_res = 32'd6 ; end
       57 :  begin pll_cp = 32'd5 ; pll_res = 32'd6 ; end
       58 :  begin pll_cp = 32'd2 ; pll_res = 32'd4 ; end
       59 :  begin pll_cp = 32'd2 ; pll_res = 32'd4 ; end
       60 :  begin pll_cp = 32'd2 ; pll_res = 32'd4 ; end
       61 :  begin pll_cp = 32'd2 ; pll_res = 32'd4 ; end
       62 :  begin pll_cp = 32'd4 ; pll_res = 32'd10 ; end
       63 :  begin pll_cp = 32'd3 ; pll_res = 32'd12 ; end
       64 :  begin pll_cp = 32'd3 ; pll_res = 32'd12 ; end
    endcase
  else if (BANDWIDTH_REG === "LOW")
    case (clkfb_div_fint)
      2 :  begin pll_cp = 32'd2 ; pll_res = 32'd15 ; end
      3 :  begin pll_cp = 32'd2 ; pll_res = 32'd15 ; end
      4 :  begin pll_cp = 32'd2 ; pll_res = 32'd15 ; end
      5 :  begin pll_cp = 32'd2 ; pll_res = 32'd7 ; end
      6 :  begin pll_cp = 32'd2 ; pll_res = 32'd11 ; end
      7 :  begin pll_cp = 32'd2 ; pll_res = 32'd13 ; end
      8 :  begin pll_cp = 32'd2 ; pll_res = 32'd3 ; end
      9 :  begin pll_cp = 32'd2 ; pll_res = 32'd5 ; end
      10 :  begin pll_cp = 32'd2 ; pll_res = 32'd5 ; end
      11 :  begin pll_cp = 32'd2 ; pll_res = 32'd9 ; end
      12 :  begin pll_cp = 32'd2 ; pll_res = 32'd14 ; end
      13 :  begin pll_cp = 32'd2 ; pll_res = 32'd14 ; end
      14 :  begin pll_cp = 32'd2 ; pll_res = 32'd14 ; end
      15 :  begin pll_cp = 32'd2 ; pll_res = 32'd14 ; end
      16 :  begin pll_cp = 32'd2 ; pll_res = 32'd1 ; end
      17 :  begin pll_cp = 32'd2 ; pll_res = 32'd1 ; end
      18 :  begin pll_cp = 32'd2 ; pll_res = 32'd1 ; end
      19 :  begin pll_cp = 32'd2 ; pll_res = 32'd6 ; end
      20 :  begin pll_cp = 32'd2 ; pll_res = 32'd6 ; end
      21 :  begin pll_cp = 32'd2 ; pll_res = 32'd6 ; end
      22 :  begin pll_cp = 32'd2 ; pll_res = 32'd6 ; end
      23 :  begin pll_cp = 32'd2 ; pll_res = 32'd6 ; end
      24 :  begin pll_cp = 32'd2 ; pll_res = 32'd6 ; end
      25 :  begin pll_cp = 32'd2 ; pll_res = 32'd6 ; end
      26 :  begin pll_cp = 32'd2 ; pll_res = 32'd10 ; end
      27 :  begin pll_cp = 32'd2 ; pll_res = 32'd10 ; end
      28 :  begin pll_cp = 32'd2 ; pll_res = 32'd10 ; end
      29 :  begin pll_cp = 32'd2 ; pll_res = 32'd10 ; end
      30 :  begin pll_cp = 32'd2 ; pll_res = 32'd10 ; end
      31 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      32 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      33 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      34 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      35 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      36 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      37 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      38 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      39 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      40 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      41 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      42 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      43 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      44 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      45 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      46 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      47 :  begin pll_cp = 32'd2 ; pll_res = 32'd12 ; end
      48 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      49 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      50 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      51 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      52 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      53 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      54 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      55 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      56 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      57 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      58 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      59 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      60 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      61 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      62 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      63 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
      64 :  begin pll_cp = 32'd2 ; pll_res = 32'd2 ; end
    endcase
  else if (BANDWIDTH_REG === "OPTIMIZED")
    case (clkfb_div_fint)
      2 :  begin pll_cp = 32'd4 ; pll_res = 32'd15 ; end
      3 :  begin pll_cp = 32'd5 ; pll_res = 32'd11 ; end
      4 :  begin pll_cp = 32'd7 ; pll_res = 32'd7 ; end
      5 :  begin pll_cp = 32'd13 ; pll_res = 32'd7 ; end
      6 :  begin pll_cp = 32'd14 ; pll_res = 32'd11 ; end
      7 :  begin pll_cp = 32'd14 ; pll_res = 32'd13 ; end
      8 :  begin pll_cp = 32'd15 ; pll_res = 32'd3 ; end
      9 :  begin pll_cp = 32'd14 ; pll_res = 32'd5 ; end
      10 :  begin pll_cp = 32'd15 ; pll_res = 32'd5 ; end
      11 :  begin pll_cp = 32'd15 ; pll_res = 32'd9 ; end
      12 :  begin pll_cp = 32'd13 ; pll_res = 32'd1 ; end
      13 :  begin pll_cp = 32'd14 ; pll_res = 32'd1 ; end
      14 :  begin pll_cp = 32'd15 ; pll_res = 32'd1 ; end
      15 :  begin pll_cp = 32'd15 ; pll_res = 32'd1 ; end
      16 :  begin pll_cp = 32'd15 ; pll_res = 32'd1 ; end
      17 :  begin pll_cp = 32'd14 ; pll_res = 32'd6 ; end
      18 :  begin pll_cp = 32'd15 ; pll_res = 32'd6 ; end
      19 :  begin pll_cp = 32'd14 ; pll_res = 32'd10 ; end
      20 :  begin pll_cp = 32'd14 ; pll_res = 32'd10 ; end
      21 :  begin pll_cp = 32'd15 ; pll_res = 32'd10 ; end
      22 :  begin pll_cp = 32'd15 ; pll_res = 32'd10 ; end
      23 :  begin pll_cp = 32'd15 ; pll_res = 32'd10 ; end
      24 :  begin pll_cp = 32'd15 ; pll_res = 32'd10 ; end
      25 :  begin pll_cp = 32'd7 ; pll_res = 32'd2 ; end
      26 :  begin pll_cp = 32'd7 ; pll_res = 32'd2 ; end
      27 :  begin pll_cp = 32'd14 ; pll_res = 32'd10 ; end
      28 :  begin pll_cp = 32'd6  ; pll_res = 32'd2 ; end
      29 :  begin pll_cp = 32'd6  ; pll_res = 32'd2 ; end
      30 :  begin pll_cp = 32'd6  ; pll_res = 32'd2 ; end
      31 :  begin pll_cp = 32'd4  ; pll_res = 32'd4 ; end
      32 :  begin pll_cp = 32'd13 ; pll_res = 32'd6 ; end
      33 :  begin pll_cp = 32'd13 ; pll_res = 32'd6 ; end
      34 :  begin pll_cp = 32'd5 ; pll_res = 32'd2 ; end
      35 :  begin pll_cp = 32'd5 ; pll_res = 32'd2 ; end
      36 :  begin pll_cp = 32'd5 ; pll_res = 32'd2 ; end
      37 :  begin pll_cp = 32'd3 ; pll_res = 32'd4 ; end
      38 :  begin pll_cp = 32'd3 ; pll_res = 32'd4 ; end
      39 :  begin pll_cp = 32'd3 ; pll_res = 32'd4 ; end
      40 :  begin pll_cp = 32'd3 ; pll_res = 32'd4 ; end
      41 :  begin pll_cp = 32'd3 ; pll_res = 32'd4 ; end
      42 :  begin pll_cp = 32'd2 ; pll_res = 32'd8 ; end
      43 :  begin pll_cp = 32'd2 ; pll_res = 32'd8 ; end
      44 :  begin pll_cp = 32'd2 ; pll_res = 32'd8 ; end
      45 :  begin pll_cp = 32'd2 ; pll_res = 32'd8 ; end
      46 :  begin pll_cp = 32'd2 ; pll_res = 32'd8 ; end
      47 :  begin pll_cp = 32'd7 ; pll_res = 32'd1 ; end
      48 :  begin pll_cp = 32'd7 ; pll_res = 32'd1 ; end
      49 :  begin pll_cp = 32'd4 ; pll_res = 32'd12 ; end
      50 :  begin pll_cp = 32'd4 ; pll_res = 32'd12 ; end
      51 :  begin pll_cp = 32'd4 ; pll_res = 32'd12 ; end
      52 :  begin pll_cp = 32'd4 ; pll_res = 32'd12 ; end
      53 :  begin pll_cp = 32'd6 ; pll_res = 32'd1 ; end
      54 :  begin pll_cp = 32'd6 ; pll_res = 32'd1 ; end
      55 :  begin pll_cp = 32'd5 ; pll_res = 32'd6 ; end
      56 :  begin pll_cp = 32'd5 ; pll_res = 32'd6 ; end
      57 :  begin pll_cp = 32'd5 ; pll_res = 32'd6 ; end
      58 :  begin pll_cp = 32'd2 ; pll_res = 32'd4 ; end
      59 :  begin pll_cp = 32'd2 ; pll_res = 32'd4 ; end
      60 :  begin pll_cp = 32'd2 ; pll_res = 32'd4 ; end
      61 :  begin pll_cp = 32'd2 ; pll_res = 32'd4 ; end
      62 :  begin pll_cp = 32'd4 ; pll_res = 32'd10 ; end
      63 :  begin pll_cp = 32'd3 ; pll_res = 32'd12 ; end
      64 :  begin pll_cp = 32'd3 ; pll_res = 32'd12 ; end
    endcase

  case (clkfb_div_fint)
     1 :  begin drp_lock_ref_dly = 32'd6;
           drp_lock_fb_dly = 32'd6;
           drp_lock_cnt = 32'd1000;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     2 :  begin drp_lock_ref_dly = 32'd6;
           drp_lock_fb_dly = 32'd6;
           drp_lock_cnt = 32'd1000;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     3 :  begin drp_lock_ref_dly = 32'd8;
           drp_lock_fb_dly = 32'd8;
           drp_lock_cnt = 32'd1000;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     4 :  begin drp_lock_ref_dly = 32'd11;
           drp_lock_fb_dly = 32'd11;
           drp_lock_cnt = 32'd1000;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     5 :  begin drp_lock_ref_dly = 32'd14;
           drp_lock_fb_dly = 32'd14;
           drp_lock_cnt = 32'd1000;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     6 :  begin drp_lock_ref_dly = 32'd17;
           drp_lock_fb_dly = 32'd17;
           drp_lock_cnt = 32'd1000;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     7 :  begin drp_lock_ref_dly = 32'd19;
           drp_lock_fb_dly = 32'd19;
           drp_lock_cnt = 32'd1000;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     8 :  begin drp_lock_ref_dly = 32'd22;
           drp_lock_fb_dly = 32'd22;
           drp_lock_cnt = 32'd1000;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     9 :  begin drp_lock_ref_dly = 32'd25;
           drp_lock_fb_dly = 32'd25;
           drp_lock_cnt = 32'd1000;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     10 :  begin drp_lock_ref_dly = 32'd28;
           drp_lock_fb_dly = 32'd28;
           drp_lock_cnt = 32'd1000;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     11 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd900;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     12 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd825;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     13 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd750;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     14 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd700;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     15 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd650;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     16 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd625;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     17 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd575;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     18 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd550;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     19 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd525;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     20 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd500;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     21 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd475;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     22 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd450;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     23 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd425;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     24 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd400;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     25 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd400;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     26 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd375;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     27 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd350;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     28 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd350;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     29 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd325;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     30 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd325;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     31 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd300;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     32 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd300;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     33 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd300;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     34 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd275;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     35 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd275;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     36 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd275;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     37 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     38 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     39 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     40 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     41 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     42 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     43 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     44 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     45 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     46 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     47 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     48 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     49 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     50 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     51 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     52 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     53 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     54 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     55 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     56 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     57 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     58 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     59 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     60 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     61 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     62 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     63 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end
     64 :  begin drp_lock_ref_dly = 32'd31;
           drp_lock_fb_dly = 32'd31;
           drp_lock_cnt = 32'd250;
           drp_lock_sat_high = 32'd1001;
           drp_unlock_cnt = 32'd1; end

  endcase

    tmp_string = "DIVCLK_DIVIDE";
    chk_ok = para_int_range_chk (DIVCLK_DIVIDE_REG, tmp_string, D_MIN, D_MAX);
      tmp_string = "CLKFBOUT_MULT_F";
      chk_ok = para_real_range_chk (CLKFBOUT_MULT_F_REG, tmp_string, M_MIN, M_MAX);
    tmp_string = "CLKOUT6_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT6_DIVIDE_REG, CLKOUT6_DUTY_CYCLE_REG, tmp_string);
    if(clk0_frac_en == 0) begin
      tmp_string = "CLKOUT0_DUTY_CYCLE";
      chk_ok = clkout_duty_chk (CLKOUT0_DIVIDE_F_REG, CLKOUT0_DUTY_CYCLE_REG, tmp_string);
    end
    tmp_string = "CLKOUT5_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT5_DIVIDE_REG, CLKOUT5_DUTY_CYCLE_REG, tmp_string);
    tmp_string = "CLKOUT1_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT1_DIVIDE_REG, CLKOUT1_DUTY_CYCLE_REG, tmp_string);
    tmp_string = "CLKOUT2_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT2_DIVIDE_REG, CLKOUT2_DUTY_CYCLE_REG, tmp_string);
    tmp_string = "CLKOUT3_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT3_DIVIDE_REG, CLKOUT3_DUTY_CYCLE_REG, tmp_string);
    tmp_string = "CLKOUT4_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT4_DIVIDE_REG, CLKOUT4_DUTY_CYCLE_REG, tmp_string);
    period_vco_max = 1000000 / VCOCLK_FREQ_MIN_REG;
    period_vco_min = 1000000 / VCOCLK_FREQ_MAX_REG;
    period_vco_target = 1000000 / VCOCLK_FREQ_TARGET;
    period_vco_target_half = period_vco_target / 2;
    if (period_clkin < MAX_FEEDBACK_DELAY)
      fb_delay_max = period_clkin * MAX_FEEDBACK_DELAY_SCALE;
    else
      fb_delay_max = MAX_FEEDBACK_DELAY * MAX_FEEDBACK_DELAY_SCALE;
    clk0f_product = CLKOUT0_DIVIDE_F_REG * 8;
    pll_lock_time = 12;
    lock_period_time = 10;
    if (clkfb_frac_en == 1) begin
      md_product = clkfb_div_fint * DIVCLK_DIVIDE_REG;
      m_product = clkfb_div_fint;
      mf_product = CLKFBOUT_MULT_F_REG * 8;
      clkout_en_val = mf_product - 1;
      m_product2 = clkfb_div_fint / 2;
      clkout_en_time = mf_product + pll_lock_time;
      locked_en_time = md_product +  clkout_en_time;
      lock_cnt_max = locked_en_time + 16;
    end
    else begin
      md_product = clkfb_div_fint * DIVCLK_DIVIDE_REG;
      m_product = clkfb_div_fint;
      mf_product = CLKFBOUT_MULT_F_REG * 8;
      m_product2 = clkfb_div_fint / 2;
      clkout_en_val = m_product;
      clkout_en_time = md_product + pll_lock_time;
      locked_en_time = md_product +  clkout_en_time;
      lock_cnt_max = locked_en_time + 16;
    end
    clkfb_stop_max = 3;
    clkin_stop_max = DIVCLK_DIVIDE_REG + 1;
    REF_CLK_JITTER_MAX_tmp = REF_CLK_JITTER_MAX;
    clk_out_para_cal (clk1_ht, clk1_lt, clk1_nocnt, clk1_edge, CLKOUT1_DIVIDE_REG, CLKOUT1_DUTY_CYCLE_REG);
    clk_out_para_cal (clk2_ht, clk2_lt, clk2_nocnt, clk2_edge, CLKOUT2_DIVIDE_REG, CLKOUT2_DUTY_CYCLE_REG);
    clk_out_para_cal (clk3_ht, clk3_lt, clk3_nocnt, clk3_edge, CLKOUT3_DIVIDE_REG, CLKOUT3_DUTY_CYCLE_REG);
    clk_out_para_cal (clk4_ht, clk4_lt, clk4_nocnt, clk4_edge, CLKOUT4_DIVIDE_REG, CLKOUT4_DUTY_CYCLE_REG);
    clk_out_para_cal (clk5_ht, clk5_lt, clk5_nocnt, clk5_edge, CLKOUT5_DIVIDE_REG, CLKOUT5_DUTY_CYCLE_REG);
    clk_out_para_cal (clk6_ht, clk6_lt, clk6_nocnt, clk6_edge, CLKOUT6_DIVIDE_REG, CLKOUT6_DUTY_CYCLE_REG);
    clk_out_para_cal (clkind_ht, clkind_lt, clkind_nocnt, clkind_edge, DIVCLK_DIVIDE_REG, 0.50);
    tmp_string = "CLKOUT1_PHASE";
    clkout_dly_cal (clkout1_dly, clk1pm_sel, CLKOUT1_DIVIDE_REG, CLKOUT1_PHASE_REG, tmp_string);
    tmp_string = "CLKOUT2_PHASE";
    clkout_dly_cal (clkout2_dly, clk2pm_sel, CLKOUT2_DIVIDE_REG, CLKOUT2_PHASE_REG, tmp_string);
    tmp_string = "CLKOUT3_PHASE";
    clkout_dly_cal (clkout3_dly, clk3pm_sel, CLKOUT3_DIVIDE_REG, CLKOUT3_PHASE_REG, tmp_string);
    tmp_string = "CLKOUT4_PHASE";
    clkout_dly_cal (clkout4_dly, clk4pm_sel, CLKOUT4_DIVIDE_REG, CLKOUT4_PHASE_REG, tmp_string);
    tmp_string = "CLKOUT5_PHASE";
    clkout_dly_cal (clkout5_dly, clk5pm_sel, CLKOUT5_DIVIDE_REG, CLKOUT5_PHASE_REG, tmp_string);
    tmp_string = "CLKOUT6_PHASE";
    clkout_dly_cal (clkout6_dly, clk6pm_sel, CLKOUT6_DIVIDE_REG, CLKOUT6_PHASE_REG, tmp_string);
    if (clkfb_frac_en == 1) begin
      clkfbm1_fht = clkfb_div_fint /2;
      clkfbm1_flt = clkfb_div_fint /2;
      if (clkfb_div_fint_odd > 0) begin
        clkfbm1r_sel = (8 + clkfb_div_frac_int) / 2;
        clkfbm1f_sel = 8 + clkfb_div_frac_int - (8 + clkfb_div_frac_int) / 2 ;
        clkfbm1pm_sel_int = 8 + clkfb_div_frac_int - (8 + clkfb_div_frac_int) / 2 ;
      end
      else begin
         clkfbm1f_sel = clkfb_div_frac_int - clkfb_div_frac_int / 2;
         clkfbm1pm_sel_int = clkfb_div_frac_int - clkfb_div_frac_int / 2;
         clkfbm1r_sel = clkfb_div_frac_int / 2;
      end
      tmp_string = "CLKFBOUT_PHASE";
      clkout_dly_real_cal (clkfbm1_dly, clkfbm1pm_sel, CLKFBOUT_MULT_F_REG, CLKFBOUT_PHASE_REG, tmp_string);
    end
    else begin
      tmp_string = "CLKFBOUT_PHASE";
      clkout_dly_real_cal (clkfbm1_dly, clkfbm1pm_sel, clkfb_div_fint, CLKFBOUT_PHASE_REG, tmp_string);
    end
    if (clk0_frac_en == 1) begin
      clk0_fht = clk0_div_fint /2;
      clk0_flt = clk0_div_fint /2;
      if (clk0_div_fint_odd > 0) begin
        clk0pm_rsel = (8 + clk0_div_frac_int) / 2;
       clk0pm_fsel = 8 + clk0_div_frac_int - (8 + clk0_div_frac_int) / 2;
        clk0pm_sel_int = 8 + clk0_div_frac_int - (8 + clk0_div_frac_int) / 2;
      end
      else begin
         clk0pm_fsel = clk0_div_frac_int - clk0_div_frac_int / 2;
         clk0pm_sel_int = clk0_div_frac_int - clk0_div_frac_int / 2;
         clk0pm_rsel = clk0_div_frac_int / 2;
      end
      tmp_string = "CLKOUT0_PHASE";
      clkout_dly_real_cal (clkout0_dly, clk0pm_sel, CLKOUT0_DIVIDE_F_REG, CLKOUT0_PHASE_REG, tmp_string);
    end
    else begin
      tmp_string = "CLKOUT0_PHASE";
      clkout_dly_real_cal (clkout0_dly, clk0pm_sel, clk0_div_fint, CLKOUT0_PHASE_REG, tmp_string);
    end
    if (clk0_frac_en == 0) begin
      clk_out_para_cal (clk0_ht, clk0_lt, clk0_nocnt, clk0_edge, clk0_div_fint, CLKOUT0_DUTY_CYCLE_REG);
    end
    if (clkfb_frac_en == 0) begin
      clk_out_para_cal (clkfbm1_ht, clkfbm1_lt, clkfbm1_nocnt, clkfbm1_edge, clkfb_div_fint, 0.50);
    end
    clk_out_para_cal (clkfbm2_ht, clkfbm2_lt, clkfbm2_nocnt, clkfbm2_edge, 1, 0.50);
    clkind_div = DIVCLK_DIVIDE_REG;

    dr_sram[6] = {clk5pm_sel[2:0], 1'b1, clk5_ht[5:0], clk5_lt[5:0]};
    dr_sram[7] = {clk0pmf_sel[2:0], clk0_frac_wf_f, 1'bx, clk5_cddcen, 2'b0, clk5_edge,
                  clk5_nocnt, clkout5_dly[5:0]};
    dr_sram[8] = {clk0pmr_sel[2:0], 1'b1, clk0_ht[5:0], clk0_lt[5:0]};
    dr_sram[9] = {clk0_cddcen, clk0_frac[2:0], clk0_frac_en, clk0_frac_wf_r, 2'b0,
                   clk0_edge, clk0_nocnt, clkout0_dly[5:0]};
    dr_sram[10] = {clk1pm_sel[2:0], 1'b1, clk1_ht[5:0], clk1_lt[5:0]};
    dr_sram[11] = {5'bx, clk1_cddcen, 2'b0, clk1_edge, clk1_nocnt, clkout1_dly[5:0]};
    dr_sram[12] = {clk2pm_sel[2:0], 1'b1, clk2_ht[5:0], clk2_lt[5:0]};
    dr_sram[13] = {5'bx, clk2_cddcen, 2'b0, clk2_edge, clk2_nocnt, clkout2_dly[5:0]};
    dr_sram[14] = {clk3pm_sel[2:0], 1'b1, clk3_ht[5:0], clk3_lt[5:0]};
    dr_sram[15] = {5'bx, clk3_cddcen, 2'b0, clk3_edge, clk3_nocnt, clkout3_dly[5:0]};
    dr_sram[16] = {clk4pm_sel[2:0], 1'b1, clk4_ht[5:0], clk4_lt[5:0]};
    dr_sram[17] = {5'bx, clk4_cddcen, 2'b0, clk4_edge, clk4_nocnt, clkout4_dly[5:0]};
    dr_sram[18] = {clk6pm_sel[2:0], 1'b1, clk6_ht[5:0], clk6_lt[5:0]};
    dr_sram[19] = {clkfbpmf_sel[2:0], clkfbout_frac_wf_f, 1'bx,clk6_cddcen,
                    2'b00, clk6_edge, clk6_nocnt, clkout6_dly[5:0]};
    dr_sram[20] = {clkfbpmr_sel[2:0], 1'b1, clkfbm1_ht[5:0], clkfbm1_lt[5:0]};
    dr_sram[21] = {1'bx, clkfb_frac[2:0], clkfb_frac_en,
        clkfbout_frac_wf_r, 2'b0, clkfbm1_edge, clkfbm1_nocnt, clkfbm1_dly[5:0]};
    dr_sram[22] = {2'bx, clkind_edge, clkind_nocnt, clkind_ht[5:0], clkind_lt[5:0]};

    dr_sram[23] = {2'bx, clkfbin_edge, clkfbin_nocnt, clkfbin_ht[5:0], clkfbin_lt[5:0]};

    dr_sram[24] = {6'bx, drp_lock_cnt};
    dr_sram[25] = {1'bx, drp_lock_fb_dly, drp_unlock_cnt};
    dr_sram[26] = {1'bx, drp_lock_ref_dly, drp_lock_sat_high};
    dr_sram[28] = {11'bx, 5'b0};
    dr_sram[39] = {1'b1, 2'bx, 2'b11, 2'bx, 2'b11, 2'bx, 2'b11, 2'bx, 1'b1};
    dr_sram[78] = {pll_cp[3], 2'bx, pll_cp[2:1], 2'bx, pll_cp[0], 1'b0, 2'bx, pll_cpres, 3'bx};
    dr_sram[79] = {pll_res[3], 2'bx, pll_res[2:1], 2'bx, pll_res[0], pll_lfhf[1], 2'bx, pll_lfhf[0], 4'bx};
  end

  initial begin
    clkpll_jitter_unlock = 0;
    clkinstopped_vco_f = 0;
    rst_clkfbstopped = 0;
    rst_clkinstopped  = 0;
    rst_clkfbstopped_lk = 0;
    rst_clkinstopped_lk  = 0;
    clkfb_stop_tmp = 0;
    clkin_stop_tmp = 0;
    clkout_ps = 0;
    clkout_ps_tmp1 = 0;
    clkout_ps_tmp2 = 0;
    clkvco_ps_tmp1 = 0;
    clkvco_ps_tmp2 = 0;
    clkvco_ps_tmp2_en = 0;
    clkvco_lk_osc = 0;
    clkvco_lk_en = 0;
    clkvco_lk_tmp = 0;
    clkvco_lk_dly_tmp = 0;
    clk_osc = 0;
    clkin_p = 0;
    clkfb_p = 0;
    clkind_edgei = 0;
    clkind_nocnti = 0;
    clkind_hti = 0;
    clkind_lti = 0;
    clkind_divi = 1;
    ps_lock = 0;
    ps_lock_dly = 0;
    PSDONE_out = 0;
    psdone_out1 = 0;
    rst_int = 0;
    clkinstopped_out1 = 0;
    clkfbstopped_out1 = 0;
    clkin_period[0] = 0;
    clkin_period[1] = 0;
    clkin_period[2] = 0;
    clkin_period[3] = 0;
    clkin_period[4] = 0;
    clkin_period_tmp_t = 0;
    period_avg = 0;
    period_fb = 0;
    clkin_lost_val = 500;
    clkfb_lost_val = 500;
    clkin_lost_val_lk = 500;
    fb_delay = 0;
    clkfbm1_div = 1;
    clkfbm2_div = 1;
    clkfbm1_div1 = 0;
    clkfbm2_div1 = 0;
    clkvco_delay = 0;
    val_tmp = 0;
    dly_tmp = 0;
    fbm1_comp_delay = 0;
    clkfbm1pm_rl = 0;
    period_vco = 0;
    period_vco1 = 0;
    period_vco2 = 0;
    period_vco3 = 0;
    period_vco4 = 0;
    period_vco5 = 0;
    period_vco6 = 0;
    period_vco7 = 0;
    period_vco_half = 0;
    period_vco_half1 = 0;
    period_vco_half_rm = 0;
    period_vco_half_rm1 = 0;
    period_vco_half_rm2 = 0;
    period_vco_rm = 0;
    period_vco_cmp_cnt = 0;
    period_vco_cmp_flag = 0;
    period_ps = 0;
    period_ps_old = 0;
    clkfb_frac_ht = 0;
    clkfb_frac_lt = 0;
    clk0_frac_ht = 0;
    clk0_frac_lt = 0;
    clkvco_rm_cnt = 0;
    fb_delay_found = 0;
    fb_delay_found_tmp = 0;
    clkin_edge = 0;
    delay_edge = 0;
    fbclk_tmp = 0;
    clkfb_tst = 0;
    clkout_en = 0;
    clkout_en0 = 0;
    clkout_en_t = 0;
    clkout_en0_tmp = 0;
    clkout_en1 = 0;
    pll_locked_tmp1  = 0;
    pll_locked_tmp2  = 0;
    pll_locked_tm = 0;
    pll_locked_delay = 0;
    clkout_mux = 8'b0;
    clkout_ps_mux = 8'b0;
    unlock_recover = 0;
    clkin_jit = 0;
    clkin_lock_cnt = 0;
    lock_period = 0;
    rst_edge = 0;
    rst_ht = 0;
    DRDY_out = 0;
    drdy_out1 = 0;
    CDDCDONE_out = 0;
    locked_out1 = 0;
//    locked_out_tmp = 0;
    DO_out = 16'b0;
    drp_lock = 0;
    drp_lock_lat_cnt = 0;
    CLKOUT0_out = 0;
    clk0_dly_cnt = 6'b0;
    clk1_dly_cnt = 6'b0;
    clk2_dly_cnt = 6'b0;
    clk3_dly_cnt = 6'b0;
    clk4_dly_cnt = 6'b0;
    clk5_dly_cnt = 6'b0;
    clk6_dly_cnt = 6'b0;
    clkfbm1_dly_cnt = 6'b0;
    clk0_cnt = 8'b0;
    clk1_cnt = 8'b0;
    clk2_cnt = 8'b0;
    clk3_cnt = 8'b0;
    clk4_cnt = 8'b0;
    clk5_cnt = 8'b0;
    clk6_cnt = 8'b0;
    clkfbm1_cnt = 8'b0;
    clkfbm2_cnt = 8'b0;
    clkind_cnt = 8'b0;
    CLKOUT0_out = 0;
    CLKOUT1_out = 0;
    CLKOUT2_out = 0;
    CLKOUT3_out = 0;
    CLKOUT4_out = 0;
    CLKOUT5_out = 0;
    CLKOUT6_out = 0;
    clk0_nf_out = 0;
    clk0_frac_out = 0;
    clk1_out = 0;
    clk2_out = 0;
    clk3_out = 0;
    clk4_out = 0;
    clk5_out = 0;
    clk6_out = 0;
    CLKFBOUT_out = 0;
    clkfbm1_nf_out = 0;
    clkfbm1_frac_out = 0;
    clkfbm2_out = 0;
    clkfbm2_out_tmp = 0;
    clkind_out = 0;
    clkind_out_tmp = 0;
    clk_osc = 0;
    clkin_p = 0;
    clkfb_p = 0;
    pwron_int = 1;
    #100000 pwron_int = 0;
  end

  assign #1 clkinsel_tmp = CLKINSEL_in;

  assign  glock = (startup_wait_sig) ? locked_out1 : 1;
  assign (weak1, strong0) glbl.PLL_LOCKG = (glock == 0) ? 0 : p_up;

  initial begin
    init_chk = 0;
    #1;
    init_chk = 1;
  end

  always @(CLKINSEL_in or posedge init_chk ) begin
  if(trig_attr_chk)
  begin
    if ($time > 1 && rst_int === 0 && (clkinsel_tmp === 0 || clkinsel_tmp === 1)) begin
      $display("Error: [Unisim %s-4] Input clock can only be switched when RST=1. CLKINSEL at time %t changed when RST=0. Instance %m", MODULE_NAME, $time);
      $finish;
    end

    clkin_chk_t1_r = 1000.000 / CLKIN_FREQ_MIN_REG;
    clkin_chk_t1_i = $rtoi(1000.0 * clkin_chk_t1_r);
    clkin_chk_t1 = 0.001 * clkin_chk_t1_i;
    clkin_chk_t2_r = 1000.000 / CLKIN_FREQ_MAX_REG;
    clkin_chk_t2_i = $rtoi(1000.0 * clkin_chk_t2_r);
    clkin_chk_t2 = 0.001 * clkin_chk_t2_i;

    if (CLKINSEL_in === 1 && $time > 1 || CLKINSEL_in !== 0 && init_chk == 1) begin
      if (CLKIN1_PERIOD_REG > clkin_chk_t1 || CLKIN1_PERIOD_REG < clkin_chk_t2) begin
        $display ("Error: [Unisim %s-5] The attribute CLKIN1_PERIOD is set to %f ns and out the allowed range %f ns to %f ns set by CLKIN_FREQ_MIN/MAX. Instance %m", MODULE_NAME, CLKIN1_PERIOD_REG, clkin_chk_t2, clkin_chk_t1);

        $finish;
      end
    end
    else if (CLKINSEL_in ===0 && $time > 1 || init_chk == 1 && clkinsel_tmp === 0 ) begin
      if (CLKIN2_PERIOD_REG > clkin_chk_t1 || CLKIN2_PERIOD_REG < clkin_chk_t2) begin
        $display ("Error: [Unisim %s-6] The attribute CLKIN2_PERIOD is set to %f ns and out the allowed range %f ns to %f ns set by CLKIN_FREQ_MIN/MAX. Instance %m", MODULE_NAME, CLKIN2_PERIOD_REG, clkin_chk_t2, clkin_chk_t1);
        $finish;
      end
    end

    period_clkin =  (CLKINSEL_in === 0) ? CLKIN2_PERIOD_REG : CLKIN1_PERIOD_REG;

    clkvco_freq_init_chk =  (1000.0 * CLKFBOUT_MULT_F_REG) / (period_clkin * DIVCLK_DIVIDE_REG);
   if (clkvco_freq_init_chk > VCOCLK_FREQ_MAX_REG || clkvco_freq_init_chk < VCOCLK_FREQ_MIN_REG) begin
     if (clkinsel_tmp === 0 && $time > 1 || clkinsel_tmp === 0 && init_chk === 1) begin
      $display ("Error: [Unisim %s-7] The calculated VCO frequency=%f Mhz. This exceeds the permitted VCO frequency range of %f Mhz to %f Mhz set by VCOCLK_FREQ_MIN/MAX. The VCO frequency is calculated with formula: VCO frequency =  CLKFBOUT_MULT_F / (DIVCLK_DIVIDE * CLKIN2_PERIOD). Please adjust the attributes to the permitted VCO frequency range. Instance %m", MODULE_NAME, clkvco_freq_init_chk, VCOCLK_FREQ_MIN_REG, VCOCLK_FREQ_MAX_REG);
      $finish;
    end
    else if (clkinsel_tmp === 1 && $time > 1 || clkinsel_tmp !== 0 && init_chk === 1) begin
      $display ("Error: [Unisim %s-8] The calculated VCO frequency=%f Mhz. This exceeds the permitted VCO frequency range of %f Mhz to %f Mhz set by VCOCLK_FREQ_MIN/MAX. The VCO frequency is calculated with formula: VCO frequency =  CLKFBOUT_MULT_F / (DIVCLK_DIVIDE * CLKIN1_PERIOD). Please adjust the attributes to the permitted VCO frequency range.", MODULE_NAME, clkvco_freq_init_chk, VCOCLK_FREQ_MIN_REG, VCOCLK_FREQ_MAX_REG);
      $finish;
    end
   end

    clkpfd_freq_init_chk = (1000.0) / (period_clkin * DIVCLK_DIVIDE_REG);
   if (clkpfd_freq_init_chk > CLKPFD_FREQ_MAX_REG || clkpfd_freq_init_chk < CLKPFD_FREQ_MIN_REG) begin
     if (clkinsel_tmp === 0 && $time > 1 || clkinsel_tmp === 0 && init_chk === 1) begin
      $display ("Error: [Unisim %s-9] The calculated PFD frequency=%f Mhz. This exceeds the permitted PFD frequency range of %f Mhz to %f Mhz set by CLKPFD_FREQ_MIN/MAX. The PFD frequency is calculated with formula: PFD frequency =  1 /(DIVCLK_DIVIDE * CLKIN2_PERIOD). Please adjust the attributes to the permitted PFD frequency range.", MODULE_NAME, clkpfd_freq_init_chk, CLKPFD_FREQ_MIN_REG, CLKPFD_FREQ_MAX_REG);
      $finish;
    end
    else if (clkinsel_tmp === 1 && $time > 1 || clkinsel_tmp !== 0 && init_chk === 1) begin
      $display ("Error: [Unisim %s-10] The calculated PFD frequency=%f Mhz. This exceeds the permitted PFD frequency range of %f Mhz to %f Mhz set by CLKPFD_FREQ_MIN/MAX. The PFD frequency is calculated with formula: PFD frequency =  1 /(DIVCLK_DIVIDE * CLKIN1_PERIOD). Please adjust the attributes to the permitted PFD frequency range.", MODULE_NAME, clkpfd_freq_init_chk, CLKPFD_FREQ_MIN_REG, CLKPFD_FREQ_MAX_REG);
      $finish;
     end
   end
  end
  end

  assign  init_trig = 1;
  assign clkpll_r = (CLKINSEL_in) ? CLKIN1_in : CLKIN2_in;
  assign pwrdwn_in1 =  (PWRDWN_in === 1) ? 1 : 0;
  assign rst_input  =  (RST_in === 1 | pwrdwn_in1 === 1) ? 1 : 0;

  always @(posedge clkpll_r or posedge rst_input)
    if (rst_input)
       rst_int <= 1;
    else
       rst_int <= rst_input ;

  assign rst_in_o = (rst_int || rst_clkfbstopped || rst_clkinstopped);

//simprim_rst_h
  always @(posedge pwrdwn_in1 or posedge pchk_clr)
    if (pwrdwn_in1)
       pwrdwn_in1_h <= 1;
    else if (pchk_clr)
       pwrdwn_in1_h <= 0;

  always @(posedge RST_in or posedge pchk_clr)
    if (RST_in)
       rst_input_r_h <= 1;
    else if (pchk_clr)
       rst_input_r_h <= 0;


  always @(rst_input )
    if (rst_input==1) begin
       rst_edge = $time;
       pchk_clr = 0;
    end
    else if (rst_input==0 && rst_edge > 1) begin
       rst_ht = $time - rst_edge;
       if (rst_ht < 1500)  begin
         if (rst_input_r_h == 1 && pwrdwn_in1_h == 1)
          $display("Error: [Unisim %s-11] RST and PWRDWN at time %t must be asserted at least for 1.5 ns. Instance %m ", MODULE_NAME, $time);
         else if (rst_input_r_h == 1 && pwrdwn_in1_h == 0)
          $display("Error: [Unisim %s-12] RST at time %t must be asserted at least for 1.5 ns. Instance %m", MODULE_NAME, $time);
         else if (rst_input_r_h == 0 && pwrdwn_in1_h == 1)
          $display("Error: [Unisim %s-13] PWRDWN at time %t must be asserted at least for 1.5 ns. Instance %m", MODULE_NAME, $time);
       end
       pchk_clr = 1;
    end
//endsimprim_rst_h

  //
  // DRP port read and write
  //

  assign do_out1 = dr_sram[daddr_lat];

  always @(posedge DCLK_in or posedge glblGSR or CDDCREQ_in)
    if (glblGSR == 1) begin
       drp_lock <= 0;
       drp_lock_lat_cnt <= 0;
    end
    else begin
      if (DEN_in == 1) begin
        valid_daddr = addr_is_valid(DADDR_in);
        if (drp_lock == 1) begin
          $display("Error: [Unisim %s-14] DEN is high at time %t. Need wait for DRDY signal before next read/write operation through DRP. Instance %m ", MODULE_NAME, $time);
        end
        else begin
          drp_lock <= 1;
          drp_lock_lat_cnt <= drp_lock_lat_cnt + 1;
          daddr_lat <= DADDR_in;
        end
//        if (valid_daddr && ( DADDR_in == 7'b1001111 ||
//          DADDR_in == 7'b1001110 || DADDR_in == 7'b0101000 ||
//          (DADDR_in >= 7'b0011000 && DADDR_in <= 7'b0011010) ||
//          (DADDR_in >= 7'b0000110 && DADDR_in <= 7'b0010110))) begin
//        end
//        else begin
        if (~valid_daddr) begin
          $display("Warning: [Unisim %s-15] Address DADDR=%b is unsupported at time %t. Instance %m ", MODULE_NAME, DADDR_in, $time);
        end

        if (DWE_in == 1) begin          // write process
          if (rst_input == 1 || CDDCREQ_in == 1) begin
//            if (valid_daddr && ( DADDR_in == 7'b1001111 ||
//          DADDR_in == 7'b1001110 || DADDR_in == 7'b0101000 ||
//          (DADDR_in >= 7'b0011000 && DADDR_in <= 7'b0011010) ||
//          (DADDR_in >= 7'b0000110 && DADDR_in <= 7'b0010110))) begin
            if (valid_daddr) begin
                  dr_sram[DADDR_in] <= DI_in;
             end
             if (DADDR_in == 7'b0001001) begin // 9
               clkout_delay_para_drp (clkout0_dly, clk0_nocnt, clk0_edge, DI_in, DADDR_in);
               clk0_frac[2:0] <= DI_in[14:12];
               clk0_frac_en <= DI_in[11];
             end
             if (DADDR_in == 7'b0001000) begin // 8 
               clkout_hl_para_drp (clk0_lt, clk0_ht, clk0pm_sel, DI_in, DADDR_in);
               clk0pmr_sel[2:0] <= DI_in[15:13];
             end
             if (DADDR_in == 7'b0001011) // 11
               clkout_delay_para_drp (clkout1_dly, clk1_nocnt, clk1_edge, DI_in, DADDR_in);
             if (DADDR_in == 7'b0001010) // 10 
               clkout_hl_para_drp (clk1_lt, clk1_ht, clk1pm_sel, DI_in, DADDR_in);
             if (DADDR_in == 7'b0001101) // 13
               clkout_delay_para_drp (clkout2_dly, clk2_nocnt, clk2_edge, DI_in, DADDR_in);
             if (DADDR_in == 7'b0001100) // 12
               clkout_hl_para_drp (clk2_lt, clk2_ht, clk2pm_sel, DI_in, DADDR_in);
             if (DADDR_in == 7'b0001111) // 15
               clkout_delay_para_drp (clkout3_dly, clk3_nocnt, clk3_edge, DI_in, DADDR_in);
             if (DADDR_in == 7'b0001110) // 14
               clkout_hl_para_drp (clk3_lt, clk3_ht, clk3pm_sel, DI_in, DADDR_in);
             if (DADDR_in == 7'b0010001) // 17
               clkout_delay_para_drp (clkout4_dly, clk4_nocnt, clk4_edge, DI_in, DADDR_in);
             if (DADDR_in == 7'b0010000) // 16
               clkout_hl_para_drp (clk4_lt, clk4_ht, clk4pm_sel, DI_in, DADDR_in);
             if (DADDR_in == 7'b0010011) begin // 19
               clkout_delay_para_drp (clkout6_dly, clk6_nocnt, clk6_edge, DI_in, DADDR_in);
               clkfbpmf_sel[2:0] <= DI_in[13:11];
             end
             if (DADDR_in == 7'b0010010) // 18
               clkout_hl_para_drp (clk6_lt, clk6_ht, clk6pm_sel, DI_in, DADDR_in);
             if (DADDR_in == 7'b0000111) begin // 7
               clkout_delay_para_drp (clkout5_dly, clk5_nocnt, clk5_edge, DI_in, DADDR_in);
               clk0pmf_sel[2:0] <= DI_in[13:11];
             end
             if (DADDR_in == 7'b0000110) // 6
               clkout_hl_para_drp (clk5_lt, clk5_ht, clk5pm_sel, DI_in, DADDR_in);

             if (DADDR_in == 7'b0010101) begin // 21
               clkout_delay_para_drp (clkfbm1_dly, clkfbm1_nocnt, clkfbm1_edge, DI_in, DADDR_in);
               clkfbtmp_nocnti = DI_in[6];
               clkfb_frac[2:0] <= DI_in[14:12];
               clkfb_frac_en <= DI_in[11];
             end
             if (DADDR_in == 7'b0010100) begin // 20
               clkout_hl_para_drp (clkfbm1_lt, clkfbm1_ht, clkfbm1pm_sel, DI_in, DADDR_in);
               clkfbpmr_sel[2:0] <= DI_in[15:13];
               clkfbtmp_lti = {2'b00, DI_in[5:0]};
               clkfbtmp_hti = {2'b00, DI_in[11:6]};
               if (clkfbtmp_nocnti == 1)
                      clkfbtmp_divi = 8'b00000001;
               else if (DI_in[5:0] == 6'b0 && DI_in[11:6] == 6'b0)
                      clkfbtmp_divi = 8'b10000000;
               else if (DI_in[5:0] == 6'b0)
                      clkfbtmp_divi = 64 + clkfbtmp_hti;
               else if (DI_in[11:6] == 6'b0)
                      clkfbtmp_divi = 64 + clkfbtmp_lti;
               else
                      clkfbtmp_divi = clkfbtmp_hti + clkfbtmp_lti;

               if (clkfbtmp_divi > M_MAX || (clkfbtmp_divi < M_MIN))
                  $display("Error: [Unisim %s-16] DI at Address DADDR=%b is %h at time %t. The sum of DI[11:6] and DI[5:0] is %h and over the range of %f to %f. Instance %m ", MODULE_NAME, DADDR_in, DI_in, $time, clkfbtmp_divi, M_MIN, M_MAX);
            end

             if (DADDR_in == 7'b0010110) begin // 22
               clkind_lti = {2'b00, DI_in[5:0]};
               clkind_hti = {2'b00, DI_in[11:6]};
               clkind_lt <= clkind_lti;
               clkind_ht <= clkind_hti;
               clkind_nocnt <= DI_in[12];
               clkind_nocnti = DI_in[12];
               clkind_edgei = DI_in[13];
               clkind_edge <= DI_in[13];
               if (DI_in[12] == 1)
                      clkind_divi = 8'b00000001;
               else if (DI_in[5:0] == 6'b0 && DI_in[11:6] == 6'b0)
                      clkind_divi = 8'b10000000;
               else if (DI_in[5:0] == 6'b0)
                      clkind_divi = 64 + clkind_hti;
               else if (DI_in[11:6] == 6'b0)
                      clkind_divi = 64 + clkind_lti;
               else
                      clkind_divi = clkind_hti + clkind_lti;

               clkind_div <= clkind_divi;
               if (clkind_divi > D_MAX || (clkind_divi < 1 && clkind_nocnti == 0))
                  $display("Error: [Unisim %s-17] DI at Address DADDR=%b is %h at time %t. The sum of DI[11:6] and DI[5:0] is %d and over the range of 1 to %d. Instance %m", MODULE_NAME,  DADDR_in, DI_in, $time, clkind_divi, D_MAX);
            end
          end
          else begin
                  $display("Error: [Unisim %s-18] RST is low at time %t. RST need to be high when changing paramters through DRP. Instance %m", MODULE_NAME, $time);
          end
        end //DWE
    end  //DEN
    if ( drp_lock == 1) begin
       if (drp_lock_lat_cnt < drp_lock_lat) begin
          drp_lock_lat_cnt <= drp_lock_lat_cnt + 1;
       end
       else begin
          drp_lock <= 0;
          drdy_out1 <= 1;
          drp_lock_lat_cnt <= 0;
       end
    end
    if (drdy_out1 == 1) drdy_out1 <= 0;
  end

  always @(posedge CDDCREQ_in or negedge CDDCREQ_in)
  begin
    if (CDDCREQ_in == 1'b1)
     CDDCDONE_out <= 1'b0;
   else
   begin
     @(posedge clkpll)
     @(posedge clkpll)
     CDDCDONE_out <= ~CDDCREQ_in;
   end
  end

  function addr_is_valid;
  input [6:0] daddr_funcin;
  begin
    addr_is_valid = 1;
    for (i=0; i<=6; i=i+1)
      if ( daddr_funcin[i] != 0 && daddr_funcin[i] != 1)
         addr_is_valid = 0;
    if (addr_is_valid == 1) begin
      if ((daddr_funcin == 7'b0100111) || // 39
          (daddr_funcin == 7'b1001111) || // 79
          (daddr_funcin == 7'b1001110) || // 78
          (daddr_funcin == 7'b0011100) || // 28
          (daddr_funcin >= 7'b0011000 && daddr_funcin <= 7'b0011010) || // 24 to 26
          (daddr_funcin >= 7'b0000110 && daddr_funcin <= 7'b0010110))   // 6 to 22
         addr_is_valid = 1;
       else
         addr_is_valid = 0;
    end
  end
  endfunction

  // end process drp;

  //
  // determine clock period
  //

  always @(posedge clkpll_r or posedge rst_int or posedge rst_clkinsel_flag)
    if (rst_int || rst_clkinsel_flag)
    begin
      clkin_period[0] <= 1000 * period_clkin;
      clkin_period[1] <= 1000 * period_clkin;
      clkin_period[2] <= 1000 * period_clkin;
      clkin_period[3] <= 1000 * period_clkin;
      clkin_period[4] <= 1000 * period_clkin;
      clkin_jit <= 0;
      clkin_lock_cnt <= 0;
      pll_locked_tm <= 0;
      lock_period <= 0;
      pll_locked_tmp1 <= 0;
      clkout_en0_tmp <= 0;
      unlock_recover <= 0;
      clkin_edge <= 0;
    end
    else begin
      clkin_edge <= $time;
      if (clkin_edge != 0 && clkinstopped_out1 == 0 && rst_clkinsel_flag == 0) begin
         clkin_period[4] <= clkin_period[3];
         clkin_period[3] <= clkin_period[2];
         clkin_period[2] <= clkin_period[1];
         clkin_period[1] <= clkin_period[0];
         clkin_period[0] <= $time - clkin_edge;
      end

      if (pll_unlock == 0 && clkin_edge != 0 && clkinstopped_out1 == 0)
         clkin_jit <=  $time - clkin_edge - clkin_period[0];
      else
         clkin_jit <= 0;
      if ( (clkin_lock_cnt < lock_cnt_max) && fb_delay_found && pll_unlock1 == 0)
         clkin_lock_cnt <= clkin_lock_cnt + 1;
      else if (pll_unlock1 == 1 && pll_locked_tmp1 ==1 ) begin
         clkin_lock_cnt <= lock_cnt_max - 6;
         unlock_recover <= 1;
      end
      if ( clkin_lock_cnt >= pll_lock_time && pll_unlock1 == 0)
         pll_locked_tm <= 1;
      if ( clkin_lock_cnt == lock_period_time )
         lock_period <= 1;
      if (clkin_lock_cnt >= clkout_en_time && pll_locked_tm == 1) begin
         clkout_en0_tmp <= 1;
      end
      if (clkin_lock_cnt >= locked_en_time && clkout_en == 1)
         pll_locked_tmp1 <= 1;
      if (unlock_recover ==1 && clkin_lock_cnt  >= lock_cnt_max)
         unlock_recover <= 0;
    end

  always @(posedge pll_locked_tmp1)
    if (CLKINSEL_in === 0) begin
       pchk_tmp1 = CLKIN2_PERIOD_REG * 1100;
       pchk_tmp2 = CLKIN2_PERIOD_REG * 900;
       if (period_avg > pchk_tmp1 || period_avg < pchk_tmp2) begin
         $display("Warning: [Unisim %s-19] Input CLKIN2 period and attribute CLKIN2_PERIOD are not same. Instance %m ", MODULE_NAME);
       end
    end
    else begin
       pchk_tmp1 = CLKIN1_PERIOD_REG * 1100;
       pchk_tmp2 = CLKIN1_PERIOD_REG * 900;
       if (period_avg > pchk_tmp1 || period_avg < pchk_tmp2) begin
         $display("Warning: [Unisim %s-20] Input CLKIN1 period and attribute CLKIN1_PERIOD are not same. Instance %m ", MODULE_NAME);
       end
    end

  always @(negedge rst_int)
    if (clkfb_frac_en == 0) begin
      clkout_en_val = m_product;
      clkout_en_time = md_product + pll_lock_time;
      locked_en_time = md_product +  clkout_en_time + 2;
      lock_cnt_max = locked_en_time + 16;
    end
    else begin
      clkout_en_val = mf_product - 1;
      clkout_en_time = mf_product + 4 + pll_lock_time;
      locked_en_time = md_product +  clkout_en_time + 2;
      lock_cnt_max = locked_en_time + 16;
    end

  always @(clkout_en0_tmp)
    clkout_en0_tmp1 <= #1 clkout_en0_tmp;

  always @(clkout_en0_tmp1 or clkout_en_t or clkout_en0_tmp )
    if (clkout_en0_tmp==0 )
      clkout_en0 = 0;
    else begin
     if (clkfb_frac_en == 1) begin
       if (clkout_en_t > clkout_en_val && clkout_en0_tmp1 == 1)
          clkout_en0 <= #period_vco6 clkout_en0_tmp1;
     end
     else begin
       if (clkout_en_t == clkout_en_val && clkout_en0_tmp1 == 1)
          clkout_en0 <= #period_vco6 clkout_en0_tmp1;
     end
   end

  always @(clkout_en0 )
    clkout_en1 <= #(clkvco_delay) clkout_en0;

  always @(clkout_en1 or rst_in_o )
  if (rst_in_o)
    clkout_en = 0;
  else
    clkout_en =  clkout_en1;

  always @(pll_locked_tmp1 )
    if (pll_locked_tmp1==0)
      pll_locked_tmp2 =  pll_locked_tmp1;
    else begin
      pll_locked_tmp2 <= #pll_locked_delay  pll_locked_tmp1;
    end

  always @(rst_int)
    if (rst_int) begin
      assign pll_locked_tmp2 = 0;
      assign clkout_en0 = 0;
      assign clkout_en1 = 0;
    end
    else begin
      deassign pll_locked_tmp2;
      deassign clkout_en0;
      deassign clkout_en1;
    end

  assign locked_out_tmp = (pll_locked_tm && pll_locked_tmp2 && ~pll_unlock && !unlock_recover) ? 1 : 0;

  always @(rst_int or locked_out_tmp)
     if (rst_int == 1)
           locked_out1 <= #1000 0;
     else
        locked_out1 <= locked_out_tmp;

  always @(clkin_period[0] or clkin_period[1] or clkin_period[2] or
           clkin_period[3] or clkin_period[4] or period_avg ) begin
    if (clkin_period[0] > clkin_period[1])
        clkin_period_tmp_t = clkin_period[0] - clkin_period[1];
    else
        clkin_period_tmp_t = clkin_period[1] - clkin_period[0];

    if ( (clkin_period[0] != period_avg) && (clkin_period[0] < 1.5 * period_avg || clkin_period_tmp_t <= 300) )
      period_avg = (clkin_period[0] + clkin_period[1] + clkin_period[2]
                 + clkin_period[3] + clkin_period[4])/5;
  end

  always @(clkinstopped_out_dly or rst_int)
  if (rst_int)
     clkinstopped_hold = 0;
  else begin
    if (clkinstopped_out1)
      clkinstopped_hold <=  #1 1;
    else begin
      if (clkin_hold_f)
         clkinstopped_hold = 0;
    end
  end

  always @(posedge clkinstopped_out1) begin
    period_avg_stpi <= period_avg;
    pd_stp_p <= #1 1;
    @(negedge clkvco)
     pd_stp_p <= #1 0;
  end

  always @(negedge clkvco or posedge rst_int or posedge pd_stp_p)
  if (rst_int) begin
    period_avg_stp <= 1000;
    vco_stp_f <= 0;
  end
  else if (pd_stp_p)
      period_avg_stp <=  period_avg_stpi;
  else  begin
    if (clkinstopped_out_dly2 == 1 && clkin_hold_f == 0) begin
      if (period_vco > 1739)
       vco_stp_f <= 1;
      else begin
         period_avg_stp  <= period_avg_stp + 1;
      end
    end
  end


  always @(period_avg or lock_period or clkind_div)
   if (period_avg > 500 && lock_period == 1)  begin
    clkin_lost_val = ((period_avg * 1.5) / 500) - 1;
    clkfb_lost_val = ((period_avg * 1.5 * clkind_div) / 500) - 1;
  end

  always @(clkfb_frac_en or clkfbm1_f_div or  clkfbm1_div)
    if (clkfb_frac_en)
        clkfbm1_div_t = clkfbm1_f_div;
    else
        clkfbm1_div_t = clkfbm1_div;

  always @(period_avg or clkind_div or clkfbm1_div_t or clkinstopped_hold
            or period_avg_stp or posedge rst_clkinstopped_rc)
  if (period_avg > 0 ) begin
    md_product = clkind_div * clkfbm1_div_t;
    m_product = clkfbm1_div_t;
    m_product2 = clkfbm1_div_t / 2;
    clkvco_div_fint = $rtoi(clkfbm1_div_t/clkind_div);
    clkvco_div_frac = (clkfbm1_div_t/clkind_div) - clkvco_div_fint;
    if (clkvco_div_frac > 0.000)
    clkvco_frac_en = 1;
    else
    clkvco_frac_en = 0;
    period_fb = period_avg * clkind_div;
    period_vco_tmp = period_fb / clkfbm1_div_t;
    period_vco_rl = 1.0 * period_fb / clkfbm1_div_t;
    clkvco_pdrm =  (period_avg * clkind_div / clkfbm1_div_t) - period_vco_tmp;
    period_vco_mf = period_avg * 8;
    if (clkinstopped_hold == 1) begin
      if (clkin_hold_f) begin
        period_vco = (20000 * period_vco_tmp) / (20000 - period_vco_tmp);
        period_vco_rl = (20000 * period_vco_tmp) / (20000 - period_vco_tmp);
      end
      else begin
        period_vco = period_avg_stp * clkind_div /clkfbm1_div_t;
        period_vco_rl = period_avg_stp * clkind_div /clkfbm1_div_t;
      end
    end
    else
        period_vco = period_vco_tmp;
    clkfbm1_div_t_int = $rtoi(clkfbm1_div_t);
    period_vco_rm = period_fb % clkfbm1_div_t_int;
    if (period_vco_rm > 1) begin
      if (period_vco_rm > m_product2)  begin
          period_vco_cmp_cnt = m_product / (m_product - period_vco_rm) - 1;
          period_vco_cmp_flag = 2;
      end
      else begin
         period_vco_cmp_cnt = (m_product / period_vco_rm) - 1;
         period_vco_cmp_flag = 1;
      end
    end
    else begin
      period_vco_cmp_cnt = 0;
      period_vco_cmp_flag = 0;
    end
    period_vco_half = period_vco /2;
    period_vco_half_rm = period_vco - period_vco_half;
    period_vco_half_rm1 = period_vco_half_rm + 1;
    if (period_vco_half_rm < 1)
      period_vco_half_rm2 = 0;
    else
      period_vco_half_rm2 = period_vco_half_rm - 1;
    period_vco_half1 = period_vco - period_vco_half + 1;
    pll_locked_delay = period_fb * clkfbm1_div_t;
    clkin_dly_t =  period_avg * (clkind_div + 1.25);
    clkfb_dly_t = period_fb * 2.25 ;
    period_vco1 = period_vco / 8;
    period_vco2 = period_vco / 4;
    period_vco3 = period_vco * 3/ 8;
    period_vco4 = period_vco / 2;
    period_vco5 = period_vco * 5 / 8;
    period_vco6 = period_vco *3 / 4;
    period_vco7 = period_vco * 7 / 8;
  end

  always @(clkfbm1_ht or clkfbm1_lt or clkfb_frac or clkfb_frac_en or clkfbpmf_sel)
  if (clkfb_frac_en == 1 && clkfb_div_adj == 1) begin
     if (clkfbpmf_sel < 4) begin
        clkfbm1_odd_frac = clkfb_frac;
         tmp_fbo = 0.0;
         tmp_fbq = 2 * clkfbm1_lt - clkfbm1_ht + 1;
     end
     else if (clkfbpmf_sel > 4 ) begin
         clkfbm1_odd_frac = clkfb_frac + 8;
         tmp_fbo = 1.0;
         tmp_fbq = 2 * clkfbm1_lt - clkfbm1_ht;
     end
     else begin
         clkfbm1_odd_frac = clkfb_frac + 8;
         tmp_fbo = 1.0;
         tmp_fbq = 2.0 * clkfbm1_lt - clkfbm1_ht + 1.0;
     end

     tmp_fbp = clkfbm1_odd_frac / 8.0 - tmp_fbo;
     clkfbm1_f_div = 2.0 * tmp_fbq  + tmp_fbp + tmp_fbo;
     clkfb_div_fint = $rtoi(clkfbm1_f_div);
     clkfb_div_frac = clkfbm1_f_div - clkfb_div_fint;
     clkfb_div_frac_int = $rtoi(clkfb_div_frac * 8);
     clkfb_div_fint_tmp1 = clkfb_div_fint / 2;
     clkfb_div_fint_odd = clkfb_div_fint - clkfb_div_fint_tmp1 -clkfb_div_fint_tmp1;

      clkfbm1_fht = clkfb_div_fint /2;
      clkfbm1_flt = clkfb_div_fint /2;
      if (clkfb_div_fint_odd > 0) begin
        clkfbm1r_sel = (8 + clkfb_div_frac_int) / 2;
        clkfbm1f_sel = 8 + clkfb_div_frac_int - (8 + clkfb_div_frac_int) / 2 ;
        clkfbm1pm_sel_int = 8 + clkfb_div_frac_int - (8 + clkfb_div_frac_int) / 2 ;
      end
      else begin
         clkfbm1f_sel = clkfb_div_frac_int - clkfb_div_frac_int / 2;
         clkfbm1pm_sel_int = clkfb_div_frac_int - clkfb_div_frac_int / 2;
         clkfbm1r_sel = clkfb_div_frac_int / 2;
      end
  end

  always @(clkfbm1_f_div or clkfb_frac_en)
    if (clkfb_frac_en == 1)
        mf_product = clkfbm1_f_div * 8;

  always @(clk0_ht or clk0_lt or clk0_frac or clk0_frac_en or clk0pmf_sel)
  if (clk0_frac_en == 1 && clk0_div_adj == 1) begin
     if (clk0pmf_sel < 4) begin
        clk0_odd_frac = clk0_frac;
         tmp_f0o = 0.0;
         tmp_f0q = 2 * clk0_lt - clk0_ht + 1;
     end
     else if (clk0pmf_sel > 4 ) begin
         clk0_odd_frac = clk0_frac + 8;
         tmp_f0o = 1.0;
         tmp_f0q = 2 * clk0_lt - clk0_ht;
     end
     else begin
         clk0_odd_frac = clk0_frac + 8;
         tmp_f0o = 1.0;
//         tmp_f0q = 2.0 * clk0_lt - clk0_ht + 1;
         tmp_f0q = 2.0 * clk0_lt - clk0_ht;
     end

     tmp_f0p = clk0_odd_frac / 8.0 - tmp_f0o;
     clk0_f_div = 2.0 * tmp_f0q  + tmp_f0p + tmp_f0o;
     clk0_div_fint = $rtoi(clk0_f_div);
     clk0_div_frac = clk0_f_div - clk0_div_fint;
     clk0_div_frac_int = $rtoi(clk0_div_frac * 8);
     clk0_div_fint_tmp1 = clk0_div_fint / 2;
     clk0_div_fint_odd = clk0_div_fint - clk0_div_fint_tmp1 -clk0_div_fint_tmp1;
      clk0_fht = clk0_div_fint /2;
      clk0_flt = clk0_div_fint /2;
      if (clk0_div_fint_odd > 0) begin
        clk0pm_rsel = (8 + clk0_div_frac_int) / 2;
       clk0pm_fsel = 8 + clk0_div_frac_int - (8 + clk0_div_frac_int) / 2;
        clk0pm_sel_int = 8 + clk0_div_frac_int - (8 + clk0_div_frac_int) / 2;
      end
      else begin
         clk0pm_fsel = clk0_div_frac_int - clk0_div_frac_int / 2;
         clk0pm_sel_int = clk0_div_frac_int - clk0_div_frac_int / 2;
         clk0pm_rsel = clk0_div_frac_int / 2;
      end
  end

  always @(period_vco_rl or clkfbm1_fht or clkfbm1_flt or clkfbm1r_sel or clkfbm1pm_sel_int) begin
    clkfb_frac_ht = period_vco_rl * clkfbm1_fht + (period_vco_rl * clkfbm1pm_sel_int) / 8;
    clkfb_frac_lt = period_vco_rl * clkfbm1_flt + (period_vco_rl * clkfbm1r_sel) / 8;
  end

  always @(period_vco_rl or clk0_fht or clk0_flt or clk0pm_sel_int or clk0pm_rsel) begin
    clk0_frac_ht = period_vco_rl * clk0_fht + (period_vco_rl * clk0pm_sel_int) / 8;
    clk0_frac_lt = period_vco_rl * clk0_flt + (period_vco_rl * clk0pm_rsel) / 8;
  end

  always @(period_vco or ps_in_ps)
  if (fps_en == 1) begin
    period_ps_old = period_ps;
    if (ps_in_ps < 0)
      period_ps = period_vco + ps_in_ps * period_vco / 56.0;
    else if ((ps_in_ps == 0) && PSINCDEC_in == 0)
      period_ps = period_vco;
    else
      period_ps = ps_in_ps * period_vco / 56.0;
  end


  always @( clkpll_r )
    clkpll_tmp1 <= #(period_avg) clkpll_r;

  always @(clkpll_tmp1)
    clkpll <= #(period_avg) clkpll_tmp1;

  always @(posedge clkinstopped_out1  or posedge rst_int)
  if ( rst_int)
      clkinstopped_vco_f <= 0;
  else begin
      clkinstopped_vco_f <= 1;
    @(negedge clkinstopped_out1 or posedge rst_int )
      if (rst_int)
      clkinstopped_vco_f <= 0;
      else begin
        @(posedge clkpll);
        @(posedge clkpll)
          clkinstopped_vco_f <= 0;
      end
   end

  always @(posedge clkinstopped_out1 or posedge rst_int)
    if (rst_int)
      CLKINSTOPPED_out <= 0;
    else begin
     CLKINSTOPPED_out <= 1;
     if (clkin_hold_f == 1) begin
        @(posedge locked_out1 or posedge rst_int)
          CLKINSTOPPED_out <= 0;
     end
     else begin
       if (CLKINSEL_in == 1)
        $display("Warning: [Unisim %s-21] Input CLKIN1 is stopped. Reset is required when input clock returns. Instance %m ", MODULE_NAME);
       else
        $display("Warning: [Unisim %s-22] Input CLKIN2 is stopped. Reset is required when input clock returns. Instance %m ", MODULE_NAME);
     end
    end

  always @(posedge clkfbstopped_out1 or posedge rst_int)
  if (rst_int)
     CLKFBSTOPPED_out <= 0;
  else begin
     CLKFBSTOPPED_out <= 1;
     @(posedge locked_out1)
       CLKFBSTOPPED_out <= 0;
  end


  always @(clkout_en_t)
    if (clkout_en_t >= clkout_en_val -3 && clkout_en_t < clkout_en_val)
        rst_clkinstopped_tm = 1;
    else
        rst_clkinstopped_tm =  0;

  always @(negedge clkinstopped_out1 or posedge rst_int)
    if (rst_int)
      rst_clkinstopped <= 0;
    else
     if (rst_clkinstopped_lk == 0 && clkin_hold_f == 1) begin
       @(posedge rst_clkinstopped_tm)
         rst_clkinstopped <= #period_vco4 1;
       @(negedge rst_clkinstopped_tm ) begin
         rst_clkinstopped <=  #period_vco5 0;
         rst_clkinstopped_rc <=  #period_vco6 1;
         rst_clkinstopped_rc <=  #period_vco7 0;
       end
      end

  always @(posedge clkinstopped_out1 or posedge rst_int)
    if (rst_int)
      clkinstopped_out_dly <= 0;
    else begin
       clkinstopped_out_dly <= 1;
       if (clkin_hold_f == 1) begin
         @(negedge rst_clkinstopped_rc or posedge rst_int)
           clkinstopped_out_dly <= 0;
       end
    end

  always @(clkinstopped_out1 or posedge rst_int)
    if (rst_int)
      clkinstopped_out_dly2 <= 0;
    else
       clkinstopped_out_dly2 <= #2 clkinstopped_out1;

  always @(negedge rst_clkinstopped or posedge rst_int)
  if (rst_int)
     rst_clkinstopped_lk <= 0;
  else begin
      rst_clkinstopped_lk <= 1;
      @(posedge locked_out1)
        rst_clkinstopped_lk <= 0;
  end


  always @(clkinstopped_vco_f or  CLKINSTOPPED_out or clkvco_lk or
            clkvco_lk_tmp or rst_int)
   if (rst_int)
     clkvco_lk  = 0;
   else begin
    if (CLKINSTOPPED_out == 1 && clkin_stop_f == 0)
      clkvco_lk <= #(period_vco_half) !clkvco_lk;
    else if (clkinstopped_vco_f == 1 && period_vco_half > 0)
       clkvco_lk <= #(period_vco_half) !clkvco_lk;
    else
      clkvco_lk  = clkvco_lk_tmp;
   end


  always @(posedge clkpll)
    if (clkfb_frac_en == 1 || clkvco_frac_en == 1) begin
      if (pll_locked_tm ==1 ) begin
        clkvco_lk_tmp <= 1;
        cmpvco = 0.0;
          for (ik1=1; ik1 < mf_product; ik1=ik1+1) begin
               clkout_en_t <= ik1;
               #(period_vco_half) clkvco_lk_tmp <= 0;
               if ( cmpvco >= 1.0 ) begin
                  #(period_vco_half_rm1) clkvco_lk_tmp <= 1;
                  cmpvco <= cmpvco - 1.0 + clkvco_pdrm;
               end
               else if ( cmpvco <= -1.0 ) begin
                  #(period_vco_half_rm2) clkvco_lk_tmp <= 1;
                  cmpvco <= cmpvco + 1.0 + clkvco_pdrm;
               end
               else begin
                  #(period_vco_half_rm) clkvco_lk_tmp <= 1;
                  cmpvco <= cmpvco + clkvco_pdrm;
               end
          end
               clkout_en_t <= ik1;
          #(period_vco_half) clkvco_lk_tmp <= 0;
      end
    end
    else begin
      if (pll_locked_tm ==1) begin
        clkvco_lk_tmp <= 1;
        clkvco_rm_cnt = 0;
        clkout_en_t <= 0;
  vcoflag = 0;
        if ( period_vco_cmp_flag == 1)  begin
          vcoflag = 1;
          for (ik2=1; ik2 < m_product; ik2=ik2+1) begin
               clkout_en_t <= ik2;
               #(period_vco_half) clkvco_lk_tmp <= 0;
               if ( clkvco_rm_cnt == 1)
                   #(period_vco_half_rm) clkvco_lk_tmp <= 1;
               else
                   #(period_vco_half) clkvco_lk_tmp <= 1;

               if ( clkvco_rm_cnt == period_vco_cmp_cnt)
                  clkvco_rm_cnt <= 0;
               else
                   clkvco_rm_cnt <= clkvco_rm_cnt + 1;
          end
               clkout_en_t <= ik2;
       end
       else if ( period_vco_cmp_flag == 2 ) begin
          vcoflag = 1;
          for (ik3=1; ik3 < m_product; ik3=ik3+1) begin
               clkout_en_t <= ik3;
               #(period_vco_half) clkvco_lk_tmp <= 0;
               if ( clkvco_rm_cnt == 1)
                   #(period_vco_half_rm) clkvco_lk_tmp <= 1;
               else
                   #(period_vco_half) clkvco_lk_tmp <= 1;

               if ( clkvco_rm_cnt == period_vco_cmp_cnt)
                  clkvco_rm_cnt <= 0;
               else
                   clkvco_rm_cnt <= clkvco_rm_cnt + 1;
          end
               clkout_en_t <= ik3;
        end
       else begin
          vcoflag = 1;
          for (ik4=1; ik4 < m_product; ik4=ik4+1) begin
               clkout_en_t <= ik4;
               #(period_vco_half) clkvco_lk_tmp <= 0;
               #(period_vco_half_rm) clkvco_lk_tmp <= 1;
          end
               clkout_en_t <= ik4;
       end

       #(period_vco_half) clkvco_lk_tmp <= 0;

       if (clkpll == 1 && m_product > 1 && m_product != clkind_div && vcoflag == 0) begin
          for (ik4=1; ik4 < m_product; ik4=ik4+1) begin
               clkout_en_t <= ik4;
               #(period_vco_half) clkvco_lk_tmp <= 0;
               #(period_vco_half_rm) clkvco_lk_tmp <= 1;
          end
               clkout_en_t <= ik4;
          #(period_vco_half) clkvco_lk_tmp <= 0;
       end

    end
  end

  always @(fb_delay or period_vco or period_vco_mf or clkfbm1_dly or clkfbm1pm_rl
         or lock_period or ps_in_ps )
   if (lock_period == 1) begin
     if (clkfb_frac_en == 1) begin
         val_tmp = period_avg * DIVCLK_DIVIDE_REG;
         fbm1_comp_delay = period_vco * (clkfbm1_dly  + clkfbm1pm_rl);
     end
     else begin
        val_tmp = period_avg * DIVCLK_DIVIDE_REG;
        fbm1_comp_delay = period_vco * (clkfbm1_dly  + clkfbm1pm_rl);
      end
    dly_tmp1 = fb_delay + fbm1_comp_delay;
    dly_tmp_int = 1;
    if (clkfb_fps_en == 1) begin
        if (ps_in_ps < 0) begin
           tmp_ps_val1 = -1 * ps_in_ps;
           tmp_ps_val2 = tmp_ps_val1 * period_vco / 56.0;
           if (tmp_ps_val2 > dly_tmp1 ) begin
             dly_tmp_int = -1;
             dly_tmp = tmp_ps_val2 - dly_tmp1;
           end
           else if (tmp_ps_val2 ==  dly_tmp1 ) begin
             dly_tmp_int = 0;
             dly_tmp = 0;
           end
           else begin
             dly_tmp_int = 1;
             dly_tmp =  dly_tmp1 - tmp_ps_val2;
           end
        end
        else
            dly_tmp = dly_tmp1 + ps_in_ps * period_vco / 56.0;
    end
    else
        dly_tmp = dly_tmp1;

    if (dly_tmp_int < 0)
      clkvco_delay = dly_tmp;
    else begin
       if (clkfb_frac_en == 1 && dly_tmp == 0)
          clkvco_delay = 0;
       else if ( dly_tmp < val_tmp)
          clkvco_delay = val_tmp - dly_tmp;
       else
          clkvco_delay = val_tmp - dly_tmp % val_tmp ;
    end
  end

  always @(period_vco or ps_in_ps )
  if (fps_en == 1) begin
   if (ps_in_ps < 0)
     period_ps = period_vco + ps_in_ps * period_vco / 56.0;
   else if ((ps_in_ps == 0) && PSINCDEC_in == 0)
     period_ps = period_vco;
   else
     period_ps = ps_in_ps * period_vco / 56.0;
  end

  always @(clkfbm1pm_sel)
    case (clkfbm1pm_sel)
      3'b000 : clkfbm1pm_rl = 0.0;
      3'b001 : clkfbm1pm_rl = 0.125;
      3'b010 : clkfbm1pm_rl = 0.25;
      3'b011 : clkfbm1pm_rl = 0.375;
      3'b100 : clkfbm1pm_rl = 0.50;
      3'b101 : clkfbm1pm_rl = 0.625;
      3'b110 : clkfbm1pm_rl = 0.75;
      3'b111 : clkfbm1pm_rl = 0.875;
    endcase


  always @(clkvco_lk)
        clkvco_lk_dly_tmp <= #clkvco_delay clkvco_lk;

  always @(clkvco_lk_dly_tmp or clkvco_lk  or pll_locked_tm)
    if ( pll_locked_tm && vco_stp_f == 0) begin
      if (dly_tmp == 0)
         clkvco = clkvco_lk;
      else
         clkvco =  clkvco_lk_dly_tmp;
    end
    else
       clkvco = 0;

  always @(clk0_ht or clk0_lt or clk0_nocnt or init_trig or clk0_edge or clk0_frac_en)
   if (clk0_frac_en == 0)
    clkout_pm_cal(clk0_ht1, clk0_div, clk0_div1, clk0_ht, clk0_lt, clk0_nocnt, clk0_edge);
  always @(clk1_ht or clk1_lt or clk1_nocnt or init_trig  or clk1_edge)
    clkout_pm_cal(clk1_ht1, clk1_div, clk1_div1, clk1_ht, clk1_lt, clk1_nocnt, clk1_edge);
  always @(clk2_ht or clk2_lt or clk2_nocnt or init_trig  or clk2_edge)
    clkout_pm_cal(clk2_ht1, clk2_div, clk2_div1, clk2_ht, clk2_lt, clk2_nocnt, clk2_edge);
  always @(clk3_ht or clk3_lt or clk3_nocnt or init_trig  or clk3_edge)
    clkout_pm_cal(clk3_ht1, clk3_div, clk3_div1, clk3_ht, clk3_lt, clk3_nocnt, clk3_edge);
  always @(clk4_ht or clk4_lt or clk4_nocnt or init_trig  or clk4_edge)
    clkout_pm_cal(clk4_ht1, clk4_div, clk4_div1, clk4_ht, clk4_lt, clk4_nocnt, clk4_edge);
  always @(clk5_ht or clk5_lt or clk5_nocnt or init_trig  or clk5_edge)
    clkout_pm_cal(clk5_ht1, clk5_div, clk5_div1, clk5_ht, clk5_lt, clk5_nocnt, clk5_edge);
  always @(clk6_ht or clk6_lt or clk6_nocnt or init_trig  or clk6_edge)
    clkout_pm_cal(clk6_ht1, clk6_div, clk6_div1, clk6_ht, clk6_lt, clk6_nocnt, clk6_edge);
  always @(clkfbm1_ht or clkfbm1_lt or clkfbm1_nocnt or init_trig  or clkfb_frac_en)
    if (clkfb_frac_en == 0) begin
      clkout_pm_cal(clkfbm1_ht1, clkfbm1_div, clkfbm1_div1, clkfbm1_ht, clkfbm1_lt, clkfbm1_nocnt, clkfbm1_edge);
    end
  always @(clkfbm2_ht or clkfbm2_lt or clkfbm2_nocnt or init_trig  or clkfbm2_edge)
    clkout_pm_cal(clkfbm2_ht1, clkfbm2_div, clkfbm2_div1, clkfbm2_ht, clkfbm2_lt, clkfbm2_nocnt, clkfbm2_edge);
  always @(clkind_ht or clkind_lt or clkind_nocnt or init_trig  or clkind_edge)
    clkout_pm_cal(clkind_ht1, clkind_div, clkind_div1, clkind_ht, clkind_lt, clkind_nocnt, clkind_edge);

  always @(posedge PSCLK_in or posedge rst_int)
    if (rst_int) begin
      ps_in_ps <= ps_in_init;
      ps_cnt <= 0;
      psen_w <= 0;
    end
    else if (fps_en == 1) begin
     if (PSEN_in) begin
       if (psen_w == 1)
        $display("Error: [Unisim %s-23] PSEN is active more than 1 PSCLK period at time %t. PSEN must be active for only one PSCLK period. Instance %m ", MODULE_NAME, $time);

       psen_w <= 1;
       if (ps_lock == 1)
        $display("Warning: [Unisim %s-24] Please wait for PSDONE signal at time %t before adjusting the Phase Shift. Instance %m ", MODULE_NAME, $time);
       else if (PSINCDEC_in == 1) begin
           if (ps_cnt < ps_max)
              ps_cnt <= ps_cnt + 1;
           else
              ps_cnt <= 0;

           if (ps_in_ps < ps_max)
              ps_in_ps <= ps_in_ps + 1;
           else
              ps_in_ps <= 0;

           ps_lock <= 1;
       end
       else if (PSINCDEC_in == 0) begin
           ps_cnt_neg = (-1) * ps_cnt;
           ps_in_ps_neg = (-1) * ps_in_ps;
           if (ps_cnt_neg < ps_max)
              ps_cnt <= ps_cnt - 1;
           else
              ps_cnt <= 0;

           if (ps_in_ps_neg < ps_max)
              ps_in_ps <= ps_in_ps - 1;
           else
              ps_in_ps <= 0;

           ps_lock <= 1;
       end
     end
     else
        psen_w <= 0;

     if ( psdone_out1 == 1)
            ps_lock <= 0;
  end

  always @(posedge ps_lock  )
    if (fps_en == 1) begin
        @(posedge PSCLK_in)
        @(posedge PSCLK_in)
        @(posedge PSCLK_in)
        @(posedge PSCLK_in)
        @(posedge PSCLK_in)
        @(posedge PSCLK_in)
        @(posedge PSCLK_in)
        @(posedge PSCLK_in)
        @(posedge PSCLK_in)
        @(posedge PSCLK_in)
        @(posedge PSCLK_in)
          begin
            psdone_out1 = 1;
            @(posedge PSCLK_in);
               psdone_out1 = 0;
          end
  end

  always @(rst_in_o)
    if (rst_in_o) begin
      assign clkout_mux = 8'b0;
      assign clkout_ps_mux = 8'b0;
      assign clkout_ps = 0;
      assign clkout_ps_tmp1 = 0;
      assign clkout_ps_tmp2 = 0;
      assign clk0_frac_out = 0;
      assign clkfbm1_frac_out = 0;
    end
    else begin
      deassign clkout_mux;
      deassign clkout_ps_mux;
      deassign clkout_ps;
      deassign clkout_ps_tmp1;
      deassign clkout_ps_tmp2;
      deassign clk0_frac_out;
      deassign clkfbm1_frac_out;
    end

    always @(rst_clkinstopped)
    if (rst_clkinstopped) begin
      assign clkfb_frac_ht = 50;
      assign clkfb_frac_lt = 50;
    end
    else begin
      deassign clkfb_frac_ht;
      deassign clkfb_frac_lt;
    end

  //always @(clkvco or clkout_en )
  always @(clkvco)
    if (clkout_en) begin
      clkout_mux[0] = clkvco;
      clkout_mux[1] <= #(period_vco1) clkvco;
      clkout_mux[2] <= #(period_vco2) clkvco;
      clkout_mux[3] <= #(period_vco3) clkvco;
      clkout_mux[4] <= #(period_vco4) clkvco;
      clkout_mux[5] <= #(period_vco5) clkvco;
      clkout_mux[6] <= #(period_vco6) clkvco;
      clkout_mux[7] <= #(period_vco7) clkvco;
    end

  always @(clkout_ps or clkout_en )
    if (clkout_en) begin
      clkout_ps_mux[0] = clkout_ps;
      clkout_ps_mux[1] <= #(period_vco1) clkout_ps;
      clkout_ps_mux[2] <= #(period_vco2) clkout_ps;
      clkout_ps_mux[3] <= #(period_vco3) clkout_ps;
      clkout_ps_mux[4] <= #(period_vco4) clkout_ps;
      clkout_ps_mux[5] <= #(period_vco5) clkout_ps;
      clkout_ps_mux[6] <= #(period_vco6) clkout_ps;
      clkout_ps_mux[7] <= #(period_vco7) clkout_ps;
    end

  always @(clkvco or clkout_en )
    if ( fps_en == 1)  begin
      clkvco_ps_tmp1 <= #(period_ps) clkvco;
      clkvco_ps_tmp2 <= #(period_ps_old) clkvco;
    end

   always @(negedge clkout_ps)
      clkout_ps_eg <= $time;

   always @(posedge clkout_ps)
      clkout_ps_peg <= $time;

   always @(ps_lock)
     ps_lock_dly <= #1 ps_lock;

   always @(posedge ps_lock_dly)
    if ((period_ps - period_ps_old) > period_vco_half ) begin
      if (clkout_ps == 0) begin
        if (clkvco_ps_tmp2 == 1) begin
           clkout_ps_w = $time - clkout_ps_eg;
           if (clkout_ps_w > period_vco3)
              clkvco_ps_tmp2_en <= 1;
           else begin
            @(negedge clkvco_ps_tmp2)
              clkvco_ps_tmp2_en <= 1;
           end
        end
        else
           clkvco_ps_tmp2_en <= 1;
      end
      else begin
        if (clkvco_ps_tmp2 == 0) begin
           clkout_ps_w = $time - clkout_ps_peg;
           if (clkout_ps_w > period_vco3)
              clkvco_ps_tmp2_en <= 1;
           else begin
            @(posedge clkvco_ps_tmp2)
              clkvco_ps_tmp2_en <= 1;
           end
        end
        else
           clkvco_ps_tmp2_en <= 1;
      end
      @(posedge clkvco_ps_tmp2);
      @(negedge clkvco_ps_tmp2)
        if (clkvco_ps_tmp1 == 0)
          clkvco_ps_tmp2_en <= 0;
        else
          @(negedge clkvco_ps_tmp1)
            clkvco_ps_tmp2_en <= 0;
   end


   always @(clkvco or clkvco_ps_tmp1 or clkvco_ps_tmp2 or clkvco_ps_tmp2_en )
   if (fps_en == 1)  begin
     if (ps_in_ps == 0 )
        clkout_ps  = clkvco;
     else if (clkvco_ps_tmp2_en == 1)
        clkout_ps  = clkvco_ps_tmp2;
     else
        clkout_ps  = clkvco_ps_tmp1;
   end

  assign clk0_sel_mux = (clk0_fps_en == 1) ? clkout_ps_mux : clkout_mux;
  assign clkfb_sel_mux = (clkfb_fps_en == 1) ? clkout_ps_mux : clkout_mux;
  assign clk0in = (clk0_fps_en == 1) ? clkout_ps_mux[clk0pm_sel] : clkout_mux[clk0pm_sel1];
  assign clk1in = (clk1_fps_en == 1) ? clkout_ps_mux[clk1pm_sel] : clkout_mux[clk1pm_sel];
  assign clk2in = (clk2_fps_en == 1) ? clkout_ps_mux[clk2pm_sel] : clkout_mux[clk2pm_sel];
  assign clk3in = (clk3_fps_en == 1) ? clkout_ps_mux[clk3pm_sel] : clkout_mux[clk3pm_sel];
  assign clk4in = (clk4_fps_en == 1) ? clkout_ps_mux[clk4pm_sel] : ((clkout4_cascade_int == 1) ? clk6_out : clkout_mux[clk4pm_sel]);
  assign clk5in = (clk5_fps_en == 1) ? clkout_ps_mux[clk5pm_sel] : clkout_mux[clk5pm_sel];
  assign clk6in = (clk6_fps_en == 1) ? clkout_ps_mux[clk6pm_sel] : clkout_mux[clk6pm_sel];
  assign clkfbm1in = (clkfb_fps_en == 1) ? clkout_ps_mux[clkfbm1pm_sel] : clkout_mux[clkfbm1pm_sel1];

  assign clkfbm1pm_sel1 =  clkfbm1pm_sel;
  assign clk0pm_sel1 =  clk0pm_sel;

  assign clk0ps_en = (clk0_dly_cnt == clkout0_dly) ? clkout_en : 0;
  assign clk1ps_en = (clk1_dly_cnt == clkout1_dly) ? clkout_en : 0;
  assign clk2ps_en = (clk2_dly_cnt == clkout2_dly) ? clkout_en : 0;
  assign clk3ps_en = (clk3_dly_cnt == clkout3_dly) ? clkout_en : 0;
  assign clk4ps_en = (clk4_dly_cnt == clkout4_dly) ? clkout_en : 0;
  assign clk5ps_en = (clk5_dly_cnt == clkout5_dly) ? clkout_en : 0;
  assign clk6ps_en = (clk6_dly_cnt == clkout6_dly) ? clkout_en : 0;
  assign clkfbm1ps_en = (clkfbm1_dly_cnt == clkfbm1_dly) ? clkout_en : 0;

  /*always @(posedge clk0in)
    if (clk0ps_en && clk0_frac_en) begin
        clk0_frac_out <= 1;
          for (ik0=1; ik0 < 8; ik0=ik0+1) begin
               #(clk0_frac_ht) clk0_frac_out <= 0;
               #(clk0_frac_lt) clk0_frac_out <= 1;
          end
          #(clk0_frac_ht) clk0_frac_out <= 0;
          #(clk0_frac_lt - period_vco1);
      end*/

  always @(posedge clk0in)
    if (clkout_en && clk0_frac_en) begin
          for (ik0=1; ik0 < 8; ik0=ik0+1) begin
               clk0_frac_out <= 1;
               #(clk0_frac_ht - period_vco1/2);
               @(posedge clk0_sel_mux[0] or posedge clk0_sel_mux[1] or posedge clk0_sel_mux[2] or posedge clk0_sel_mux[3] or posedge clk0_sel_mux[4]
            or posedge clk0_sel_mux[5] or posedge clk0_sel_mux[6] or posedge clk0_sel_mux[7]);
               clk0_frac_out <= 0;
               #(clk0_frac_lt - period_vco1/2);
               @(posedge clk0_sel_mux[0] or posedge clk0_sel_mux[1] or posedge clk0_sel_mux[2] or posedge clk0_sel_mux[3] or posedge clk0_sel_mux[4]
            or posedge clk0_sel_mux[5] or posedge clk0_sel_mux[6] or posedge clk0_sel_mux[7]);
          end
          clk0_frac_out <= 1;
          #(clk0_frac_ht - period_vco1/2);
               @(posedge clk0_sel_mux[0] or posedge clk0_sel_mux[1] or posedge clk0_sel_mux[2] or posedge clk0_sel_mux[3] or posedge clk0_sel_mux[4]
            or posedge clk0_sel_mux[5] or posedge clk0_sel_mux[6] or posedge clk0_sel_mux[7]);
          clk0_frac_out <= 0;
          #(clk0_frac_lt - period_vco1/2);
      end

  /*always @(posedge clkfbm1in)
    if (clkfbm1ps_en && clkfb_frac_en) begin
        clkfbm1_frac_out <= 1;
          for (ib=1; ib < 8; ib=ib+1) begin
               #(clkfb_frac_ht) clkfbm1_frac_out <= 0;
               #(clkfb_frac_lt) clkfbm1_frac_out <= 1;
          end
          #(clkfb_frac_ht) clkfbm1_frac_out <= 0;
          #(clkfb_frac_lt - period_vco1);
    end
    else
       clkfbm1_frac_out <= 0;*/

 always @(posedge clkfbm1in)
    if (clkout_en && clkfb_frac_en) begin
        clkfbm1_frac_out <= 1;
          for (ib=1; ib < 8; ib=ib+1) begin
               #(clkfb_frac_ht - period_vco1/2);
               @(posedge clkfb_sel_mux[0] or posedge clkfb_sel_mux[1] or posedge clkfb_sel_mux[2] or posedge clkfb_sel_mux[3] or posedge clkfb_sel_mux[4]
            or posedge clkfb_sel_mux[5] or posedge clkfb_sel_mux[6] or posedge clkfb_sel_mux[7]);
               clkfbm1_frac_out <= 0;
               #(clkfb_frac_lt - period_vco1/2);
               @(posedge clkfb_sel_mux[0] or posedge clkfb_sel_mux[1] or posedge clkfb_sel_mux[2] or posedge clkfb_sel_mux[3] or posedge clkfb_sel_mux[4]
            or posedge clkfb_sel_mux[5] or posedge clkfb_sel_mux[6] or posedge clkfb_sel_mux[7]);
               clkfbm1_frac_out <= 1;
          end
          #(clkfb_frac_ht - period_vco1/2);
               @(posedge clkfb_sel_mux[0] or posedge clkfb_sel_mux[1] or posedge clkfb_sel_mux[2] or posedge clkfb_sel_mux[3] or posedge clkfb_sel_mux[4]
           or posedge clkfb_sel_mux[5] or posedge clkfb_sel_mux[6] or posedge clkfb_sel_mux[7]);
          clkfbm1_frac_out <= 0;
          #(clkfb_frac_lt - period_vco1/2);
    end
    else
       clkfbm1_frac_out <= 0;

 always  @(negedge clk0in or posedge rst_in_o)
   if (rst_in_o)
     clk0_dly_cnt <= 6'b0;
   else if (clkout_en == 1 ) begin
     if (clk0_dly_cnt < clkout0_dly)
       clk0_dly_cnt <= clk0_dly_cnt + 1;
   end

  always  @(negedge clk1in or posedge rst_in_o)
    if (rst_in_o)
      clk1_dly_cnt <= 6'b0;
    else
      if (clk1_dly_cnt < clkout1_dly && clkout_en ==1)
        clk1_dly_cnt <= clk1_dly_cnt + 1;

  always  @(negedge clk2in or posedge rst_in_o)
    if (rst_in_o)
      clk2_dly_cnt <= 6'b0;
    else
      if (clk2_dly_cnt < clkout2_dly && clkout_en ==1)
        clk2_dly_cnt <= clk2_dly_cnt + 1;

  always  @(negedge clk3in or posedge rst_in_o)
    if (rst_in_o)
      clk3_dly_cnt <= 6'b0;
    else
      if (clk3_dly_cnt < clkout3_dly && clkout_en ==1)
        clk3_dly_cnt <= clk3_dly_cnt + 1;

  always  @(negedge clk4in or posedge rst_in_o)
    if (rst_in_o)
        clk4_dly_cnt <= 6'b0;
    else
       if (clk4_dly_cnt < clkout4_dly && clkout_en ==1)
          clk4_dly_cnt <= clk4_dly_cnt + 1;

  always  @(negedge clk5in or posedge rst_in_o)
    if (rst_in_o)
        clk5_dly_cnt <= 6'b0;
    else if (clkout_en == 1 ) begin
       if (clk5_dly_cnt < clkout5_dly)
          clk5_dly_cnt <= clk5_dly_cnt + 1;
    end

  always  @(negedge clk6in or posedge rst_in_o)
    if (rst_in_o)
        clk6_dly_cnt <= 6'b0;
    else if (clkout_en == 1 ) begin
       if (clk6_dly_cnt < clkout6_dly)
          clk6_dly_cnt <= clk6_dly_cnt + 1;
    end

  always  @(negedge clkfbm1in or posedge rst_in_o)
    if (rst_in_o)
        clkfbm1_dly_cnt <= 6'b0;
    else if (clkout_en == 1 ) begin
       if (clkfbm1_dly_cnt < clkfbm1_dly)
          clkfbm1_dly_cnt <= clkfbm1_dly_cnt + 1;
    end

  always @(posedge clk0in or negedge clk0in or posedge rst_in_o)
    if (rst_in_o) begin
        clk0_cnt <= 8'b0;
        clk0_nf_out <= 0;
    end
    else if (clk0ps_en && clk0_frac_en == 0) begin
      if (clk0_cnt < clk0_div1)
         clk0_cnt <= clk0_cnt + 1;
      else
         clk0_cnt <= 8'b0;
      if (clk0_cnt < clk0_ht1)
         clk0_nf_out <= 1;
      else
         clk0_nf_out <= 0;
    end
    else begin
         clk0_cnt <= 8'b0;
         clk0_nf_out <= 0;
    end

  assign clk0_out = (clk0_frac_en) ? clk0_frac_out : clk0_nf_out;

  always @(posedge clk1in or negedge clk1in or posedge rst_in_o)
    if (rst_in_o) begin
        clk1_cnt <= 8'b0;
        clk1_out <= 0;
    end
    else if (clk1ps_en) begin
          if (clk1_cnt < clk1_div1)
                clk1_cnt <= clk1_cnt + 1;
          else
                clk1_cnt <= 8'b0;
          if (clk1_cnt < clk1_ht1)
                clk1_out <= 1;
          else
                clk1_out <= 0;
    end
    else begin
        clk1_cnt <= 8'b0;
        clk1_out <= 0;
    end

  always @(posedge clk2in or negedge clk2in or posedge rst_in_o)
    if (rst_in_o) begin
        clk2_cnt <= 8'b0;
        clk2_out <= 0;
    end
    else if (clk2ps_en) begin
          if (clk2_cnt < clk2_div1)
                clk2_cnt <= clk2_cnt + 1;
          else
                clk2_cnt <= 8'b0;
          if (clk2_cnt < clk2_ht1)
                clk2_out <= 1;
           else
                clk2_out <= 0;
     end
     else begin
        clk2_cnt <= 8'b0;
        clk2_out <= 0;
     end

  always @(posedge clk3in or negedge clk3in or posedge rst_in_o)
    if (rst_in_o) begin
        clk3_cnt <= 8'b0;
        clk3_out <= 0;
    end
    else if (clk3ps_en) begin
          if (clk3_cnt < clk3_div1)
                clk3_cnt <= clk3_cnt + 1;
          else
                clk3_cnt <= 8'b0;
          if (clk3_cnt < clk3_ht1)
                clk3_out <= 1;
          else
                clk3_out <= 0;
    end
    else begin
        clk3_cnt <= 8'b0;
        clk3_out <= 0;
    end


  always @(posedge clk4in or negedge clk4in or posedge rst_in_o)
    if (rst_in_o) begin
        clk4_cnt <= 8'b0;
        clk4_out <= 0;
    end
    else if (clk4ps_en) begin
          if (clk4_cnt < clk4_div1)
                clk4_cnt <= clk4_cnt + 1;
          else
                clk4_cnt <= 8'b0;
          if (clk4_cnt < clk4_ht1)
                clk4_out <= 1;
          else
                clk4_out <= 0;
    end
    else begin
        clk4_cnt <= 8'b0;
        clk4_out <= 0;
    end

  always @(posedge clk5in or negedge clk5in or posedge rst_in_o)
    if (rst_in_o) begin
        clk5_cnt <= 8'b0;
        clk5_out <= 0;
    end
//    else if (clk5ps_en && clk0_frac_en == 0) begin
    else if (clk5ps_en ) begin
          if (clk5_cnt < clk5_div1)
                clk5_cnt <= clk5_cnt + 1;
          else
                clk5_cnt <= 8'b0;
          if (clk5_cnt < clk5_ht1)
                clk5_out <= 1;
          else
                clk5_out <= 0;
    end
    else begin
        clk5_cnt <= 8'b0;
        clk5_out <= 0;
    end

  always @(posedge clk6in or negedge clk6in or posedge rst_in_o)
    if (rst_in_o) begin
        clk6_cnt <= 8'b0;
        clk6_out <= 0;
    end
    else if (clk6ps_en ) begin
          if (clk6_cnt < clk6_div1)
                clk6_cnt <= clk6_cnt + 1;
          else
                clk6_cnt <= 8'b0;
          if (clk6_cnt < clk6_ht1)
                clk6_out <= 1;
          else
                clk6_out <= 0;
    end
    else begin
        clk6_cnt <= 8'b0;
        clk6_out <= 0;
    end

  always @(posedge clkfbm1in or negedge clkfbm1in or posedge rst_in_o)
    if (rst_in_o) begin
        clkfbm1_cnt <= 8'b0;
        clkfbm1_nf_out <= 0;
    end
    else if (clkfbm1ps_en && clkfb_frac_en == 0) begin
          if (clkfbm1_cnt < clkfbm1_div1)
                clkfbm1_cnt <= clkfbm1_cnt + 1;
          else
                clkfbm1_cnt <= 8'b0;
          if (clkfbm1_cnt < clkfbm1_ht1)
                clkfbm1_nf_out <= 1;
          else
                clkfbm1_nf_out <= 0;
    end
    else begin
        clkfbm1_cnt <= 8'b0;
        clkfbm1_nf_out <= 0;
    end

  assign clkfbm1_out = (clkfb_frac_en) ? clkfbm1_frac_out : clkfbm1_nf_out;

  always @(posedge CLKFBIN_in or negedge CLKFBIN_in or posedge rst_int)
    if (rst_int) begin
        clkfbm2_cnt <= 8'b0;
        clkfbm2_out <= 0;
    end
    else if (clkout_en)  begin
          if (clkfbm2_cnt < clkfbm2_div1)
                clkfbm2_cnt <= clkfbm2_cnt + 1;
          else
                clkfbm2_cnt <= 8'b0;
          if (clkfbm2_cnt < clkfbm2_ht1)
                clkfbm2_out <= 1;
          else
                clkfbm2_out <= 0;
    end
    else begin
        clkfbm2_cnt <= 8'b0;
        clkfbm2_out <= 0;
    end

  always @(posedge clkpll_r or negedge clkpll_r or posedge rst_int)
    if (rst_int) begin
        clkind_cnt <= 8'b0;
        clkind_out <= 0;
    end
    else if (clkout_en) begin
          if (clkind_cnt < clkind_div1)
                clkind_cnt <= clkind_cnt + 1;
          else
                clkind_cnt <= 8'b0;
          if (clkind_cnt < clkind_ht1)
                clkind_out <= 1;
          else
                clkind_out <= 0;
    end
    else begin
        clkind_cnt <= 8'b0;
        clkind_out <= 0;
    end

   always @(clk0_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          CLKOUT0_out =  clk0_out;
     else
          CLKOUT0_out = clkfb_tst;

   always @(clk1_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          CLKOUT1_out =  clk1_out;
     else
          CLKOUT1_out = clkfb_tst;

   always @(clk2_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          CLKOUT2_out =  clk2_out;
     else
          CLKOUT2_out = clkfb_tst;

   always @(clk3_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          CLKOUT3_out =  clk3_out;
     else
          CLKOUT3_out = clkfb_tst;

   always @(clk4_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          CLKOUT4_out =  clk4_out;
     else
          CLKOUT4_out = clkfb_tst;

   always @(clk5_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          CLKOUT5_out =  clk5_out;
     else
          CLKOUT5_out = clkfb_tst;

   always @(clk6_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          CLKOUT6_out =  clk6_out;
     else
          CLKOUT6_out = clkfb_tst;

   always @(clkfbm1_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          CLKFBOUT_out =  clkfbm1_out;
     else
          CLKFBOUT_out = clkfb_tst;

  //
  // determine feedback delay
  //

  always @(posedge clkpll_r )
    if (fb_delay_found_tmp == 0 && pwron_int == 0 && rst_int == 0) begin
         clkfb_tst <=  ~clkfb_tst;
    end
    else
         clkfb_tst <=  1'b0;

  always @( posedge clkfb_tst or posedge rst_int )
    if (rst_int)
      delay_edge  <= 0;
    else
      delay_edge <= $time;

  always @(posedge CLKFBIN_in or posedge rst_int )
    if (rst_int) begin
      fb_delay  <= 0;
      fb_delay_found_tmp <= 0;
    end
    else
      if (fb_delay_found_tmp ==0 ) begin
        if ( delay_edge != 0)
          fb_delay <= ($time - delay_edge);
        else
          fb_delay <= 0;
        fb_delay_found_tmp <=  1;
      end

  always @(rst_int)
    if (rst_int)
       assign fb_delay_found = 0;
    else
       deassign fb_delay_found;

  always @(fb_delay_found_tmp or clkvco_delay )
    if (clkvco_delay == 0)
       fb_delay_found <= #1000 fb_delay_found_tmp;
    else
       fb_delay_found <= #(clkvco_delay) fb_delay_found_tmp;

  always @(fb_delay)
    if (rst_int==0 && (fb_delay/1000.0 > fb_delay_max)) begin
      $display("Warning: [Unisim %s-25] The feedback delay at time %t is %f ns. It is over the maximum value %f ns. Instance %m ", MODULE_NAME, $time, fb_delay / 1000.0, fb_delay_max);
    end

  //
  // generate unlock signal
  //

  always begin
  if (rst_int)
    clk_osc = 0;
  else
    clk_osc = ~clk_osc;
    #OSC_P2;
  end

  always @(posedge clkpll_r or negedge clkpll_r) begin
      clkin_p <= 1;
      clkin_p <= #100 0;
  end

  always @(posedge CLKFBIN_in or negedge CLKFBIN_in) begin
      clkfb_p <= 1;
      clkfb_p <= #100 0;
  end


  always @(posedge clk_osc or posedge rst_int or posedge clkin_p)
      if (rst_int == 1) begin
        clkinstopped_out1 <= 0;
        clkin_lost_cnt <= 0;
      end
      else if (clkin_p == 1) begin
        if (clkinstopped_out1 == 1) begin
          @(posedge clkpll_r) begin
          clkinstopped_out1 <= 0;
          clkin_lost_cnt <= 0;
          end
        end
        else begin
           clkinstopped_out1 <= 0;
           clkin_lost_cnt <= 0;
        end
      end
      else if (lock_period) begin
        if (clkin_lost_cnt < clkin_lost_val) begin
           clkin_lost_cnt <= clkin_lost_cnt + 1;
           clkinstopped_out1 <= 0;
        end
        else
           clkinstopped_out1 <= 1;
      end

  always @(posedge clk_osc or posedge rst_int or posedge clkfb_p)
      if (rst_int == 1 || clkfb_p == 1) begin
        clkfbstopped_out1 <= 0;
        clkfb_lost_cnt <= 0;
      end
      else if (clkout_en) begin
        if (clkfb_lost_cnt < clkfb_lost_val) begin
           clkfb_lost_cnt <= clkfb_lost_cnt + 1;
           clkfbstopped_out1 <= 0;
        end
        else
           clkfbstopped_out1 <= 1;
      end


  always @(clkin_jit or rst_int )
    if (rst_int)
       clkpll_jitter_unlock = 0;
    else
      if (pll_locked_tmp2 && clkfbstopped_out1 == 0 && clkinstopped_out1 == 0) begin
        if ((clkin_jit > REF_CLK_JITTER_MAX_tmp && clkin_jit < period_avg) ||
             (clkin_jit < -REF_CLK_JITTER_MAX_tmp && clkin_jit > -period_avg ))
          clkpll_jitter_unlock = 1;
        else
          clkpll_jitter_unlock = 0;
      end
      else
          clkpll_jitter_unlock = 0;

  assign pll_unlock1 = (clkinstopped_out_dly ==1 || clkfbstopped_out1==1 || clkpll_jitter_unlock == 1) ? 1 : 0;
  assign pll_unlock = (clkinstopped_out_dly ==1 || clkfbstopped_out1==1 || clkpll_jitter_unlock == 1 || unlock_recover == 1) ? 1 : 0;

  // tasks

  task clkout_dly_real_cal;
  output [5:0] clkout_dly;
  output [2:0] clkpm_sel;
  input  clkdiv;
  input  clk_ps;
  input reg [160:0] clk_ps_name;
  real clkdiv;
  real clk_ps;
  real clk_ps_rl;
  real clk_dly_rl, clk_dly_rem;
  integer clk_rl_tmp_1000;
  real clk_rl_tmp;
  integer clkout_dly_tmp;
  integer clkpm_sel_tmp;
  begin
    if (clk_ps < 0.0)
      clk_dly_rl = (360.0 + clk_ps) * clkdiv / 360.0;
    else
      clk_dly_rl = clk_ps * clkdiv / 360.0;

    clk_rl_tmp_1000 = clk_dly_rl * 1000.0;
    clk_rl_tmp =  clk_rl_tmp_1000 / 1000.0;

    clkout_dly_tmp =  $rtoi(clk_dly_rl);

    if (clkout_dly_tmp > 63) begin
      $display(" Warning: [Unisim %s-26] Attribute %s is set to %f. Required phase shifting can not be reached. Instance %m ", MODULE_NAME, clk_ps_name, clk_ps);
      clkout_dly = 6'b111111;
    end
    else
      clkout_dly = clkout_dly_tmp;

    clk_dly_rem = clk_rl_tmp - clkout_dly;

    if (clk_dly_rem < 0.125)
        clkpm_sel_tmp =  0;
    else if (clk_dly_rem >=  0.125 && clk_dly_rem < 0.25)
        clkpm_sel_tmp =  1;
    else if (clk_dly_rem >=  0.25 && clk_dly_rem < 0.375)
        clkpm_sel_tmp =  2;
    else if (clk_dly_rem >=  0.375 && clk_dly_rem < 0.5)
        clkpm_sel_tmp =  3;
    else if (clk_dly_rem >=  0.5 && clk_dly_rem < 0.625)
        clkpm_sel_tmp =  4;
    else if (clk_dly_rem >=  0.625 && clk_dly_rem < 0.75)
        clkpm_sel_tmp =  5;
    else if (clk_dly_rem >=  0.75 && clk_dly_rem < 0.875)
        clkpm_sel_tmp =  6;
    else if (clk_dly_rem >=  0.875)
        clkpm_sel_tmp =  7;
    else if (clk_dly_rem == 1.000)  // only for rounding issues
        clkpm_sel_tmp = 8;  

    if(clkpm_sel_tmp == 8)
    clkpm_sel = 0;
    else
    clkpm_sel = clkpm_sel_tmp;

    if (clk_ps < 0.0)
       clk_ps_rl = (clkout_dly + 0.125 * clkpm_sel_tmp)* 360.0 / clkdiv - 360.0;
    else
       clk_ps_rl = (clkout_dly + 0.125 * clkpm_sel_tmp) * 360.0 / clkdiv;

    if (((clk_ps_rl- clk_ps) > 0.001) || ((clk_ps_rl- clk_ps) < -0.001))
      $display(" Warning: [Unisim %s-27] Attribute %s is set to %f. Real phase shifting is %f. Required phase shifting can not be reached. Instance %m ", MODULE_NAME, clk_ps_name, clk_ps, clk_ps_rl);

  end
  endtask


  task clkout_dly_cal;
  output [5:0] clkout_dly;
  output [2:0] clkpm_sel;
  input  clkdiv;
  input  clk_ps;
  input reg [160:0] clk_ps_name;
  integer clkdiv;
  real clk_ps;
  real clk_ps_rl;
  real clk_dly_rl, clk_dly_rem;
  integer clk_rl_tmp_1000;
  real clk_rl_tmp;
  integer clkout_dly_tmp;
  integer clkpm_sel_tmp;
  begin
    if (clk_ps < 0.0)
      clk_dly_rl = (360.0 + clk_ps) * clkdiv / 360.0;
    else
      clk_dly_rl = clk_ps * clkdiv / 360.0;

    clk_rl_tmp_1000 = clk_dly_rl * 1000.0;
    clk_rl_tmp =  clk_rl_tmp_1000 / 1000.0;

    clkout_dly_tmp =  $rtoi(clk_dly_rl);


    if (clkout_dly_tmp > 63) begin
      $display(" Warning: [Unisim %s-28] Attribute %s is set to %f. Required phase shifting can not be reached. Instance %m ", MODULE_NAME, clk_ps_name, clk_ps);
      clkout_dly = 6'b111111;
    end
    else
      clkout_dly = clkout_dly_tmp;

    clk_dly_rem = clk_rl_tmp - clkout_dly;

    if (clk_dly_rem < 0.125)
        clkpm_sel_tmp =  0;
    else if (clk_dly_rem >=  0.125 && clk_dly_rem < 0.25)
        clkpm_sel_tmp =  1;
    else if (clk_dly_rem >=  0.25 && clk_dly_rem < 0.375)
        clkpm_sel_tmp =  2;
    else if (clk_dly_rem >=  0.375 && clk_dly_rem < 0.5)
        clkpm_sel_tmp =  3;
    else if (clk_dly_rem >=  0.5 && clk_dly_rem < 0.625)
        clkpm_sel_tmp =  4;
    else if (clk_dly_rem >=  0.625 && clk_dly_rem < 0.75)
        clkpm_sel_tmp =  5;
    else if (clk_dly_rem >=  0.75 && clk_dly_rem < 0.875)
        clkpm_sel_tmp =  6;
    else if (clk_dly_rem >=  0.875 && clk_dly_rem < 1.000)
        clkpm_sel_tmp =  7;
    else if (clk_dly_rem == 1.000)  //only for rounding issues
        clkpm_sel_tmp = 8;

    if(clkpm_sel_tmp == 8)
    clkpm_sel = 0;
    else
    clkpm_sel = clkpm_sel_tmp;

    if (clk_ps < 0.0)
       clk_ps_rl = (clkout_dly + 0.125 * clkpm_sel_tmp)* 360.0 / clkdiv - 360.0;
    else
       clk_ps_rl = (clkout_dly + (0.125 * clkpm_sel_tmp)) * 360.0 / clkdiv;

    if (((clk_ps_rl- clk_ps) > 0.001) || ((clk_ps_rl- clk_ps) < -0.001))
      $display("Warning: [Unisim %s-29] Attribute %s is set to %f. Real phase shifting is %f. Required phase shifting can not be reached. Instance %m ", MODULE_NAME, clk_ps_name, clk_ps, clk_ps_rl);

  end
  endtask


  task   clk_out_para_cal;
  output [6:0] clk_ht;
  output [6:0] clk_lt;
  output clk_nocnt;
  output clk_edge;
  input  CLKOUT_DIVIDE;
  input  CLKOUT_DUTY_CYCLE;
  integer CLKOUT_DIVIDE;
  real  CLKOUT_DUTY_CYCLE;
  real  tmp_value, tmp_value0, tmp_value_rm;
  integer tmp_value_round, tmp_value1, tmp_value_r;
  real tmp_value2;
  real tmp_value_rm1, tmp_value_r1;
  integer tmp_value_r2;
  begin

     tmp_value0 = CLKOUT_DIVIDE * CLKOUT_DUTY_CYCLE;
     tmp_value_r = $rtoi(tmp_value0);
     tmp_value_rm = tmp_value0 - tmp_value_r;
     if (tmp_value_rm < 0.1)
       tmp_value = tmp_value_r * 1.0;
     else if (tmp_value_rm > 0.9)
       tmp_value = 1.0 * tmp_value_r + 1.0;
     else begin
       tmp_value_r1 = tmp_value0 * 2.0;
       tmp_value_r2 = $rtoi(tmp_value_r1);
       tmp_value_rm1 = tmp_value_r1 - tmp_value_r2;
       if (tmp_value_rm1 > 0.995)
          tmp_value = tmp_value0 + 0.002;
       else
          tmp_value = tmp_value0;
     end
     tmp_value_round = tmp_value * 2.0;
     tmp_value1 =  tmp_value_round % 2;
     tmp_value2 = CLKOUT_DIVIDE - tmp_value;


     if ((tmp_value2) >= O_MAX_HT_LT) begin
       clk_lt = 7'b1000000;
     end
     else begin
       if  (tmp_value2 < 1.0)
          clk_lt = 1;
       else
          if ( tmp_value1  != 0)
             clk_lt = $rtoi(tmp_value2) + 1;
          else
             clk_lt = $rtoi(tmp_value2);
     end

     if ( (CLKOUT_DIVIDE -  clk_lt) >= O_MAX_HT_LT)
       clk_ht = 7'b1000000;
     else
       clk_ht =  CLKOUT_DIVIDE -  clk_lt;

     clk_nocnt = (CLKOUT_DIVIDE ==1) ? 1 : 0;
     if ( tmp_value < 1.0)
       clk_edge = 1;
     else if (tmp_value1 != 0)
       clk_edge = 1;
     else
       clk_edge = 0;
  end
  endtask

  function  clkout_duty_chk;
  input  CLKOUT_DIVIDE;
  input  CLKOUT_DUTY_CYCLE;
  input reg [160:0] CLKOUT_DUTY_CYCLE_N;
  integer CLKOUT_DIVIDE, step_tmp;
  real CLKOUT_DUTY_CYCLE;
  real CLK_DUTY_CYCLE_MIN, CLK_DUTY_CYCLE_MAX, CLK_DUTY_CYCLE_STEP;
  real CLK_DUTY_CYCLE_MIN_rnd;
  reg clk_duty_tmp_int;
  begin
    if (CLKOUT_DIVIDE > O_MAX_HT_LT) begin
      CLK_DUTY_CYCLE_MIN = 1.0 * (CLKOUT_DIVIDE - O_MAX_HT_LT)/CLKOUT_DIVIDE;
      CLK_DUTY_CYCLE_MAX = (O_MAX_HT_LT + 0.5)/CLKOUT_DIVIDE;
      CLK_DUTY_CYCLE_MIN_rnd = CLK_DUTY_CYCLE_MIN;
    end
    else begin
      if (CLKOUT_DIVIDE == 1) begin
        CLK_DUTY_CYCLE_MIN = 0.0;
        CLK_DUTY_CYCLE_MIN_rnd = 0.0;
      end
      else begin
        step_tmp = 1000 / CLKOUT_DIVIDE;
        CLK_DUTY_CYCLE_MIN_rnd = step_tmp / 1000.0;
        CLK_DUTY_CYCLE_MIN = 1.0 /CLKOUT_DIVIDE;
      end
      CLK_DUTY_CYCLE_MAX = 1.0;
    end

    if (CLKOUT_DUTY_CYCLE > CLK_DUTY_CYCLE_MAX || CLKOUT_DUTY_CYCLE < CLK_DUTY_CYCLE_MIN_rnd) begin
      $display("Warning: [Unisim %s-30] %s is set to %f and is not in the allowed range %f to %f. Instance %m ", MODULE_NAME, CLKOUT_DUTY_CYCLE_N, CLKOUT_DUTY_CYCLE, CLK_DUTY_CYCLE_MIN, CLK_DUTY_CYCLE_MAX );
    end

    clk_duty_tmp_int = 0;
    CLK_DUTY_CYCLE_STEP = 0.5 / CLKOUT_DIVIDE;
    for (j = 0; j < (2 * CLKOUT_DIVIDE - CLK_DUTY_CYCLE_MIN/CLK_DUTY_CYCLE_STEP); j = j + 1)
        if (((CLK_DUTY_CYCLE_MIN + CLK_DUTY_CYCLE_STEP * j) - CLKOUT_DUTY_CYCLE) > -0.001 &&
             ((CLK_DUTY_CYCLE_MIN + CLK_DUTY_CYCLE_STEP * j) - CLKOUT_DUTY_CYCLE) < 0.001)
            clk_duty_tmp_int = 1;

    if ( clk_duty_tmp_int != 1) begin
      $display("Warning: [Unisim %s-31] %s is set to %f and is not an allowed value. Allowed values are:",  MODULE_NAME, CLKOUT_DUTY_CYCLE_N, CLKOUT_DUTY_CYCLE);
      for (j = 0; j < (2 * CLKOUT_DIVIDE - CLK_DUTY_CYCLE_MIN/CLK_DUTY_CYCLE_STEP); j = j + 1)
       $display("%f", CLK_DUTY_CYCLE_MIN + CLK_DUTY_CYCLE_STEP * j);
      $display(" Instance %m ");
    end

    clkout_duty_chk = 1'b1;
  end
  endfunction

  function  para_int_range_chk;
  input  para_in;
  input reg [160:0] para_name;
  input  range_low;
  input  range_high;
  integer para_in;
  integer range_low;
  integer  range_high;
  begin
    if ( para_in < range_low || para_in > range_high) begin
      $display("Error: [Unisim %s-32] The Attribute %s is set to %d.  Legal values for this attribute are %d to %d. Instance %m ", MODULE_NAME, para_name, para_in, range_low, range_high);
      $finish;
    end
    para_int_range_chk = 1'b1;
  end
  endfunction

  function  para_real_range_chk;
  input  para_in;
  input reg [160:0] para_name;
  input  range_low;
  input  range_high;
  real para_in;
  real range_low;
  real range_high;
  begin
    if ( para_in < range_low || para_in > range_high) begin
      $display("Error : [Unisim %s-33] The Attribute %s is set to %f.  Legal values for this attribute are %f to %f. Instance %m ", MODULE_NAME, para_name, para_in, range_low, range_high);
      $finish;
    end
    para_real_range_chk = 1'b0;
  end
  endfunction

  task clkout_pm_cal;
  output [7:0] clk_ht1;
  output [7:0] clk_div;
  output [7:0] clk_div1;
  input [6:0] clk_ht;
  input [6:0] clk_lt;
  input clk_nocnt;
  input clk_edge;
  begin
    if (clk_nocnt ==1) begin
        clk_div = 8'b00000001;
        clk_div1 = 8'b00000001;
        clk_ht1 = 8'b00000001;
    end
    else begin
      if ( clk_edge == 1)
        clk_ht1 = 2 * clk_ht + 1;
      else
        clk_ht1 = 2 * clk_ht;
      clk_div = clk_ht  + clk_lt ;
      clk_div1 = 2 * clk_div -1;
    end
  end
  endtask

  task clkout_delay_para_drp;
  output [5:0] clkout_dly;
  output clk_nocnt;
  output clk_edge;
  input [15:0]  di_in;
  input [6:0] daddr_in;
  begin
     clkout_dly = di_in[5:0];
     clk_nocnt = di_in[6];
     clk_edge = di_in[7];
  end
  endtask

  task clkout_hl_para_drp;
  output  [6:0] clk_lt;
  output  [6:0] clk_ht;
  output  [2:0] clkpm_sel;
  input [15:0] di_in_tmp;
  input [6:0] daddr_in_tmp;
  begin
    if (di_in_tmp[12] != 1) begin
      $display("Error: [Unisim %s-34] Input DI is %h at address DADDR=%b at time %t. The bit 12 needs to be set to 1. Instance %m ", MODULE_NAME, di_in_tmp, daddr_in_tmp, $time);
    end
    if ( di_in_tmp[5:0] == 6'b0)
       clk_lt = 7'b1000000;
    else
       clk_lt = { 1'b0, di_in_tmp[5:0]};
    if (di_in_tmp[11:6] == 6'b0)
       clk_ht = 7'b1000000;
    else
       clk_ht = { 1'b0, di_in_tmp[11:6]};
    clkpm_sel = di_in_tmp[15:13];
  end
  endtask

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
    (CLKIN2 => CLKFBOUT) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKFBOUTB) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT0) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT0B) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT1) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT1B) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT2) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT2B) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT3) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT3B) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT4) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT5) = (0:0:0, 0:0:0);
    (CLKIN2 => CLKOUT6) = (0:0:0, 0:0:0);
    (DCLK *> DO) = (0:0:0, 0:0:0);
    (DCLK => DRDY) = (0:0:0, 0:0:0);
    (PSCLK => PSDONE) = (0:0:0, 0:0:0);
    (negedge RST => (CLKFBSTOPPED +: 0)) = (0:0:0, 0:0:0);
    (negedge RST => (CLKINSTOPPED +: 0)) = (0:0:0, 0:0:0);
    (negedge RST => (LOCKED +: 0)) = (0:0:0, 0:0:0);
    (posedge RST => (CLKFBSTOPPED +: 0)) = (0:0:0, 0:0:0);
    (posedge RST => (CLKINSTOPPED +: 0)) = (0:0:0, 0:0:0);
    (posedge RST => (LOCKED +: 0)) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge CLKFBIN, 0:0:0, notifier);
    $period (negedge CLKFBOUT, 0:0:0, notifier);
    $period (negedge CLKFBOUTB, 0:0:0, notifier);
    $period (negedge CLKIN1, 0:0:0, notifier);
    $period (negedge CLKIN2, 0:0:0, notifier);
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
    $period (negedge DCLK, 0:0:0, notifier);
    $period (negedge PSCLK, 0:0:0, notifier);
    $period (posedge CLKFBIN, 0:0:0, notifier);
    $period (posedge CLKFBOUT, 0:0:0, notifier);
    $period (posedge CLKFBOUTB, 0:0:0, notifier);
    $period (posedge CLKIN1, 0:0:0, notifier);
    $period (posedge CLKIN2, 0:0:0, notifier);
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
    $period (posedge DCLK, 0:0:0, notifier);
    $period (posedge PSCLK, 0:0:0, notifier);
    $setuphold (posedge DCLK, negedge DADDR, 0:0:0, 0:0:0, notifier,,, DCLK_delay, DADDR_delay);
    $setuphold (posedge DCLK, negedge DEN, 0:0:0, 0:0:0, notifier,,, DCLK_delay, DEN_delay);
    $setuphold (posedge DCLK, negedge DI, 0:0:0, 0:0:0, notifier,,, DCLK_delay, DI_delay);
    $setuphold (posedge DCLK, negedge DWE, 0:0:0, 0:0:0, notifier,,, DCLK_delay, DWE_delay);
    $setuphold (posedge DCLK, posedge DADDR, 0:0:0, 0:0:0, notifier,,, DCLK_delay, DADDR_delay);
    $setuphold (posedge DCLK, posedge DEN, 0:0:0, 0:0:0, notifier,,, DCLK_delay, DEN_delay);
    $setuphold (posedge DCLK, posedge DI, 0:0:0, 0:0:0, notifier,,, DCLK_delay, DI_delay);
    $setuphold (posedge DCLK, posedge DWE, 0:0:0, 0:0:0, notifier,,, DCLK_delay, DWE_delay);
    $setuphold (posedge PSCLK, negedge PSEN, 0:0:0, 0:0:0, notifier,,, PSCLK_delay, PSEN_delay);
    $setuphold (posedge PSCLK, negedge PSINCDEC, 0:0:0, 0:0:0, notifier,,, PSCLK_delay, PSINCDEC_delay);
    $setuphold (posedge PSCLK, posedge PSEN, 0:0:0, 0:0:0, notifier,,, PSCLK_delay, PSEN_delay);
    $setuphold (posedge PSCLK, posedge PSINCDEC, 0:0:0, 0:0:0, notifier,,, PSCLK_delay, PSINCDEC_delay);
    $width (negedge CLKIN1, 0:0:0, 0, notifier);
    $width (negedge CLKIN2, 0:0:0, 0, notifier);
    $width (negedge DCLK, 0:0:0, 0, notifier);
    $width (negedge PSCLK, 0:0:0, 0, notifier);
    $width (negedge PWRDWN, 0:0:0, 0, notifier);
    $width (negedge RST, 0:0:0, 0, notifier);
    $width (posedge CLKIN1, 0:0:0, 0, notifier);
    $width (posedge CLKIN2, 0:0:0, 0, notifier);
    $width (posedge DCLK, 0:0:0, 0, notifier);
    $width (posedge PSCLK, 0:0:0, 0, notifier);
    $width (posedge PWRDWN, 0:0:0, 0, notifier);
    $width (posedge RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
