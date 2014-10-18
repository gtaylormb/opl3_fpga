///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2011 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  3-State Diffential Signaling I/O Buffer
// /___/   /\     Filename : IOBUFDS_DIFF_OUT_INTERMDISABLE.v
// \   \  /  \    Timestamp : Wed Apr 20 17:49:56 PDT 2011
//  \___\/\___\
//
// Revision:
//    04/20/11 - Initial version.
//    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
//    08/31/11 - CR 623170 -- Tristate powergating support
//    09/20/11 - CR 625564 -- Fixed Tristate powergating polarity
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision

`timescale  1 ps / 1 ps


`celldefine

module IOBUFDS_DIFF_OUT_INTERMDISABLE (O, OB, IO, IOB, I, IBUFDISABLE, INTERMDISABLE, TM, TS);

    parameter DIFF_TERM = "FALSE";
    parameter DQS_BIAS = "FALSE";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";
    parameter SIM_DEVICE = "7SERIES";
    parameter USE_IBUFDISABLE = "TRUE";
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif // `ifdef XIL_TIMING

    output O;
    output OB;
    inout  IO;
    inout  IOB;
    input  I;
    input  IBUFDISABLE;
    input  INTERMDISABLE;
    input  TM;
    input  TS;

    wire t1, t2,out_val,out_b_val;
    wire T_OR_IBUFDISABLE_1;
    wire T_OR_IBUFDISABLE_2;
    reg DQS_BIAS_BINARY = 1'b0;

    tri0 GTS = glbl.GTS;

    or O1 (t1, GTS, TM);
    bufif0 B1 (IO, I, t1);

    or O2 (t2, GTS, TS);
    notif0 N2 (IOB, I, t2);

    reg O_int, OB_int;

    initial begin
	
        case (DIFF_TERM)

            "TRUE", "FALSE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute DIFF_TERM on IOBUFDS_DIFF_OUT_INTERMDISABLE instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", DIFF_TERM);
                          $finish;
                      end

        endcase // case(DIFF_TERM)
        case (IBUF_LOW_PWR)

            "FALSE", "TRUE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute IBUF_LOW_PWR on IOBUFDS_DIFF_OUT_INTERMDISABLE instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", IBUF_LOW_PWR);
                          $finish;
                      end

        endcase
	case (DQS_BIAS)

            "TRUE"  : DQS_BIAS_BINARY <= #1 1'b1;
            "FALSE" : DQS_BIAS_BINARY <= #1 1'b0;
            default : begin
                          $display("Attribute Syntax Error : The attribute DQS_BIAS on IOBUFDS_DIFF_OUT_INTERMDISABLE instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", DQS_BIAS);
                          $finish;
                      end

        endcase

     if ((SIM_DEVICE != "7SERIES") &&
        (SIM_DEVICE != "ULTRASCALE")) begin
      $display("Attribute Syntax Error : The attribute SIM_DEVICE on IOBUFDS_DIFF_OUT_INTERMDISABLE instance %m is set to %s.  Legal values for this attribute are 7SERIES or ULTRASCALE.",SIM_DEVICE);
         $finish;
         end

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

    always @(IO or IOB or DQS_BIAS_BINARY) begin
        if (IO == 1'b1 && IOB == 1'b0) begin
            O_int  <= IO;
            OB_int <= ~IO;
        end
        else if (IO == 1'b0 && IOB == 1'b1) begin
            O_int  <= IO;
            OB_int <= ~IO;
        end
	else if ((IO === 1'bz || IO == 1'b0) && (IOB === 1'bz || IOB == 1'b1)) begin
          if (DQS_BIAS_BINARY == 1'b1) begin
            O_int <= 1'b0;
            OB_int <= 1'b1;
          end else begin
            O_int <= 1'bx;
            OB_int <= 1'bx;
          end
        end
        else begin
            O_int  <= 1'bx;
            OB_int <= 1'bx;
        end
    end

    generate
       case (USE_IBUFDISABLE)
          "TRUE" :  begin
                       assign T_OR_IBUFDISABLE_1 = ~TM || IBUFDISABLE;
                       assign T_OR_IBUFDISABLE_2 = ~TS || IBUFDISABLE;
                       assign O = (T_OR_IBUFDISABLE_1 == 1'b1) ? out_val : (T_OR_IBUFDISABLE_1 == 1'b0) ? O_int : 1'bx;
                       assign OB = (T_OR_IBUFDISABLE_2 == 1'b1) ? out_b_val : (T_OR_IBUFDISABLE_2 == 1'b0) ? OB_int : 1'bx;
                    end
          "FALSE" : begin
                        assign O = O_int;
                        assign OB = OB_int;
                    end
       endcase
    endgenerate
`ifdef XIL_TIMING
    specify
        (I => O)                = (0:0:0,  0:0:0);
        (I => OB)               = (0:0:0,  0:0:0);
        (I => IO)               = (0:0:0,  0:0:0);
        (I => IOB)              = (0:0:0,  0:0:0);
        (IO => O)               = (0:0:0,  0:0:0);
        (IO => OB)              = (0:0:0,  0:0:0);
        (IO => IOB)             = (0:0:0,  0:0:0);
        (IOB => O)              = (0:0:0,  0:0:0);
        (IOB => OB)             = (0:0:0,  0:0:0);
        (IOB => IO)             = (0:0:0,  0:0:0);
        (IBUFDISABLE => O)      = (0:0:0,  0:0:0);
        (IBUFDISABLE => OB)     = (0:0:0,  0:0:0);
        (IBUFDISABLE => IO)     = (0:0:0,  0:0:0);
        (IBUFDISABLE => IOB)    = (0:0:0,  0:0:0);
        (INTERMDISABLE => O)    = (0:0:0,  0:0:0);
        (INTERMDISABLE => OB)   = (0:0:0,  0:0:0);
        (INTERMDISABLE => IO)   = (0:0:0,  0:0:0);
        (INTERMDISABLE => IOB)  = (0:0:0,  0:0:0);
        (TM => O)               = (0:0:0,  0:0:0);
        (TM => OB)              = (0:0:0,  0:0:0);
        (TM => IO)              = (0:0:0,  0:0:0);
        (TM => IOB)             = (0:0:0,  0:0:0);
        (TS => O)               = (0:0:0,  0:0:0);
        (TS => OB)              = (0:0:0,  0:0:0);
        (TS => IO)              = (0:0:0,  0:0:0);
        (TS => IOB)             = (0:0:0,  0:0:0);
        specparam PATHPULSE$ = 0;
    endspecify
`endif // `ifdef XIL_TIMING

endmodule

`endcelldefine
