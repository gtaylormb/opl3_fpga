// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/versclibs/data/fuji/BUFR.v,v 1.6 2011/08/09 22:45:10 yanx Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.i (O.72)
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                  Regional Clock Buffer
// /___/   /\     Filename : BUFR.v
// \   \  /  \    Timestamp : Thu Mar 11 16:44:06 PST 2005
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    03/11/05 - Added LOC parameter, removed GSR ports and initialized outpus.
//    04/04/2005 - Add SIM_DEVICE paramter to support rainier. CE pin has 4 clock
//                 latency for Virtex 4 and none for Rainier
//    07/25/05 - Updated names to Virtex5
//    08/31/05 - Add ce_en to sensitivity list of i_in which make ce asynch.
//    05/23/06 - Add count =0 and first_rise=1 when CE = 0 (CR232206).
//    07/19/06 - Add wire declaration for undeclared wire signals.
//    04/01/09 - CR 517236 -- Added VIRTEX6 support
//    11/13/09 - Added VIRTEX7
//    01/20/10 - Change VIRTEX7 to FUJI (CR545223)
//    02/23/10 - Use assign for o_out (CR543271)
//    06/09/10 - Change FUJI to 7_SERIES
//    08/18/10 - Change 7_SERIES to 7SERIES (CR571653)
//    08/09/11 - Add 7SERIES  to ce_en logic (CR620544)
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    03/15/12 - Match with hardware (CR 650440)
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module BUFR (O, CE, CLR, I);

    output O;

    input CE;
    input CLR;
    input I;

    parameter BUFR_DIVIDE = "BYPASS";
    parameter SIM_DEVICE = "VIRTEX4";

