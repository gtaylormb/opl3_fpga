///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 2013 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \   \   \/      Version     : 2012.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        
// /___/   /\      Filename    : IBUFDS_GTE3.v
// \   \  /  \ 
//  \___\/\___\                    
//                                 
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  12/11/2012 - Initial version
//  03/22/2013 - Model added
//  03/25/2013 - Sync 5 YML & model update
//  04/12/2013 - Add attribute section
//  08/28/2013 - Add specify section
//  06/02/2014 - New simulation library message format.
//  End Revision:
///////////////////////////////////////////////////////////////////////////////


`timescale 1 ps / 1 ps 

`celldefine
module IBUFDS_GTE3 #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",  
  `endif
  parameter [0:0] REFCLK_EN_TX_PATH = 1'b0,
  parameter [1:0] REFCLK_HROW_CK_SEL = 2'b00,
  parameter [1:0] REFCLK_ICNTL_RX = 2'b00
)(
  output O,
  output ODIV2,

  input CEB,
  input I,
  input IB
);
  
// define constants

  localparam MODULE_NAME = "IBUFDS_GTE3";

   // Parameter encodings and registers
  `ifndef XIL_DR
  localparam [0:0] REFCLK_EN_TX_PATH_REG = REFCLK_EN_TX_PATH;
  localparam [1:0] REFCLK_HROW_CK_SEL_REG = REFCLK_HROW_CK_SEL;
  localparam [1:0] REFCLK_ICNTL_RX_REG = REFCLK_ICNTL_RX;
  `endif

  wire REFCLK_EN_TX_PATH_BIN;
  wire [1:0] REFCLK_HROW_CK_SEL_BIN;
  wire [1:0] REFCLK_ICNTL_RX_BIN;
  wire i_in, ib_in, ceb_in;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
   
  tri0 GSR = glbl.GSR;

 `ifdef XIL_TIMING //Simprim
  reg notifier;
  `endif

  reg trig_attr = 1'b0;
  reg attr_err = 1'b0;
   
// include dynamic registers - XILINX test only
  `ifdef XIL_DR
  `include "IBUFDS_GTE3_dr.v"
  `endif

  initial begin
  #1;
  trig_attr = ~trig_attr;
  end
  
  assign i_in = I;
  assign ib_in = IB;
  assign ceb_in = CEB;
   
   
  assign REFCLK_EN_TX_PATH_BIN = REFCLK_EN_TX_PATH_REG;
  assign REFCLK_HROW_CK_SEL_BIN = REFCLK_HROW_CK_SEL_REG;
  assign REFCLK_ICNTL_RX_BIN = REFCLK_ICNTL_RX_REG;

  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((REFCLK_EN_TX_PATH_REG !== 1'b0) && (REFCLK_EN_TX_PATH_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-102] REFCLK_EN_TX_PATH attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, REFCLK_EN_TX_PATH_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((REFCLK_HROW_CK_SEL_REG < 2'b00) || (REFCLK_HROW_CK_SEL_REG > 2'b11))) begin
      $display("Error: [Unisim %s-103] REFCLK_HROW_CK_SEL attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, REFCLK_HROW_CK_SEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((REFCLK_ICNTL_RX_REG < 2'b00) || (REFCLK_ICNTL_RX_REG > 2'b11))) begin
      $display("Error: [Unisim %s-104] REFCLK_ICNTL_RX attribute is set to %b.  Legal values for this attribute are 2'b00 to 2'b11. Instance: %m", MODULE_NAME, REFCLK_ICNTL_RX_REG);
      attr_err = 1'b1;
    end

  if (attr_err == 1'b1) $finish;
  end


   reg  ODIV2_out=0;
   wire  O_out;
   

    reg [2:0] ce_count = 1;
    reg [2:0] edge_count = 0;

    reg allEqual;

    initial begin
        allEqual = 0;
     end // initial begin


// =====================
// Count the rising edges of the clk
// =====================
    always @(posedge I) begin
         if(allEqual)
             edge_count <= 3'b000;
          else
             if (CEB == 1'b0)
                 edge_count <= edge_count + 1;
     end

//  Generate synchronous reset after DIVIDE number of counts
    always @(edge_count)
        if (edge_count == ce_count)
           allEqual = 1;
        else
          allEqual = 0;

// =====================
// Generate ODIV2
// =====================
    always @(*) begin
       case (REFCLK_HROW_CK_SEL_BIN)
	 2'b00: ODIV2_out <= O_out;
         2'b01: ODIV2_out <= allEqual;
         2'b10: ODIV2_out <= 1'b0;
         2'b11: ODIV2_out <= 1'b0;
         default : ODIV2_out <= O_out;
	   endcase
    end

// =====================
// Generate O
// =====================

   assign O_out = (REFCLK_EN_TX_PATH_BIN | ceb_in) ? 1'b0 : i_in;
   


// =====================
// Outputs   
// =====================

    assign O  = O_out;
    assign ODIV2   = ODIV2_out;
    

  specify
    (CEB => O) = (0:0:0, 0:0:0);
    (CEB => ODIV2) = (0:0:0, 0:0:0);
    (I => O) = (0:0:0, 0:0:0);
    (I => ODIV2) = (0:0:0, 0:0:0);
    (IB => O) = (0:0:0, 0:0:0);
    (IB => ODIV2) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
