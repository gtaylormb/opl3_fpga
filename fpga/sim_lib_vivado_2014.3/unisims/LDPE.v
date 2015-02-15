///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Transparent Data Latch with Asynchronous Preset and Gate Enable
// /___/   /\     Filename : LDPE.v
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
module LDPE #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",
  parameter MSGON = "TRUE",
  parameter XON = "TRUE",
  `endif
  parameter [0:0] INIT = 1'b1,
  parameter [0:0] IS_PRE_INVERTED = 1'b0,
  parameter [0:0] IS_G_INVERTED = 1'b0
)(
  output Q,

  input D,
  input G,
  input GE,
  input PRE
);

    wire D_dly, G_dly, GE_dly, PRE_dly;
    wire G_in, PRE_in;

    reg q_out = INIT;
    reg notifier;
    wire notifier1;
    reg rst_int, set_int;
    
    tri0 GSR = glbl.GSR;

`ifdef XIL_TIMING
    wire ngsr, nset, in_out;
    wire in_clk_enable, ce_clk_enable, rst_clk_enable;
    wire in_clk_enable1, ce_clk_enable1, rst_clk_enable1;
    wire tl_enable, tl_enable1;

    not (nset, PRE_in);
    not (ngsr, GSR);
    xor (in_out, D_dly, Q);

    and (in_clk_enable, ngsr, nset, GE_dly);
    and (ce_clk_enable, ngsr, nset, in_out);
    and (rst_clk_enable, ngsr, GE_dly);
    and (tl_enable, ngsr, nset);

    assign notifier1 = (XON == "FALSE") ?  1'bx : notifier;
    assign in_clk_enable1 = (MSGON =="FALSE") ? 1'b0 : in_clk_enable;
    assign ce_clk_enable1 = (MSGON =="FALSE") ? 1'b0 : ce_clk_enable;
    assign rst_clk_enable1 = (MSGON =="FALSE") ? 1'b0 : rst_clk_enable;
    assign tl_enable1 = (MSGON =="FALSE") ? 1'b0 : tl_enable;
`else
    assign notifier1 = 1'bx;
`endif


    assign Q = q_out;

    always @(GSR or PRE_in) begin
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
       rst_int = 0;
       set_int = PRE_in;
   end
    end
    
    latchsre_ldpe (o_out, G_in, D_dly, set_int, rst_int, GE_dly, notifier1);
    
    always @(o_out)
   q_out = o_out;
    
    
`ifndef XIL_TIMING
    
    assign G_dly = G;
    assign GE_dly = GE;
    assign D_dly = D;
    assign PRE_dly = PRE;
    
`endif

    assign G_in = IS_G_INVERTED ^ G_dly;
    assign PRE_in = IS_PRE_INVERTED ^ PRE_dly;

  specify
      
    (D => Q) = (100:100:100, 100:100:100);
    (G => Q) = (100:100:100, 100:100:100);
    (GE => Q) = (0:0:0, 0:0:0);

`ifdef XIL_TIMING

    (PRE => Q) = (0:0:0, 0:0:0);
    (negedge PRE *> (Q +: 1)) = (0:0:0, 0:0:0);
    (posedge PRE *> (Q +: 1)) = (0:0:0, 0:0:0);


    $setuphold (negedge G, posedge GE &&& ce_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,GE_dly);
    $setuphold (negedge G, negedge GE &&& ce_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,GE_dly);
    $setuphold (negedge G, posedge D &&& in_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,D_dly);
    $setuphold (negedge G, negedge D &&& in_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,D_dly);
      
    $recrem (negedge PRE, negedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,PRE_dly, G_dly);
    $recrem (negedge GE, negedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,GE_dly, G_dly);
      
    $period (posedge G, 0:0:0, notifier);
    $width (posedge G, 0:0:0, 0, notifier);
    $width (negedge G, 0:0:0, 0, notifier);
    $width (posedge GE, 0:0:0, 0, notifier);
    $width (posedge PRE, 0:0:0, 0, notifier);

    $setuphold (posedge G, posedge GE &&& ce_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,GE_dly);
    $setuphold (posedge G, negedge GE &&& ce_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,GE_dly);
    $setuphold (posedge G, posedge D &&& in_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,D_dly);
    $setuphold (posedge G, negedge D &&& in_clk_enable1, 0:0:0, 0:0:0, notifier,,,G_dly,D_dly);
    $recrem (posedge PRE, negedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,PRE_dly, G_dly);
    $recrem (negedge PRE, posedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,PRE_dly, G_dly);
    $recrem (posedge PRE, posedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,PRE_dly, G_dly);
    $recrem (negedge GE, posedge G &&& tl_enable1, 0:0:0, 0:0:0, notifier,,,GE_dly, G_dly);
    $period (negedge G, 0:0:0, notifier);
    $width (negedge PRE, 0:0:0, 0, notifier);
`endif

      specparam PATHPULSE$ = 0;

  endspecify

    
endmodule

`endcelldefine


primitive latchsre_ldpe (q, clk, d, set, rst, ge, notifier);

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
