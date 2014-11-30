///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 11.1i (L.12)
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  Static Single Port Synchronous RAM 64-Deep by 1-Wide
// /___/   /\     Filename : RAMS64E.v
// \   \  /  \    Timestamp : Thu Mar 25 16:44:03 PST 2004
//  \___\/\___\
//
// Revision:
//    07/02/10 - Initial version.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    03/21/12 - CR649330 - Add RAM_ADDRESS_MASK to allow floating WADR6/7
//    04/16/13 - PR683925 - add invertible pin support.
// End Revision

`timescale 1 ps/1 ps

`celldefine
module RAMS64E #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",
  `endif
  parameter [63:0] INIT = 64'h0000000000000000,
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter [1:0] RAM_ADDRESS_MASK = 2'b00,
  parameter [1:0] RAM_ADDRESS_SPACE = 2'b00
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
  input WE
);

  reg [63:0] mem;
  wire [5:0] ADR_dly, ADR_in;
  wire CLK_dly, I_dly; 
  wire CLK_in, I_in; 
  wire [1:0] WADR_dly, WADR_in;
  wire WE_dly, WE_in;

  localparam MODULE_NAME = "RAMS64E";

  initial begin 
    mem = INIT;
    `ifndef XIL_TIMING
    $display("ERROR: SIMPRIM primitive %s instance %m is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the SIMPRIM library.", MODULE_NAME);
    $finish;
    `endif
  end

  always @(posedge CLK_in) 
    if (WE_in == 1'b1 &&
        (RAM_ADDRESS_MASK[1] || WADR_in[1] == RAM_ADDRESS_SPACE[1]) &&
        (RAM_ADDRESS_MASK[0] || WADR_in[0] == RAM_ADDRESS_SPACE[0]) )
      mem[ADR_in] <= #100 I_in;

   assign O = mem[ADR_in];

    
`ifdef XIL_TIMING
  reg notifier;

  always @(notifier) 
    mem[ADR_in] <= 1'bx;

`endif
    
   
`ifndef XIL_TIMING
    assign I_dly = I;
    assign CLK_dly = CLK;
    assign ADR_dly = {ADR5, ADR4, ADR3, ADR2, ADR1, ADR0};
    assign WADR_dly = {WADR7, WADR6};
    assign WE_dly = WE;
`endif

    assign CLK_in = IS_CLK_INVERTED ^ CLK_dly;
    assign WE_in = WE_dly;
    assign I_in = I_dly;
    assign ADR_in = ADR_dly;
    assign WADR_in = WADR_dly;
    
      
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
    $setuphold (negedge CLK, negedge ADR0 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[0]);
    $setuphold (negedge CLK, negedge ADR1 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[1]);
    $setuphold (negedge CLK, negedge ADR2 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[2]);
    $setuphold (negedge CLK, negedge ADR3 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[3]);
    $setuphold (negedge CLK, negedge ADR4 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[4]);
    $setuphold (negedge CLK, negedge ADR5 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[5]);
    $setuphold (negedge CLK, negedge I &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,I_dly);
    $setuphold (negedge CLK, negedge WADR6 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[0]);
    $setuphold (negedge CLK, negedge WADR7 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[1]);
    $setuphold (negedge CLK, negedge WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WE_dly);
    $setuphold (negedge CLK, posedge ADR0 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[0]);
    $setuphold (negedge CLK, posedge ADR1 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[1]);
    $setuphold (negedge CLK, posedge ADR2 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[2]);
    $setuphold (negedge CLK, posedge ADR3 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[3]);
    $setuphold (negedge CLK, posedge ADR4 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[4]);
    $setuphold (negedge CLK, posedge ADR5 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[5]);
    $setuphold (negedge CLK, posedge I &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,I_dly);
    $setuphold (negedge CLK, posedge WADR6 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[0]);
    $setuphold (negedge CLK, posedge WADR7 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[1]);
    $setuphold (negedge CLK, posedge WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WE_dly);
    $setuphold (posedge CLK, negedge ADR0 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[0]);
    $setuphold (posedge CLK, negedge ADR1 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[1]);
    $setuphold (posedge CLK, negedge ADR2 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[2]);
    $setuphold (posedge CLK, negedge ADR3 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[3]);
    $setuphold (posedge CLK, negedge ADR4 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[4]);
    $setuphold (posedge CLK, negedge ADR5 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[5]);
    $setuphold (posedge CLK, negedge I &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,I_dly);
    $setuphold (posedge CLK, negedge WADR6 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[0]);
    $setuphold (posedge CLK, negedge WADR7 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[1]);
    $setuphold (posedge CLK, negedge WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WE_dly);
    $setuphold (posedge CLK, posedge ADR0 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[0]);
    $setuphold (posedge CLK, posedge ADR1 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[1]);
    $setuphold (posedge CLK, posedge ADR2 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[2]);
    $setuphold (posedge CLK, posedge ADR3 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[3]);
    $setuphold (posedge CLK, posedge ADR4 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[4]);
    $setuphold (posedge CLK, posedge ADR5 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,ADR_dly[5]);
    $setuphold (posedge CLK, posedge I &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,I_dly);
    $setuphold (posedge CLK, posedge WADR6 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[0]);
    $setuphold (posedge CLK, posedge WADR7 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[1]);
    $setuphold (posedge CLK, posedge WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WE_dly);
    $width (negedge CLK, 0:0:0, 0, notifier);
    $width (posedge CLK, 0:0:0, 0, notifier);
`endif
   specparam PATHPULSE$ = 0;
  endspecify
endmodule

`endcelldefine
