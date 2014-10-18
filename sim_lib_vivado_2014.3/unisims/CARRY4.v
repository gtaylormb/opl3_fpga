// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1i (K.17)
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                  Fast Carry Logic with Look Ahead 
// /___/   /\     Filename : CARRY4.v
// \   \  /  \    
//  \___\/\___\
//
// Revision:
//    04/11/05 - Initial version.
//    05/06/05 - Unused CYINT or CI pin need grounded instead of open (CR207752)
//    05/31/05 - Change pin order, remove connection check for CYINIT and CI.
//    12/21/05 - Add timing path.
//    04/13/06 - Add full timing path for DI to O (CR228786)
//    06/04/07 - Add wire definition.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    04/13/12 - CR655410 - add pulldown, CI, CYINIT, sync uni/sim/unp
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module CARRY4 (CO, O, CI, CYINIT, DI, S);

`ifdef XIL_TIMING

    parameter LOC = "UNPLACED";

`endif

    output [3:0] CO;
    output [3:0] O;
    input        CI;
    input        CYINIT;
    input  [3:0] DI;
    input  [3:0] S;

    wire [3:0] di_in, s_in, o_out, co_out;
    wire ci_or_cyinit;
    wire ci_in, cyinit_in;

    pulldown P1 (CI);
    pulldown P2 (CYINIT);

    assign ci_in = CI;
    assign cyinit_in = CYINIT;
    assign di_in = DI;
    assign s_in = S;
    assign O = o_out;
    assign CO = co_out;

    assign o_out = s_in ^ {co_out[2:0], ci_or_cyinit};
    assign co_out[0] = s_in[0] ? ci_or_cyinit : di_in[0];
    assign co_out[1] = s_in[1] ? co_out[0] : di_in[1];
    assign co_out[2] = s_in[2] ? co_out[1] : di_in[2];
    assign co_out[3] = s_in[3] ? co_out[2] : di_in[3];
    assign  ci_or_cyinit = ci_in | cyinit_in;


