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
// /___/   /\      Filename    : DSP_OUTPUT.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  07/15/12 - Migrate from E1.
//  12/10/12 - Add dynamic registers
//  04/03/13 - yaml update
//  04/23/13 - 714772 - remove sensitivity to negedge GSR
//  04/23/13 - 713706 - change P_PDBK connection
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module DSP_OUTPUT #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter AUTORESET_PATDET = "NO_RESET",
  parameter AUTORESET_PRIORITY = "RESET",
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter [0:0] IS_RSTP_INVERTED = 1'b0,
  parameter [47:0] MASK = 48'h3FFFFFFFFFFF,
  parameter [47:0] PATTERN = 48'h000000000000,
  parameter integer PREG = 1,
  parameter SEL_MASK = "MASK",
  parameter SEL_PATTERN = "PATTERN",
  parameter USE_PATTERN_DETECT = "NO_PATDET"
)(
  output CARRYCASCOUT,
  output [3:0] CARRYOUT,
  output CCOUT_FB,
  output MULTSIGNOUT,
  output OVERFLOW,
  output [47:0] P,
  output PATTERN_B_DETECT,
  output PATTERN_DETECT,
  output [47:0] PCOUT,
  output [47:0] P_FDBK,
  output P_FDBK_47,
  output UNDERFLOW,
  output [7:0] XOROUT,

  input ALUMODE10,
  input [47:0] ALU_OUT,
  input CEP,
  input CLK,
  input [3:0] COUT,
  input [47:0] C_DATA,
  input MULTSIGN_ALU,
  input RSTP,
  input [7:0] XOR_MX
);
  
// define constants
  localparam MODULE_NAME = "DSP_OUTPUT";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  localparam AUTORESET_PATDET_NO_RESET = 0;
  localparam AUTORESET_PATDET_RESET_MATCH = 1;
  localparam AUTORESET_PATDET_RESET_NOT_MATCH = 2;
  localparam AUTORESET_PRIORITY_CEP = 1;
  localparam AUTORESET_PRIORITY_RESET = 0;
  localparam PREG_0 = 1;
  localparam PREG_1 = 0;
  localparam SEL_MASK_C = 1;
  localparam SEL_MASK_MASK = 0;
  localparam SEL_MASK_ROUNDING_MODE1 = 2;
  localparam SEL_MASK_ROUNDING_MODE2 = 3;
  localparam SEL_PATTERN_C = 1;
  localparam SEL_PATTERN_PATTERN = 0;
  localparam USE_PATTERN_DETECT_NO_PATDET = 0;
  localparam USE_PATTERN_DETECT_PATDET = 1;

// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
`ifdef XIL_DR
  `include "DSP_OUTPUT_dr.v"
`else
  localparam [120:1] AUTORESET_PATDET_REG = AUTORESET_PATDET;
  localparam [40:1] AUTORESET_PRIORITY_REG = AUTORESET_PRIORITY;
  localparam [0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
  localparam [0:0] IS_RSTP_INVERTED_REG = IS_RSTP_INVERTED;
  localparam [47:0] MASK_REG = MASK;
  localparam [47:0] PATTERN_REG = PATTERN;
  localparam [0:0] PREG_REG = PREG;
  localparam [112:1] SEL_MASK_REG = SEL_MASK;
  localparam [56:1] SEL_PATTERN_REG = SEL_PATTERN;
  localparam [72:1] USE_PATTERN_DETECT_REG = USE_PATTERN_DETECT;
`endif

  wire [1:0] AUTORESET_PATDET_BIN;
  wire AUTORESET_PRIORITY_BIN;
  wire IS_CLK_INVERTED_BIN;
  wire IS_RSTP_INVERTED_BIN;
  wire [47:0] MASK_BIN;
  wire [47:0] PATTERN_BIN;
  wire PREG_BIN;
  wire [1:0] SEL_MASK_BIN;
  wire SEL_PATTERN_BIN;
  wire USE_PATTERN_DETECT_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;
  tri0 glblGSR = glbl.GSR;

  wire CARRYCASCOUT_out;
  wire CCOUT_FB_out;
  wire MULTSIGNOUT_out;
  wire OVERFLOW_out;
  wire PATTERN_B_DETECT_out;
  wire PATTERN_DETECT_out;
  wire P_FDBK_47_out;
  wire UNDERFLOW_out;
  wire [3:0] CARRYOUT_out;
  wire [47:0] PCOUT_out;
  wire [47:0] P_FDBK_out;
  wire [47:0] P_out;
  wire [7:0] XOROUT_out;

