///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____   ____
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \   \   \/      Version     : 2014.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Register Interface Unit Selection Block
// /___/   /\      Filename    : RIU_OR.v
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

module RIU_OR #(
  `ifdef XIL_TIMING
  parameter LOC = "UNPLACED",  
  `endif
  parameter real SIM_VERSION = 2.0
)(
  output [15:0] RIU_RD_DATA,
  output RIU_RD_VALID,

  input [15:0] RIU_RD_DATA_LOW,
  input [15:0] RIU_RD_DATA_UPP,
  input RIU_RD_VALID_LOW,
  input RIU_RD_VALID_UPP
);
  
// define constants
  localparam MODULE_NAME = "RIU_OR";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers

  
// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
  localparam real SIM_VERSION_REG = SIM_VERSION;

  wire [63:0] SIM_VERSION_BIN;

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

  wire RIU_RD_VALID_out;
  wire [15:0] RIU_RD_DATA_out;

  wire RIU_RD_VALID_delay;
  wire [15:0] RIU_RD_DATA_delay;

  wire RIU_RD_VALID_LOW_in;
  wire RIU_RD_VALID_UPP_in;
  wire [15:0] RIU_RD_DATA_LOW_in;
  wire [15:0] RIU_RD_DATA_UPP_in;

  wire RIU_RD_VALID_LOW_delay;
  wire RIU_RD_VALID_UPP_delay;
  wire [15:0] RIU_RD_DATA_LOW_delay;
  wire [15:0] RIU_RD_DATA_UPP_delay;

  
  assign #(out_delay) RIU_RD_DATA = RIU_RD_DATA_delay;
  assign #(out_delay) RIU_RD_VALID = RIU_RD_VALID_delay;
  

// inputs with no timing checks

  assign #(in_delay) RIU_RD_DATA_LOW_delay = RIU_RD_DATA_LOW;
  assign #(in_delay) RIU_RD_DATA_UPP_delay = RIU_RD_DATA_UPP;
  assign #(in_delay) RIU_RD_VALID_LOW_delay = RIU_RD_VALID_LOW;
  assign #(in_delay) RIU_RD_VALID_UPP_delay = RIU_RD_VALID_UPP;

  assign RIU_RD_DATA_delay = RIU_RD_DATA_out;
  assign RIU_RD_VALID_delay = RIU_RD_VALID_out;

  assign RIU_RD_DATA_LOW_in = RIU_RD_DATA_LOW_delay;
  assign RIU_RD_DATA_UPP_in = RIU_RD_DATA_UPP_delay;
  assign RIU_RD_VALID_LOW_in = RIU_RD_VALID_LOW_delay;
  assign RIU_RD_VALID_UPP_in = RIU_RD_VALID_UPP_delay;

  assign SIM_VERSION_BIN = SIM_VERSION_REG * 1000;
  assign RIU_RD_DATA_out = RIU_RD_DATA_UPP_in | RIU_RD_DATA_LOW_in;
  assign RIU_RD_VALID_out =   RIU_RD_VALID_UPP_in & RIU_RD_VALID_LOW_in;


  initial begin
    #1;
    trig_attr = ~trig_attr;
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
   ((SIM_VERSION_REG != 2.0) &&
      (SIM_VERSION_REG != 1.0))) begin
    $display("Error: [Unisim %s-101] SIM_VERSION attribute is set to %f.  Legal values for this attribute are 2.0 or 1.0. Instance: %m", MODULE_NAME, SIM_VERSION_REG);
    attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

  specify
    (RIU_RD_DATA_LOW *> RIU_RD_DATA) = (0:0:0, 0:0:0);
    (RIU_RD_DATA_UPP *> RIU_RD_DATA) = (0:0:0, 0:0:0);
    (RIU_RD_VALID_LOW => RIU_RD_VALID) = (0:0:0, 0:0:0);
    (RIU_RD_VALID_UPP => RIU_RD_VALID) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
