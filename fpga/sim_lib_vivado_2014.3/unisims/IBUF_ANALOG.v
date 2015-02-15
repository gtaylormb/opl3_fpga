// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2013 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Input Analog Buffer
// /___/   /\     Filename : IBUF_ANALOG.v
// \   \  /  \    Timestamp : Wed Oct 30 16:09:20 PDT 2013
//  \___\/\___\
//
// Revision:
//    10/30/13 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module IBUF_ANALOG (O, I);

`ifdef XIL_TIMING

    parameter LOC = " UNPLACED";

`endif
    
    output O;
    input  I;

    pulldown p (O);
    buf (weak1, weak0) B1 (O, I);
    
    specify
        (I => O) = (0:0:0, 0:0:0);
        specparam PATHPULSE$ = 0;
    endspecify

    
endmodule

`endcelldefine

