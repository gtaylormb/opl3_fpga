///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  5-input Dynamically Reconfigurable Look-Up-Table with Carry and Clock Enable
// /___/   /\     Filename : CFGLUT5.v
// \   \  /  \    Timestamp : Thu Mar 25 16:43:40 PST 2004
//  \___\/\___\
//
// Revision:
//    12/27/05 - Initial version.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    05/13/13 - add IS_CLK_INVERTED
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module CFGLUT5 #(
  `ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
  `endif
  parameter [31:0] INIT = 32'h00000000,
  parameter [0:0]  IS_CLK_INVERTED = 1'b0
)(
  output CDO,
  output O5,
  output O6,

  input  CDI,
  input  CE,
  input  CLK,
  input  I0,
  input  I1,
  input  I2,
  input  I3,
  input  I4
);

  reg  [31:0] data;
  wire [4:0] addr;
  wire CDI_dly, CE_dly, CLK_dly;
  wire CDI_in, CE_in, CLK_in;
  wire clk_is_inverted;
  reg notifier;
  reg first_time = 1'b1;

  initial
  begin
    assign  data = INIT;
    first_time <= #100000 1'b0;
    while ((CLK_in !== 1'b0) && (first_time == 1'b1)) #1000;
    deassign data;
  end

  assign addr = {I4, I3, I2, I1, I0};

 always @(posedge CLK_in)
   if (CE_in == 1'b1)
      data <= #100 {data[30:0], CDI_in};

 assign  O6 = data[addr[4:0]];
 assign  O5 = data[addr[3:0]];
 assign  CDO = data[31];
 
`ifndef XIL_TIMING
  assign CDI_dly = CDI;
  assign CLK_dly = CLK;
  assign CE_dly = CE;
`endif
  assign clk_is_inverted = IS_CLK_INVERTED;

  assign CLK_in = clk_is_inverted ^ CLK_dly;
  assign CDI_in = CDI_dly;
  assign CE_in = CE_dly;

  specify
  (CLK => CDO) = (0:0:0, 0:0:0);
  (CLK => O5) = (0:0:0, 0:0:0);
  (CLK => O6) = (0:0:0, 0:0:0);
  (I0 => CDO) = (0:0:0, 0:0:0);
  (I0 => O5) = (0:0:0, 0:0:0);
  (I0 => O6) = (0:0:0, 0:0:0);
  (I1 => CDO) = (0:0:0, 0:0:0);
  (I1 => O5) = (0:0:0, 0:0:0);
  (I1 => O6) = (0:0:0, 0:0:0);
  (I2 => CDO) = (0:0:0, 0:0:0);
  (I2 => O5) = (0:0:0, 0:0:0);
  (I2 => O6) = (0:0:0, 0:0:0);
  (I3 => CDO) = (0:0:0, 0:0:0);
  (I3 => O5) = (0:0:0, 0:0:0);
  (I3 => O6) = (0:0:0, 0:0:0);
  (I4 => CDO) = (0:0:0, 0:0:0);
  (I4 => O5) = (0:0:0, 0:0:0);
  (I4 => O6) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
   $period (negedge CLK, 0:0:0, notifier);
   $period (posedge CLK, 0:0:0, notifier);
   $setuphold (negedge CLK, negedge CDI, 0:0:0, 0:0:0, notifier,,,CLK_dly,CDI_dly);
   $setuphold (negedge CLK, negedge CE, 0:0:0, 0:0:0, notifier,,,CLK_dly,CE_dly);
   $setuphold (negedge CLK, posedge CDI, 0:0:0, 0:0:0, notifier,,,CLK_dly,CDI_dly);
   $setuphold (negedge CLK, posedge CE, 0:0:0, 0:0:0, notifier,,,CLK_dly,CE_dly);
   $setuphold (posedge CLK, negedge CDI, 0:0:0, 0:0:0, notifier,,,CLK_dly,CDI_dly);
   $setuphold (posedge CLK, negedge CE, 0:0:0, 0:0:0, notifier,,,CLK_dly,CE_dly);
   $setuphold (posedge CLK, posedge CDI, 0:0:0, 0:0:0, notifier,,,CLK_dly,CDI_dly);
   $setuphold (posedge CLK, posedge CE, 0:0:0, 0:0:0, notifier,,,CLK_dly,CE_dly);
   $width (negedge CLK, 0:0:0, 0, notifier);
   $width (posedge CLK, 0:0:0, 0, notifier);
`endif
   specparam PATHPULSE$ = 0;
  endspecify
    
endmodule

`endcelldefine
