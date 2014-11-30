///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2014.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Bidirectional I/O Buffer with Offset Calibration and VREF Tuning
// /___/   /\      Filename    : IOBUFE3.v
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

module IOBUFE3 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer DRIVE = 12,
  parameter IBUF_LOW_PWR = "TRUE",
  parameter IOSTANDARD = "DEFAULT",
  parameter integer SIM_INPUT_BUFFER_OFFSET = 0,
  parameter USE_IBUFDISABLE = "FALSE"
)(
  output O,

  inout IO,

  input DCITERMDISABLE,
  input I,
  input IBUFDISABLE,
  input [3:0] OSC,
  input OSC_EN,
  input T,
  input VREF
);
  
// define constants
  localparam MODULE_NAME = "IOBUFE3";
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
  localparam [4:0] DRIVE_REG = DRIVE;
  localparam [40:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
  localparam integer SIM_INPUT_BUFFER_OFFSET_REG = SIM_INPUT_BUFFER_OFFSET;
  localparam [40:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;

  wire [4:0] DRIVE_BIN;
  wire IBUF_LOW_PWR_BIN;
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

  wire DCITERMDISABLE_in;
  wire IBUFDISABLE_in;
  wire I_in;
  wire IO_in;
  wire IO_out;
  wire OSC_EN_in;
  wire T_in;
  wire VREF_in;
  wire [3:0] OSC_in;

  wire DCITERMDISABLE_delay;
  wire IBUFDISABLE_delay;
  wire I_delay;
  wire OSC_EN_delay;
  wire T_delay;
  wire IO_delay_O;
  wire IO_delay_I;
  wire VREF_delay;
  wire [3:0] OSC_delay;

  assign #(out_delay) O = O_delay;


// inputs with no timing checks
  assign #(in_delay) DCITERMDISABLE_delay = DCITERMDISABLE;
  assign #(in_delay) IBUFDISABLE_delay = IBUFDISABLE;
  assign #(in_delay) I_delay = I;
  assign #(in_delay) IO_delay_I = IO;
  assign #(in_delay) IO = IO_delay_O; 
  assign #(in_delay) OSC_EN_delay = OSC_EN;
  assign #(in_delay) OSC_delay = OSC;
  assign #(in_delay) T_delay = T;
  assign #(in_delay) VREF_delay = VREF;

  assign O_delay = O_out;
  assign IO_delay_O = IO_out;

  assign DCITERMDISABLE_in = DCITERMDISABLE_delay;
  assign IBUFDISABLE_in = IBUFDISABLE_delay;
  assign I_in = I_delay;
  assign IO_in = IO_delay_I;    
  assign OSC_EN_in = OSC_EN_delay;
  assign OSC_in = OSC_delay;
  assign T_in = T_delay;
  assign VREF_in = VREF_delay;
  wire not_t_or_ibufdisable;

  wire ts;
  integer OSC_int = 0;

  tri0 GTS = glbl.GTS;

  or O1 (ts, GTS, T_in);
  bufif0 T1 (IO_out, I_in, ts);

  assign not_t_or_ibufdisable = ~T_in || IBUFDISABLE_in;

  generate
       case (USE_IBUFDISABLE_REG)
          "TRUE" :  begin
              assign O_out = (not_t_or_ibufdisable == 0)? (OSC_EN_in) ? O_OSC_in : IO_in : (not_t_or_ibufdisable == 1 && OSC_EN_in != 1)? 1'b0  : 1'bx;
              end
          "FALSE"  : begin
  	      assign O_out = (OSC_EN_in) ? O_OSC_in : IO_in;
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

  assign DRIVE_BIN = DRIVE_REG;

  assign IBUF_LOW_PWR_BIN =
    (IBUF_LOW_PWR_REG == "TRUE") ? IBUF_LOW_PWR_TRUE :
    (IBUF_LOW_PWR_REG == "FALSE") ? IBUF_LOW_PWR_FALSE :
     IBUF_LOW_PWR_TRUE;

  assign USE_IBUFDISABLE_BIN =
    (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
    (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
     USE_IBUFDISABLE_FALSE;
 
 initial begin
    if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int)< 0)
        O_OSC_in <= 1'b0;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) > 0)  
        O_OSC_in <= 1'b1;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) == 0)
        O_OSC_in <= 1'bx;
  end 

  initial begin
    #1;
    trig_attr = ~trig_attr;
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
         ((DRIVE_REG < 2) || (DRIVE_REG > 24))) begin
      $display("Error: [Unisim %s-101] DRIVE attribute is set to %d.  Legal values for this attribute are 2 to 24. Instance: %m", MODULE_NAME, DRIVE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SIM_INPUT_BUFFER_OFFSET_REG < -50) || (SIM_INPUT_BUFFER_OFFSET_REG > 50))) begin
      $display("Error: [Unisim %s-104] SIM_INPUT_BUFFER_OFFSET attribute is set to %d.  Legal values for this attribute are -50 to 50. Instance: %m", MODULE_NAME, SIM_INPUT_BUFFER_OFFSET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IBUF_LOW_PWR_REG != "TRUE") &&
         (IBUF_LOW_PWR_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-102] IBUF_LOW_PWR attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, IBUF_LOW_PWR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_IBUFDISABLE_REG != "FALSE") &&
         (USE_IBUFDISABLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-106] USE_IBUFDISABLE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end


endmodule

`endcelldefine
