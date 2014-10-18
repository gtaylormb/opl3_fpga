///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2014 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 2014.2
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                  D Flip-Flop with Clock Enable and Asynchronous Preset
// /___/   /\     Filename : FDPE.v
// \   \  /  \
//  \___\/\___\
//
// Revision:
//    08/25/10 - Initial version.
//    10/20/10 - remove unused pin line from table.
//    11/01/11 - Disable timing check when set reset active (CR632017)
//    12/08/11 - add MSGON and XON attributes (CR636891)
//    01/16/12 - 640813 - add MSGON and XON functionality
//    04/16/13 - PR683925 - add invertible pin support.
// End Revision

`timescale  1 ps / 1 ps

primitive ffsrce_fdpe (q, ici, clk, d, ce, set, rst, notifier);

  output q; reg q;
  input ici, clk, d, ce, set, rst, notifier;

  table

    //   ici   clk    d     ce   set   rst   notifier    q     q+;

          ?     ?     ?      ?    1     0       ?    :   ?  :  1;
          ?     ?     ?      ?    ?     1       ?    :   ?  :  0;
          ?    (??)   ?      0    ?     ?       ?    :   ?  :  -;

          0    (01)   0      1    0     0       ?    :   ?  :  0;
          0    (01)   1      1    0     0       ?    :   ?  :  1;
          1    (10)   0      1    0     0       ?    :   ?  :  0;
          1    (10)   1      1    0     0       ?    :   ?  :  1;

          0    (01)   x      1    0     0       ?    :   ?  :  x;
          0    (01)   0      x    0     0       ?    :   0  :  0;
          0    (01)   1      x    0     0       ?    :   1  :  1;
          1    (10)   x      1    0     0       ?    :   ?  :  x;
          1    (10)   0      x    0     0       ?    :   0  :  0;
          1    (10)   1      x    0     0       ?    :   1  :  1;

          0    (1?)   ?      ?    ?     ?       ?    :   ?  :  -;
          0    (?0)   ?      ?    ?     ?       ?    :   ?  :  -;
          1    (?1)   ?      ?    ?     ?       ?    :   ?  :  -;
          1    (0?)   ?      ?    ?     ?       ?    :   ?  :  -;

          0    (01)   0      1    0     x       ?    :   ?  :  0;
          0    (01)   1      1    x     0       ?    :   ?  :  1;
          1    (10)   0      1    0     x       ?    :   ?  :  0;
          1    (10)   1      1    x     0       ?    :   ?  :  1;

          ?     ?     ?      ?    0    (?x)     ?    :   0  :  0;
          ?     ?     ?      ?   (?x)   0       ?    :   1  :  1;

          0    (?1)   1      ?    ?     0       ?    :   1  :  1;
          0    (?1)   0      ?    0     ?       ?    :   0  :  0;
          0    (0?)   1      ?    ?     0       ?    :   1  :  1;
          0    (0?)   0      ?    0     ?       ?    :   0  :  0;
          1    (?0)   1      ?    ?     0       ?    :   1  :  1;
          1    (?0)   0      ?    0     ?       ?    :   0  :  0;
          1    (1?)   1      ?    ?     0       ?    :   1  :  1;
          1    (1?)   0      ?    0     ?       ?    :   0  :  0;

          ?     ?    (??)    ?    ?     ?       ?    :   ?  :  -;
          ?     ?     ?    (??)   ?     ?       ?    :   ?  :  -;
          ?     ?     ?      ?   (?0)   ?       ?    :   ?  :  -;

          ?     ?     ?      ?    x    (?0)     ?    :   ?  :  x;
          ?     ?     ?      ?    0    (?0)     ?    :   ?  :  -;

          ?     ?     ?      ?    ?     ?       *    :   ?  :  x;
  endtable

endprimitive

`celldefine 
module FDPE #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",
  parameter MSGON = "TRUE",
  parameter XON = "TRUE",
  `endif
  parameter [0:0] INIT = 1'b1,
  parameter [0:0] IS_C_INVERTED = 1'b0,
  parameter [0:0] IS_D_INVERTED = 1'b0,
  parameter [0:0] IS_PRE_INVERTED = 1'b0
)(
  output Q,
  
  input C,
  input CE,
  input D,
  input PRE
);

    wire o_out;
`ifdef XIL_TIMING
    wire D_dly, C_dly, CE_dly;
    wire PRE_dly;
