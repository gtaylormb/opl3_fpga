// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  3-State Differential Signaling Output Buffer
// /___/   /\     Filename : OBUFTDS.v
// \   \  /  \    Timestamp : Thu Mar 25 16:43:01 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.
//    05/23/07 - Added wire declaration for internal signals.

`timescale  1 ps / 1 ps

`celldefine

module OBUFTDS (O, OB, I, T);

    parameter CAPACITANCE = "DONT_CARE";
    parameter IOSTANDARD = "DEFAULT";
    
`ifdef XIL_TIMING

    parameter LOC = " UNPLACED";

`endif

    parameter SLEW = "SLOW";

    
    output O, OB;
    input  I, T;

    wire ts;

    tri0 GTS = glbl.GTS;

    or O1 (ts, GTS, T);
    bufif0 B1 (O, I, ts);
    notif0 N1 (OB, I, ts);

    initial begin
	
        case (CAPACITANCE)

            "LOW", "NORMAL", "DONT_CARE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute CAPACITANCE on OBUFTDS instance %m is set to %s.  Legal values for this attribute are DONT_CARE, LOW or NORMAL.", CAPACITANCE);
                          $finish;
                      end

        endcase

    end


`ifdef XIL_TIMING
 
    specify
        (I => O)  = (0:0:0, 0:0:0);
        (I => OB) = (0:0:0, 0:0:0);
        (T => O)  = (0:0:0, 0:0:0,
                     0:0:0, 0:0:0,
                     0:0:0, 0:0:0);
        (T => OB) = (0:0:0, 0:0:0,
                     0:0:0, 0:0:0,
                     0:0:0, 0:0:0);
        specparam PATHPULSE$ = 0;
    endspecify

`endif

    
endmodule

`endcelldefine


