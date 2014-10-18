///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____   ____
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \   \   \/      Version     : 2014.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Dedicated Dual Data Rate (DDR) Output Register
// /___/   /\      Filename    : ODDRE1.v
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

module ODDRE1 #(
  `ifdef XIL_TIMING
  parameter LOC = "UNPLACED",  
  `endif
  parameter [0:0] IS_C_INVERTED = 1'b0,
  parameter [0:0] IS_D1_INVERTED = 1'b0,
  parameter [0:0] IS_D2_INVERTED = 1'b0,
  parameter [0:0] SRVAL = 1'b0
)(
  output Q,

  input C,
  input D1,
  input D2,
  input SR
);
  
// define constants
  localparam MODULE_NAME = "ODDRE1";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers

  
// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
  `ifdef XIL_DR
  `include "ODDRE1_dr.v"
  `else
  localparam [0:0] IS_C_INVERTED_REG = IS_C_INVERTED;
  localparam [0:0] IS_D1_INVERTED_REG = IS_D1_INVERTED;
  localparam [0:0] IS_D2_INVERTED_REG = IS_D2_INVERTED;
  localparam [0:0] SRVAL_REG = SRVAL;
  `endif

  wire IS_C_INVERTED_BIN;
  wire IS_D1_INVERTED_BIN;
  wire IS_D2_INVERTED_BIN;
  wire SRVAL_BIN;

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

  reg Q_out,QD2_posedge_int;
  reg R_sync1 = 1'b0;
  reg R_sync2 = 1'b0;
  reg R_sync3 = 1'b0;


  wire Q_delay;

  wire C_in;
  wire D1_in;
  wire D2_in;
  wire SR_in;

  wire C_delay;
  wire D1_delay;
  wire D2_delay;
  wire SR_delay;

  
  assign #(out_delay) Q = Q_delay;
  

// inputs with no timing checks
  assign #(inclk_delay) C_delay = C;

  assign #(in_delay) D1_delay = D1;
  assign #(in_delay) D2_delay = D2;
  assign #(in_delay) SR_delay = SR;

  assign Q_delay = Q_out;

  assign C_in = C_delay ^ IS_C_INVERTED_BIN;
  assign D1_in = D1_delay ^ IS_D1_INVERTED_BIN;
  assign D2_in = D2_delay ^ IS_D2_INVERTED_BIN;
  assign SR_in = SR_delay;

  assign IS_C_INVERTED_BIN = IS_C_INVERTED_REG;

  assign IS_D1_INVERTED_BIN = IS_D1_INVERTED_REG;

  assign IS_D2_INVERTED_BIN = IS_D2_INVERTED_REG;

  assign SRVAL_BIN = SRVAL_REG;


  initial begin
    #1;
    trig_attr = ~trig_attr;
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((IS_C_INVERTED_REG !== 1'b0) && (IS_C_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-101] IS_C_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_C_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_D1_INVERTED_REG !== 1'b0) && (IS_D1_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-102] IS_D1_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_D1_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_D2_INVERTED_REG !== 1'b0) && (IS_D2_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-103] IS_D2_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_D2_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((SRVAL_REG !== 1'b0) && (SRVAL_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-106] SRVAL attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, SRVAL_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

  always @(posedge C_in) begin
          R_sync1 <= SR_in;
          R_sync2 <= R_sync1;
          R_sync3 <= R_sync2;
  end
  
  always @ (glblGSR or SR_in or R_sync1 or R_sync2 or R_sync3) begin
    if (glblGSR == 1'b1) begin
      assign Q_out = SRVAL_REG;
      assign QD2_posedge_int = SRVAL_REG;
    end
    else if (glblGSR == 1'b0) begin
      if (SR_in == 1'b1 || R_sync1 == 1'b1 || R_sync2 == 1'b1 || R_sync3 == 1'b1 ) begin
        assign Q_out = SRVAL_REG;
        assign QD2_posedge_int = SRVAL_REG;
      end
      else if (R_sync3 == 1'b0) begin
        deassign Q_out;
        deassign QD2_posedge_int;
      end
    end
  end
 
  always @(posedge C_in) begin
    if (SR_in == 1'b1 || R_sync1 ==1'b1 || R_sync2 == 1'b1 || R_sync3 == 1'b1) begin
         Q_out <= SRVAL_REG;
         QD2_posedge_int <= SRVAL_REG;
    end 
    else if (R_sync3 == 1'b0) begin
         Q_out <= D1_in;
	 QD2_posedge_int <= D2_in;
    end
  end

  always @(negedge C_in) begin
    if (SR_in == 1'b1 || R_sync1 == 1'b1 || R_sync2 == 1'b1 || R_sync3 == 1'b1)
         Q_out <= SRVAL_REG;
    else if (R_sync3 == 1'b0) begin
         Q_out <= QD2_posedge_int;
    end
  end

endmodule

`endcelldefine
