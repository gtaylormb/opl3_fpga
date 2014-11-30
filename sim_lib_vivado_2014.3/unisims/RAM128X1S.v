///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                  Static Synchronous RAM 128-Deep by 1-Wide
// /___/   /\     Filename : RAM128X1S.v
// \   \  /  \    Timestamp : Thu Mar 25 16:43:32 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    02/04/05 - Rev 0.0.1 Remove input/output bufs; Remove for-loop in initial block;
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    04/18/13 - PR683925 - add invertible pin support.
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module RAM128X1S #(
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED",
`endif
    parameter [127:0] INIT = 128'h00000000000000000000000000000000,
    parameter [0:0] IS_WCLK_INVERTED = 1'b0
)(
    output O,
    input  A0,
    input  A1,
    input  A2,
    input  A3,
    input  A4,
    input  A5,
    input  A6,
    input  D,
    input  WCLK,
    input  WE
);

    reg  [127:0] mem;
    wire [6:0] A_dly, A_in;

    reg notifier;
    wire D_dly, WCLK_dly, WE_dly;
    wire D_in, WCLK_in, WE_in;
    
    assign O = mem[A_in];

    initial 
        mem = INIT;

    always @(posedge WCLK_in) 
        if (WE_in == 1'b1)
            mem[A_in] <= #100 D_in;
    
    always @(notifier)
        mem[A_in] <= 1'bx;
    
`ifndef XIL_TIMING
    assign A_dly[0] = A0;
    assign A_dly[1] = A1;
    assign A_dly[2] = A2;
    assign A_dly[3] = A3;
    assign A_dly[4] = A4;
    assign A_dly[5] = A5;
    assign A_dly[6] = A6;
    assign D_dly = D;
    assign WCLK_dly = WCLK;
    assign WE_dly = WE;
`endif

    assign WCLK_in = IS_WCLK_INVERTED ^ WCLK_dly;
    assign WE_in = WE_dly;
    assign A_in = A_dly;
    assign D_in = D_dly;

`ifdef XIL_TIMING
    specify

    (WCLK => O) = (0:0:0, 0:0:0);
    (A0 => O) = (0:0:0, 0:0:0);
    (A1 => O) = (0:0:0, 0:0:0);
    (A2 => O) = (0:0:0, 0:0:0);
    (A3 => O) = (0:0:0, 0:0:0);
    (A4 => O) = (0:0:0, 0:0:0);
    (A5 => O) = (0:0:0, 0:0:0);
    (A6 => O) = (0:0:0, 0:0:0);

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
    $setuphold (posedge WCLK, posedge A5 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[5]);
    $setuphold (posedge WCLK, negedge A5 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[5]);
    $setuphold (posedge WCLK, posedge A6 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[6]);
    $setuphold (posedge WCLK, negedge A6 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[6]);
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
    $setuphold (negedge WCLK, posedge A5 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[5]);
    $setuphold (negedge WCLK, negedge A5 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[5]);
    $setuphold (negedge WCLK, posedge A6 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[6]);
    $setuphold (negedge WCLK, negedge A6 &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,A_dly[6]);
    $setuphold (negedge WCLK, posedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
    $setuphold (negedge WCLK, negedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
    $period (negedge WCLK &&& WE, 0:0:0, notifier);

    specparam PATHPULSE$ = 0;

  endspecify
`endif
    
endmodule

`endcelldefine