`ifdef XIL_TIMING
  wire CARRYCASCOUT_delay;
  wire CCOUT_FB_delay;
  wire MULTSIGNOUT_delay;
  wire OVERFLOW_delay;
  wire PATTERN_B_DETECT_delay;
  wire PATTERN_DETECT_delay;
  wire P_FDBK_47_delay;
  wire UNDERFLOW_delay;
  wire [3:0] CARRYOUT_delay;
  wire [47:0] PCOUT_delay;
  wire [47:0] P_FDBK_delay;
  wire [47:0] P_delay;
  wire [7:0] XOROUT_delay;
`endif

  wire ALUMODE10_in;
  wire CEP_in;
  wire CLK_in;
  wire MULTSIGN_ALU_in;
  wire RSTP_in;
  wire [3:0] COUT_in;
  wire [47:0] ALU_OUT_in;
  wire [47:0] C_DATA_in;
  wire [7:0] XOR_MX_in;

`ifdef XIL_TIMING
  wire ALUMODE10_delay;
  wire CEP_delay;
  wire CLK_delay;
  wire MULTSIGN_ALU_delay;
  wire RSTP_delay;
  wire [3:0] COUT_delay;
  wire [47:0] ALU_OUT_delay;
  wire [47:0] C_DATA_delay;
  wire [7:0] XOR_MX_delay;
`endif
  
  wire the_auto_reset_patdet;
  wire auto_reset_pri;
  wire [47:0] the_mask;
  wire [47:0] the_pattern;
  reg opmode_valid_flag_dou = 1'b1; // TODO

  reg [3:0] COUT_reg = 4'b0000;
  reg ALUMODE10_reg = 1'b0;
  wire ALUMODE10_mux;
  reg MULTSIGN_ALU_reg = 1'b0;
  reg [47:0] ALU_OUT_reg = 48'b0;
  reg [7:0] XOR_MX_reg = 8'b0;

  wire pdet_o;
  wire pdetb_o;
  wire pdet_o_mux;
  wire pdetb_o_mux;
  wire overflow_data;
  wire underflow_data;
  reg  pdet_o_reg1 = 1'b0;
  reg  pdet_o_reg2 = 1'b0;
  reg  pdetb_o_reg1 = 1'b0;
  reg  pdetb_o_reg2 = 1'b0;
  wire CLK_preg;

  assign CARRYCASCOUT = CARRYCASCOUT_out;
  assign CARRYOUT = CARRYOUT_out;
  assign CCOUT_FB = CCOUT_FB_out;
  assign MULTSIGNOUT = MULTSIGNOUT_out;
  assign OVERFLOW = OVERFLOW_out;
  assign PATTERN_B_DETECT = PATTERN_B_DETECT_out;
  assign PATTERN_DETECT = PATTERN_DETECT_out;
  assign PCOUT = PCOUT_out;
  assign P_FDBK_47 = P_FDBK_47_out;
  assign P_FDBK = P_FDBK_out;
  assign P = P_out;
  assign UNDERFLOW = UNDERFLOW_out;
  assign XOROUT = XOROUT_out;

`ifdef XIL_TIMING
  reg notifier;
`endif
`ifdef XIL_TIMING
`endif


