// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/versclibs/data/simprims/LUT2.v,v 1.5 2005/03/14 21:05:15 yanx Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.1i (I.13)
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  2-input Look-Up-Table with General Output
// /___/   /\     Filename : LUT2.v
// \   \  /  \    Timestamp : Thu Mar 25 16:43:56 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    03/11/05 - Add LOC paramter;
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision

`timescale 1 ps/1 ps

`celldefine

module LUT2 (O, I0, I1);

  parameter INIT = 4'h0;

`ifdef XIL_TIMING

  parameter LOC = "UNPLACED";

`endif

  output O;
  input I0, I1;

  wire out, a0, a1;

  buf b0 (a0, I0);
  buf b1 (a1, I1);

  x_lut2_mux4 (O, INIT[3], INIT[2], INIT[1], INIT[0], a1, a0);

  specify

	(I0 => O) = (0:0:0, 0:0:0);
	(I1 => O) = (0:0:0, 0:0:0);
	specparam PATHPULSE$ = 0;

  endspecify

endmodule

`endcelldefine

primitive x_lut2_mux4 (o, d3, d2, d1, d0, s1, s0);

  output o;
  input d3, d2, d1, d0;
  input s1, s0;

  table

    // d3  d2  d1  d0  s1  s0 : o;

       ?   ?   ?   1   0   0  : 1;
       ?   ?   ?   0   0   0  : 0;
       ?   ?   1   ?   0   1  : 1;
       ?   ?   0   ?   0   1  : 0;
       ?   1   ?   ?   1   0  : 1;
       ?   0   ?   ?   1   0  : 0;
       1   ?   ?   ?   1   1  : 1;
       0   ?   ?   ?   1   1  : 0;

       ?   ?   0   0   0   x  : 0;
       ?   ?   1   1   0   x  : 1;
       0   0   ?   ?   1   x  : 0;
       1   1   ?   ?   1   x  : 1;

       ?   0   ?   0   x   0  : 0;
       ?   1   ?   1   x   0  : 1;
       0   ?   0   ?   x   1  : 0;
       1   ?   1   ?   x   1  : 1;

       0   0   0   0   x   x  : 0;
       1   1   1   1   x   x  : 1;

  endtable

endprimitive
