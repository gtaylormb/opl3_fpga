// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/blanc/EFUSE_USR.v,v 1.1.72.1 2009/04/10 19:56:17 yanx Exp $
///////////////////////////////////////////////////////
//  Copyright (c) 2009 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version : 10.1
//  \  \           Description : 
//  /  /                      
// /__/   /\       Filename    : EFUSE_USR.v
// \  \  /  \      Timestamp : Wed Mar 19 12:34:06 2008
//  \__\/\__ \                    
//                                 
// Revision:
//    03/19/08 - Initial version.  
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision

`timescale 1 ps / 1 ps 

`celldefine

module EFUSE_USR (
  EFUSEUSR
);

  parameter [31:0] SIM_EFUSE_VALUE = 32'h00000000;

`ifdef XIL_TIMING

  parameter LOC = "UNPLACED";

`endif

    
  output [31:0] EFUSEUSR;

  assign EFUSEUSR = SIM_EFUSE_VALUE;

  specify

      specparam PATHPULSE$ = 0;

  endspecify

endmodule

`endcelldefine
