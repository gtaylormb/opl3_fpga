///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 2011 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \   \   \/      Version     : 2012.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        
// /___/   /\      Filename    : BUFGCTRL.v
// \   \  /  \ 
//  \___\/\___\                    
//                                 
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  06272013 723696 - dynamic register change
//  02062014 771896 - specify block update
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

`celldefine
module BUFGCTRL #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",  
  `endif
  parameter integer INIT_OUT = 0,
  parameter [0:0] IS_CE0_INVERTED = 1'b0,
  parameter [0:0] IS_CE1_INVERTED = 1'b0,
  parameter [0:0] IS_I0_INVERTED = 1'b0,
  parameter [0:0] IS_I1_INVERTED = 1'b0,
  parameter [0:0] IS_IGNORE0_INVERTED = 1'b0,
  parameter [0:0] IS_IGNORE1_INVERTED = 1'b0,
  parameter [0:0] IS_S0_INVERTED = 1'b0,
  parameter [0:0] IS_S1_INVERTED = 1'b0,
  parameter PRESELECT_I0 = "FALSE",
  parameter PRESELECT_I1 = "FALSE"
)(
  output O,

  input CE0,
  input CE1,
  input I0,
  input I1,
  input IGNORE0,
  input IGNORE1,
  input S0,
  input S1
);
  
// define constants
  localparam MODULE_NAME = "BUFGCTRL";
  localparam in_delay    = 0;
  localparam out_delay   = 0;
  localparam inclk_delay    = 0;
  localparam outclk_delay   = 0;

// Parameter encodings and registers
  localparam INIT_OUT_0 = 0;
  localparam INIT_OUT_1 = 1;
  localparam PRESELECT_I0_FALSE = 0;
  localparam PRESELECT_I0_TRUE = 1;
  localparam PRESELECT_I1_FALSE = 0;
  localparam PRESELECT_I1_TRUE = 1;

  `ifndef XIL_DR
  localparam [0:0] INIT_OUT_REG = INIT_OUT;
  localparam [0:0] IS_CE0_INVERTED_REG = IS_CE0_INVERTED;
  localparam [0:0] IS_CE1_INVERTED_REG = IS_CE1_INVERTED;
  localparam [0:0] IS_I0_INVERTED_REG = IS_I0_INVERTED;
  localparam [0:0] IS_I1_INVERTED_REG = IS_I1_INVERTED;
  localparam [0:0] IS_IGNORE0_INVERTED_REG = IS_IGNORE0_INVERTED;
  localparam [0:0] IS_IGNORE1_INVERTED_REG = IS_IGNORE1_INVERTED;
  localparam [0:0] IS_S0_INVERTED_REG = IS_S0_INVERTED;
  localparam [0:0] IS_S1_INVERTED_REG = IS_S1_INVERTED;
  localparam [40:1] PRESELECT_I0_REG = PRESELECT_I0;
  localparam [40:1] PRESELECT_I1_REG = PRESELECT_I1;
  `endif

  wire INIT_OUT_BIN;
  wire IS_CE0_INVERTED_BIN;
  wire IS_CE1_INVERTED_BIN;
  wire IS_I0_INVERTED_BIN;
  wire IS_I1_INVERTED_BIN;
  wire IS_IGNORE0_INVERTED_BIN;
  wire IS_IGNORE1_INVERTED_BIN;
  wire IS_S0_INVERTED_BIN;
  wire IS_S1_INVERTED_BIN;
  wire PRESELECT_I0_BIN;
  wire PRESELECT_I1_BIN;

  tri0 glblGSR = glbl.GSR;

  `ifdef XIL_TIMING //Simprim 
  reg notifier;
  `endif
  reg trig_attr = 1'b0;
  reg attr_err = 1'b0;
  
