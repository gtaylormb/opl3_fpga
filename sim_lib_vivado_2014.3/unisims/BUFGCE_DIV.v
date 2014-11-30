///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        General Clock Buffer with Divide Function
// /___/   /\      Filename    : BUFGCE_DIV.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    04/30/12 - Initial version.
//    02/28/13 - 703678 - update BUFGCE_DIVIDE attribute type.
//    06/20/13 - 723918 - Add latch on CE to match HW
//    02/06/14 - 717896 - update specify block
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module BUFGCE_DIV #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer BUFGCE_DIVIDE = 1,
  parameter [0:0] IS_CE_INVERTED = 1'b0,
  parameter [0:0] IS_CLR_INVERTED = 1'b0,
  parameter [0:0] IS_I_INVERTED = 1'b0
)(
  output O,

  input CE,
  input CLR,
  input I
);
  
// define constants
  localparam MODULE_NAME = "BUFGCE_DIV";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  localparam BUFGCE_DIVIDE_1 = 0;
  localparam BUFGCE_DIVIDE_2 = 1;
  localparam BUFGCE_DIVIDE_3 = 2;
  localparam BUFGCE_DIVIDE_4 = 3;
  localparam BUFGCE_DIVIDE_5 = 4;
  localparam BUFGCE_DIVIDE_6 = 5;
  localparam BUFGCE_DIVIDE_7 = 6;
  localparam BUFGCE_DIVIDE_8 = 7;

// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
`ifdef XIL_DR
  `include "BUFGCE_DIV_dr.v"
`else
  localparam [3:0] BUFGCE_DIVIDE_REG = BUFGCE_DIVIDE;
  localparam [0:0] IS_CE_INVERTED_REG = IS_CE_INVERTED;
  localparam [0:0] IS_CLR_INVERTED_REG = IS_CLR_INVERTED;
  localparam [0:0] IS_I_INVERTED_REG = IS_I_INVERTED;
`endif

  wire [2:0] BUFGCE_DIVIDE_BIN;
  wire IS_CE_INVERTED_BIN;
  wire IS_CLR_INVERTED_BIN;
  wire IS_I_INVERTED_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;
  tri0 glblGSR = glbl.GSR;

  wire O_out;

  wire O_delay;

  wire CE_in;
  wire CLR_in;
  wire I_in;

  wire CE_delay;
  wire CLR_delay;
  wire I_delay;

  integer clk_count=1, first_toggle_count=1, second_toggle_count=1;
  reg first_rise, first_half_period;
  reg  o_out_divide = 0;
  wire i_ce, i_inv;
  reg ce_en;

  assign #(out_delay) O = O_delay;

`ifdef XIL_TIMING
  reg notifier;
`endif

