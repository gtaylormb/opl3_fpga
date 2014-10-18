///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 2014.3
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                  Static Dual Port Synchronous RAM 256-Deep by 1-Wide
// /___/   /\     Filename : RAM256X1D.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    07/02/12 - Initial version, from RAM128X1D
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module RAM256X1D #(
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED",
`endif
    parameter [255:0] INIT = 256'h0,
    parameter [0:0] IS_WCLK_INVERTED = 1'b0
) (
    output DPO,
    output SPO,

    input [7:0] A,
    input D,
    input [7:0] DPRA,
    input WCLK,
    input WE
);

// define constants
  localparam MODULE_NAME = "RAM256X1D";

  reg trig_attr = 1'b0;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;

  wire D_in;
  wire WCLK_in;
  wire WE_in;
  wire [7:0] A_in;

  wire D_dly;
  wire WCLK_dly;
  wire WE_dly;
  wire [7:0] A_dly;
    
`ifdef XIL_TIMING
  reg notifier;
`endif

`ifndef XIL_TIMING
  assign A_dly = A;
  assign D_dly = D;
  assign WCLK_dly = WCLK;
  assign WE_dly = WE;
`endif

  assign A_in = A_dly;
  assign D_in = D_dly;
  assign WCLK_in = WCLK_dly ^ IS_WCLK_INVERTED;
  assign WE_in = (WE === 1'bz) || WE_dly; // rv 1
    
  initial begin
    #1;
    trig_attr = ~trig_attr;
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((INIT < 256'h0000000000000000000000000000000000000000000000000000000000000000) || (INIT > 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-101] INIT attribute is set to %h.  Legal values for this attribute are 256'h0000000000000000000000000000000000000000000000000000000000000000 to 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_WCLK_INVERTED !== 1'b0) && (IS_WCLK_INVERTED !== 1'b1))) begin
      $display("Error: [Unisim %s-102] IS_WCLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_WCLK_INVERTED);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end


  reg  [255:0] mem;

  initial 
    mem = INIT;

  assign DPO = mem[DPRA];
  assign SPO = mem[A_in];

  always @(posedge WCLK_in) 
    if (WE_in == 1'b1) mem[A_in] <= #100 D_in;
    
`ifdef XIL_TIMING
  always @(notifier) mem[A_in] <= 1'bx;
`endif
    
`ifdef XIL_TIMING
  specify
  (WCLK => DPO) = (0:0:0, 0:0:0);
  (WCLK => SPO) = (0:0:0, 0:0:0);
  (A[0] => SPO) = (0:0:0, 0:0:0);
  (A[1] => SPO) = (0:0:0, 0:0:0);
  (A[2] => SPO) = (0:0:0, 0:0:0);
  (A[3] => SPO) = (0:0:0, 0:0:0);
  (A[4] => SPO) = (0:0:0, 0:0:0);
  (A[5] => SPO) = (0:0:0, 0:0:0);
  (A[6] => SPO) = (0:0:0, 0:0:0);
  (A[7] => SPO) = (0:0:0, 0:0:0);
  (DPRA[0] => DPO) = (0:0:0, 0:0:0);
  (DPRA[1] => DPO) = (0:0:0, 0:0:0);
  (DPRA[2] => DPO) = (0:0:0, 0:0:0);
  (DPRA[3] => DPO) = (0:0:0, 0:0:0);
  (DPRA[4] => DPO) = (0:0:0, 0:0:0);
  (DPRA[5] => DPO) = (0:0:0, 0:0:0);
  (DPRA[6] => DPO) = (0:0:0, 0:0:0);
  (DPRA[7] => DPO) = (0:0:0, 0:0:0);
  $period (negedge WCLK &&& WE, 0:0:0, notifier);
  $period (posedge WCLK &&& WE, 0:0:0, notifier);
  $setuphold (negedge WCLK, negedge A[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[0]);
  $setuphold (negedge WCLK, negedge A[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[1]);
  $setuphold (negedge WCLK, negedge A[2] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[2]);
  $setuphold (negedge WCLK, negedge A[3] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[3]);
  $setuphold (negedge WCLK, negedge A[4] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[4]);
  $setuphold (negedge WCLK, negedge A[5] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[5]);
  $setuphold (negedge WCLK, negedge A[6] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[6]);
  $setuphold (negedge WCLK, negedge A[7] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[7]);
  $setuphold (negedge WCLK, negedge D &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,D_dly);
  $setuphold (negedge WCLK, negedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
  $setuphold (negedge WCLK, posedge A[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[0]);
  $setuphold (negedge WCLK, posedge A[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[1]);
  $setuphold (negedge WCLK, posedge A[2] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[2]);
  $setuphold (negedge WCLK, posedge A[3] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[3]);
  $setuphold (negedge WCLK, posedge A[4] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[4]);
  $setuphold (negedge WCLK, posedge A[5] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[5]);
  $setuphold (negedge WCLK, posedge A[6] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[6]);
  $setuphold (negedge WCLK, posedge A[7] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[7]);
  $setuphold (negedge WCLK, posedge D &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,D_dly);
  $setuphold (negedge WCLK, posedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
  $setuphold (posedge WCLK, negedge A[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[0]);
  $setuphold (posedge WCLK, negedge A[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[1]);
  $setuphold (posedge WCLK, negedge A[2] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[2]);
  $setuphold (posedge WCLK, negedge A[3] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[3]);
  $setuphold (posedge WCLK, negedge A[4] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[4]);
  $setuphold (posedge WCLK, negedge A[5] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[5]);
  $setuphold (posedge WCLK, negedge A[6] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[6]);
  $setuphold (posedge WCLK, negedge A[7] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[7]);
  $setuphold (posedge WCLK, negedge D &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,D_dly);
  $setuphold (posedge WCLK, negedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
  $setuphold (posedge WCLK, posedge A[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[0]);
  $setuphold (posedge WCLK, posedge A[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[1]);
  $setuphold (posedge WCLK, posedge A[2] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[2]);
  $setuphold (posedge WCLK, posedge A[3] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[3]);
  $setuphold (posedge WCLK, posedge A[4] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[4]);
  $setuphold (posedge WCLK, posedge A[5] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[5]);
  $setuphold (posedge WCLK, posedge A[6] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[6]);
  $setuphold (posedge WCLK, posedge A[7] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[7]);
  $setuphold (posedge WCLK, posedge D &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,D_dly);
  $setuphold (posedge WCLK, posedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
   specparam PATHPULSE$ = 0;
  endspecify
`endif
    
endmodule

`endcelldefine
