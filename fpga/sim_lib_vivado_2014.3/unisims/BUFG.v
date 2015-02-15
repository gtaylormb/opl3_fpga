// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/unisims/BUFG.v,v 1.6 2007/05/23 21:43:33 patrickp Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Global Clock Buffer
// /___/   /\     Filename : BUFG.v
// \   \  /  \    Timestamp : Thu Mar 25 16:42:14 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module BUFG (O, I);
    

`ifdef XIL_TIMING

    parameter LOC = " UNPLACED";
    reg notifier;

`endif


    output O;
    input  I;

    buf B1 (O, I);

`ifdef XIL_TIMING
  specify
    (I => O) = (0:0:0, 0:0:0);
    $period (negedge I, 0:0:0, notifier);
    $period (posedge I, 0:0:0, notifier);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
