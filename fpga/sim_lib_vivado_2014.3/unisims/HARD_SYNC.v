///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Metastability Hardened Registers
// /___/   /\      Filename    : HARD_SYNC.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  01/30/13 Initial version
//  05/08/13 712367 - fix blocking assignments
//  05/17/13 718960 - fix BIN encoding
//  05/17/13 719092 - remove SR, add IS_CLK_INVERTED
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module HARD_SYNC #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [0:0] INIT = 1'b0,
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter integer LATENCY = 2
)(
  output DOUT,

  input CLK,
  input DIN
);
  
// define constants
  localparam MODULE_NAME = "HARD_SYNC";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  localparam LATENCY_2 = 0;
  localparam LATENCY_3 = 1;

// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
`ifdef XIL_DR
  `include "HARD_SYNC_dr.v"
`else
  localparam [0:0] INIT_REG = INIT;
  localparam [0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
  localparam [1:0] LATENCY_REG = LATENCY;
`endif

  wire INIT_BIN;
  wire IS_CLK_INVERTED_BIN;
  wire LATENCY_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;
  tri0 glblGSR = glbl.GSR;

  wire DOUT_out;

  wire DOUT_delay;

  wire CLK_in;
  wire DIN_in;

  wire CLK_delay;
  wire DIN_delay;

  assign #(out_delay) DOUT = DOUT_delay;

`ifdef XIL_TIMING
  reg notifier;
`endif

`ifndef XIL_TIMING // inputs with timing checks
  assign #(inclk_delay) CLK_delay = CLK;

  assign #(in_delay) DIN_delay = DIN;
`endif

  assign DOUT_delay = DOUT_out;

  assign CLK_in = CLK_delay ^ IS_CLK_INVERTED_BIN;
  assign DIN_in = DIN_delay;

  assign INIT_BIN = INIT_REG;

  assign IS_CLK_INVERTED_BIN = IS_CLK_INVERTED_REG;

  assign LATENCY_BIN =
    (LATENCY_REG == 2) ? LATENCY_2 :
    (LATENCY_REG == 3) ? LATENCY_3 :
     LATENCY_2;

  initial begin
    #1;
    trig_attr = ~trig_attr;
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((INIT_REG !== 1'b0) && (INIT_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-101] INIT attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, INIT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLK_INVERTED_REG !== 1'b0) && (IS_CLK_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-102] IS_CLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLK_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((LATENCY_REG != 2) &&
         (LATENCY_REG != 3))) begin
      $display("Error: [Unisim %s-103] LATENCY attribute is set to %d.  Legal values for this attribute are 2 or 3. Instance: %m", MODULE_NAME, LATENCY_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

reg [2:0] DIN_reg;

assign DOUT_out = (LATENCY_BIN == LATENCY_3) && DIN_reg[2] || (LATENCY_BIN == LATENCY_2) && DIN_reg[1];

always @ (posedge CLK_in or posedge glblGSR) begin
   if (glblGSR == 1'b1) begin
      DIN_reg <= {INIT_BIN, INIT_BIN, INIT_BIN};
      end
   else begin
      DIN_reg <= {DIN_reg[1:0], DIN_in};
      end
   end

  specify
    (CLK => DOUT) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $setuphold (negedge CLK, negedge DIN, 0:0:0, 0:0:0, notifier,,, CLK_delay, DIN_delay);
    $setuphold (negedge CLK, posedge DIN, 0:0:0, 0:0:0, notifier,,, CLK_delay, DIN_delay);
    $setuphold (posedge CLK, negedge DIN, 0:0:0, 0:0:0, notifier,,, CLK_delay, DIN_delay);
    $setuphold (posedge CLK, posedge DIN, 0:0:0, 0:0:0, notifier,,, CLK_delay, DIN_delay);
`endif
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
