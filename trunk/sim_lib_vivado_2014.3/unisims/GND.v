// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/unisims/GND.v,v 1.5 2007/05/23 21:43:33 patrickp Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  GND Connection
// /___/   /\     Filename : GND.v
// \   \  /  \    Timestamp : Thu Mar 25 16:42:19 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.

`timescale  1 ps / 1 ps


`celldefine

module GND(G);


`ifdef XIL_TIMING

    parameter LOC = "UNPLACED";

`endif

    output G;

    assign G = 1'b0;

endmodule

`endcelldefine

