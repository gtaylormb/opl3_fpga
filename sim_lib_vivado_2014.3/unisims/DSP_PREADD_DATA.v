///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.2
//  \   \          Description : Xilinx Timing Simulation Library Component
//  /   /                        48-bit Multi-Functional Arithmetic Block
// /___/   /\      Filename    : DSP_PREADD_DATA.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  07/15/12 - Migrate from E1.
//  12/10/12 - Add dynamic registers
//  01/11/13 - DIN, D_DATA data width change (26/24) sync4 yml
//  04/23/13 - 714772 - remove sensitivity to negedge GSR
//  05/07/13 - 716896 - INMODE_INV_REG mis sized
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module DSP_PREADD_DATA #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer ADREG = 1,
  parameter AMULTSEL = "A",
  parameter BMULTSEL = "B",
  parameter integer DREG = 1,
  parameter integer INMODEREG = 1,
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter [4:0] IS_INMODE_INVERTED = 5'b00000,
  parameter [0:0] IS_RSTD_INVERTED = 1'b0,
  parameter [0:0] IS_RSTINMODE_INVERTED = 1'b0,
  parameter PREADDINSEL = "A",
  parameter USE_MULT = "MULTIPLY"
)(
  output [26:0] A2A1,
  output ADDSUB,
  output [26:0] AD_DATA,
  output [17:0] B2B1,
  output [26:0] D_DATA,
  output INMODE_2,
  output [26:0] PREADD_AB,

  input [26:0] A1_DATA,
  input [26:0] A2_DATA,
  input [26:0] AD,
  input [17:0] B1_DATA,
  input [17:0] B2_DATA,
  input CEAD,
  input CED,
  input CEINMODE,
  input CLK,
  input [26:0] DIN,
  input [4:0] INMODE,
  input RSTD,
  input RSTINMODE
);
  
// define constants
  localparam MODULE_NAME = "DSP_PREADD_DATA";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  localparam ADREG_0 = 1;
  localparam ADREG_1 = 0;
  localparam AMULTSEL_A = 0;
  localparam AMULTSEL_AD = 1;
  localparam BMULTSEL_AD = 1;
  localparam BMULTSEL_B = 0;
  localparam DREG_0 = 1;
  localparam DREG_1 = 0;
  localparam INMODEREG_0 = 1;
  localparam INMODEREG_1 = 0;
  localparam PREADDINSEL_A = 0;
  localparam PREADDINSEL_B = 1;
  localparam USE_MULT_DYNAMIC = 1;
  localparam USE_MULT_MULTIPLY = 0;
  localparam USE_MULT_NONE = 2;

// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
`ifdef XIL_DR
  `include "DSP_PREADD_DATA_dr.v"
`else
  localparam [0:0] ADREG_REG = ADREG;
  localparam [16:1] AMULTSEL_REG = AMULTSEL;
  localparam [16:1] BMULTSEL_REG = BMULTSEL;
  localparam [0:0] DREG_REG = DREG;
  localparam [0:0] INMODEREG_REG = INMODEREG;
  localparam [0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
  localparam [4:0] IS_INMODE_INVERTED_REG = IS_INMODE_INVERTED;
  localparam [0:0] IS_RSTD_INVERTED_REG = IS_RSTD_INVERTED;
  localparam [0:0] IS_RSTINMODE_INVERTED_REG = IS_RSTINMODE_INVERTED;
  localparam [8:1] PREADDINSEL_REG = PREADDINSEL;
  localparam [64:1] USE_MULT_REG = USE_MULT;
`endif

  wire ADREG_BIN;
  wire AMULTSEL_BIN;
  wire BMULTSEL_BIN;
  wire DREG_BIN;
  wire INMODEREG_BIN;
  wire IS_CLK_INVERTED_BIN;
  wire [4:0] IS_INMODE_INVERTED_BIN;
  wire IS_RSTD_INVERTED_BIN;
  wire IS_RSTINMODE_INVERTED_BIN;
  wire PREADDINSEL_BIN;
  wire [1:0] USE_MULT_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;
  tri0 glblGSR = glbl.GSR;

  wire ADDSUB_out;
  wire INMODE_2_out;
  wire [17:0] B2B1_out;
  wire [26:0] A2A1_out;
  wire [26:0] AD_DATA_out;
  wire [26:0] D_DATA_out;
  wire [26:0] PREADD_AB_out;

