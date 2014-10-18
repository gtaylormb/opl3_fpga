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
// /___/   /\      Filename    : OBUFDS_GTE3.v
// \   \  /  \ 
//  \___\/\___\                    
//                                 
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  12/11/2012 - Initial version
//  03/22/2013 - Model added
//  03/25/2013 - Sync 5 YML & model update
//  04/12/2013 - Add attribute section
//  08/28/2013 - Remove REFCLKOUT_CLKOUT_SEL, Add specify section
//  06/02/2014 - New simulation library message format.
// End Revision:
///////////////////////////////////////////////////////////////////////////////


`timescale 1 ps / 1 ps 

`celldefine
module OBUFDS_GTE3  #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",  
  `endif

  parameter [0:0] REFCLK_EN_TX_PATH = 1'b0,
  parameter [4:0] REFCLK_ICNTL_TX = 5'b00000
)(
  output O,
  output OB,

  input CEB,
  input I
);
  
// define constants

  localparam MODULE_NAME = "OBUFDS_GTE3";
   // Parameter encodings and registers

  `ifndef XIL_DR
  localparam [0:0] REFCLK_EN_TX_PATH_REG = REFCLK_EN_TX_PATH;
  localparam [4:0] REFCLK_ICNTL_TX_REG = REFCLK_ICNTL_TX;
  `endif
  wire REFCLK_EN_TX_PATH_BIN;
  wire [4:0] REFCLK_ICNTL_TX_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
   
  tri0 GTS = glbl.GTS;
  tri0 glblGSR = glbl.GSR;

 `ifdef XIL_TIMING //Simprim 
  reg notifier;
 `endif
  
  reg trig_attr = 1'b0;
  reg attr_err = 1'b0;
   
// include dynamic registers - XILINX test only
  `ifdef XIL_DR
  `include "OBUFDS_GTE3_dr.v"
 `endif
initial begin
  #1;
  trig_attr = ~trig_attr;
  end

  assign REFCLK_EN_TX_PATH_BIN = REFCLK_EN_TX_PATH_REG;

  assign REFCLK_ICNTL_TX_BIN = REFCLK_ICNTL_TX_REG;

always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((REFCLK_EN_TX_PATH_REG !== 1'b0) && (REFCLK_EN_TX_PATH_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-101] REFCLK_EN_TX_PATH attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, REFCLK_EN_TX_PATH_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((REFCLK_ICNTL_TX_REG < 5'b00000) || (REFCLK_ICNTL_TX_REG > 5'b11111))) begin
      $display("Error: [Unisim %s-102] REFCLK_ICNTL_TX attribute is set to %b.  Legal values for this attribute are 5'b00000 to 5'b11111. Instance: %m", MODULE_NAME, REFCLK_ICNTL_TX_REG);
      attr_err = 1'b1;
    end

  if (attr_err == 1'b1) $finish;
  end
   
    wire t1;
    wire t2;
   
    or O1 (t1, GTS, CEB);
    or O2 (t2, ~REFCLK_EN_TX_PATH_BIN, t1);
    bufif0 B1 (O, I, t2);
    notif0 N1 (OB, I, t2);
   
  specify
    (I => O) = (0:0:0, 0:0:0);
    (I => OB) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
