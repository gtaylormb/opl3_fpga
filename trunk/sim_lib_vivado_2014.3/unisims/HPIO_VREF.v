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
// /___/   /\      Filename    : HPIO_VREF.v
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
module HPIO_VREF #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",  
  `endif
  parameter VREF_CNTR = "OFF"
)(
  output VREF,

  input [6:0] FABRIC_VREF_TUNE
);
  
// define constants
  localparam MODULE_NAME = "HPIO_VREF";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  localparam VREF_CNTR_FABRIC_RANGE1 = 1;
  localparam VREF_CNTR_FABRIC_RANGE2 = 2;
  localparam VREF_CNTR_OFF = 0;

  localparam [104:1] VREF_CNTR_REG = VREF_CNTR;

  wire [1:0] VREF_CNTR_BIN;

  tri0 glblGSR = glbl.GSR;

  `ifdef XIL_TIMING //Simprim 
  reg notifier;
  `endif
  reg trig_attr = 1'b0;
`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;
  
  wire VREF_out = 1'b1;

  wire VREF_delay;

  wire [6:0] FABRIC_VREF_TUNE_in;

  wire [6:0] FABRIC_VREF_TUNE_delay;

  
  assign #(out_delay) VREF = VREF_delay;
  

// inputs with no timing checks

  assign #(in_delay) FABRIC_VREF_TUNE_delay = FABRIC_VREF_TUNE;

  assign VREF_delay = VREF_out;

  assign FABRIC_VREF_TUNE_in = FABRIC_VREF_TUNE_delay;

  initial begin
    #1;
    trig_attr = ~trig_attr;
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((VREF_CNTR_REG != "OFF") &&
         (VREF_CNTR_REG != "FABRIC_RANGE1") &&
         (VREF_CNTR_REG != "FABRIC_RANGE2"))) begin
      $display("Error: [Unisim %s-101] VREF_CNTR attribute is set to %s.  Legal values for this attribute are OFF, FABRIC_RANGE1 or FABRIC_RANGE2. Instance: %m", MODULE_NAME, VREF_CNTR_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

  assign VREF_CNTR_BIN = 
    (VREF_CNTR_REG == "OFF") ? VREF_CNTR_OFF :
    (VREF_CNTR_REG == "FABRIC_RANGE1") ? VREF_CNTR_FABRIC_RANGE1 :
    (VREF_CNTR_REG == "FABRIC_RANGE2") ? VREF_CNTR_FABRIC_RANGE2 :
    VREF_CNTR_OFF;

  always @ (FABRIC_VREF_TUNE_in) begin
     $display("Info: [Unisim %s-1] Fabric Tune Value changed to %b. Instance: %m",MODULE_NAME, FABRIC_VREF_TUNE_in);
  end
  
  endmodule

`endcelldefine
