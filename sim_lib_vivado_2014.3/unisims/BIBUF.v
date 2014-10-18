// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2012 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 14.1
//  \   \         Description : Xilinx Simulation Library Component
//  /   /                  Bi-Directional IO
// /___/   /\     Filename : BIBUF.v
// \   \  /  \    Timestamp : 
//  \___\/\___\
//
// Revision:
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module BIBUF (PAD, IO);

    inout  PAD;
    inout  IO;

    wire PAD_io;
    wire IO_io;

    assign #10 PAD_io = PAD;
    assign #10 IO_io = IO;

    assign (weak1, weak0) IO = PAD_io;
    assign (weak1, weak0) PAD = IO_io;

endmodule

`endcelldefine