`ifdef XIL_TIMING

    parameter LOC = "UNPLACED";

`endif

    integer count, period_toggle, half_period_toggle;    
    reg first_rise, half_period_done;
    reg notifier;
    reg  o_out_divide = 0;
    wire o_out;
    reg ce_enable1, ce_enable2, ce_enable3, ce_enable4;
    tri0 GSR = glbl.GSR;
    wire i_in, ce_in, clr_in, gsr_in, ce_en, i_ce;
    
    buf buf_i (i_in, I);
    buf buf_ce (ce_in, CE);
    buf buf_clr (clr_in, CLR);
    buf buf_gsr (gsr_in, GSR);    
    buf buf_o (O, o_out);

    initial begin
  case (BUFR_DIVIDE)
      "BYPASS" : period_toggle = 0;
      "1" : begin 
        period_toggle = 1;
        half_period_toggle = 1;
            end
      "2" : begin 
        period_toggle = 2;
        half_period_toggle = 2;
            end
      "3" : begin 
        period_toggle = 4;
        half_period_toggle = 2;
            end
      "4" : begin
        period_toggle = 4;
        half_period_toggle = 4;
      end
      "5" : begin 
        period_toggle = 6;
        half_period_toggle = 4;
      end
      "6" : begin 
        period_toggle = 6;
        half_period_toggle = 6;
      end
      "7" : begin 
        period_toggle = 8;
        half_period_toggle = 6;
      end
      "8" : begin 
        period_toggle = 8;
        half_period_toggle = 8;
            end
      default : begin 
              $display("Attribute Syntax Error : The attribute BUFR_DIVIDE on BUFR instance %m is set to %s.  Legal values for this attribute are BYPASS, 1, 2, 3, 4, 5, 6, 7 or 8.", BUFR_DIVIDE);
                    $finish;
      end
  endcase // case(BUFR_DIVIDE)

        case (SIM_DEVICE)
           "VIRTEX4" : ;
           "VIRTEX5" : ;
           "VIRTEX6" : ;
           "7SERIES" : ;
      default : begin 
              $display("Attribute Syntax Error : The attribute SIM_DEVICE on BUFR instance %m is set to %s.  Legal values for this attribute are VIRTEX4 or VIRTEX5 or VIRTEX6 or 7SERIES.", SIM_DEVICE);
                    $finish;
      end
        endcase 

    end // initial begin
    

    always @(gsr_in or clr_in)
  if (gsr_in == 1'b1 || clr_in == 1'b1) begin
      assign o_out_divide = 1'b0;
      assign count = 0;
      assign first_rise = 1'b1;
      assign half_period_done = 1'b0;
      if (gsr_in == 1'b1) begin
    assign ce_enable1 = 1'b0;
    assign ce_enable2 = 1'b0;
    assign ce_enable3 = 1'b0;
    assign ce_enable4 = 1'b0;
      end      
  end  
  else if (gsr_in == 1'b0 || clr_in == 1'b0) begin
      deassign o_out_divide;      
      deassign count;
      deassign first_rise;
      deassign half_period_done;
      if (gsr_in == 1'b0) begin
    deassign ce_enable1;
    deassign ce_enable2;
    deassign ce_enable3;
    deassign ce_enable4;
      end    
  end
    

    always @(negedge i_in) 
    begin
  ce_enable1 <= ce_in;
  ce_enable2 <= ce_enable1;
  ce_enable3 <= ce_enable2;
  ce_enable4 <= ce_enable3;
    end

    assign ce_en = ((SIM_DEVICE == "VIRTEX5") || (SIM_DEVICE == "VIRTEX6") || (SIM_DEVICE == "7SERIES")) ? ce_in :  ce_enable4;

    assign i_ce = i_in & ce_en;

  generate
    case (SIM_DEVICE)
      "VIRTEX4" : begin
      always @(i_in or ce_en)
        if (ce_en == 1'b1) begin
      if (i_in == 1'b1 && first_rise == 1'b1) begin
    o_out_divide = 1'b1;
    first_rise = 1'b0;
      end
      else if (count == half_period_toggle && half_period_done == 1'b0) begin
    o_out_divide = ~o_out_divide;
    half_period_done = 1'b1;
          count = 0;  
      end
      else if (count == period_toggle && half_period_done == 1'b1) begin
    o_out_divide = ~o_out_divide;
    half_period_done = 1'b0;
          count = 0;
      end

            if (first_rise == 1'b0)
    count = count + 1;
  end // if (ce_in == 1'b1)
        else begin
           count = 0;
           first_rise = 1;
        end
      end
      "VIRTEX5","VIRTEX6","7SERIES" : begin
       always @(i_ce)
       begin 
           if (i_ce == 1'b1 && first_rise == 1'b1) begin
       o_out_divide = 1'b1;
       first_rise = 1'b0;
     end
     else if (count == half_period_toggle && half_period_done == 1'b0) begin
              o_out_divide = ~o_out_divide;
        half_period_done = 1'b1;
       count = 0;  
     end
     else if (count == period_toggle && half_period_done == 1'b1) begin
       o_out_divide = ~o_out_divide;
       half_period_done = 1'b0;
       count = 0;
           end

          if (first_rise == 1'b0) begin
      count = count + 1;
    end // if (ce_in == 1'b1)
        end   
       end
    endcase
  endgenerate
    
    assign o_out = (period_toggle == 0) ? i_in : o_out_divide;



//*** Timing Checks Start here

    always @(notifier) begin
  o_out_divide <= 1'bx;
    end
    
`ifdef XIL_TIMING
  specify
    (CLR => O) = (0:0:0, 0:0:0);
    (I => O) = (0:0:0, 0:0:0);
    $period (negedge I, 0:0:0, notifier);
    $period (posedge I, 0:0:0, notifier);
    $setuphold (posedge I, posedge CE, 0:0:0, 0:0:0, notifier);
    $setuphold (posedge I, negedge CE, 0:0:0, 0:0:0, notifier);
    $setuphold (negedge I, posedge CE, 0:0:0, 0:0:0, notifier);
    $setuphold (negedge I, negedge CE, 0:0:0, 0:0:0, notifier);
    $width (posedge CLR, 0:0:0, 0, notifier);
    $width (posedge I, 0:0:0, 0, notifier);
    $width (negedge I, 0:0:0, 0, notifier);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule // BUFR

`endcelldefine
