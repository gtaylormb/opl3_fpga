///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        _no_description_
// /___/   /\      Filename    : IBUFCTRL.v
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

module IBUFCTRL #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter ISTANDARD = "UNUSED",
  parameter USE_IBUFDISABLE = "FALSE"
)(
  output O,

  input I,
  input IBUFDISABLE,
  input INTERMDISABLE,
  input T
);
  
// define constants
  localparam MODULE_NAME = "IBUFCTRL";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  localparam USE_IBUFDISABLE_FALSE = 0;
  localparam USE_IBUFDISABLE_TRUE = 1;

// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
  localparam [40:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;

  wire USE_IBUFDISABLE_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;
  tri0 glblGSR = glbl.GSR;

  wire O_out;

  wire O_delay;

  wire IBUFDISABLE_in;
  wire INTERMDISABLE_in;
  wire I_in;
  wire T_in;

  wire IBUFDISABLE_delay;
  wire INTERMDISABLE_delay;
  wire I_delay;
  wire T_delay;
  wire NOT_T_OR_IBUFDISABLE;

  assign #(out_delay) O = O_delay;


// inputs with no timing checks
  assign #(in_delay) IBUFDISABLE_delay = IBUFDISABLE;
  assign #(in_delay) INTERMDISABLE_delay = INTERMDISABLE;
  assign #(in_delay) I_delay = I;
  assign #(in_delay) T_delay = T;

  assign O_delay = O_out;

  assign IBUFDISABLE_in = IBUFDISABLE_delay;
  assign INTERMDISABLE_in = INTERMDISABLE_delay;
  assign I_in = I_delay;
  assign T_in = T_delay;

  assign USE_IBUFDISABLE_BIN =
    (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
    (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
     USE_IBUFDISABLE_FALSE;

`ifndef XIL_TIMING
  initial begin
    $display("Error: [Unisim %s-103] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
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
        ((USE_IBUFDISABLE_REG != "FALSE") &&
         (USE_IBUFDISABLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-104] USE_IBUFDISABLE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

  generate
       case (USE_IBUFDISABLE)
          "TRUE" :  begin
              assign NOT_T_OR_IBUFDISABLE = ~T_in || IBUFDISABLE_in;
              assign O_out = (NOT_T_OR_IBUFDISABLE == 0)? I_in : (NOT_T_OR_IBUFDISABLE == 1)? 1'b0  : 1'bx;
              end
          "FALSE"  : begin
              assign O_out = I_in;
              end   
       endcase
  endgenerate       

  specify
    (I => O) = (0:0:0, 0:0:0);
    (IBUFDISABLE => O) = (0:0:0, 0:0:0);
    (INTERMDISABLE => O) = (0:0:0, 0:0:0);
    (T => O) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
