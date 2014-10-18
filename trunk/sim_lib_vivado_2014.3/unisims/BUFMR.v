// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/fuji/BUFMR.v,v 1.1 2009/12/21 21:08:16 yanx Exp $
///////////////////////////////////////////////////////
//  Copyright (c) 2009 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version     :  12.1
//  \  \           Description : 
//  /  /                      
// /__/   /\       Filename    : BUFMR.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Revision:		1.0
//  05/24/12 - 661573 - Remove 100 ps delay
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

`celldefine

module BUFMR (
  O,

  I
);

`ifdef XIL_TIMING

    parameter LOC = "UNPLACED";
    reg notifier;

`endif 

  output O;

  input I;


  buf B1 (O, I);

  specify

  ( I => O) = (0:0:0, 0:0:0);

`ifdef XIL_TIMING

  $period (posedge I, 0:0:0, notifier);

`endif 

  specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