// include dynamic registers - XILINX test only
  `ifdef XIL_DR
  `include "BUFGCTRL_dr.v"
  `endif

  reg O_out;

  wire O_delay;

  wire CE0_in;
  wire CE1_in;
  wire I0_in;
  wire I1_in;
  wire IGNORE0_in;
  wire IGNORE1_in;
  wire S0_in;
  wire S1_in;

  wire CE0_delay;
  wire CE1_delay;
  wire I0_delay;
  wire I1_delay;
  wire IGNORE0_delay;
  wire IGNORE1_delay;
  wire S0_delay;
  wire S1_delay;

  reg q0, q1;
  reg q0_enable, q1_enable;
  reg task_input_ce0, task_input_ce1, task_input_i0;
  reg task_input_i1, task_input_ignore0, task_input_ignore1;
  reg task_input_gsr, task_input_s0, task_input_s1;
    
  wire I0t, I1t;
  
  assign #(out_delay) O = O_delay;

`ifndef XIL_TIMING // inputs with timing checks
  assign #(inclk_delay) I0_delay = I0;
  assign #(inclk_delay) I1_delay = I1;

  assign #(in_delay) CE0_delay = CE0;
  assign #(in_delay) CE1_delay = CE1;
  assign #(in_delay) S0_delay = S0;
  assign #(in_delay) S1_delay = S1;
