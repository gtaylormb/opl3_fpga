///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 11.1i (L.12)
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  Static Dual Port Synchronous RAM 32-Deep by 1-Wide
// /___/   /\     Filename : RAMD32.v
// \   \  /  \    Timestamp : Thu Mar 25 16:44:03 PST 2004
//  \___\/\___\
//
// Revision:
//    07/02/10 - Initial version.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    04/16/13 - PR683925 - add invertible pin support.
// End Revision

`timescale 1 ps/1 ps

`celldefine

module RAMD32 #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",
  `endif
  parameter [31:0] INIT = 32'h00000000,
  parameter [0:0] IS_CLK_INVERTED = 1'b0
)(
  output O,

  input CLK,
  input I,
  input RADR0,
  input RADR1,
  input RADR2,
  input RADR3,
  input RADR4,
  input WADR0,
  input WADR1,
  input WADR2,
  input WADR3,
  input WADR4,
  input WE
);

  reg [31:0] mem;
  wire [4:0] WADR_dly, WADR_in;
  wire [4:0] radr;
  wire I_dly, CLK_dly, WE_dly;
  wire I_in, CLK_in, WE_in;


  localparam MODULE_NAME = "RAMD32";

  initial begin
    mem[31:0] = INIT;
    `ifndef XIL_TIMING
    $display("ERROR: SIMPRIM primitive %s instance %m is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the SIMPRIM library.", MODULE_NAME);
    $finish;
    `endif
  end

  assign radr[4:0] = {RADR4, RADR3, RADR2, RADR1, RADR0};

  always @(posedge CLK_in) 
    if (WE_in == 1'b1)
      mem[WADR_in] <= #100 I_in;

  assign O = mem[radr];


`ifdef XIL_TIMING
    reg  notifier;
    
    always @(notifier)
   mem[WADR_in] <= 1'bx;
`endif
    

`ifndef XIL_TIMING
    assign I_dly = I;
    assign CLK_dly = CLK;
    assign WADR_dly = {WADR4, WADR3, WADR2, WADR1, WADR0};
    assign WE_dly = WE;
`endif

    assign CLK_in = IS_CLK_INVERTED ^ CLK_dly;
    assign WE_in = WE_dly;
    assign I_in = I_dly;
    assign WADR_in = WADR_dly;
    
    specify
    (CLK => O) = (0:0:0, 0:0:0);
    (RADR0 => O) = (0:0:0, 0:0:0);
    (RADR1 => O) = (0:0:0, 0:0:0);
    (RADR2 => O) = (0:0:0, 0:0:0);
    (RADR3 => O) = (0:0:0, 0:0:0);
    (RADR4 => O) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge CLK &&& WE, 0:0:0, notifier);
    $period (posedge CLK &&& WE, 0:0:0, notifier);
    $setuphold (negedge CLK, negedge I &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,I_dly);
    $setuphold (negedge CLK, negedge WADR0 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[0]);
    $setuphold (negedge CLK, negedge WADR1 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[1]);
    $setuphold (negedge CLK, negedge WADR2 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[2]);
    $setuphold (negedge CLK, negedge WADR3 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[3]);
    $setuphold (negedge CLK, negedge WADR4 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[4]);
    $setuphold (negedge CLK, negedge WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WE_dly);
    $setuphold (negedge CLK, posedge I &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,I_dly);
    $setuphold (negedge CLK, posedge WADR0 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[0]);
    $setuphold (negedge CLK, posedge WADR1 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[1]);
    $setuphold (negedge CLK, posedge WADR2 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[2]);
    $setuphold (negedge CLK, posedge WADR3 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[3]);
    $setuphold (negedge CLK, posedge WADR4 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[4]);
    $setuphold (negedge CLK, posedge WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WE_dly);
    $setuphold (posedge CLK, negedge I &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,I_dly);
    $setuphold (posedge CLK, negedge WADR0 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[0]);
    $setuphold (posedge CLK, negedge WADR1 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[1]);
    $setuphold (posedge CLK, negedge WADR2 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[2]);
    $setuphold (posedge CLK, negedge WADR3 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[3]);
    $setuphold (posedge CLK, negedge WADR4 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[4]);
    $setuphold (posedge CLK, negedge WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WE_dly);
    $setuphold (posedge CLK, posedge I &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,I_dly);
    $setuphold (posedge CLK, posedge WADR0 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[0]);
    $setuphold (posedge CLK, posedge WADR1 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[1]);
    $setuphold (posedge CLK, posedge WADR2 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[2]);
    $setuphold (posedge CLK, posedge WADR3 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[3]);
    $setuphold (posedge CLK, posedge WADR4 &&& WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WADR_dly[4]);
    $setuphold (posedge CLK, posedge WE, 0:0:0, 0:0:0, notifier,,,CLK_dly,WE_dly);
    $width (negedge CLK, 0:0:0, 0, notifier);
    $width (posedge CLK, 0:0:0, 0, notifier);
`endif
   specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
