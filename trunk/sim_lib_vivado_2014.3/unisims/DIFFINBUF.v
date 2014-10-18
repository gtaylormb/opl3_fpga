///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        _no_description_
// /___/   /\      Filename    : DIFFINBUF.v
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

module DIFFINBUF #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DIFF_TERM = "FALSE",
  parameter DQS_BIAS = "FALSE",
  parameter IBUF_LOW_PWR = "TRUE",
  parameter ISTANDARD = "UNUSED",
  parameter integer SIM_INPUT_BUFFER_OFFSET = 0
)(
  output O,
  output O_B,

  input DIFF_IN_N,
  input DIFF_IN_P,
  input [3:0] OSC,
  input [1:0] OSC_EN,
  input VREF
);
  
// define constants
  localparam MODULE_NAME = "DIFFINBUF";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  localparam DIFF_TERM_FALSE = 0;
  localparam DIFF_TERM_TRUE = 1;
  localparam DQS_BIAS_FALSE = 0;
  localparam DQS_BIAS_TRUE = 1;
  localparam IBUF_LOW_PWR_FALSE = 1;
  localparam IBUF_LOW_PWR_TRUE = 0;

// include dynamic registers - XILINX test only
  reg trig_attr = 1'b0;
  localparam [40:1] DIFF_TERM_REG = DIFF_TERM;
  localparam [40:1] DQS_BIAS_REG = DQS_BIAS;
  localparam [40:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
  localparam integer SIM_INPUT_BUFFER_OFFSET_REG = SIM_INPUT_BUFFER_OFFSET;
  
  wire DIFF_TERM_BIN;
  wire DQS_BIAS_BIN;
  wire IBUF_LOW_PWR_BIN;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;
  tri0 glblGSR = glbl.GSR;

  reg O_B_out;
  reg O_out;
  reg O_OSC_in;
  reg O_B_OSC_in;

  wire O_B_delay;
  wire O_delay;

  wire DIFF_IN_N_in;
  wire DIFF_IN_P_in;
  wire VREF_in;
  wire [1:0] OSC_EN_in;
  wire [3:0] OSC_in;

  wire DIFF_IN_N_delay;
  wire DIFF_IN_P_delay;
  wire VREF_delay;
  wire [1:0] OSC_EN_delay;
  wire [3:0] OSC_delay;

  assign #(out_delay) O = O_delay;
  assign #(out_delay) O_B = O_B_delay;


// inputs with no timing checks
  assign #(in_delay) DIFF_IN_N_delay = DIFF_IN_N;
  assign #(in_delay) DIFF_IN_P_delay = DIFF_IN_P;
  assign #(in_delay) OSC_EN_delay = OSC_EN;
  assign #(in_delay) OSC_delay = OSC;
  assign #(in_delay) VREF_delay = VREF;

  assign O_B_delay = (OSC_EN_in === 2'b11) ? O_B_OSC_in : (OSC_EN_in === 2'b10 || OSC_EN_in === 2'b01) ? 1'bx : O_B_out;
  assign O_delay = (OSC_EN_in === 2'b11) ? O_OSC_in : (OSC_EN_in === 2'b10 || OSC_EN_in === 2'b01) ? 1'bx : O_out;

  assign DIFF_IN_N_in = DIFF_IN_N_delay;
  assign DIFF_IN_P_in = DIFF_IN_P_delay;
  assign OSC_EN_in = OSC_EN_delay;
  assign OSC_in = OSC_delay;
  assign VREF_in = VREF_delay;
  integer OSC_int = 0; 

  always @ (OSC_in or OSC_EN_in) begin
   OSC_int = OSC_in[2:0] * 5;
   if (OSC_in[3] == 1'b0 )
      OSC_int =  -1*OSC_int;

   if(OSC_EN_in === 2'b11) begin
    if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) < 0) begin
        O_OSC_in <= 1'b0;
        O_B_OSC_in <= 1'b1;
    end	
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) > 0) begin  
        O_OSC_in <= 1'b1;
        O_B_OSC_in <= 1'b0;
    end	
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) == 0) begin
        O_OSC_in <= ~O_OSC_in;
        O_B_OSC_in <= ~O_B_OSC_in;
    end	
   end
  end

  initial begin
    if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) < 0) begin
        O_OSC_in <= 1'b0;
        O_B_OSC_in <= 1'b1;
    end	
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) > 0) begin  
        O_OSC_in <= 1'b1;
        O_B_OSC_in <= 1'b0;
    end	
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) == 0) begin
        O_OSC_in <= 1'bx;
        O_B_OSC_in <= 1'bx;
    end	
  end

  assign DIFF_TERM_BIN =
    (DIFF_TERM_REG == "FALSE") ? DIFF_TERM_FALSE :
    (DIFF_TERM_REG == "TRUE")  ? DIFF_TERM_TRUE  :
     DIFF_TERM_FALSE;

  assign DQS_BIAS_BIN =
    (DQS_BIAS_REG == "FALSE") ? DQS_BIAS_FALSE :
    (DQS_BIAS_REG == "TRUE") ? DQS_BIAS_TRUE :
     DQS_BIAS_FALSE;

  assign IBUF_LOW_PWR_BIN =
    (IBUF_LOW_PWR_REG == "TRUE") ? IBUF_LOW_PWR_TRUE :
    (IBUF_LOW_PWR_REG == "FALSE") ? IBUF_LOW_PWR_FALSE :
     IBUF_LOW_PWR_TRUE;