`endif

    wire D_in, CE_in;
    wire PRE_in;
    wire [0:0] IS_C_INVERTED_BIN;
    wire [0:0] IS_D_INVERTED_BIN;
    wire [0:0] IS_PRE_INVERTED_BIN;
    
    reg q_out = INIT;
    reg notifier;
    wire notifier1;
    reg rst_int, set_int;

`ifdef XIL_TIMING
    wire ngsr, in_out;
    wire ni, nset;
    wire in_clk_enable, ce_clk_enable;
    wire in_clk_enable1, ce_clk_enable1;
    wire set_clk_enable, set_clk_enable1;
`endif

    tri0 glblGSR = glbl.GSR;

    assign Q = q_out;

`ifdef XIL_TIMING
    not (ngsr, glblGSR);
    xor (in_out, D_in, Q);
    not (ni, D_in);
    not (nset, PRE_in);

    and (in_clk_enable, ngsr,  nset, CE_in);
    and (ce_clk_enable, ngsr,  nset, in_out);
    and (set_clk_enable, ngsr, CE_in,  ni);

    assign notifier1 = (XON == "FALSE") ?  1'bx : notifier;
    assign ce_clk_enable1 = (MSGON =="TRUE") && ce_clk_enable;
    assign in_clk_enable1 = (MSGON =="TRUE") && in_clk_enable;
    assign set_clk_enable1 = (MSGON =="TRUE") && set_clk_enable;
`else
    assign notifier1 = 1'bx;
`endif

    always @(glblGSR or PRE_in)
      if (glblGSR) 
        if (INIT) begin
          set_int = 1'b1;
          rst_int = 1'b0;
        end
        else begin
          set_int = 1'b0;
          rst_int = 1'b1;
        end
      else begin
        set_int = PRE_in;
        rst_int = 1'b0;
      end

`ifdef XIL_TIMING
    ffsrce_fdpe (o_out, IS_C_INVERTED_BIN, C_dly, D_in, CE_in, set_int, rst_int, notifier1);
`else
    ffsrce_fdpe (o_out, IS_C_INVERTED_BIN, C, D_in, CE_in, set_int, rst_int, notifier1);
`endif

    always @(o_out) q_out = o_out;

    assign IS_C_INVERTED_BIN   = IS_C_INVERTED;
    assign IS_D_INVERTED_BIN   = IS_D_INVERTED;
    assign IS_PRE_INVERTED_BIN = IS_PRE_INVERTED;
`ifdef XIL_TIMING
    assign CE_in = CE_dly || (CE === 1'bz);
    assign D_in = D_dly ^ IS_D_INVERTED_BIN;
    assign PRE_in = (PRE_dly ^ IS_PRE_INVERTED_BIN) && (PRE !== 1'bz);
`else
    assign CE_in = CE || (CE === 1'bz);
    assign D_in = D ^ IS_D_INVERTED_BIN;
    assign PRE_in = (PRE ^ IS_PRE_INVERTED_BIN) && (PRE !== 1'bz);
`endif

  specify
  (C => Q) = (100:100:100, 100:100:100);
  (negedge PRE => (Q +: 1)) = (0:0:0, 0:0:0);
  (posedge PRE => (Q +: 1)) = (0:0:0, 0:0:0);
  (PRE => Q) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
  $period (negedge C &&& CE, 0:0:0, notifier);
  $period (posedge C &&& CE, 0:0:0, notifier);
  $recrem (negedge PRE, negedge C  &&& (set_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,PRE_dly, C_dly);
  $recrem (negedge PRE, posedge C  &&& (set_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,PRE_dly, C_dly);
  $recrem (posedge PRE, negedge C  &&& (set_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,PRE_dly, C_dly);
  $recrem (posedge PRE, posedge C  &&& (set_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,PRE_dly, C_dly);
  $setuphold (negedge C, negedge CE &&& (ce_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,C_dly,CE_dly);
  $setuphold (negedge C, negedge D  &&& (in_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,C_dly,D_dly);
  $setuphold (negedge C, posedge CE &&& (ce_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,C_dly,CE_dly);
  $setuphold (negedge C, posedge D  &&& (in_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,C_dly,D_dly);
  $setuphold (posedge C, negedge CE &&& (ce_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,C_dly,CE_dly);
  $setuphold (posedge C, negedge D  &&& (in_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,C_dly,D_dly);
  $setuphold (posedge C, posedge CE &&& (ce_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,C_dly,CE_dly);
  $setuphold (posedge C, posedge D  &&& (in_clk_enable1!=0), 0:0:0, 0:0:0, notifier,,,C_dly,D_dly);
  $width (negedge C &&& CE, 0:0:0, 0, notifier);
  $width (negedge PRE, 0:0:0, 0, notifier);
  $width (posedge C &&& CE, 0:0:0, 0, notifier);
  $width (posedge PRE, 0:0:0, 0, notifier);
`endif
  specparam PATHPULSE$ = 0;
  endspecify
endmodule

`endcelldefine
