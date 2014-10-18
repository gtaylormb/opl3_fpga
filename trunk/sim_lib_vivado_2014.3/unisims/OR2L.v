///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 11.1 (L.33)
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  Latch used as 2-input OR Gate
// /___/   /\     Filename : OR2L.v
// \   \  /  \    Timestamp : Tue Feb 26 11:11:42 PST 2008
//  \___\/\___\
//
// Revision:
//    02/26/08 - Initial version.
//    04/01/08 - Add GSR.
//    02/19/09 - Order port name (CR509139)
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    04/16/13 - PR683925 - add invertible pin support.
// End Revision

`timescale  1 ps / 1 ps

`celldefine
module OR2L #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",
  `endif
  parameter [0:0] IS_SRI_INVERTED = 1'b0
)(
  output O,

  input DI,
  input SRI
);
    
    tri0 GSR = glbl.GSR;

  `ifdef XIL_TIMING
  reg notifier;
  `endif

    wire o_out;
    wire SRI_in;

    assign O = (GSR) ? 0 : o_out;
    or O1 (o_out, SRI_in, DI);

    assign SRI_in = IS_SRI_INVERTED ^ SRI;

  specify
  (DI => O) = (0:0:0, 0:0:0);
  (SRI => O) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $width (negedge SRI, 0:0:0, 0, notifier);
    $width (posedge SRI, 0:0:0, 0, notifier);
`endif
  specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