`ifdef XIL_TIMING
  wire ADDSUB_delay;
  wire INMODE_2_delay;
  wire [17:0] B2B1_delay;
  wire [26:0] A2A1_delay;
  wire [26:0] AD_DATA_delay;
  wire [26:0] D_DATA_delay;
  wire [26:0] PREADD_AB_delay;
`endif

  wire CEAD_in;
  wire CED_in;
  wire CEINMODE_in;
  wire CLK_in;
  wire RSTD_in;
  wire RSTINMODE_in;
  wire [17:0] B1_DATA_in;
  wire [17:0] B2_DATA_in;
  wire [26:0] A1_DATA_in;
  wire [26:0] A2_DATA_in;
  wire [26:0] AD_in;
  wire [26:0] DIN_in;
  wire [4:0] INMODE_in;

`ifdef XIL_TIMING
  wire CEAD_delay;
  wire CED_delay;
  wire CEINMODE_delay;
  wire CLK_delay;
  wire RSTD_delay;
  wire RSTINMODE_delay;
  wire [17:0] B1_DATA_delay;
  wire [17:0] B2_DATA_delay;
  wire [26:0] A1_DATA_delay;
  wire [26:0] A2_DATA_delay;
  wire [26:0] AD_delay;
  wire [26:0] DIN_delay;
  wire [4:0] INMODE_delay;
`endif
  
  wire [26:0] a1a2_i_mux;
  wire [17:0] b1b2_i_mux;
  wire [4:0]  INMODE_mux;
  reg  [4:0]  INMODE_reg = 5'b0;
  reg  [26:0] AD_DATA_reg = 27'b0;
  reg  [26:0] D_DATA_reg = 27'b0;
  wire CLK_inmode;
  wire CLK_dreg;
  wire CLK_adreg;

  assign A2A1 = A2A1_out;
  assign ADDSUB = ADDSUB_out;
  assign AD_DATA = AD_DATA_out;
  assign B2B1 = B2B1_out;
  assign D_DATA = D_DATA_out;
  assign INMODE_2 = INMODE_2_out;
  assign PREADD_AB = PREADD_AB_out;

`ifdef XIL_TIMING
  reg notifier;
`endif

// inputs with no timing checks
`ifdef XIL_TIMING
  assign #(in_delay) A1_DATA_delay = A1_DATA;
  assign #(in_delay) A2_DATA_delay = A2_DATA;
  assign #(in_delay) B1_DATA_delay = B1_DATA;
  assign #(in_delay) B2_DATA_delay = B2_DATA;
`endif