`endif //  `ifndef XIL_TIMING
// inputs with no timing checks

  assign #(in_delay) IGNORE0_delay = IGNORE0;
  assign #(in_delay) IGNORE1_delay = IGNORE1;

  assign O_delay = O_out;

  assign CE0_in = (CE0 !== 1'bz) && (CE0_delay ^ IS_CE0_INVERTED_BIN); // rv 0
  assign CE1_in = (CE1 !== 1'bz) && (CE1_delay ^ IS_CE1_INVERTED_BIN); // rv 0
  assign I0_in = I0_delay ^ IS_I0_INVERTED_BIN;
  assign I1_in = I1_delay ^ IS_I1_INVERTED_BIN;
  assign IGNORE0_in = (IGNORE0 !== 1'bz) && (IGNORE0_delay ^ IS_IGNORE0_INVERTED_BIN); // rv 0
  assign IGNORE1_in = (IGNORE1 !== 1'bz) && (IGNORE1_delay ^ IS_IGNORE1_INVERTED_BIN); // rv 0
  assign S0_in = (S0 !== 1'bz) && (S0_delay ^ IS_S0_INVERTED_BIN); // rv 0
  assign S1_in = (S1 !== 1'bz) && (S1_delay ^ IS_S1_INVERTED_BIN); // rv 0


  initial begin
  #1;
  trig_attr = ~trig_attr;
  end

  assign INIT_OUT_BIN = 
    (INIT_OUT_REG == 0) ? INIT_OUT_0 :
    (INIT_OUT_REG == 1) ? INIT_OUT_1 :
    INIT_OUT_0;

  assign IS_CE0_INVERTED_BIN = IS_CE0_INVERTED_REG;

  assign IS_CE1_INVERTED_BIN = IS_CE1_INVERTED_REG;

  assign IS_I0_INVERTED_BIN = IS_I0_INVERTED_REG;

  assign IS_I1_INVERTED_BIN = IS_I1_INVERTED_REG;

  assign IS_IGNORE0_INVERTED_BIN = IS_IGNORE0_INVERTED_REG;

  assign IS_IGNORE1_INVERTED_BIN = IS_IGNORE1_INVERTED_REG;

  assign IS_S0_INVERTED_BIN = IS_S0_INVERTED_REG;

  assign IS_S1_INVERTED_BIN = IS_S1_INVERTED_REG;

  assign PRESELECT_I0_BIN =
    (PRESELECT_I0_REG == "FALSE") ? PRESELECT_I0_FALSE :
    (PRESELECT_I0_REG == "TRUE")  ? PRESELECT_I0_TRUE  :
    PRESELECT_I0_FALSE;

  assign PRESELECT_I1_BIN =
    (PRESELECT_I1_REG == "FALSE") ? PRESELECT_I1_FALSE :
    (PRESELECT_I1_REG == "TRUE")  ? PRESELECT_I1_TRUE  :
    PRESELECT_I1_FALSE;

  always @ (trig_attr) begin
    #1;
    if ((INIT_OUT_REG != 0) &&
        (INIT_OUT_REG != 1)) begin
      $display("Attribute Syntax Error : The attribute INIT_OUT on %s instance %m is set to %d.  Legal values for this attribute are  0 to 1.", MODULE_NAME, INIT_OUT_REG);
      attr_err = 1'b1;
    end

    if ((IS_CE0_INVERTED_REG != 1'b0) && (IS_CE0_INVERTED_REG != 1'b1)) begin
      $display("Attribute Syntax Error : The attribute IS_CE0_INVERTED on %s instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", MODULE_NAME, IS_CE0_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((IS_CE1_INVERTED_REG != 1'b0) && (IS_CE1_INVERTED_REG != 1'b1)) begin
      $display("Attribute Syntax Error : The attribute IS_CE1_INVERTED on %s instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", MODULE_NAME, IS_CE1_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((IS_I0_INVERTED_REG != 1'b0) && (IS_I0_INVERTED_REG != 1'b1)) begin
      $display("Attribute Syntax Error : The attribute IS_I0_INVERTED on %s instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", MODULE_NAME, IS_I0_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((IS_I1_INVERTED_REG != 1'b0) && (IS_I1_INVERTED_REG != 1'b1)) begin
      $display("Attribute Syntax Error : The attribute IS_I1_INVERTED on %s instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", MODULE_NAME, IS_I1_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((IS_IGNORE0_INVERTED_REG != 1'b0) && (IS_IGNORE0_INVERTED_REG != 1'b1)) begin
      $display("Attribute Syntax Error : The attribute IS_IGNORE0_INVERTED on %s instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", MODULE_NAME, IS_IGNORE0_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((IS_IGNORE1_INVERTED_REG != 1'b0) && (IS_IGNORE1_INVERTED_REG != 1'b1)) begin
      $display("Attribute Syntax Error : The attribute IS_IGNORE1_INVERTED on %s instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", MODULE_NAME, IS_IGNORE1_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((IS_S0_INVERTED_REG != 1'b0) && (IS_S0_INVERTED_REG != 1'b1)) begin
      $display("Attribute Syntax Error : The attribute IS_S0_INVERTED on %s instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", MODULE_NAME, IS_S0_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((IS_S1_INVERTED_REG != 1'b0) && (IS_S1_INVERTED_REG != 1'b1)) begin
      $display("Attribute Syntax Error : The attribute IS_S1_INVERTED on %s instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", MODULE_NAME, IS_S1_INVERTED_REG);
      attr_err = 1'b1;
    end

    if ((PRESELECT_I0_REG != "FALSE") &&
        (PRESELECT_I0_REG != "TRUE")) begin
      $display("Attribute Syntax Error : The attribute PRESELECT_I0 on %s instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", MODULE_NAME, PRESELECT_I0_REG);
      attr_err = 1'b1;
    end

    if ((PRESELECT_I1_REG != "FALSE") &&
        (PRESELECT_I1_REG != "TRUE")) begin
      $display("Attribute Syntax Error : The attribute PRESELECT_I1 on %s instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", MODULE_NAME, PRESELECT_I1_REG);
      attr_err = 1'b1;
    end

// *** both preselects can not be 1 simultaneously.
	 if ((PRESELECT_I0_REG == "TRUE") && (PRESELECT_I1_REG == "TRUE")) begin
      $display("Attribute Syntax Error : The attributes PRESELECT_I0 and PRESELECT_I1 on BUFGCTRL instance %m should not be set to TRUE simultaneously.");
      attr_err = 1'b1;
	 end

  if (attr_err == 1'b1) $finish;
  end


// *** Start here
	assign I0t = INIT_OUT_BIN ^ I0_in;
	assign I1t = INIT_OUT_BIN ^ I1_in;

// *** Input enable for i1
	always @(IGNORE1_in or I1t or S1_in or glblGSR or q0 or PRESELECT_I1_BIN) begin
	    if (glblGSR == 1)
                q1_enable <= PRESELECT_I1_BIN;

	    else if (glblGSR == 0) begin
                if ((I1t == 0) && (IGNORE1_in == 0))
                    q1_enable <= q1_enable;
	        else if ((I1t == 1) || (IGNORE1_in == 1))
                    q1_enable <= (~q0 && S1_in);
	    end
	end

// *** Output q1 for i1
	always @(q1_enable or CE1_in or I1t or IGNORE1_in or glblGSR or PRESELECT_I1_BIN) begin
	    if (glblGSR == 1)
                q1 <= PRESELECT_I1_BIN;

	    else if (glblGSR == 0) begin
	        if ((I1t == 1)&& (IGNORE1_in == 0))
                    q1 <= q1;
	        else if ((I1t == 0) || (IGNORE1_in == 1))
                    q1 <= (CE1_in && q1_enable);
	    end
	end

// *** input enable for i0
	always @(IGNORE0_in or I0t or S0_in or glblGSR or q1 or PRESELECT_I0_BIN) begin
	    if (glblGSR == 1)
                q0_enable <= PRESELECT_I0_BIN;

	    else if (glblGSR == 0) begin
	        if ((I0t == 0) && (IGNORE0_in == 0))
                    q0_enable <= q0_enable;
	        else if ((I0t == 1) || (IGNORE0_in == 1))
                    q0_enable <= (~q1 && S0_in);
	    end
	end

// *** Output q0 for i0
	always @(q0_enable or CE0_in or I0t or IGNORE0_in or glblGSR or PRESELECT_I0_BIN) begin
	    if (glblGSR == 1)
                q0 <= PRESELECT_I0_BIN;

	    else if (glblGSR == 0) begin 
	        if ((I0t == 1) && (IGNORE0_in == 0))
                    q0 <= q0;
	        else if ((I0t == 0) || (IGNORE0_in == 1))
                    q0 <= (CE0_in && q0_enable);
	    end
	end


	always @(q0 or q1 or I0t or I1t) begin 
	    case ({q1, q0})
                2'b01: O_out = I0_in;
                2'b10: O_out = I1_in; 
                2'b00: O_out = INIT_OUT_BIN;
	        2'b11: begin
		           q0 = 1'bx;
		           q1 = 1'bx;
		           q0_enable = 1'bx;
		           q1_enable = 1'bx;
		           O_out = 1'bx;
		       end
            endcase
	end

    specify
        (I0 => O) = (0:0:0, 0:0:0);
        (I1 => O) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge I0, 0:0:0, notifier);
    $period (negedge I1, 0:0:0, notifier);
    $period (posedge I0, 0:0:0, notifier);
    $period (posedge I1, 0:0:0, notifier);
    $setuphold (negedge I0, negedge CE0, 0:0:0, 0:0:0, notifier,,, I0_delay, CE0_delay);
    $setuphold (negedge I0, negedge S0, 0:0:0, 0:0:0, notifier,,, I0_delay, S0_delay);
    $setuphold (negedge I0, posedge CE0, 0:0:0, 0:0:0, notifier,,, I0_delay, CE0_delay);
    $setuphold (negedge I0, posedge S0, 0:0:0, 0:0:0, notifier,,, I0_delay, S0_delay);
    $setuphold (negedge I1, negedge CE1, 0:0:0, 0:0:0, notifier,,, I1_delay, CE1_delay);
    $setuphold (negedge I1, negedge S1, 0:0:0, 0:0:0, notifier,,, I1_delay, S1_delay);
    $setuphold (negedge I1, posedge CE1, 0:0:0, 0:0:0, notifier,,, I1_delay, CE1_delay);
    $setuphold (negedge I1, posedge S1, 0:0:0, 0:0:0, notifier,,, I1_delay, S1_delay);
    $setuphold (posedge I0, negedge CE0, 0:0:0, 0:0:0, notifier,,, I0_delay, CE0_delay);
    $setuphold (posedge I0, negedge S0, 0:0:0, 0:0:0, notifier,,, I0_delay, S0_delay);
    $setuphold (posedge I0, posedge CE0, 0:0:0, 0:0:0, notifier,,, I0_delay, CE0_delay);
    $setuphold (posedge I0, posedge S0, 0:0:0, 0:0:0, notifier,,, I0_delay, S0_delay);
    $setuphold (posedge I1, negedge CE1, 0:0:0, 0:0:0, notifier,,, I1_delay, CE1_delay);
    $setuphold (posedge I1, negedge S1, 0:0:0, 0:0:0, notifier,,, I1_delay, S1_delay);
    $setuphold (posedge I1, posedge CE1, 0:0:0, 0:0:0, notifier,,, I1_delay, CE1_delay);
    $setuphold (posedge I1, posedge S1, 0:0:0, 0:0:0, notifier,,, I1_delay, S1_delay);
`endif
        specparam PATHPULSE$ = 0;
    endspecify

endmodule

`endcelldefine
