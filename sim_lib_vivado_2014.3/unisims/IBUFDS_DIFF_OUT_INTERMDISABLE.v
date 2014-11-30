///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2011 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Differential Signaling Input Buffer with Differential Outputs
// /___/   /\     Filename : IBUFDS_DIFF_OUT_INTERMDISABLE.v
// \   \  /  \    Timestamp : Wed Apr 20 17:49:56 PDT 2011
//  \___\/\___\
//
// Revision:
//    04/20/11 - Initial version.
//    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
//    08/31/11 - CR 623170 -- added attribute USE_IBUFDISABLE
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision

`timescale  1 ps / 1 ps


`celldefine

module IBUFDS_DIFF_OUT_INTERMDISABLE (O, OB, I, IB, IBUFDISABLE, INTERMDISABLE);

    parameter DIFF_TERM = "FALSE";
    parameter DQS_BIAS = "FALSE";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";
    parameter SIM_DEVICE = "7SERIES";
    parameter USE_IBUFDISABLE = "TRUE";
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif //  `ifdef XIL_TIMING


    output O; 
    output OB;

    input I;
    input IB;
    input IBUFDISABLE;
    input INTERMDISABLE;

    reg  o_out;
    reg DQS_BIAS_BINARY = 1'b0;
    wire out_val;
    wire out_b_val;


    initial begin
         case (DQS_BIAS)

            "TRUE"  : DQS_BIAS_BINARY <= #1 1'b1;
            "FALSE" : DQS_BIAS_BINARY <= #1 1'b0;
            default : begin
                          $display("Attribute Syntax Error : The attribute DQS_BIAS on IBUFDS_DIFF_OUT_INTERMDISABLE instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", DQS_BIAS);
                          $finish;
                      end
        endcase
         
	 if ((SIM_DEVICE != "7SERIES") &&
        (SIM_DEVICE != "ULTRASCALE")) begin
      $display("Attribute Syntax Error : The attribute SIM_DEVICE on IBUFDS_DIFF_OUT_INTERMDISABLE instance %m is set to %s.  Legal values for this attribute are 7SERIES or ULTRASCALE.", SIM_DEVICE);
         $finish;
         end

        case (DIFF_TERM)

            "TRUE", "FALSE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute DIFF_TERM on IBUFDS_DIFF_OUT_INTERMDISABLE instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", DIFF_TERM);
                          $finish;
                      end

        endcase // case(DIFF_TERM)

        case (IBUF_LOW_PWR)

            "FALSE", "TRUE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute IBUF_LOW_PWR on IBUFDS_DIFF_OUT_INTERMDISABLE instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", IBUF_LOW_PWR);
                          $finish;
                      end

        endcase

    end


    always @(I or IB or DQS_BIAS_BINARY) begin
	if (I == 1'b1 && IB == 1'b0)
	    o_out <= I;
	else if (I == 1'b0 && IB == 1'b1)
	    o_out <= I;
	else if ((I === 1'bz || I == 1'b0) && (IB === 1'bz || IB == 1'b1))
	  if (DQS_BIAS_BINARY == 1'b1)
            o_out <= 1'b0;
          else
            o_out <= 1'bx;
        else if (I == 1'bx || IB == 1'bx)
            o_out <= 1'bx;
    end
 
    generate
       case (SIM_DEVICE)
         "7SERIES" : begin
                        assign out_val = 1'b1;
                        assign out_b_val = 1'b1;
                     end
         "ULTRASCALE" : begin
                        assign out_val = 1'b0;
                        assign out_b_val = 1'bx;
                     end
        endcase
   endgenerate

    generate
       case (USE_IBUFDISABLE)
          "TRUE" :  begin
                       assign O  = (IBUFDISABLE == 0)? o_out  : (IBUFDISABLE == 1)? out_val  : 1'bx;
                       assign OB = (IBUFDISABLE == 0)? ~o_out : (IBUFDISABLE == 1)? out_b_val  : 1'bx;
                    end
          "FALSE" : begin
                       assign O  =  o_out;
                       assign OB =  ~o_out;
                    end
       endcase
    endgenerate

`ifdef XIL_TIMING
    specify
        (I => O)                = (0:0:0,  0:0:0);
        (I => OB)               = (0:0:0,  0:0:0);
        (IB => O)               = (0:0:0,  0:0:0);
        (IB => OB)              = (0:0:0,  0:0:0);
        (IBUFDISABLE => O)      = (0:0:0,  0:0:0);
        (IBUFDISABLE => OB)     = (0:0:0,  0:0:0);
        (INTERMDISABLE => O)    = (0:0:0,  0:0:0);
        (INTERMDISABLE => OB)   = (0:0:0,  0:0:0);
        specparam PATHPULSE$ = 0;
    endspecify
`endif // `ifdef XIL_TIMING

endmodule

`endcelldefine
