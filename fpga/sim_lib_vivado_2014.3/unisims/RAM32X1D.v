///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 11.1i (L.12)
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                  Static Dual Port Synchronous RAM 32-Deep by 1-Wide
// /___/   /\     Filename : RAMD32.v
// \   \  /  \    Timestamp : Thu Mar 25 16:44:03 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    03/11/05 - Add LOC paramter;
//    01/18/08 - Add support for negative setup/hold timing check (CR457308).
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    04/18/13 - PR683925 - add invertible pin support.
// End Revision

`timescale 1 ps/1 ps

`celldefine

module RAM32X1D #(
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED",
`endif
    parameter [31:0] INIT = 32'h00000000,
    parameter [0:0] IS_WCLK_INVERTED = 1'b0
)(
    output DPO,
    output SPO,
    input  A0,
    input  A1,
    input  A2,
    input  A3,
    input  A4,
    input  D, 
    input  DPRA0, 
    input  DPRA1, 
    input  DPRA2, 
    input  DPRA3, 
    input  DPRA4, 
    input  WCLK, 
    input  WE
);
    reg  [32:0] mem;
    wire [4:0] A_dly, A_in;
    wire WCLK_dly, WE_dly, D_dly;
    wire WCLK_in, WE_in, D_in;
    wire wclk_is_inverted;
    reg notifier;
    
    assign SPO = mem[A_in];
    assign DPO = mem[{DPRA4, DPRA3, DPRA2, DPRA1, DPRA0}];

    initial 
        mem = INIT;

    always @(posedge(WCLK_in))
        if (WE_in == 1'b1)
            mem[A_in] <= #100 D_in;

    always @(notifier) 
        mem[A_in] = 1'bx;

`ifndef XIL_TIMING
    assign A_dly = {A4, A3, A2, A1, A0};
    assign D_dly = D;
    assign WCLK_dly = WCLK;
    assign WE_dly = WE;
`endif

    assign wclk_is_inverted = IS_WCLK_INVERTED;
    assign WCLK_in = wclk_is_inverted ^ WCLK_dly;
    assign WE_in = WE_dly;
    assign A_in = A_dly;
    assign D_in = D_dly;
   
`ifdef XIL_TIMING
   specify

   (WCLK => DPO) = (0:0:0, 0:0:0);
   (WCLK => SPO) = (0:0:0, 0:0:0);
   (A0 => SPO) = (0:0:0, 0:0:0);
   (A1 => SPO) = (0:0:0, 0:0:0);
   (A2 => SPO) = (0:0:0, 0:0:0);
   (A3 => SPO) = (0:0:0, 0:0:0);
   (A4 => SPO) = (0:0:0, 0:0:0);
   (DPRA0 => DPO) = (0:0:0, 0:0:0);
   (DPRA1 => DPO) = (0:0:0, 0:0:0);
   (DPRA2 => DPO) = (0:0:0, 0:0:0);
   (DPRA3 => DPO) = (0:0:0, 0:0:0);
   (DPRA4 => DPO) = (0:0:0, 0:0:0);

   $setuphold (posedge WCLK, posedge D &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,D_dly);
   $setuphold (posedge WCLK, negedge D &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,D_dly);
   $setuphold (posedge WCLK, posedge A0 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[0]);
   $setuphold (posedge WCLK, negedge A0 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[0]);
   $setuphold (posedge WCLK, posedge A1 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[1]);
   $setuphold (posedge WCLK, negedge A1 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[1]);
   $setuphold (posedge WCLK, posedge A2 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[2]);
   $setuphold (posedge WCLK, negedge A2 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[2]);
   $setuphold (posedge WCLK, posedge A3 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[3]);
   $setuphold (posedge WCLK, negedge A3 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[3]);
   $setuphold (posedge WCLK, posedge A4 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[4]);
   $setuphold (posedge WCLK, negedge A4 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[4]);
   $setuphold (posedge WCLK, posedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
   $setuphold (posedge WCLK, negedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
   $period (posedge WCLK &&& WE, 0:0:0, notifier);

   $setuphold (negedge WCLK, posedge D &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,D_dly);
   $setuphold (negedge WCLK, negedge D &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,D_dly);
   $setuphold (negedge WCLK, posedge A0 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[0]);
   $setuphold (negedge WCLK, negedge A0 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[0]);
   $setuphold (negedge WCLK, posedge A1 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[1]);
   $setuphold (negedge WCLK, negedge A1 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[1]);
   $setuphold (negedge WCLK, posedge A2 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[2]);
   $setuphold (negedge WCLK, negedge A2 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[2]);
   $setuphold (negedge WCLK, posedge A3 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[3]);
   $setuphold (negedge WCLK, negedge A3 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[3]);
   $setuphold (negedge WCLK, posedge A4 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[4]);
   $setuphold (negedge WCLK, negedge A4 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[4]);
   $setuphold (negedge WCLK, posedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
   $setuphold (negedge WCLK, negedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
   $period (negedge WCLK &&& WE, 0:0:0, notifier);

   specparam PATHPULSE$ = 0;

  endspecify
`endif

endmodule

`endcelldefine