`ifdef XIL_TIMING
  assign A1_DATA_in = A1_DATA_delay;
  assign A2_DATA_in = A2_DATA_delay;
  assign AD_in = AD_delay;
  assign B1_DATA_in = B1_DATA_delay;
  assign B2_DATA_in = B2_DATA_delay;
  assign CEAD_in = (CEAD !== 1'bz) && CEAD_delay; // rv 0
  assign CED_in = (CED !== 1'bz) && CED_delay; // rv 0
  assign CEINMODE_in = CEINMODE_delay;
  assign CLK_inmode = ((CLK !== 1'bz) && (INMODEREG_BIN != INMODEREG_0)) && (CLK_delay ^ IS_CLK_INVERTED_BIN); // rv 0
  assign CLK_dreg   = ((CLK !== 1'bz) && (DREG_BIN != DREG_0)) && (CLK_delay ^ IS_CLK_INVERTED_BIN); // rv 0
  assign CLK_adreg  = ((CLK !== 1'bz) && (ADREG_BIN != ADREG_0)) && (CLK_delay ^ IS_CLK_INVERTED_BIN); // rv 0
  assign DIN_in[0] = (DIN[0] !== 1'bz) && DIN_delay[0]; // rv 0
  assign DIN_in[10] = (DIN[10] !== 1'bz) && DIN_delay[10]; // rv 0
  assign DIN_in[11] = (DIN[11] !== 1'bz) && DIN_delay[11]; // rv 0
  assign DIN_in[12] = (DIN[12] !== 1'bz) && DIN_delay[12]; // rv 0
  assign DIN_in[13] = (DIN[13] !== 1'bz) && DIN_delay[13]; // rv 0
  assign DIN_in[14] = (DIN[14] !== 1'bz) && DIN_delay[14]; // rv 0
  assign DIN_in[15] = (DIN[15] !== 1'bz) && DIN_delay[15]; // rv 0
  assign DIN_in[16] = (DIN[16] !== 1'bz) && DIN_delay[16]; // rv 0
  assign DIN_in[17] = (DIN[17] !== 1'bz) && DIN_delay[17]; // rv 0
  assign DIN_in[18] = (DIN[18] !== 1'bz) && DIN_delay[18]; // rv 0
  assign DIN_in[19] = (DIN[19] !== 1'bz) && DIN_delay[19]; // rv 0
  assign DIN_in[1] = (DIN[1] !== 1'bz) && DIN_delay[1]; // rv 0
  assign DIN_in[20] = (DIN[20] !== 1'bz) && DIN_delay[20]; // rv 0
  assign DIN_in[21] = (DIN[21] !== 1'bz) && DIN_delay[21]; // rv 0
  assign DIN_in[22] = (DIN[22] !== 1'bz) && DIN_delay[22]; // rv 0
  assign DIN_in[23] = (DIN[23] !== 1'bz) && DIN_delay[23]; // rv 0
  assign DIN_in[24] = (DIN[24] !== 1'bz) && DIN_delay[24]; // rv 0
  assign DIN_in[25] = (DIN[25] !== 1'bz) && DIN_delay[25]; // rv 0
  assign DIN_in[26] = (DIN[26] !== 1'bz) && DIN_delay[26]; // rv 0
  assign DIN_in[2] = (DIN[2] !== 1'bz) && DIN_delay[2]; // rv 0
  assign DIN_in[3] = (DIN[3] !== 1'bz) && DIN_delay[3]; // rv 0
  assign DIN_in[4] = (DIN[4] !== 1'bz) && DIN_delay[4]; // rv 0
  assign DIN_in[5] = (DIN[5] !== 1'bz) && DIN_delay[5]; // rv 0
  assign DIN_in[6] = (DIN[6] !== 1'bz) && DIN_delay[6]; // rv 0
  assign DIN_in[7] = (DIN[7] !== 1'bz) && DIN_delay[7]; // rv 0
  assign DIN_in[8] = (DIN[8] !== 1'bz) && DIN_delay[8]; // rv 0
  assign DIN_in[9] = (DIN[9] !== 1'bz) && DIN_delay[9]; // rv 0
  assign INMODE_in[0] = (INMODE[0] !== 1'bz) && (INMODE_delay[0] ^ IS_INMODE_INVERTED_BIN[0]); // rv 0
  assign INMODE_in[1] = (INMODE[1] !== 1'bz) && (INMODE_delay[1] ^ IS_INMODE_INVERTED_BIN[1]); // rv 0
  assign INMODE_in[2] = (INMODE[2] !== 1'bz) && (INMODE_delay[2] ^ IS_INMODE_INVERTED_BIN[2]); // rv 0
  assign INMODE_in[3] = (INMODE[3] !== 1'bz) && (INMODE_delay[3] ^ IS_INMODE_INVERTED_BIN[3]); // rv 0
  assign INMODE_in[4] = (INMODE[4] !== 1'bz) && (INMODE_delay[4] ^ IS_INMODE_INVERTED_BIN[4]); // rv 0
  assign RSTD_in = (RSTD !== 1'bz) && (RSTD_delay ^ IS_RSTD_INVERTED_BIN); // rv 0
  assign RSTINMODE_in = (RSTINMODE !== 1'bz) && (RSTINMODE_delay ^ IS_RSTINMODE_INVERTED_BIN); // rv 0
`else
  assign A1_DATA_in = A1_DATA;
  assign A2_DATA_in = A2_DATA;
  assign AD_in = AD;
  assign B1_DATA_in = B1_DATA;
  assign B2_DATA_in = B2_DATA;
  assign CEAD_in = (CEAD !== 1'bz) && CEAD; // rv 0
  assign CED_in = (CED !== 1'bz) && CED; // rv 0
  assign CEINMODE_in = CEINMODE;
  assign CLK_inmode = ((CLK !== 1'bz) && (INMODEREG_BIN != INMODEREG_0)) && (CLK ^ IS_CLK_INVERTED_BIN); // rv 0
  assign CLK_dreg   = ((CLK !== 1'bz) && (DREG_BIN != DREG_0)) && (CLK ^ IS_CLK_INVERTED_BIN); // rv 0
  assign CLK_adreg  = ((CLK !== 1'bz) && (ADREG_BIN != ADREG_0)) && (CLK ^ IS_CLK_INVERTED_BIN); // rv 0
  assign DIN_in[0] = (DIN[0] !== 1'bz) && DIN[0]; // rv 0
  assign DIN_in[10] = (DIN[10] !== 1'bz) && DIN[10]; // rv 0
  assign DIN_in[11] = (DIN[11] !== 1'bz) && DIN[11]; // rv 0
  assign DIN_in[12] = (DIN[12] !== 1'bz) && DIN[12]; // rv 0
  assign DIN_in[13] = (DIN[13] !== 1'bz) && DIN[13]; // rv 0
  assign DIN_in[14] = (DIN[14] !== 1'bz) && DIN[14]; // rv 0
  assign DIN_in[15] = (DIN[15] !== 1'bz) && DIN[15]; // rv 0
  assign DIN_in[16] = (DIN[16] !== 1'bz) && DIN[16]; // rv 0
  assign DIN_in[17] = (DIN[17] !== 1'bz) && DIN[17]; // rv 0
  assign DIN_in[18] = (DIN[18] !== 1'bz) && DIN[18]; // rv 0
  assign DIN_in[19] = (DIN[19] !== 1'bz) && DIN[19]; // rv 0
  assign DIN_in[1] = (DIN[1] !== 1'bz) && DIN[1]; // rv 0
  assign DIN_in[20] = (DIN[20] !== 1'bz) && DIN[20]; // rv 0
  assign DIN_in[21] = (DIN[21] !== 1'bz) && DIN[21]; // rv 0
  assign DIN_in[22] = (DIN[22] !== 1'bz) && DIN[22]; // rv 0
  assign DIN_in[23] = (DIN[23] !== 1'bz) && DIN[23]; // rv 0
  assign DIN_in[24] = (DIN[24] !== 1'bz) && DIN[24]; // rv 0
  assign DIN_in[25] = (DIN[25] !== 1'bz) && DIN[25]; // rv 0
  assign DIN_in[26] = (DIN[26] !== 1'bz) && DIN[26]; // rv 0
  assign DIN_in[2] = (DIN[2] !== 1'bz) && DIN[2]; // rv 0
  assign DIN_in[3] = (DIN[3] !== 1'bz) && DIN[3]; // rv 0
  assign DIN_in[4] = (DIN[4] !== 1'bz) && DIN[4]; // rv 0
  assign DIN_in[5] = (DIN[5] !== 1'bz) && DIN[5]; // rv 0
  assign DIN_in[6] = (DIN[6] !== 1'bz) && DIN[6]; // rv 0
  assign DIN_in[7] = (DIN[7] !== 1'bz) && DIN[7]; // rv 0
  assign DIN_in[8] = (DIN[8] !== 1'bz) && DIN[8]; // rv 0
  assign DIN_in[9] = (DIN[9] !== 1'bz) && DIN[9]; // rv 0
  assign INMODE_in[0] = (INMODE[0] !== 1'bz) && (INMODE[0] ^ IS_INMODE_INVERTED_BIN[0]); // rv 0
  assign INMODE_in[1] = (INMODE[1] !== 1'bz) && (INMODE[1] ^ IS_INMODE_INVERTED_BIN[1]); // rv 0
  assign INMODE_in[2] = (INMODE[2] !== 1'bz) && (INMODE[2] ^ IS_INMODE_INVERTED_BIN[2]); // rv 0
  assign INMODE_in[3] = (INMODE[3] !== 1'bz) && (INMODE[3] ^ IS_INMODE_INVERTED_BIN[3]); // rv 0
  assign INMODE_in[4] = (INMODE[4] !== 1'bz) && (INMODE[4] ^ IS_INMODE_INVERTED_BIN[4]); // rv 0
  assign RSTD_in = (RSTD !== 1'bz) && (RSTD ^ IS_RSTD_INVERTED_BIN); // rv 0
  assign RSTINMODE_in = (RSTINMODE !== 1'bz) && (RSTINMODE ^ IS_RSTINMODE_INVERTED_BIN); // rv 0
`endif

  assign ADREG_BIN =
    (ADREG_REG == 1) ? ADREG_1 :
    (ADREG_REG == 0) ? ADREG_0 :
     ADREG_1;

  assign AMULTSEL_BIN =
    (AMULTSEL_REG == "A") ? AMULTSEL_A :
    (AMULTSEL_REG == "AD") ? AMULTSEL_AD :
     AMULTSEL_A;

  assign BMULTSEL_BIN =
    (BMULTSEL_REG == "B") ? BMULTSEL_B :
    (BMULTSEL_REG == "AD") ? BMULTSEL_AD :
     BMULTSEL_B;

  assign DREG_BIN =
    (DREG_REG == 1) ? DREG_1 :
    (DREG_REG == 0) ? DREG_0 :
     DREG_1;

  assign INMODEREG_BIN =
    (INMODEREG_REG == 1) ? INMODEREG_1 :
    (INMODEREG_REG == 0) ? INMODEREG_0 :
     INMODEREG_1;

  assign IS_CLK_INVERTED_BIN = IS_CLK_INVERTED_REG;

  assign IS_INMODE_INVERTED_BIN = IS_INMODE_INVERTED_REG;

  assign IS_RSTD_INVERTED_BIN = IS_RSTD_INVERTED_REG;

  assign IS_RSTINMODE_INVERTED_BIN = IS_RSTINMODE_INVERTED_REG;

  assign PREADDINSEL_BIN =
    (PREADDINSEL_REG == "A") ? PREADDINSEL_A :
    (PREADDINSEL_REG == "B") ? PREADDINSEL_B :
     PREADDINSEL_A;

  assign USE_MULT_BIN =
    (USE_MULT_REG == "MULTIPLY") ? USE_MULT_MULTIPLY :
    (USE_MULT_REG == "DYNAMIC") ? USE_MULT_DYNAMIC :
    (USE_MULT_REG == "NONE") ? USE_MULT_NONE :
     USE_MULT_MULTIPLY;

`ifndef XIL_TIMING
  initial begin
    $display("Error: [Unisim %s-140] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    #100;
    $finish;
  end
`endif

  initial begin
    #1;
    trig_attr = ~trig_attr;
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((ADREG_REG != 1) &&
         (ADREG_REG != 0))) begin
      $display("Error: [Unisim %s-102] ADREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, ADREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AMULTSEL_REG != "A") &&
         (AMULTSEL_REG != "AD"))) begin
      $display("Error: [Unisim %s-104] AMULTSEL attribute is set to %s.  Legal values for this attribute are A or AD. Instance: %m", MODULE_NAME, AMULTSEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BMULTSEL_REG != "B") &&
         (BMULTSEL_REG != "AD"))) begin
      $display("Error: [Unisim %s-110] BMULTSEL attribute is set to %s.  Legal values for this attribute are B or AD. Instance: %m", MODULE_NAME, BMULTSEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DREG_REG != 1) &&
         (DREG_REG != 0))) begin
      $display("Error: [Unisim %s-116] DREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, DREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INMODEREG_REG != 1) &&
         (INMODEREG_REG != 0))) begin
      $display("Error: [Unisim %s-117] INMODEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, INMODEREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLK_INVERTED_REG !== 1'b0) && (IS_CLK_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-120] IS_CLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLK_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_INMODE_INVERTED_REG < 5'b00000) || (IS_INMODE_INVERTED_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-121] IS_INMODE_INVERTED attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, IS_INMODE_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_RSTD_INVERTED_REG !== 1'b0) && (IS_RSTD_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-129] IS_RSTD_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_RSTD_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_RSTINMODE_INVERTED_REG !== 1'b0) && (IS_RSTINMODE_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-130] IS_RSTINMODE_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_RSTINMODE_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PREADDINSEL_REG != "A") &&
         (PREADDINSEL_REG != "B"))) begin
      $display("Error: [Unisim %s-137] PREADDINSEL attribute is set to %s.  Legal values for this attribute are A or B. Instance: %m", MODULE_NAME, PREADDINSEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG != "MULTIPLY") &&
         (USE_MULT_REG != "DYNAMIC") &&
         (USE_MULT_REG != "NONE"))) begin
      $display("Error: [Unisim %s-142] USE_MULT attribute is set to %s.  Legal values for this attribute are MULTIPLY, DYNAMIC or NONE. Instance: %m", MODULE_NAME, USE_MULT_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

   assign a1a2_i_mux = INMODE_mux[0] ? A1_DATA_in : A2_DATA_in;
   assign b1b2_i_mux = INMODE_mux[4] ? B1_DATA_in : B2_DATA_in;
   assign A2A1_out = ((PREADDINSEL_BIN==PREADDINSEL_A) && INMODE_mux[1]) ? 27'b0 : a1a2_i_mux;
   assign B2B1_out = ((PREADDINSEL_BIN==PREADDINSEL_B) && INMODE_mux[1]) ? 18'b0 : b1b2_i_mux;
   assign ADDSUB_out = INMODE_mux[3];
   assign INMODE_2_out = INMODE_mux[2];
   assign PREADD_AB_out = (PREADDINSEL_BIN==PREADDINSEL_B) ? {{9{B2B1_out[17]}}, B2B1_out} : A2A1_out;

//*********************************************************
//**********  INMODE signal registering        ************
//*********************************************************
// new 
//   assign CLK_inmode = (INMODEREG_BIN == INMODEREG_1) ? CLK_in : 1'b0;

   always @(posedge CLK_inmode) begin
      if (RSTINMODE_in || glblGSR)
         INMODE_reg <= 5'b0;
      else if (CEINMODE_in)
         INMODE_reg <= INMODE_in;
   end

   assign INMODE_mux = (INMODEREG_BIN == INMODEREG_1) ? INMODE_reg : INMODE_in;

//*********************************************************
//*** Input register D with 1 level deep of register
//*********************************************************
//   assign CLK_dreg = (DREG_BIN == DREG_1) ? CLK_in : 1'b0;

   always @(posedge CLK_dreg) begin
      if      (RSTD_in || glblGSR) D_DATA_reg <= 27'b0;
      else if (CED_in)  D_DATA_reg <= DIN_in;
   end

   assign D_DATA_out = (DREG_BIN == DREG_1) ? D_DATA_reg : DIN_in;

//*********************************************************
//*** Input register AD with 1 level deep of register
//*********************************************************
//   assign CLK_adreg = (ADREG_BIN == ADREG_1) ? CLK_in : 1'b0;

   always @(posedge CLK_adreg) begin
      if      (RSTD_in || glblGSR) AD_DATA_reg <= 27'b0;
      else if (CEAD_in) AD_DATA_reg <= AD_in;
   end

   assign AD_DATA_out = (ADREG_BIN == ADREG_1) ? AD_DATA_reg : AD_in;


  specify
    (A1_DATA *> A2A1) = (0:0:0, 0:0:0);
    (A1_DATA *> PREADD_AB) = (0:0:0, 0:0:0);
    (A2_DATA *> A2A1) = (0:0:0, 0:0:0);
    (A2_DATA *> PREADD_AB) = (0:0:0, 0:0:0);
    (AD *> AD_DATA) = (0:0:0, 0:0:0);
    (B1_DATA *> B2B1) = (0:0:0, 0:0:0);
    (B1_DATA *> PREADD_AB) = (0:0:0, 0:0:0);
    (B2_DATA *> B2B1) = (0:0:0, 0:0:0);
    (B2_DATA *> PREADD_AB) = (0:0:0, 0:0:0);
    (CLK *> A2A1) = (0:0:0, 0:0:0);
    (CLK *> AD_DATA) = (0:0:0, 0:0:0);
    (CLK *> B2B1) = (0:0:0, 0:0:0);
    (CLK *> D_DATA) = (0:0:0, 0:0:0);
    (CLK *> PREADD_AB) = (0:0:0, 0:0:0);
    (CLK => ADDSUB) = (0:0:0, 0:0:0);
    (CLK => INMODE_2) = (0:0:0, 0:0:0);
    (DIN *> D_DATA) = (0:0:0, 0:0:0);
    (INMODE *> A2A1) = (0:0:0, 0:0:0);
    (INMODE *> ADDSUB) = (0:0:0, 0:0:0);
    (INMODE *> B2B1) = (0:0:0, 0:0:0);
    (INMODE *> INMODE_2) = (0:0:0, 0:0:0);
    (INMODE *> PREADD_AB) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $setuphold (negedge CLK, negedge AD, 0:0:0, 0:0:0, notifier,,, CLK_delay, AD_delay);
    $setuphold (negedge CLK, negedge CEAD, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEAD_delay);
    $setuphold (negedge CLK, negedge CED, 0:0:0, 0:0:0, notifier,,, CLK_delay, CED_delay);
    $setuphold (negedge CLK, negedge CEINMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEINMODE_delay);
    $setuphold (negedge CLK, negedge DIN, 0:0:0, 0:0:0, notifier,,, CLK_delay, DIN_delay);
    $setuphold (negedge CLK, negedge INMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, INMODE_delay);
    $setuphold (negedge CLK, negedge RSTD, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTD_delay);
    $setuphold (negedge CLK, negedge RSTINMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTINMODE_delay);
    $setuphold (negedge CLK, posedge AD, 0:0:0, 0:0:0, notifier,,, CLK_delay, AD_delay);
    $setuphold (negedge CLK, posedge CEAD, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEAD_delay);
    $setuphold (negedge CLK, posedge CED, 0:0:0, 0:0:0, notifier,,, CLK_delay, CED_delay);
    $setuphold (negedge CLK, posedge CEINMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEINMODE_delay);
    $setuphold (negedge CLK, posedge DIN, 0:0:0, 0:0:0, notifier,,, CLK_delay, DIN_delay);
    $setuphold (negedge CLK, posedge INMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, INMODE_delay);
    $setuphold (negedge CLK, posedge RSTD, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTD_delay);
    $setuphold (negedge CLK, posedge RSTINMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTINMODE_delay);
    $setuphold (posedge CLK, negedge AD, 0:0:0, 0:0:0, notifier,,, CLK_delay, AD_delay);
    $setuphold (posedge CLK, negedge CEAD, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEAD_delay);
    $setuphold (posedge CLK, negedge CED, 0:0:0, 0:0:0, notifier,,, CLK_delay, CED_delay);
    $setuphold (posedge CLK, negedge CEINMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEINMODE_delay);
    $setuphold (posedge CLK, negedge DIN, 0:0:0, 0:0:0, notifier,,, CLK_delay, DIN_delay);
    $setuphold (posedge CLK, negedge INMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, INMODE_delay);
    $setuphold (posedge CLK, negedge RSTD, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTD_delay);
    $setuphold (posedge CLK, negedge RSTINMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTINMODE_delay);
    $setuphold (posedge CLK, posedge AD, 0:0:0, 0:0:0, notifier,,, CLK_delay, AD_delay);
    $setuphold (posedge CLK, posedge CEAD, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEAD_delay);
    $setuphold (posedge CLK, posedge CED, 0:0:0, 0:0:0, notifier,,, CLK_delay, CED_delay);
    $setuphold (posedge CLK, posedge CEINMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEINMODE_delay);
    $setuphold (posedge CLK, posedge DIN, 0:0:0, 0:0:0, notifier,,, CLK_delay, DIN_delay);
    $setuphold (posedge CLK, posedge INMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, INMODE_delay);
    $setuphold (posedge CLK, posedge RSTD, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTD_delay);
    $setuphold (posedge CLK, posedge RSTINMODE, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTINMODE_delay);
`endif
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
