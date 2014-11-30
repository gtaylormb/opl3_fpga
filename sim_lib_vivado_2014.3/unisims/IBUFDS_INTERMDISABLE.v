// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2011 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                  Differential Signaling Input Buffer
// /___/   /\     Filename : IBUFDS_INTERMDISABLE.v
// \   \  /  \
//  \___\/\___\
//
// Revision:
//    04/20/11 - Initial version.
//    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
//    08/31/11 - CR 623170 -- added attribute USE_IBUFDISABLE
//    09/20/11 - CR 624774, 625725 -- Removed attributes IBUF_DELAY_VALUE, IFD_DELAY_VALUE and CAPACITANCE 
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    07/13/12 - 669215 - add parameter DQS_BIAS
//    08/29/12 - 675511 - add DQS_BIAS functionality
//    09/11/12 - 677753 - remove X glitch on O
// End Revision

`timescale 1 ps / 1 ps

`celldefine

module IBUFDS_INTERMDISABLE (O, I, IB, IBUFDISABLE, INTERMDISABLE);

`ifdef XIL_TIMING
  parameter LOC = "UNPLACED";
`endif // `ifdef XIL_TIMING
  parameter DIFF_TERM = "FALSE";
  parameter DQS_BIAS = "FALSE";
  parameter IBUF_LOW_PWR = "TRUE";
  parameter IOSTANDARD = "DEFAULT";
  parameter SIM_DEVICE = "7SERIES";
  parameter USE_IBUFDISABLE = "TRUE";

  localparam MODULE_NAME = "IBUFDS_INTERMDISABLE";


    output O;

    input  I;
    input  IB;
    input  IBUFDISABLE;
    input  INTERMDISABLE;

    wire i_in, ib_in, ibufdisable_in, intermdisable_in;
    reg o_out;
    wire out_val;

    reg DQS_BIAS_BINARY = 1'b0;
    reg USE_IBUFDISABLE_BINARY = 1'b0;

    assign O =  (USE_IBUFDISABLE_BINARY == 1'b0) ? o_out :
                ((ibufdisable_in === 1'b1) ? out_val : ((ibufdisable_in === 1'b0) ? o_out : 1'bx));

    assign i_in = I;
    assign ib_in = IB;
    assign ibufdisable_in = IBUFDISABLE;
    assign intermdisable_in = INTERMDISABLE;

    initial begin

        case (DQS_BIAS)

            "TRUE"  : DQS_BIAS_BINARY <= #1 1'b1;
            "FALSE" : DQS_BIAS_BINARY <= #1 1'b0;
            default : begin
                          $display("Attribute Syntax Error : The attribute DQS_BIAS on %s instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", MODULE_NAME, DQS_BIAS);
                          $finish;
                      end

        endcase

	case (DIFF_TERM)

            "TRUE", "FALSE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute DIFF_TERM on %s instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", MODULE_NAME, DIFF_TERM);
                          $finish;
                      end

	endcase // case(DIFF_TERM)

        case (IBUF_LOW_PWR)

            "FALSE", "TRUE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute IBUF_LOW_PWR on %s instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", MODULE_NAME, IBUF_LOW_PWR);
                          $finish;
                      end

        endcase

        case (USE_IBUFDISABLE)

            "TRUE"  : USE_IBUFDISABLE_BINARY <= #1 1'b1;
            "FALSE" : USE_IBUFDISABLE_BINARY <= #1 1'b0;
            default : begin
                          $display("Attribute Syntax Error : The attribute USE_IBUFDISABLE on %s instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", MODULE_NAME, USE_IBUFDISABLE);
                          $finish;
                      end

        endcase
	 if ((SIM_DEVICE != "7SERIES") &&
        (SIM_DEVICE != "ULTRASCALE")) begin
      $display("Attribute Syntax Error : The attribute SIM_DEVICE on %s instance %m is set to %s.  Legal values for this attribute are 7SERIES or ULTRASCALE.", MODULE_NAME,SIM_DEVICE);
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

    always @(i_in or ib_in or DQS_BIAS_BINARY) begin
        if (i_in == 1'b1 && ib_in == 1'b0)
          o_out <= 1'b1;
        else if (i_in == 1'b0 && ib_in == 1'b1)
          o_out <= 1'b0;
        else if ((i_in === 1'bz || i_in == 1'b0) && (ib_in === 1'bz || ib_in == 1'b1))
          if (DQS_BIAS_BINARY == 1'b1)
            o_out <= 1'b0;
          else
            o_out <= 1'bx;
        else if ((i_in === 1'bx) || (ib_in === 1'bx))
          o_out <= 1'bx;
        end

`ifdef XIL_TIMING
    specify
        (I => O)                = (0:0:0,  0:0:0);
        (IB => O)               = (0:0:0,  0:0:0);
        (IBUFDISABLE => O)      = (0:0:0,  0:0:0);
        (INTERMDISABLE => O)    = (0:0:0,  0:0:0);
        specparam PATHPULSE$ = 0;
    endspecify
`endif // `ifdef XIL_TIMING

endmodule

`endcelldefine
