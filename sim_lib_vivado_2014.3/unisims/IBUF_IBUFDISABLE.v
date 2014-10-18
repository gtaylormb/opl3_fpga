///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  Input Buffer
// /___/   /\     Filename : IBUF_IBUFDISABLE.v
// \   \  /  \    Timestamp : Wed Dec  8 17:04:24 PST 2010
//  \___\/\___\
//
// Revision:
//    12/08/10 - Initial version.
//    04/04/11 - CR 604808 fix
//    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
//    08/31/11 - CR 623170 -- added attribute USE_IBUFDISABLE
//    09/20/11 - CR 624774, 625725 -- Removed attributes IBUF_DELAY_VALUE, IFD_DELAY_VALUE and CAPACITANCE
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision

`timescale  1 ps / 1 ps


`celldefine

module IBUF_IBUFDISABLE (O, I, IBUFDISABLE);

    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";
    parameter SIM_DEVICE = "7SERIES";
    parameter USE_IBUFDISABLE = "TRUE";
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif // `ifdef XIL_TIMING
    
    output O;

    input  I;
    input  IBUFDISABLE;


   wire out_val;
    initial begin
	

        case (IBUF_LOW_PWR)

            "FALSE", "TRUE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute IBUF_LOW_PWR on IBUF_IBUFDISABLE instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", IBUF_LOW_PWR);
                          $finish;
                      end

        endcase
     if ((SIM_DEVICE != "7SERIES") &&
        (SIM_DEVICE != "ULTRASCALE")) begin
      $display("Attribute Syntax Error : The attribute SIM_DEVICE on IBUF_IBUFDISABLE instance %m is set to %s.  Legal values for this attribute are 7SERIES or ULTRASCALE.",SIM_DEVICE);
         $finish;
         end

    end
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
                        assign O = (IBUFDISABLE == 0)? I : (IBUFDISABLE == 1)? out_val  : 1'bx;
                    end
          "FALSE" : begin
                        assign O = I;
                    end
       endcase
    endgenerate

`ifdef XIL_TIMING
    specify

        (I => O) 		= (0:0:0,  0:0:0);
        (IBUFDISABLE => O)	= (0:0:0,  0:0:0);

        specparam PATHPULSE$ = 0;

    endspecify
`endif // `ifdef XIL_TIMING

endmodule

`endcelldefine