`ifndef XIL_TIMING
  initial begin
    $display("Error: [Unisim %s-106] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    $finish;
  end
`endif

  initial begin
    #1;
    trig_attr = ~trig_attr;
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
         ((SIM_INPUT_BUFFER_OFFSET_REG < -50) || (SIM_INPUT_BUFFER_OFFSET_REG > 50))) begin
      $display("Error: [Unisim %s-111] SIM_INPUT_BUFFER_OFFSET attribute is set to %d.  Legal values for this attribute are -50 to 50. Instance: %m", MODULE_NAME, SIM_INPUT_BUFFER_OFFSET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         (DIFF_TERM_REG != "TRUE" && DIFF_TERM_REG != "FALSE")) begin
  $display("Error: [Unisim %s-101] DIFF_TERM attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. . Instance: %m", MODULE_NAME, DIFF_TERM_REG);
  attr_err = 1'b1;
end

    if ((attr_test == 1'b1) ||
        ((DQS_BIAS_REG != "FALSE") &&
         (DQS_BIAS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] DQS_BIAS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DQS_BIAS_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IBUF_LOW_PWR_REG != "TRUE") &&
         (IBUF_LOW_PWR_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-104] IBUF_LOW_PWR attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, IBUF_LOW_PWR_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

  always @(DIFF_IN_P_in or DIFF_IN_N_in or DQS_BIAS_BIN) begin
      if (DIFF_IN_P_in == 1'b1 && DIFF_IN_N_in == 1'b0) begin
        O_out <= 1'b1;
        O_B_out <= 1'b0;
      end	
      else if (DIFF_IN_P_in == 1'b0 && DIFF_IN_N_in == 1'b1) begin
        O_out <= 1'b0;
        O_B_out <= 1'b1;
      end
      else if ((DIFF_IN_P_in === 1'bz || DIFF_IN_P_in == 1'b0) && (DIFF_IN_N_in === 1'bz || DIFF_IN_N_in == 1'b1)) begin
        if (DQS_BIAS_BIN == 1'b1) begin
          O_out <= 1'b0;
          O_B_out <= 1'b1;
	end  
        else begin
          O_out <= 1'bx;
          O_B_out <= 1'bx;
	end
      end	
      else if ((DIFF_IN_P_in === 1'bx) || (DIFF_IN_N_in === 1'bx)) begin
          O_out <= 1'bx;
          O_B_out <= 1'bx;
      end
  //    O_out <= DIFF_IN_P_in;
  //    O_B_out <= DIFF_IN_N_in; 
  end

  specify
    (DIFF_IN_N => O) = (0:0:0, 0:0:0);
    (DIFF_IN_N => O_B) = (0:0:0, 0:0:0);
    (DIFF_IN_P => O) = (0:0:0, 0:0:0);
    (DIFF_IN_P => O_B) = (0:0:0, 0:0:0);
    (OSC_EN *> O) = (0:0:0, 0:0:0);
    (OSC_EN *> O_B) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
