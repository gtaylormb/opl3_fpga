///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  User Interface to Global Clock, Reset and 3-State Controls
// /___/   /\     Filename : STARTUPE2.v
// \   \  /  \    Timestamp : Mon Mar  8 15:49:37 PST 2010
//  \___\/\___\
//
// Revision:
//    03/08/10 - Initial version.
//    10/26/10 - CR 573665 -- Added PREQ support.
//    01/26/11 - CR 591438 -- Added SIM_CCLK_FREQ 
//    06/16/11 - CR 610112 -- SIM_CCLK_FREQ attribute check fix
//    08/23/11 - CR 608084 -- Passed USRCCLKO to glbl.CCLKO
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    08/23/12 - Fixed GSR (CR 673651).
//    02/06/14 - Fixed tristate of USRCCLKTS (CR 766066).
// End Revision

`timescale 1 ps / 1 ps

`celldefine

module STARTUPE2 (
  CFGCLK,
  CFGMCLK,
  EOS,
  PREQ,

  CLK,
  GSR,
  GTS,
  KEYCLEARB,
  PACK,
  USRCCLKO,
  USRCCLKTS,
  USRDONEO,
  USRDONETS
);

`ifdef XIL_TIMING

  parameter LOC = "UNPLACED";

`endif

  parameter PROG_USR = "FALSE";
  parameter real SIM_CCLK_FREQ = 0.0;

  output CFGCLK;
  output CFGMCLK;
  output EOS;
  output PREQ;

  input CLK;
  input GSR;
  input GTS;
  input KEYCLEARB;
  input PACK;
  input USRCCLKO;
  input USRCCLKTS;
  input USRDONEO;
  input USRDONETS;

  reg SIM_CCLK_FREQ_BINARY;
  reg [2:0] PROG_USR_BINARY;

  time CFGMCLK_PERIOD = 20000;
  reg cfgmclk_out;

  tri0 GSR, GTS;

  assign glbl.GSR = GSR;
  assign glbl.GTS = GTS;
    
  wire CFGCLK_OUT;
  wire CFGMCLK_OUT;

  wire CLK_IN;
  wire GSR_IN;
  wire GTS_IN;
  wire KEYCLEARB_IN;
  wire PACK_IN;
  wire USRCCLKO_IN;
  wire USRCCLKTS_IN;
  wire USRDONEO_IN;
  wire USRDONETS_IN;

  wire CLK_INDELAY;
  wire GSR_INDELAY;
  wire GTS_INDELAY;
  wire KEYCLEARB_INDELAY;
  wire PACK_INDELAY;
  wire USRCCLKO_INDELAY;
  wire USRCCLKTS_INDELAY;
  wire USRDONEO_INDELAY;
  wire USRDONETS_INDELAY;

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
        $display("Attribute Syntax Error : The Attribute PROG_USR on STARTUPE2 instance %m is set to %s.  Legal values for this attribute are FALSE, or TRUE.", PROG_USR);
        $finish;
      end
    endcase

    if ((SIM_CCLK_FREQ >= 0.0) && (SIM_CCLK_FREQ <= 10.0))
      SIM_CCLK_FREQ_BINARY = SIM_CCLK_FREQ;
    else begin
      $display("Attribute Syntax Error : The Attribute SIM_CCLK_FREQ on STARTUPE2 instance %m is set to %f.  Legal values for this attribute are  0.0 to 10.0.", SIM_CCLK_FREQ);
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
      $display("Error : PACK received with no associate PREQ in STARTTUPE2 instance %m.");
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
     assign glbl.CCLKO_GLBL = start_glbl_cclko ? (~USRCCLKTS? USRCCLKO : 1'bz) : 1'b1;

  specify

    specparam PATHPULSE$ = 0;
  endspecify

endmodule

`endcelldefine