`ifdef XIL_TIMING
  specify
    (CI => CO[0]) = (0:0:0, 0:0:0);
    (CI => CO[1]) = (0:0:0, 0:0:0);
    (CI => CO[2]) = (0:0:0, 0:0:0);
    (CI => CO[3]) = (0:0:0, 0:0:0);
    (CI => O[0]) = (0:0:0, 0:0:0);
    (CI => O[1]) = (0:0:0, 0:0:0);
    (CI => O[2]) = (0:0:0, 0:0:0);
    (CI => O[3]) = (0:0:0, 0:0:0);
    (CYINIT => CO[0]) = (0:0:0, 0:0:0);
    (CYINIT => CO[1]) = (0:0:0, 0:0:0);
    (CYINIT => CO[2]) = (0:0:0, 0:0:0);
    (CYINIT => CO[3]) = (0:0:0, 0:0:0);
    (CYINIT => O[0]) = (0:0:0, 0:0:0);
    (CYINIT => O[1]) = (0:0:0, 0:0:0);
    (CYINIT => O[2]) = (0:0:0, 0:0:0);
    (CYINIT => O[3]) = (0:0:0, 0:0:0);
    (DI[0] => CO[0]) = (0:0:0, 0:0:0);
    (DI[0] => CO[1]) = (0:0:0, 0:0:0);
    (DI[0] => CO[2]) = (0:0:0, 0:0:0);
    (DI[0] => CO[3]) = (0:0:0, 0:0:0);
    (DI[0] => O[0]) = (0:0:0, 0:0:0);
    (DI[0] => O[1]) = (0:0:0, 0:0:0);
    (DI[0] => O[2]) = (0:0:0, 0:0:0);
    (DI[0] => O[3]) = (0:0:0, 0:0:0);
    (DI[1] => CO[0]) = (0:0:0, 0:0:0);
    (DI[1] => CO[1]) = (0:0:0, 0:0:0);
    (DI[1] => CO[2]) = (0:0:0, 0:0:0);
    (DI[1] => CO[3]) = (0:0:0, 0:0:0);
    (DI[1] => O[0]) = (0:0:0, 0:0:0);
    (DI[1] => O[1]) = (0:0:0, 0:0:0);
    (DI[1] => O[2]) = (0:0:0, 0:0:0);
    (DI[1] => O[3]) = (0:0:0, 0:0:0);
    (DI[2] => CO[0]) = (0:0:0, 0:0:0);
    (DI[2] => CO[1]) = (0:0:0, 0:0:0);
    (DI[2] => CO[2]) = (0:0:0, 0:0:0);
    (DI[2] => CO[3]) = (0:0:0, 0:0:0);
    (DI[2] => O[0]) = (0:0:0, 0:0:0);
    (DI[2] => O[1]) = (0:0:0, 0:0:0);
    (DI[2] => O[2]) = (0:0:0, 0:0:0);
    (DI[2] => O[3]) = (0:0:0, 0:0:0);
    (DI[3] => CO[0]) = (0:0:0, 0:0:0);
    (DI[3] => CO[1]) = (0:0:0, 0:0:0);
    (DI[3] => CO[2]) = (0:0:0, 0:0:0);
    (DI[3] => CO[3]) = (0:0:0, 0:0:0);
    (DI[3] => O[0]) = (0:0:0, 0:0:0);
    (DI[3] => O[1]) = (0:0:0, 0:0:0);
    (DI[3] => O[2]) = (0:0:0, 0:0:0);
    (DI[3] => O[3]) = (0:0:0, 0:0:0);
    (S[0] => CO[0]) = (0:0:0, 0:0:0);
    (S[0] => CO[1]) = (0:0:0, 0:0:0);
    (S[0] => CO[2]) = (0:0:0, 0:0:0);
    (S[0] => CO[3]) = (0:0:0, 0:0:0);
    (S[0] => O[0]) = (0:0:0, 0:0:0);
    (S[0] => O[1]) = (0:0:0, 0:0:0);
    (S[0] => O[2]) = (0:0:0, 0:0:0);
    (S[0] => O[3]) = (0:0:0, 0:0:0);
    (S[1] => CO[0]) = (0:0:0, 0:0:0);
    (S[1] => CO[1]) = (0:0:0, 0:0:0);
    (S[1] => CO[2]) = (0:0:0, 0:0:0);
    (S[1] => CO[3]) = (0:0:0, 0:0:0);
    (S[1] => O[0]) = (0:0:0, 0:0:0);
    (S[1] => O[1]) = (0:0:0, 0:0:0);
    (S[1] => O[2]) = (0:0:0, 0:0:0);
    (S[1] => O[3]) = (0:0:0, 0:0:0);
    (S[2] => CO[0]) = (0:0:0, 0:0:0);
    (S[2] => CO[1]) = (0:0:0, 0:0:0);
    (S[2] => CO[2]) = (0:0:0, 0:0:0);
    (S[2] => CO[3]) = (0:0:0, 0:0:0);
    (S[2] => O[0]) = (0:0:0, 0:0:0);
    (S[2] => O[1]) = (0:0:0, 0:0:0);
    (S[2] => O[2]) = (0:0:0, 0:0:0);
    (S[2] => O[3]) = (0:0:0, 0:0:0);
    (S[3] => CO[0]) = (0:0:0, 0:0:0);
    (S[3] => CO[1]) = (0:0:0, 0:0:0);
    (S[3] => CO[2]) = (0:0:0, 0:0:0);
    (S[3] => CO[3]) = (0:0:0, 0:0:0);
    (S[3] => O[0]) = (0:0:0, 0:0:0);
    (S[3] => O[1]) = (0:0:0, 0:0:0);
    (S[3] => O[2]) = (0:0:0, 0:0:0);
    (S[3] => O[3]) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif

endmodule

`endcelldefine
