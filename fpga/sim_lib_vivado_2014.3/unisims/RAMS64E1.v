///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.3
//  \   \          Description : Xilinx Timing Simulation Library Component
//  /   /                   Static Single Port Synchronous RAM 64-Deep by 1-Wide
// /___/   /\      Filename    : RAMS64E1.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
// Revision:
//    04/16/13 - Initial from RAMS64E
// End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module RAMS64E1 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [63:0] INIT = 64'h0000000000000000,
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter [2:0] RAM_ADDRESS_MASK = 3'b000,
  parameter [2:0] RAM_ADDRESS_SPACE = 3'b000
)(
  output O,

  input ADR0,
  input ADR1,
  input ADR2,
  input ADR3,
  input ADR4,
  input ADR5,
  input CLK,
  input I,
  input WADR6,
  input WADR7,
  input WADR8,
  input WE
);
  
// define constants
  localparam MODULE_NAME = "RAMS64E1";

  reg trig_attr = 1'b0;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;

  wire [5:0] ADR_in;
  wire CLK_in;
  wire I_in;
  wire [2:0] WADR_in;
  wire WE_in;

  wire [5:0] ADR_delay;
  wire CLK_delay;
  wire I_delay;
  wire [2:0] WADR_delay;
  wire WE_delay;

`ifdef XIL_TIMING
  reg notifier;
`endif

`ifndef XIL_TIMING // inputs with timing checks
  assign CLK_delay = CLK;

  assign ADR_delay = {ADR5, ADR4, ADR3, ADR2, ADR1, ADR0};
  assign I_delay = I;
  assign WADR_delay = {WADR8, WADR7, WADR6};
  assign WE_delay = WE;
`endif

  assign ADR_in = ADR_delay;
  assign CLK_in = CLK_delay ^ IS_CLK_INVERTED;
  assign I_in = I_delay;
  assign WADR_in = WADR_delay;
  assign WE_in = (WE === 1'bz) || WE_delay; // rv 1

  reg [63:0] mem;

`ifndef XIL_TIMING
  initial begin
    $display("Error: [Unisim %s-105] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
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
        ((INIT < 64'h0000000000000000) || (INIT > 64'hFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-101] INIT attribute is set to %h.  Legal values for this attribute are 64'h0000000000000000 to 64'hFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLK_INVERTED !== 1'b0) && (IS_CLK_INVERTED !== 1'b1))) begin
      $display("Error: [Unisim %s-102] IS_CLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLK_INVERTED);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RAM_ADDRESS_MASK < 3'b000) || (RAM_ADDRESS_MASK > 3'b111))) begin
      $display("Error: [Unisim %s-105] RAM_ADDRESS_MASK attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, RAM_ADDRESS_MASK);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((RAM_ADDRESS_SPACE < 3'b000) || (RAM_ADDRESS_SPACE > 3'b111))) begin
      $display("Error: [Unisim %s-106] RAM_ADDRESS_SPACE attribute is set to %b.  Legal values for this attribute are 3'b000 to 3'b111. Instance: %m", MODULE_NAME, RAM_ADDRESS_SPACE);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

  initial begin
    mem = INIT;
  end

  always @(posedge CLK_in)
    if (WE_in == 1'b1 &&
        (RAM_ADDRESS_MASK[2] || WADR_in[2] == RAM_ADDRESS_SPACE[2]) &&
        (RAM_ADDRESS_MASK[1] || WADR_in[1] == RAM_ADDRESS_SPACE[1]) &&
        (RAM_ADDRESS_MASK[0] || WADR_in[0] == RAM_ADDRESS_SPACE[0]) )
      mem[ADR_in] <= #100 I_in;

   assign O = mem[ADR_in];


`ifdef XIL_TIMING
  always @(notifier)
    mem[ADR_in] <= 1'bx;
`endif



  specify
    (ADR0 => O) = (0:0:0, 0:0:0);
    (ADR1 => O) = (0:0:0, 0:0:0);
    (ADR2 => O) = (0:0:0, 0:0:0);
    (ADR3 => O) = (0:0:0, 0:0:0);
    (ADR4 => O) = (0:0:0, 0:0:0);
    (ADR5 => O) = (0:0:0, 0:0:0);
    (CLK => O) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge CLK &&& WE, 0:0:0, notifier);
    $period (posedge CLK &&& WE, 0:0:0, notifier);
    $setuphold (negedge CLK, negedge ADR0 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[0]);
    $setuphold (negedge CLK, negedge ADR1 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[1]);
    $setuphold (negedge CLK, negedge ADR2 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[2]);
    $setuphold (negedge CLK, negedge ADR3 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[3]);
    $setuphold (negedge CLK, negedge ADR4 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[4]);
    $setuphold (negedge CLK, negedge ADR5 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[5]);
    $setuphold (negedge CLK, negedge I &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, I_delay);
    $setuphold (negedge CLK, negedge WADR6 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[0]);
    $setuphold (negedge CLK, negedge WADR7 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[1]);
    $setuphold (negedge CLK, negedge WADR8 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[2]);
    $setuphold (negedge CLK, negedge WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WE_delay);
    $setuphold (negedge CLK, posedge ADR0 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[0]);
    $setuphold (negedge CLK, posedge ADR1 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[1]);
    $setuphold (negedge CLK, posedge ADR2 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[2]);
    $setuphold (negedge CLK, posedge ADR3 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[3]);
    $setuphold (negedge CLK, posedge ADR4 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[4]);
    $setuphold (negedge CLK, posedge ADR5 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[5]);
    $setuphold (negedge CLK, posedge I &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, I_delay);
    $setuphold (negedge CLK, posedge WADR6 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[0]);
    $setuphold (negedge CLK, posedge WADR7 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[1]);
    $setuphold (negedge CLK, posedge WADR8 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[2]);
    $setuphold (negedge CLK, posedge WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WE_delay);
    $setuphold (posedge CLK, negedge ADR0 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[0]);
    $setuphold (posedge CLK, negedge ADR1 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[1]);
    $setuphold (posedge CLK, negedge ADR2 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[2]);
    $setuphold (posedge CLK, negedge ADR3 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[3]);
    $setuphold (posedge CLK, negedge ADR4 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[4]);
    $setuphold (posedge CLK, negedge ADR5 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[5]);
    $setuphold (posedge CLK, negedge I &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, I_delay);
    $setuphold (posedge CLK, negedge WADR6 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[0]);
    $setuphold (posedge CLK, negedge WADR7 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[1]);
    $setuphold (posedge CLK, negedge WADR8 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[2]);
    $setuphold (posedge CLK, negedge WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WE_delay);
    $setuphold (posedge CLK, posedge ADR0 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[0]);
    $setuphold (posedge CLK, posedge ADR1 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[1]);
    $setuphold (posedge CLK, posedge ADR2 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[2]);
    $setuphold (posedge CLK, posedge ADR3 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[3]);
    $setuphold (posedge CLK, posedge ADR4 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[4]);
    $setuphold (posedge CLK, posedge ADR5 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, ADR_delay[5]);
    $setuphold (posedge CLK, posedge I &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, I_delay);
    $setuphold (posedge CLK, posedge WADR6 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[0]);
    $setuphold (posedge CLK, posedge WADR7 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[1]);
    $setuphold (posedge CLK, posedge WADR8 &&& WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WADR_delay[2]);
    $setuphold (posedge CLK, posedge WE, 0:0:0, 0:0:0, notifier,,, CLK_delay, WE_delay);
    $width (negedge CLK, 0:0:0, 0, notifier);
    $width (posedge CLK, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
