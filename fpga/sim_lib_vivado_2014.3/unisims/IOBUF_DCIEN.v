///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  Bi-Directional Buffer
// /___/   /\     Filename : IOBUF_DCIEN.v
// \   \  /  \    Timestamp : Wed Dec  8 17:04:24 PST 2010
//  \___\/\___\
//
// Revision:
//    12/08/10 - Initial version.
//    03/28/11 - CR 603466 fix
//    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
//    08/31/11 - CR 623170 -- Tristate powergating support
//    09/20/11 - CR 624774, 625725 -- Removed attributes IBUF_DELAY_VALUE, IFD_DELAY_VALUE and CAPACITANCE
//    09/20/11 - CR 625564 -- Fixed Tristate powergating polarity
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision

`timescale  1 ps / 1 ps


`celldefine

module IOBUF_DCIEN (O, IO, DCITERMDISABLE, I, IBUFDISABLE, T);

    parameter integer DRIVE = 12;
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";
    parameter SIM_DEVICE = "7SERIES";
    parameter SLEW = "SLOW";
    parameter USE_IBUFDISABLE = "TRUE";
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif // `ifdef XIL_TIMING

    output O;
    inout  IO;
    input  DCITERMDISABLE;
    input  I;
    input  IBUFDISABLE;
    input  T;

    wire ts;
    wire T_OR_IBUFDISABLE;
    wire out_val;

    tri0 GTS = glbl.GTS;

    or O1 (ts, GTS, T);
    bufif0 T1 (IO, I, ts);

    and a1 (disable_out, DCITERMDISABLE, IBUFDISABLE);

//    buf B1 (O, IO);

    initial begin
	

        case (IBUF_LOW_PWR)

            "FALSE", "TRUE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute IBUF_LOW_PWR on IOBUF_DCIEN instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", IBUF_LOW_PWR);
                          $finish;
                      end

        endcase
     if ((SIM_DEVICE != "7SERIES") &&
        (SIM_DEVICE != "ULTRASCALE")) begin
      $display("Attribute Syntax Error : The attribute SIM_DEVICE on IOBUF_DCIEN instance %m is set to %s.  Legal values for this attribute are 7SERIES or ULTRASCALE.",SIM_DEVICE);
         $finish;
         end

	
    end // initial begin
   generate
       case (SIM_DEVICE)
         "7SERIES" : begin
                        assign out_val = 1'b1;
                     end
         "ULTRASCALE" : begin
                        assign out_val = 1'b0;
                     end
        endcase
   endgenerate

    generate
       case (USE_IBUFDISABLE)
          "TRUE" :  begin
                       assign T_OR_IBUFDISABLE = ~T || IBUFDISABLE;
                       assign O = (T_OR_IBUFDISABLE == 1'b1) ? out_val : (T_OR_IBUFDISABLE == 1'b0) ? IO : 1'bx;
                    end
          "FALSE" : begin
                        assign O = IO;
                    end
       endcase
    endgenerate

`ifdef XIL_TIMING
    specify

        (DCITERMDISABLE => O)   = (0:0:0,  0:0:0);
        (DCITERMDISABLE => IO)  = (0:0:0,  0:0:0);
        (I => O)                = (0:0:0,  0:0:0);
        (I => IO)               = (0:0:0,  0:0:0);
        (IO => O)               = (0:0:0,  0:0:0);
        (IBUFDISABLE => O)      = (0:0:0,  0:0:0);
        (IBUFDISABLE => IO)     = (0:0:0,  0:0:0);
        (T => O)               = (0:0:0,  0:0:0);
        (T => IO)              = (0:0:0,  0:0:0);
        specparam PATHPULSE$ = 0;
    endspecify
`endif // `ifdef XIL_TIMING

endmodule

`endcelldefine