`ifdef XIL_TIMING
  assign ALUMODE10_in = ALUMODE10_delay;
  assign #1 ALU_OUT_in = ALU_OUT_delay; // break 0 delay feedback
  assign CEP_in = (CEP !== 1'bz) && CEP_delay; // rv 0
  assign CLK_preg   = ((CLK !== 1'bz) && (PREG_BIN != PREG_0)) && (CLK_delay ^ IS_CLK_INVERTED_BIN); // rv 0
  assign COUT_in = COUT_delay;
  assign C_DATA_in = C_DATA_delay;
  assign MULTSIGN_ALU_in = MULTSIGN_ALU_delay;
  assign RSTP_in = (RSTP !== 1'bz) && (RSTP_delay ^ IS_RSTP_INVERTED_BIN); // rv 0
  assign XOR_MX_in = XOR_MX_delay;
`else
  assign ALUMODE10_in = ALUMODE10;
  assign #1 ALU_OUT_in = ALU_OUT; // break 0 delay feedback
  assign CEP_in = (CEP !== 1'bz) && CEP; // rv 0
  assign CLK_preg   = ((CLK !== 1'bz) && (PREG_BIN != PREG_0)) && (CLK ^ IS_CLK_INVERTED_BIN); // rv 0
  assign COUT_in = COUT;
  assign C_DATA_in = C_DATA;
  assign MULTSIGN_ALU_in = MULTSIGN_ALU;
  assign RSTP_in = (RSTP !== 1'bz) && (RSTP ^ IS_RSTP_INVERTED_BIN); // rv 0
  assign XOR_MX_in = XOR_MX;
`endif

  assign AUTORESET_PATDET_BIN =
    (AUTORESET_PATDET_REG == "NO_RESET") ? AUTORESET_PATDET_NO_RESET :
    (AUTORESET_PATDET_REG == "RESET_MATCH") ? AUTORESET_PATDET_RESET_MATCH :
    (AUTORESET_PATDET_REG == "RESET_NOT_MATCH") ? AUTORESET_PATDET_RESET_NOT_MATCH :
     AUTORESET_PATDET_NO_RESET;

  assign AUTORESET_PRIORITY_BIN =
    (AUTORESET_PRIORITY_REG == "RESET") ? AUTORESET_PRIORITY_RESET :
    (AUTORESET_PRIORITY_REG == "CEP") ? AUTORESET_PRIORITY_CEP :
     AUTORESET_PRIORITY_RESET;

  assign IS_CLK_INVERTED_BIN = IS_CLK_INVERTED_REG;

  assign IS_RSTP_INVERTED_BIN = IS_RSTP_INVERTED_REG;

  assign MASK_BIN = MASK_REG;

  assign PATTERN_BIN = PATTERN_REG;

  assign PREG_BIN =
    (PREG_REG == 1) ? PREG_1 :
    (PREG_REG == 0) ? PREG_0 :
     PREG_1;

  assign SEL_MASK_BIN =
    (SEL_MASK_REG == "MASK") ? SEL_MASK_MASK :
    (SEL_MASK_REG == "C") ? SEL_MASK_C :
    (SEL_MASK_REG == "ROUNDING_MODE1") ? SEL_MASK_ROUNDING_MODE1 :
    (SEL_MASK_REG == "ROUNDING_MODE2") ? SEL_MASK_ROUNDING_MODE2 :
     SEL_MASK_MASK;

  assign SEL_PATTERN_BIN =
    (SEL_PATTERN_REG == "PATTERN") ? SEL_PATTERN_PATTERN :
    (SEL_PATTERN_REG == "C") ? SEL_PATTERN_C :
     SEL_PATTERN_PATTERN;

  assign USE_PATTERN_DETECT_BIN =
    (USE_PATTERN_DETECT_REG == "NO_PATDET") ? USE_PATTERN_DETECT_NO_PATDET :
    (USE_PATTERN_DETECT_REG == "PATDET") ? USE_PATTERN_DETECT_PATDET :
     USE_PATTERN_DETECT_NO_PATDET;

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
        ((AUTORESET_PATDET_REG != "NO_RESET") &&
         (AUTORESET_PATDET_REG != "RESET_MATCH") &&
         (AUTORESET_PATDET_REG != "RESET_NOT_MATCH"))) begin
      $display("Error: [Unisim %s-106] AUTORESET_PATDET attribute is set to %s.  Legal values for this attribute are NO_RESET, RESET_MATCH or RESET_NOT_MATCH. Instance: %m", MODULE_NAME, AUTORESET_PATDET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AUTORESET_PRIORITY_REG != "RESET") &&
         (AUTORESET_PRIORITY_REG != "CEP"))) begin
      $display("Error: [Unisim %s-107] AUTORESET_PRIORITY attribute is set to %s.  Legal values for this attribute are RESET or CEP. Instance: %m", MODULE_NAME, AUTORESET_PRIORITY_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLK_INVERTED_REG !== 1'b0) && (IS_CLK_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-120] IS_CLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLK_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_RSTP_INVERTED_REG !== 1'b0) && (IS_RSTP_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-132] IS_RSTP_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_RSTP_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((MASK_REG < 48'h000000000000) || (MASK_REG > 48'hFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-133] MASK attribute is set to %h.  Legal values for this attribute are 48'h000000000000 to 48'hFFFFFFFFFFFF. Instance: %m", MODULE_NAME, MASK_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PATTERN_REG < 48'h000000000000) || (PATTERN_REG > 48'hFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-136] PATTERN attribute is set to %h.  Legal values for this attribute are 48'h000000000000 to 48'hFFFFFFFFFFFF. Instance: %m", MODULE_NAME, PATTERN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PREG_REG != 1) &&
         (PREG_REG != 0))) begin
      $display("Error: [Unisim %s-138] PREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, PREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SEL_MASK_REG != "MASK") &&
         (SEL_MASK_REG != "C") &&
         (SEL_MASK_REG != "ROUNDING_MODE1") &&
         (SEL_MASK_REG != "ROUNDING_MODE2"))) begin
      $display("Error: [Unisim %s-140] SEL_MASK attribute is set to %s.  Legal values for this attribute are MASK, C, ROUNDING_MODE1 or ROUNDING_MODE2. Instance: %m", MODULE_NAME, SEL_MASK_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SEL_PATTERN_REG != "PATTERN") &&
         (SEL_PATTERN_REG != "C"))) begin
      $display("Error: [Unisim %s-141] SEL_PATTERN attribute is set to %s.  Legal values for this attribute are PATTERN or C. Instance: %m", MODULE_NAME, SEL_PATTERN_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_PATTERN_DETECT_REG != "NO_PATDET") &&
         (USE_PATTERN_DETECT_REG != "PATDET"))) begin
      $display("Error: [Unisim %s-143] USE_PATTERN_DETECT attribute is set to %s.  Legal values for this attribute are NO_PATDET or PATDET. Instance: %m", MODULE_NAME, USE_PATTERN_DETECT_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

//--####################################################################
//--#####                    Pattern Detector                      #####
//--####################################################################

    // select pattern
    assign the_pattern = (SEL_PATTERN_BIN == SEL_PATTERN_PATTERN) ? PATTERN_BIN : C_DATA_in;

    // select mask
    assign the_mask = (SEL_MASK_BIN == SEL_MASK_C)              ?    C_DATA_in       :
                      (SEL_MASK_BIN == SEL_MASK_ROUNDING_MODE1) ? {~(C_DATA_in[46:0]),1'b0} :
                      (SEL_MASK_BIN == SEL_MASK_ROUNDING_MODE2) ? {~(C_DATA_in[45:0]),2'b0} :
                      MASK_BIN; // default or (SEL_MASK_BIN == SEL_MASK_MASK)
//    always @(C_DATA_in or SEL_MASK_BIN or MASK_BIN) begin
//        case(SEL_MASK_BIN)
//              SEL_MASK_MASK           : the_mask <=  MASK_BIN;
//              SEL_MASK_C              : the_mask <=  C_DATA_in;
//              SEL_MASK_ROUNDING_MODE1 : the_mask <= ~(C_DATA_in << 1);
//              SEL_MASK_ROUNDING_MODE2 : the_mask <= ~(C_DATA_in << 2);
//              default                 : the_mask <=  MASK_BIN;
//        endcase
//    end

    //--  now do the pattern detection

   assign pdet_o  = &(~(the_pattern ^ ALU_OUT_in) | the_mask);
   assign pdetb_o = &( (the_pattern ^ ALU_OUT_in) | the_mask);

   assign PATTERN_DETECT_out   = opmode_valid_flag_dou ? pdet_o_mux  : 1'bx;
   assign PATTERN_B_DETECT_out = opmode_valid_flag_dou ? pdetb_o_mux : 1'bx;

//   assign CLK_preg =  (PREG_BIN == PREG_1) ? CLK_in : 1'b0;

//*** Output register PATTERN DETECT and UNDERFLOW / OVERFLOW 

   always @(posedge CLK_preg) begin
     if(RSTP_in || glblGSR || the_auto_reset_patdet)
       begin
         pdet_o_reg1  <= 1'b0;
         pdet_o_reg2  <= 1'b0;
         pdetb_o_reg1 <= 1'b0;
         pdetb_o_reg2 <= 1'b0;
       end
     else if(CEP_in)
       begin
       //-- the previous values are used in Underflow/Overflow
         pdet_o_reg2  <= pdet_o_reg1;
         pdet_o_reg1  <= pdet_o;
         pdetb_o_reg2 <= pdetb_o_reg1;
         pdetb_o_reg1 <= pdetb_o;
       end
     end

    assign pdet_o_mux     = (PREG_BIN == PREG_1) ? pdet_o_reg1  : pdet_o;
    assign pdetb_o_mux    = (PREG_BIN == PREG_1) ? pdetb_o_reg1 : pdetb_o;
    assign overflow_data  = (PREG_BIN == PREG_1) ? pdet_o_reg2  : pdet_o;
    assign underflow_data = (PREG_BIN == PREG_1) ? pdetb_o_reg2 : pdetb_o;

//--####################################################################
//--#####                     AUTORESET_PATDET                     #####
//--####################################################################
    assign auto_reset_pri = (AUTORESET_PRIORITY_BIN == AUTORESET_PRIORITY_RESET) || CEP_in;

    assign the_auto_reset_patdet =
         (AUTORESET_PATDET_BIN == AUTORESET_PATDET_RESET_MATCH) ?
                     auto_reset_pri && pdet_o_mux :
         (AUTORESET_PATDET_BIN == AUTORESET_PATDET_RESET_NOT_MATCH) ?
                     auto_reset_pri && overflow_data && ~pdet_o_mux : 1'b0; // NO_RESET

//--####################################################################
//--#### CARRYOUT, CARRYCASCOUT. MULTSIGNOUT, PCOUT and XOROUT reg ##### 
//--####################################################################
//*** register with 1 level of register
   always @(posedge CLK_preg) begin
        if(RSTP_in || glblGSR || the_auto_reset_patdet) begin
//           COUT_reg         <= 4'b0xxx;
           COUT_reg         <= 4'b0000;
           ALUMODE10_reg    <= 1'b0;
           MULTSIGN_ALU_reg <= 1'b0;
           ALU_OUT_reg      <= 48'b0;
           XOR_MX_reg       <= 8'b0;
           end
        else if (CEP_in) begin
           COUT_reg         <= COUT_in;
           ALUMODE10_reg    <= ALUMODE10_in;
           MULTSIGN_ALU_reg <= MULTSIGN_ALU_in;
           ALU_OUT_reg      <= ALU_OUT_in;
           XOR_MX_reg       <= XOR_MX_in;
           end
    end

    assign ALUMODE10_mux    = (PREG_BIN == PREG_1) ? ALUMODE10_reg    : ALUMODE10_in;
    assign CARRYOUT_out     = (PREG_BIN == PREG_1) ? COUT_reg         : COUT_in;
    assign MULTSIGNOUT_out  = (PREG_BIN == PREG_1) ? MULTSIGN_ALU_reg : MULTSIGN_ALU_in;
    assign P_out            = (PREG_BIN == PREG_1) ? ALU_OUT_reg      : ALU_OUT_in;
    assign XOROUT_out       = (PREG_BIN == PREG_1) ? XOR_MX_reg      : XOR_MX_in;
    assign CCOUT_FB_out     = ALUMODE10_reg ^ COUT_reg[3];
    assign CARRYCASCOUT_out = ALUMODE10_mux ^ CARRYOUT_out[3];
    assign P_FDBK_out       = ALU_OUT_reg;
    assign P_FDBK_47_out    = ALU_OUT_reg[47];
    assign PCOUT_out        = (PREG_BIN == PREG_1) ? ALU_OUT_reg      : ALU_OUT_in;

//--####################################################################
//--#####                    Underflow / Overflow                  #####
//--####################################################################
    assign OVERFLOW_out  = ((USE_PATTERN_DETECT_BIN == USE_PATTERN_DETECT_PATDET) ||
                            (PREG_BIN == PREG_1)) ?
                            ~pdet_o_mux && ~pdetb_o_mux && overflow_data : 1'bx;
    assign UNDERFLOW_out = ((USE_PATTERN_DETECT_BIN == USE_PATTERN_DETECT_PATDET) ||
                            (PREG_BIN == PREG_1)) ?
                            ~pdet_o_mux && ~pdetb_o_mux && underflow_data : 1'bx;

  specify
    (ALUMODE10 => CARRYCASCOUT) = (0:0:0, 0:0:0);
    (ALU_OUT *> P) = (0:0:0, 0:0:0);
    (ALU_OUT *> PATTERN_B_DETECT) = (0:0:0, 0:0:0);
    (ALU_OUT *> PATTERN_DETECT) = (0:0:0, 0:0:0);
    (ALU_OUT *> PCOUT) = (0:0:0, 0:0:0);
    (CLK *> CARRYOUT) = (0:0:0, 0:0:0);
    (CLK *> P) = (0:0:0, 0:0:0);
    (CLK *> PCOUT) = (0:0:0, 0:0:0);
    (CLK *> P_FDBK) = (0:0:0, 0:0:0);
    (CLK *> XOROUT) = (0:0:0, 0:0:0);
    (CLK => CARRYCASCOUT) = (0:0:0, 0:0:0);
    (CLK => CCOUT_FB) = (0:0:0, 0:0:0);
    (CLK => MULTSIGNOUT) = (0:0:0, 0:0:0);
    (CLK => OVERFLOW) = (0:0:0, 0:0:0);
    (CLK => PATTERN_B_DETECT) = (0:0:0, 0:0:0);
    (CLK => PATTERN_DETECT) = (0:0:0, 0:0:0);
    (CLK => P_FDBK_47) = (0:0:0, 0:0:0);
    (CLK => UNDERFLOW) = (0:0:0, 0:0:0);
    (COUT *> CARRYCASCOUT) = (0:0:0, 0:0:0);
    (COUT *> CARRYOUT) = (0:0:0, 0:0:0);
    (C_DATA *> PATTERN_B_DETECT) = (0:0:0, 0:0:0);
    (C_DATA *> PATTERN_DETECT) = (0:0:0, 0:0:0);
    (MULTSIGN_ALU => MULTSIGNOUT) = (0:0:0, 0:0:0);
    (XOR_MX *> XOROUT) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge CLK, 0:0:0, notifier);
    $period (posedge CLK, 0:0:0, notifier);
    $setuphold (negedge CLK, negedge ALUMODE10, 0:0:0, 0:0:0, notifier,,, CLK_delay, ALUMODE10_delay);
    $setuphold (negedge CLK, negedge ALU_OUT, 0:0:0, 0:0:0, notifier,,, CLK_delay, ALU_OUT_delay);
    $setuphold (negedge CLK, negedge CEP, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEP_delay);
    $setuphold (negedge CLK, negedge COUT, 0:0:0, 0:0:0, notifier,,, CLK_delay, COUT_delay);
    $setuphold (negedge CLK, negedge C_DATA, 0:0:0, 0:0:0, notifier,,, CLK_delay, C_DATA_delay);
    $setuphold (negedge CLK, negedge MULTSIGN_ALU, 0:0:0, 0:0:0, notifier,,, CLK_delay, MULTSIGN_ALU_delay);
    $setuphold (negedge CLK, negedge RSTP, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTP_delay);
    $setuphold (negedge CLK, negedge XOR_MX, 0:0:0, 0:0:0, notifier,,, CLK_delay, XOR_MX_delay);
    $setuphold (negedge CLK, posedge ALUMODE10, 0:0:0, 0:0:0, notifier,,, CLK_delay, ALUMODE10_delay);
    $setuphold (negedge CLK, posedge ALU_OUT, 0:0:0, 0:0:0, notifier,,, CLK_delay, ALU_OUT_delay);
    $setuphold (negedge CLK, posedge CEP, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEP_delay);
    $setuphold (negedge CLK, posedge COUT, 0:0:0, 0:0:0, notifier,,, CLK_delay, COUT_delay);
    $setuphold (negedge CLK, posedge C_DATA, 0:0:0, 0:0:0, notifier,,, CLK_delay, C_DATA_delay);
    $setuphold (negedge CLK, posedge MULTSIGN_ALU, 0:0:0, 0:0:0, notifier,,, CLK_delay, MULTSIGN_ALU_delay);
    $setuphold (negedge CLK, posedge RSTP, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTP_delay);
    $setuphold (negedge CLK, posedge XOR_MX, 0:0:0, 0:0:0, notifier,,, CLK_delay, XOR_MX_delay);
    $setuphold (posedge CLK, negedge ALUMODE10, 0:0:0, 0:0:0, notifier,,, CLK_delay, ALUMODE10_delay);
    $setuphold (posedge CLK, negedge ALU_OUT, 0:0:0, 0:0:0, notifier,,, CLK_delay, ALU_OUT_delay);
    $setuphold (posedge CLK, negedge CEP, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEP_delay);
    $setuphold (posedge CLK, negedge COUT, 0:0:0, 0:0:0, notifier,,, CLK_delay, COUT_delay);
    $setuphold (posedge CLK, negedge C_DATA, 0:0:0, 0:0:0, notifier,,, CLK_delay, C_DATA_delay);
    $setuphold (posedge CLK, negedge MULTSIGN_ALU, 0:0:0, 0:0:0, notifier,,, CLK_delay, MULTSIGN_ALU_delay);
    $setuphold (posedge CLK, negedge RSTP, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTP_delay);
    $setuphold (posedge CLK, negedge XOR_MX, 0:0:0, 0:0:0, notifier,,, CLK_delay, XOR_MX_delay);
    $setuphold (posedge CLK, posedge ALUMODE10, 0:0:0, 0:0:0, notifier,,, CLK_delay, ALUMODE10_delay);
    $setuphold (posedge CLK, posedge ALU_OUT, 0:0:0, 0:0:0, notifier,,, CLK_delay, ALU_OUT_delay);
    $setuphold (posedge CLK, posedge CEP, 0:0:0, 0:0:0, notifier,,, CLK_delay, CEP_delay);
    $setuphold (posedge CLK, posedge COUT, 0:0:0, 0:0:0, notifier,,, CLK_delay, COUT_delay);
    $setuphold (posedge CLK, posedge C_DATA, 0:0:0, 0:0:0, notifier,,, CLK_delay, C_DATA_delay);
    $setuphold (posedge CLK, posedge MULTSIGN_ALU, 0:0:0, 0:0:0, notifier,,, CLK_delay, MULTSIGN_ALU_delay);
    $setuphold (posedge CLK, posedge RSTP, 0:0:0, 0:0:0, notifier,,, CLK_delay, RSTP_delay);
    $setuphold (posedge CLK, posedge XOR_MX, 0:0:0, 0:0:0, notifier,,, CLK_delay, XOR_MX_delay);
`endif
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
