// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/versclibs/data/rainier/LUT6_2.v,v 1.4 2007/06/19 19:47:31 yanx Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1i (K.18)
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  6-input Look-Up-Table with Two Outputs
// /___/   /\     Filename : LUT6_2.v
// \   \  /  \    Timestamp : 
//  \___\/\___\
//
// Revision:
//    08/08/06 - Initial version.
//    06/04/07 - Change timescale form 100ps/10ps to 1ps/1ps.
//               Add wire definition.
//    06/19/07 - Add LOC parameter (CR 441956).
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision

`timescale  1 ps / 1 ps


`celldefine

module LUT6_2 (O5, O6, I0, I1, I2, I3, I4, I5);

  parameter INIT = 64'h0000000000000000;

`ifdef XIL_TIMING

  parameter LOC = "UNPLACED";

`endif

  input I0, I1, I2, I3, I4, I5;

  output O5, O6;

  reg [63:0] init_reg = INIT;
  reg [31:0] init_l, init_h;
  reg O_l, O_h, tmp;
  reg O5_o, O6_o;
  wire I0_i, I1_i, I2_i, I3_i, I4_i, I5_i;
  
  buf bo5 (O5, O5_o);
  buf bo6 (O6, O6_o);
  buf bi0 (I0_i, I0);
  buf bi1 (I1_i, I1);
  buf bi2 (I2_i, I2);
  buf bi3 (I3_i, I3);
  buf bi4 (I4_i, I4);
  buf bi5 (I5_i, I5);

  initial begin
     init_l = init_reg[31:0];
     init_h = init_reg[63:32];
  end

  always @(I5_i or O_l or O_h) begin
    O5_o = O_l;
    if (I5_i == 1)
      O6_o = O_h;
    else if (I5_i == 0)
      O6_o = O_l;
    else begin
      if (O_h == 0 && O_l == 0)
         O6_o = 1'b0;
      else if (O_h == 1 && O_l == 1)
         O6_o = 1'b1;
      else
         O6_o = 1'bx;
      end
   end
   

  always @( I4_i or I3_i or  I2_i or  I1_i or  I0_i )  begin
    tmp =  I0_i ^ I1_i  ^ I2_i ^ I3_i ^ I4_i;
    if ( tmp == 0 || tmp == 1) begin
        O_l = init_l[{I4_i, I3_i, I2_i, I1_i, I0_i}];
        O_h = init_h[{I4_i, I3_i, I2_i, I1_i, I0_i}];
    end
    else begin
      O_l =  lut4_mux4 ( 
                        { lut6_mux8 ( init_l[31:24], {I2_i, I1_i, I0_i}),
                          lut6_mux8 ( init_l[23:16], {I2_i, I1_i, I0_i}),
                          lut6_mux8 ( init_l[15:8], {I2_i, I1_i, I0_i}),
                          lut6_mux8 ( init_l[7:0], {I2_i, I1_i, I0_i}) }, { I4_i, I3_i});

      O_h =  lut4_mux4 ( 
                        { lut6_mux8 ( init_h[31:24], {I2_i, I1_i, I0_i}),
                          lut6_mux8 ( init_h[23:16], {I2_i, I1_i, I0_i}),
                          lut6_mux8 ( init_h[15:8], {I2_i, I1_i, I0_i}),
                          lut6_mux8 ( init_h[7:0], {I2_i, I1_i, I0_i}) }, { I4_i, I3_i});
     end
    end

  specify

        (I0 => O5) = (0:0:0, 0:0:0);
        (I1 => O5) = (0:0:0, 0:0:0);
        (I2 => O5) = (0:0:0, 0:0:0);
        (I3 => O5) = (0:0:0, 0:0:0);
        (I4 => O5) = (0:0:0, 0:0:0);
        (I5 => O5) = (0:0:0, 0:0:0);
        (I0 => O6) = (0:0:0, 0:0:0);
        (I1 => O6) = (0:0:0, 0:0:0);
        (I2 => O6) = (0:0:0, 0:0:0);
        (I3 => O6) = (0:0:0, 0:0:0);
        (I4 => O6) = (0:0:0, 0:0:0);
        (I5 => O6) = (0:0:0, 0:0:0);
        specparam PATHPULSE$ = 0;

  endspecify


  function lut6_mux8;
  input [7:0] d;
  input [2:0] s;
   
  begin

       if ((s[2]^s[1]^s[0] ==1) || (s[2]^s[1]^s[0] ==0))
           
           lut6_mux8 = d[s];

         else
           if ( ~(|d))
                 lut6_mux8 = 1'b0;
           else if ((&d))
                 lut6_mux8 = 1'b1;
           else if (((s[1]^s[0] ==1'b1) || (s[1]^s[0] ==1'b0)) && (d[{1'b0,s[1:0]}]===d[{1'b1,s[1:0]}]))
                 lut6_mux8 = d[{1'b0,s[1:0]}];
           else if (((s[2]^s[0] ==1) || (s[2]^s[0] ==0)) && (d[{s[2],1'b0,s[0]}]===d[{s[2],1'b1,s[0]}]))
                 lut6_mux8 = d[{s[2],1'b0,s[0]}];
           else if (((s[2]^s[1] ==1) || (s[2]^s[1] ==0)) && (d[{s[2],s[1],1'b0}]===d[{s[2],s[1],1'b1}]))
                 lut6_mux8 = d[{s[2],s[1],1'b0}];
           else if (((s[0] ==1) || (s[0] ==0)) && (d[{1'b0,1'b0,s[0]}]===d[{1'b0,1'b1,s[0]}]) &&
              (d[{1'b0,1'b0,s[0]}]===d[{1'b1,1'b0,s[0]}]) && (d[{1'b0,1'b0,s[0]}]===d[{1'b1,1'b1,s[0]}]))
                 lut6_mux8 = d[{1'b0,1'b0,s[0]}];
           else if (((s[1] ==1) || (s[1] ==0)) && (d[{1'b0,s[1],1'b0}]===d[{1'b0,s[1],1'b1}]) &&
              (d[{1'b0,s[1],1'b0}]===d[{1'b1,s[1],1'b0}]) && (d[{1'b0,s[1],1'b0}]===d[{1'b1,s[1],1'b1}]))
                 lut6_mux8 = d[{1'b0,s[1],1'b0}];
           else if (((s[2] ==1) || (s[2] ==0)) && (d[{s[2],1'b0,1'b0}]===d[{s[2],1'b0,1'b1}]) &&
              (d[{s[2],1'b0,1'b0}]===d[{s[2],1'b1,1'b0}]) && (d[{s[2],1'b0,1'b0}]===d[{s[2],1'b1,1'b1}]))
                 lut6_mux8 = d[{s[2],1'b0,1'b0}];
           else
                 lut6_mux8 = 1'bx;
   end
  endfunction


  function lut4_mux4;
  input [3:0] d;
  input [1:0] s;
   
  begin

       if ((s[1]^s[0] ==1) || (s[1]^s[0] ==0))

           lut4_mux4 = d[s];

         else if ((d[0] === d[1]) && (d[2] === d[3])  && (d[0] === d[2]) )
           lut4_mux4 = d[0];
         else if ((s[1] == 0) && (d[0] === d[1]))
           lut4_mux4 = d[0];
         else if ((s[1] == 1) && (d[2] === d[3]))
           lut4_mux4 = d[2];
         else if ((s[0] == 0) && (d[0] === d[2]))
           lut4_mux4 = d[0];
         else if ((s[0] == 1) && (d[1] === d[3]))
           lut4_mux4 = d[1];
         else
           lut4_mux4 = 1'bx;

   end
  endfunction

endmodule

`endcelldefine
