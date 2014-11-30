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
// /___/   /\      Filename    : FRAME_ECCE3.v
// \   \  /  \ 
//  \___\/\___\                    
//                                 
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//     05/30/13 - Initial version.
//     02/26/14 - Pulldown all outputs (CR 775504).
//  End Revision
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

`celldefine
module FRAME_ECCE3
  `ifdef XIL_TIMING //Simprim
  #(		     
  parameter LOC = "UNPLACED"
)
  `endif
(
  output CRCERROR,
  output ECCERRORNOTSINGLE,
  output ECCERRORSINGLE,
  output ENDOFFRAME,
  output ENDOFSCAN,
  output [25:0] FAR,

  input [1:0] FARSEL, 
  input ICAPBOTCLK,
  input ICAPTOPCLK

);

   pulldown (CRCERROR);
   pulldown (ECCERRORNOTSINGLE);
   pulldown (ECCERRORSINGLE);
   pulldown (ENDOFFRAME);
   pulldown (ENDOFSCAN);
   pulldown far_net[25:0] (FAR);

   tri0 glblGSR = glbl.GSR;
   
   specify
      specparam PATHPULSE$ = 0;
   endspecify
   
endmodule

`endcelldefine
