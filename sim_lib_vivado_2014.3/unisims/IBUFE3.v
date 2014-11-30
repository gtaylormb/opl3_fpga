///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Input Buffer with Offset Calibration and VREF Tuning
// /___/   /\      Filename    : IBUFE3.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module IBUFE3 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter IBUF_LOW_PWR = "TRUE",
  parameter IOSTANDARD = "DEFAULT",
  parameter integer SIM_INPUT_BUFFER_OFFSET = 0,
  parameter USE_IBUFDISABLE = "FALSE"
)(
  output O,

  input I,
  input IBUFDISABLE,
  input [3:0] OSC,
  input OSC_EN,
  input VREF
);
  
// define constants
  localparam MODULE_NAME = "IBUFE3";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  localparam IBUF_LOW_PWR_FALSE = 1;
  localparam IBUF_LOW_PWR_TRUE = 0;
  localparam USE_IBUFDISABLE_FALSE = 0;
  localparam USE_IBUFDISABLE_TRUE = 1;

// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
  localparam [40:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
  localparam integer SIM_INPUT_BUFFER_OFFSET_REG = SIM_INPUT_BUFFER_OFFSET;
  localparam [40:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;

  wire IBUF_LOW_PWR_BIN;
  wire [6:0] SIM_INPUT_BUFFER_OFFSET_BIN;
  wire USE_IBUFDISABLE_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;
  tri0 glblGSR = glbl.GSR;

  wire O_out;
  reg O_OSC_in;

  wire O_delay;

  wire IBUFDISABLE_in;
  wire I_in;
  wire OSC_EN_in;
  wire VREF_in;
  wire [3:0] OSC_in;

  wire IBUFDISABLE_delay;
  wire I_delay;
  wire OSC_EN_delay;
  wire VREF_delay;
  wire [3:0] OSC_delay;

  assign #(out_delay) O = O_delay;


// inputs with no timing checks
  assign #(in_delay) IBUFDISABLE_delay = IBUFDISABLE;
  assign #(in_delay) I_delay = I;
  assign #(in_delay) OSC_EN_delay = OSC_EN;
  assign #(in_delay) OSC_delay = OSC;
  assign #(in_delay) VREF_delay = VREF;

  assign O_delay = O_out;

  assign IBUFDISABLE_in = IBUFDISABLE_delay;
  assign I_in = I_delay;
  assign OSC_EN_in = OSC_EN_delay;
  assign OSC_in = OSC_delay;
  assign VREF_in = VREF_delay;

  integer OSC_int = 0;
  generate
       case (USE_IBUFDISABLE_REG)
          "TRUE" :  begin
              assign O_out = (IBUFDISABLE_in == 0)? (OSC_EN_in) ? O_OSC_in : I_in : (IBUFDISABLE_in == 1 && OSC_EN_in != 1)? 1'b0  : 1'bx;
              end
          "FALSE"  : begin
  	      assign O_out = (OSC_EN_in) ? O_OSC_in : I_in;
              end
       endcase
  endgenerate
 
  
  always @ (OSC_in or OSC_EN_in) begin
      OSC_int = OSC_in[2:0] * 5;
  if (OSC_in[3] == 1'b0 )
      OSC_int =  -1*OSC_int;
  
   if(OSC_EN_in == 1'b1) begin
    if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) < 0)
        O_OSC_in <= 1'b0;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) > 0)  
        O_OSC_in <= 1'b1;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) == 0)
        O_OSC_in <= ~O_OSC_in;
   end
  end


  assign IBUF_LOW_PWR_BIN =
    (IBUF_LOW_PWR_REG == "TRUE") ? IBUF_LOW_PWR_TRUE :
    (IBUF_LOW_PWR_REG == "FALSE") ? IBUF_LOW_PWR_FALSE :
     IBUF_LOW_PWR_TRUE;

  assign SIM_INPUT_BUFFER_OFFSET_BIN = SIM_INPUT_BUFFER_OFFSET_REG;

  assign USE_IBUFDISABLE_BIN =
    (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
    (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
     USE_IBUFDISABLE_FALSE;

  initial begin
    #1;
    trig_attr = ~trig_attr;
  end
  initial begin
    if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int)< 0)
        O_OSC_in <= 1'b0;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) > 0)  
        O_OSC_in <= 1'b1;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) == 0)
        O_OSC_in <= 1'bx;

  end 
  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
         ((SIM_INPUT_BUFFER_OFFSET_REG < -50) || (SIM_INPUT_BUFFER_OFFSET_REG > 50))) begin
      $display("Error: [Unisim %s-103] SIM_INPUT_BUFFER_OFFSET attribute is set to %d.  Legal values for this attribute are -50 to 50. Instance: %m", MODULE_NAME, SIM_INPUT_BUFFER_OFFSET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IBUF_LOW_PWR_REG != "TRUE") &&
         (IBUF_LOW_PWR_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-101] IBUF_LOW_PWR attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, IBUF_LOW_PWR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_IBUFDISABLE_REG != "FALSE") &&
         (USE_IBUFDISABLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-104] USE_IBUFDISABLE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end


endmodule

`endcelldefine