`ifndef XIL_TIMING // inputs with timing checks
  assign #(inclk_delay) I_delay = I;

  assign #(in_delay) CE_delay = CE;
  assign #(in_delay) CLR_delay = CLR;
`endif

  assign O_delay = O_out;

  assign CE_in = (CE === 1'bz) || (CE_delay ^ IS_CE_INVERTED_BIN); // rv 1
  assign CLR_in = (CLR !== 1'bz) && (CLR_delay ^ IS_CLR_INVERTED_BIN); // rv 0
  assign I_in = I_delay ^ IS_I_INVERTED_BIN;

  assign BUFGCE_DIVIDE_BIN =
    (BUFGCE_DIVIDE_REG == 1) ? BUFGCE_DIVIDE_1 :
    (BUFGCE_DIVIDE_REG == 2) ? BUFGCE_DIVIDE_2 :
    (BUFGCE_DIVIDE_REG == 3) ? BUFGCE_DIVIDE_3 :
    (BUFGCE_DIVIDE_REG == 4) ? BUFGCE_DIVIDE_4 :
    (BUFGCE_DIVIDE_REG == 5) ? BUFGCE_DIVIDE_5 :
    (BUFGCE_DIVIDE_REG == 6) ? BUFGCE_DIVIDE_6 :
    (BUFGCE_DIVIDE_REG == 7) ? BUFGCE_DIVIDE_7 :
    (BUFGCE_DIVIDE_REG == 8) ? BUFGCE_DIVIDE_8 :
     BUFGCE_DIVIDE_1;

  assign IS_CE_INVERTED_BIN = IS_CE_INVERTED_REG;

  assign IS_CLR_INVERTED_BIN = IS_CLR_INVERTED_REG;

  assign IS_I_INVERTED_BIN = IS_I_INVERTED_REG;

  initial begin
    #1;
    trig_attr = ~trig_attr;
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((BUFGCE_DIVIDE_REG != 1) &&
         (BUFGCE_DIVIDE_REG != 2) &&
         (BUFGCE_DIVIDE_REG != 3) &&
         (BUFGCE_DIVIDE_REG != 4) &&
         (BUFGCE_DIVIDE_REG != 5) &&
         (BUFGCE_DIVIDE_REG != 6) &&
         (BUFGCE_DIVIDE_REG != 7) &&
         (BUFGCE_DIVIDE_REG != 8))) begin
      $display("Error: [Unisim %s-101] BUFGCE_DIVIDE attribute is set to %d.  Legal values for this attribute are 1, 2, 3, 4, 5, 6, 7 or 8. Instance: %m", MODULE_NAME, BUFGCE_DIVIDE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CE_INVERTED_REG !== 1'b0) && (IS_CE_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-102] IS_CE_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CE_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CLR_INVERTED_REG !== 1'b0) && (IS_CLR_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-103] IS_CLR_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CLR_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_I_INVERTED_REG !== 1'b0) && (IS_I_INVERTED_REG !== 1'b1))) begin
      $display("Error: [Unisim %s-104] IS_I_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_I_INVERTED_REG);
      attr_err = 1'b1;
    end

    case (BUFGCE_DIVIDE_REG)
      1 : begin
       first_toggle_count = 1;
       second_toggle_count = 1;
     end
      2 : begin
       first_toggle_count = 2;
       second_toggle_count = 2;
          end
      3 : begin
       first_toggle_count = 2;
       second_toggle_count = 4;
     end
      4 : begin
       first_toggle_count = 4;
       second_toggle_count = 4;
     end
      5 : begin
       first_toggle_count = 4;
       second_toggle_count = 6;
     end
      6 : begin
       first_toggle_count = 6;
       second_toggle_count = 6;
     end
      7 : begin
       first_toggle_count = 6;
       second_toggle_count = 8;
     end
      8 : begin
       first_toggle_count = 8;
       second_toggle_count = 8;
          end
    endcase // case(BUFGCE_DIV)

  if (attr_err == 1'b1) $finish;
  end

  always begin
    if (glblGSR == 1'b1) begin
      assign o_out_divide = 1'b0;
      assign clk_count = 0;
      assign first_rise = 1'b1;
      assign first_half_period = 1'b0;
    end
    else if (glblGSR == 1'b0) begin
      deassign o_out_divide;
      deassign clk_count;
      deassign first_rise;
      deassign first_half_period;
    end
    @(glblGSR);
  end

  assign i_inv = ~I_in;

  always @(glblGSR, CLR_in, I_in, CE_in)
  begin
    if(glblGSR || CLR_in)
      ce_en <= 1'b0;
    else if (~I_in)
      ce_en <= CE_in;
  end

  assign i_ce = I_in & ce_en;

  always @(i_ce or posedge glblGSR or posedge CLR_in) begin
    if (first_toggle_count == 1) begin
      o_out_divide = i_ce;
    end
    else begin
      if(CLR_in == 1'b1 || glblGSR == 1'b1) begin
        o_out_divide = 1'b0;
        clk_count = 1;
        first_half_period = 1'b1;
        first_rise = 1'b1;
      end
      else if(CLR_in == 1'b0 && glblGSR == 1'b0) begin
        if (i_ce == 1'b1 && first_rise == 1'b1) begin
          o_out_divide = 1'b1;
          clk_count = 1;
          first_half_period = 1'b1;
          first_rise = 1'b0;
        end
        else if (clk_count == second_toggle_count && first_half_period == 1'b0) begin
          o_out_divide = ~o_out_divide;
          clk_count = 1;
          first_half_period = 1'b1;
        end
        else if (clk_count == first_toggle_count && first_half_period == 1'b1) begin
          o_out_divide = ~o_out_divide;
          clk_count = 1;
          first_half_period = 1'b0;
        end
        else if (first_rise == 1'b0) begin
          clk_count = clk_count + 1;
        end
      end
    end
  end

//  assign O_out = (period_toggle == 0) ? I_in : o_out_divide;
  assign O_out = o_out_divide;

  specify
    (I => O) = (0:0:0, 0:0:0);
    (negedge CLR => (O +: 0)) = (0:0:0, 0:0:0);
    (posedge CLR => (O +: 0)) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge I, 0:0:0, notifier);
    $period (posedge I, 0:0:0, notifier);
    $recrem ( negedge CLR, negedge I, 0:0:0, 0:0:0, notifier,,, CLR_delay, I_delay);
    $recrem ( negedge CLR, posedge I, 0:0:0, 0:0:0, notifier,,, CLR_delay, I_delay);
    $recrem ( posedge CLR, negedge I, 0:0:0, 0:0:0, notifier,,, CLR_delay, I_delay);
    $recrem ( posedge CLR, posedge I, 0:0:0, 0:0:0, notifier,,, CLR_delay, I_delay);
    $setuphold (negedge I, negedge CE, 0:0:0, 0:0:0, notifier,,, I_delay, CE_delay);
    $setuphold (negedge I, posedge CE, 0:0:0, 0:0:0, notifier,,, I_delay, CE_delay);
    $setuphold (posedge I, negedge CE, 0:0:0, 0:0:0, notifier,,, I_delay, CE_delay);
    $setuphold (posedge I, posedge CE, 0:0:0, 0:0:0, notifier,,, I_delay, CE_delay);
    $width (negedge CLR, 0:0:0, 0, notifier);
    $width (posedge CLR, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
