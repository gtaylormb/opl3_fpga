///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Synchronizer for BUFG_GT Control Signals
// /___/   /\      Filename    : BUFG_GT_SYNC.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    02/03/14 - Initial version.
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module BUFG_GT_SYNC
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output CESYNC,
  output CLRSYNC,

  input CE,
  input CLK,
  input CLR
);
  
// define constants
  localparam MODULE_NAME = "BUFG_GT_SYNC";
  assign CESYNC = (CE === 1'bz) || CE; // rv 1
  assign CLRSYNC = (CLR !== 1'bz) && CLR; // rv 0

endmodule

`endcelldefine
