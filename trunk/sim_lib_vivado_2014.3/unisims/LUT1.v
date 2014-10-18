// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/versclibs/data/simprims/LUT1.v,v 1.5 2005/03/14 21:05:15 yanx Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.i (O.60)
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  1-input Look-Up-Table with General Output
// /___/   /\     Filename : LUT1.v
// \   \  /  \    Timestamp : Thu Mar 25 16:43:56 PST 2004
//  \___\/\___\
//
// Revision:
//    05/12/11 - Initial version.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision

`timescale 1 ps/1 ps

`celldefine

module LUT1 (O, I0);

  parameter INIT = 2'h0;

`ifdef XIL_TIMING

  parameter LOC = "UNPLACED";

`endif

  output O;
  input I0;

  wire out, a0;

  buf b0 (a0, I0);

  x_lut1_mux2 (O, INIT[1], INIT[0], a0);

  specify

	(I0 => O) = (0:0:0, 0:0:0);
	specparam PATHPULSE$ = 0;

  endspecify

endmodule

`endcelldefine

primitive x_lut1_mux2 (o, d1, d0, s0);

  output o;
  input  d1, d0;
  input  s0;

  table

    //         d1  d0      s0 : o;

               ?   1       0  : 1;
               ?   0       0  : 0;
               1   ?       1  : 1;
               0   ?       1  : 0;

               0   0       x  : 0;
               1   1       x  : 1;

  endtable

endprimitive
