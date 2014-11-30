// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/unisims/IBUFDS_DIFF_OUT.v,v 1.10 2010/11/03 22:31:02 fphillip Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Differential Signaling Input Buffer with Differential Outputs
// /___/   /\     Filename : IBUFDS_DIFF_OUT.v
// \   \  /  \    Timestamp : Thu Mar 25 16:42:23 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.
//    05/13/08 - CR 458290 -- Added else condition to handle x case.
//    02/10/09 - CR 430124 -- Added attribute DIFF_TERM.
//    06/02/09 - CR 523083 -- Added attribute IBUF_LOW_PWR.
//    11/03/10 - CR 576577 -- changed default value of IOSTANDARD from LVDS_25 to DEFAULT.
//    09/30/11 - CR 626400 -- Added PATHPULSE 
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision

`timescale  1 ps / 1 ps


`celldefine

module IBUFDS_DIFF_OUT (O, OB, I, IB);

    parameter DIFF_TERM = "FALSE";
    parameter DQS_BIAS = "FALSE";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";
`ifdef XIL_TIMING
    parameter LOC = " UNPLACED";
`endif
    output O, OB;

    input  I, IB;

    reg  o_out;
    reg DQS_BIAS_BINARY = 1'b0;


    buf B0 (O, o_out);
    not B1 (OB, o_out);

    initial begin
        case (DIFF_TERM)

            "TRUE", "FALSE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute DIFF_TERM on IBUFDS_DIFF_OUT instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", DIFF_TERM);
                          $finish;
                      end

        endcase // case(DIFF_TERM)

        case (IBUF_LOW_PWR)

            "FALSE", "TRUE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute IBUF_LOW_PWR on IBUFDS_DIFF_OUT instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", IBUF_LOW_PWR);
                          $finish;
                      end

        endcase
        case (DQS_BIAS)

            "TRUE"  : DQS_BIAS_BINARY <= #1 1'b1;
            "FALSE" : DQS_BIAS_BINARY <= #1 1'b0;
            default : begin
                          $display("Attribute Syntax Error : The attribute DQS_BIAS on IBUFDS_DIFF_OUT instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", DQS_BIAS);
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

    `ifdef XIL_TIMING

        specify
            (I => O) = (0:0:0, 0:0:0);
            (I => OB) = (0:0:0, 0:0:0);
            (IB => O) = (0:0:0, 0:0:0);
            (IB => OB) = (0:0:0, 0:0:0);
            specparam PATHPULSE$ = 0;
        endspecify

    `endif
endmodule

`endcelldefine
