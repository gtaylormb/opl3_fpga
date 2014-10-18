// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/versclibs/data/simprims/LUT3.v,v 1.5 2005/03/14 21:05:15 yanx Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.1i (I.13)
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  3-input Look-Up-Table with General Output
// /___/   /\     Filename : LUT3.v
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

module LUT3 (O, I0, I1, I2);

  parameter INIT = 8'h00;

`ifdef XIL_TIMING

  parameter LOC = "UNPLACED";

`endif

  output O;
  input I0, I1, I2;

  wire out0, out1, a0, a1, a2;

  buf b0 (a0, I0);
  buf b1 (a1, I1);
  buf b2 (a2, I2);

  x_lut3_mux4 (out1, INIT[7], INIT[6], INIT[5], INIT[4], a1, a0);
  x_lut3_mux4 (out0, INIT[3], INIT[2], INIT[1], INIT[0], a1, a0);
  x_lut3_mux4 (O, 1'b0, 1'b0, out1, out0, 1'b0, a2);

  specify

	(I0 => O) = (0:0:0, 0:0:0);
	(I1 => O) = (0:0:0, 0:0:0);
	(I2 => O) = (0:0:0, 0:0:0);
	specparam PATHPULSE$ = 0;

  endspecify

endmodule

`endcelldefine

primitive x_lut3_mux4 (o, d3, d2, d1, d0, s1, s0);

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
