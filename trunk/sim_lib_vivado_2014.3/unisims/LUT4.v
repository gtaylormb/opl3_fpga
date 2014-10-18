// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/versclibs/data/simprims/LUT4.v,v 1.10 2007/06/05 00:00:54 yanx Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1i (K.17)
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  4-input Look-Up-Table with General Output
// /___/   /\     Filename : LUT4.v
// \   \  /  \    Timestamp : Thu Mar 25 16:43:56 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    02/04/05 - Rev 0.0.1 Replace premitive with function; Remove buf.
//    03/11/05 - Add LOC paramter;
//    06/04/07 - Add wire declaration to internal signal.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision

`timescale 1 ps/1 ps

`celldefine

module LUT4 (O, I0, I1, I2, I3);

  parameter INIT = 16'h0000;

`ifdef XIL_TIMING

  parameter LOC = "UNPLACED";

`endif

  output O;
  input I0, I1, I2, I3;

  wire  a0, a1, a2, a3;
  wire o_out_tmp;
  reg o_out;
  reg tmp;

  buf b0 (a0, I0);
  buf b1 (a1, I1);
  buf b2 (a2, I2);
  buf b3 (a3, I3);

  buf b4 (O, o_out_tmp);

  assign o_out_tmp = o_out;

  always @(  a3 or  a2 or  a1 or  a0 )  begin

      tmp =  a0 ^ a1  ^ a2 ^ a3;

    if ( tmp == 0 || tmp == 1)

      o_out = INIT[{a3, a2, a1, a0}];

    else 

      o_out =  lut4_mux4 ( {lut4_mux4 ( INIT[15:12], {a1, a0}),
                          lut4_mux4 ( INIT[11:8], {a1, a0}),
                          lut4_mux4 ( INIT[7:4], {a1, a0}),
                          lut4_mux4 ( INIT[3:0], {a1, a0}) }, {a3, a2});
  end

  specify

	(I0 => O) = (0:0:0, 0:0:0);
	(I1 => O) = (0:0:0, 0:0:0);
	(I2 => O) = (0:0:0, 0:0:0);
	(I3 => O) = (0:0:0, 0:0:0);
	specparam PATHPULSE$ = 0;

  endspecify


  function lut4_mux4;
  input [3:0] d;
  input [1:0] s;

  begin

       if ((s[1]^s[0] ==1) || (s[1]^s[0] ==0))

           lut4_mux4 = d[s];

         else if ((d[0] ^ d[1]) == 0 && (d[2] ^ d[3]) == 0 && (d[0] ^ d[2]) == 0)
           lut4_mux4 = d[0];
         else if ((s[1] == 0) && (d[0] == d[1]))
           lut4_mux4 = d[0];
         else if ((s[1] == 1) && (d[2] == d[3]))
           lut4_mux4 = d[2];
         else if ((s[0] == 0) && (d[0] == d[2]))
           lut4_mux4 = d[0];
         else if ((s[0] == 1) && (d[1] == d[3]))
           lut4_mux4 = d[1];
         else
           lut4_mux4 = 1'bx;

   end
  endfunction

endmodule

`endcelldefine

