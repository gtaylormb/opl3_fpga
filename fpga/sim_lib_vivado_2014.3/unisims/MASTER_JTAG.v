///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 2013 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \   \   \/      Version     : 2013.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        
// /___/   /\      Filename    : MASTER_JTAG.v
// \   \  /  \ 
//  \___\/\___\                    
//                                 
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//     06/17/13 - Initial version.
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

`celldefine
module MASTER_JTAG 
  `ifdef XIL_TIMING //Simprim adding LOC only 
#(
  parameter LOC = "UNPLACED"  
)
  `endif
(
  output TDO,

  input TCK,
  input TDI,
  input TMS
);
  
endmodule

`endcelldefine
