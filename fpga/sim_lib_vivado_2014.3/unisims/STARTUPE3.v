///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2013 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 2013.3
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  User Interface to Global Clock, Reset and 3-State Controls
// /___/   /\     Filename : STARTUPE3.v
// \   \  /  \    Timestamp : Tue Jul  9 16:30:16 PDT 2013
//  \___\/\___\
//
// Revision:
//    07/12/13 - Initial version.
//    02/06/14 - Fixed tristate of USRCCLKTS (CR 766066).
//    04/15/14 - Updated FCSBO, DO and DI to connect to glbl (CR 763244).
//    05/27/14 - New simulation library message format.
// End Revision

`timescale 1 ps / 1 ps

`celldefine

module STARTUPE3 #(
  `ifdef XIL_TIMING //Simprim 
  parameter LOC = "UNPLACED",  
  `endif
  parameter PROG_USR = "FALSE",
  parameter real SIM_CCLK_FREQ = 0.0
)(
  output CFGCLK,
  output CFGMCLK,
  output [3:0] DI,
  output EOS,
  output PREQ,

  input [3:0] DO,
  input [3:0] DTS,
  input FCSBO,
  input FCSBTS,
  input GSR,
  input GTS,
  input KEYCLEARB,
  input PACK,
  input USRCCLKO,
  input USRCCLKTS,
  input USRDONEO,
  input USRDONETS
);
  
  reg SIM_CCLK_FREQ_BINARY;
  reg [2:0] PROG_USR_BINARY;

  time CFGMCLK_PERIOD = 20000;
  reg cfgmclk_out;
  localparam MODULE_NAME = "STARTUPE3";
   
  assign glbl.GSR = GSR;
  assign glbl.GTS = GTS;

  wire start_count;
  integer edge_count = 0;
  reg preq_deassert = 0;
  reg PREQ_out = 0;
  wire  EOS_out;

//  Counters and Flags
    reg [2:0] edge_count_cclko = 0;
    reg [2:0] cclko_wait_count = 3'b010;
    reg start_glbl_cclko = 0;

  initial begin
    case (PROG_USR)
      "FALSE" : PROG_USR_BINARY = 3'b000;
      "TRUE" : PROG_USR_BINARY = 3'b111;
      default : begin
	 $display("Error: [Unisim %s-101] PROG_USR attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, PROG_USR);
        $finish;
      end
    endcase

    if ((SIM_CCLK_FREQ >= 0.0) && (SIM_CCLK_FREQ <= 10.0))
      SIM_CCLK_FREQ_BINARY = SIM_CCLK_FREQ;
    else begin
       $display("Error: [Unisim %s-102] SIM_CCLK_FREQ attribute is set to %f.  Legal values for this attribute are 0.0 to 10.0. Instance: %m", MODULE_NAME, SIM_CCLK_FREQ);
       $finish;
    end

  end
//-------------------------------------------------------------------------------
//----------------- Initial -----------------------------------------------------
//-------------------------------------------------------------------------------
  initial begin
      cfgmclk_out = 0;
      forever #(CFGMCLK_PERIOD/2.0) cfgmclk_out = !cfgmclk_out;
  end

//-------------------------------------------------------------------------------
//-------------------- PREQ -----------------------------------------------------
//-------------------------------------------------------------------------------

   assign start_count = (PREQ_out && PACK)? 1'b1 : 1'b0;

   always @(posedge cfgmclk_out) begin
      if(start_count)
         edge_count = edge_count + 1;
       else 
         edge_count = 0;  
      
      if(edge_count == 35) 
        preq_deassert <= 1'b1;
      else
        preq_deassert <= 1'b0;
   end

    
  always @(negedge glbl.PROGB_GLBL, posedge preq_deassert) 
     PREQ_out <= ~glbl.PROGB_GLBL || ~preq_deassert; 

//-------------------------------------------------------------------------------
//-------------------- ERROR MSG ------------------------------------------------
//-------------------------------------------------------------------------------
  always @(posedge PACK) begin
     if(PREQ_out == 1'b0) 
      $display("Error: [Unisim %s-1] PACK received with no associate PREQ. Instance: %m", MODULE_NAME);
  end 

//-------------------------------------------------------------------------------
//--------------------- EOS -----------------------------------------------------
//-------------------------------------------------------------------------------

     assign EOS_out = ~glbl.GSR;
//-------------------------------------------------------------------------------
//--------------------  glbl.CCLKO  ---------------------------------------------
//-------------------------------------------------------------------------------

   always @(posedge USRCCLKO) begin
       if(EOS_out) edge_count_cclko <= edge_count_cclko + 1;
   end

   always @(edge_count_cclko)
        if (edge_count_cclko == cclko_wait_count)
               start_glbl_cclko = 1;

//-------------------------------------------------------------------------------
//-------------------- OUTPUT ---------------------------------------------------
//-------------------------------------------------------------------------------

  assign CFGMCLK = cfgmclk_out;
  assign PREQ    = PREQ_out;
  assign EOS      = EOS_out;
//  assign glbl.CCLKO_GLBL = start_glbl_cclko ? ~USRCCLKTS? USRCCLKO : 1'b1 : 1'b1;
  assign glbl.CCLKO_GLBL = start_glbl_cclko ? (~USRCCLKTS ? USRCCLKO : 1'bz) : 1'b1;

  assign glbl.FCSBO_GLBL = ~FCSBTS ? FCSBO : 1'bz;
  assign glbl.DO_GLBL[0] = ~DTS[0] ? DO[0] : 1'bz;
  assign glbl.DO_GLBL[1] = ~DTS[1] ? DO[1] : 1'bz;
  assign glbl.DO_GLBL[2] = ~DTS[2] ? DO[2] : 1'bz;
  assign glbl.DO_GLBL[3] = ~DTS[3] ? DO[3] : 1'bz;
  assign DI = glbl.DI_GLBL;

   
  specify
    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
