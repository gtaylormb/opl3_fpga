///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.i
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Transparent Data Latch with Asynchronous Clear and Gate Enable
// /___/   /\     Filename : LDCE.v
// \   \  /  \    Timestamp : Thu Mar 25 16:42:16 PST 2004
//  \___\/\___\
//
// Revision:
//    08/25/10 - Initial version.
//    11/01/11 - Disable timing check when set reset active (CR633224)
//    12/08/11 - add MSGON and XON attribures (CR636891)
//    01/16/12 - 640813 - add MSGON and XON functionality
//    04/16/13 - PR683925 - add invertible pin support.
// End Revision

`timescale  1 ps / 1 ps

`celldefine
module LDCE #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",
  parameter MSGON = "TRUE",
  parameter XON = "TRUE",
  `endif
  parameter [0:0] INIT = 1'b0,
  parameter [0:0] IS_CLR_INVERTED = 1'b0,
  parameter [0:0] IS_G_INVERTED = 1'b0
)(
  output Q,

  input CLR,
  input D,
  input G,
  input GE
);

    wire D_dly, G_dly, GE_dly, CLR_dly;
    wire G_in, CLR_in;

    reg q_out = INIT;
    reg notifier;
    wire notifier1;
    reg rst_int, set_int;
`ifdef XIL_TIMING
    wire ngsr, nrst,  in_out;
    wire in_clk_enable, ce_clk_enable, rst_clk_enable;
    wire in_clk_enable1, ce_clk_enable1, rst_clk_enable1;
    wire tl_enable, tl_enable1;
`endif

    tri0 GSR = glbl.GSR;
    
`ifdef XIL_TIMING
    not (nrst, CLR_in);
    not (ngsr, GSR);
    xor (in_out, D_dly, Q);

    and (in_clk_enable, ngsr, nrst,  GE_dly);
    and (ce_clk_enable, ngsr, nrst,  in_out);
    and (rst_clk_enable, ngsr, GE_dly);
    and (tl_enable, ngsr, nrst);

    assign notifier1 = (XON == "FALSE") ?  1'bx : notifier;
    assign in_clk_enable1 = (MSGON =="FALSE") ? 1'b0 : in_clk_enable;
    assign ce_clk_enable1 = (MSGON =="FALSE") ? 1'b0 : ce_clk_enable;
    assign rst_clk_enable1 = (MSGON =="FALSE") ? 1'b0 : rst_clk_enable;
    assign tl_enable1 = (MSGON =="FALSE") ? 1'b0 : tl_enable;
`else
    assign notifier1 = 1'bx;
`endif

    assign Q = q_out;
    
    always @(GSR or CLR_in) begin
      if (GSR) 
     if (INIT) begin
         set_int = 1;
         rst_int = 0;
     end
     else begin
         rst_int = 1;
         set_int = 0;
     end
      else begin
     rst_int = CLR_in;
     set_int = 0;
      end
  end

  latchsre_ldce (o_out, G_in, D_dly, set_int, rst_int, GE_dly, notifier1);
    
  always @(o_out)
      q_out = o_out;

    
`ifndef XIL_TIMING
    
    assign G_dly = G;
    assign GE_dly = GE;
    assign CLR_dly = CLR;
    assign D_dly = D;
    
`endif

    assign G_in = IS_G_INVERTED ^ G_dly;
    assign CLR_in = IS_CLR_INVERTED ^ CLR_dly;

  specify
    (D => Q) = (100:100:100, 100:100:100);
    (G => Q) = (100:100:100, 100:100:100);
    (GE => Q) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    (CLR => Q) = (0:0:0, 0:0:0);
    (negedge CLR => (Q +: 0)) = (0:0:0, 0:0:0);
    (posedge CLR => (Q +: 0)) = (0:0:0, 0:0:0);
    $recrem (negedge CLR, negedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,CLR_dly, G_dly);
    $recrem (negedge CLR, posedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,CLR_dly, G_dly);
    $recrem (posedge CLR, negedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,CLR_dly, G_dly);
    $recrem (posedge CLR, posedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,CLR_dly, G_dly);
    $setuphold (negedge G, negedge CLR, 0:0:0, 0:0:0, notifier,,, G_dly, CLR_dly);
    $setuphold (negedge G, negedge D &&& in_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,D_dly);
    $setuphold (negedge G, negedge GE &&& ce_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,GE_dly);
    $setuphold (negedge G, posedge CLR, 0:0:0, 0:0:0, notifier,,, G_dly, CLR_dly);
    $setuphold (negedge G, posedge D &&& in_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,D_dly);
    $setuphold (negedge G, posedge GE &&& ce_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,GE_dly);
    $setuphold (posedge G, negedge CLR, 0:0:0, 0:0:0, notifier,,, G_dly, CLR_dly);
    $setuphold (posedge G, negedge D &&& in_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,D_dly);
    $setuphold (posedge G, negedge GE &&& ce_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,GE_dly);
    $setuphold (posedge G, posedge CLR, 0:0:0, 0:0:0, notifier,,, G_dly, CLR_dly);
    $setuphold (posedge G, posedge D &&& in_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,D_dly);
    $setuphold (posedge G, posedge GE &&& ce_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,GE_dly);
    $width (posedge G, 0:0:0, 0, notifier);
    $width (negedge G, 0:0:0, 0, notifier);
    $width (posedge CLR, 0:0:0, 0, notifier);
    $width (posedge GE, 0:0:0, 0, notifier);
    $width (negedge CLR, 0:0:0, 0, notifier);
    $period (posedge G, 0:0:0, notifier);
    $period (negedge G, 0:0:0, notifier);
    $recrem (negedge GE, negedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,GE_dly, G_dly);
    $recrem (negedge GE, posedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,GE_dly, G_dly);
`endif
      specparam PATHPULSE$ = 0;
  endspecify

    
endmodule

`endcelldefine


primitive latchsre_ldce (q, clk, d, set, rst, ge, notifier);

  output q; reg q;
  input clk, d, set, rst, ge, notifier;

  table

    //   clk    d   set   rst   ge  notifier   q     q+;

          1     0    0     0    1      ?   :   ?  :  0;
          1     1    0     0    1      ?   :   ?  :  1;

          0     ?    0     0    ?      ?   :   ?  :  -;
          ?     ?    0     0    0      ?   :   ?  :  -;
          ?     0    0     ?    ?      ?   :   0  :  -;
          ?     1    ?     0    ?      ?   :   1  :  -;

          ?     ?    1     0    ?      ?   :   ?  :  1;
          ?     ?    ?     1    ?      ?   :   ?  :  0;
          0     ?    0     x    ?      ?   :   0  :  0;
          ?     ?    0     x    0      ?   :   0  :  0;
          1     0    0     x    1      ?   :   ?  :  0;
          0     ?    x     0    ?      ?   :   1  :  1;
          ?     ?    x     0    0      ?   :   1  :  1;
          1     1    x     0    1      ?   :   ?  :  1;
          ?     ?    ?     ?    ?      *   :   ?  :  x;

  endtable

endprimitive
