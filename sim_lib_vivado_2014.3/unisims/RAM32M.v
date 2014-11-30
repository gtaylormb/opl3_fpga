///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor      : Xilinx
// \   \   \/     Version     : 2014.3
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                       32-Deep by 8-bit Wide Multi Port RAM 
// /___/   /\     Filename    : RAM32M.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    03/21/06 - Initial version.
//    12/01/06 - Fix cut/past error for port C and D (CR 430051)
//    05/07/08 - Add negative setup/hold support (CR468872)
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    04/18/13 - PR683925 - add invertible pin support.
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module RAM32M #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [63:0] INIT_A = 64'h0000000000000000,
  parameter [63:0] INIT_B = 64'h0000000000000000,
  parameter [63:0] INIT_C = 64'h0000000000000000,
  parameter [63:0] INIT_D = 64'h0000000000000000,
  parameter [0:0] IS_WCLK_INVERTED = 1'b0
)(
  output [1:0] DOA,
  output [1:0] DOB,
  output [1:0] DOC,
  output [1:0] DOD,

  input [4:0] ADDRA,
  input [4:0] ADDRB,
  input [4:0] ADDRC,
  input [4:0] ADDRD,
  input [1:0] DIA,
  input [1:0] DIB,
  input [1:0] DIC,
  input [1:0] DID,
  input WCLK,
  input WE
);
  
// define constants
  localparam MODULE_NAME = "RAM32M";

  reg trig_attr = 1'b0;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;

  wire WCLK_in;
  wire WE_in;
  wire [1:0] DIA_in;
  wire [1:0] DIB_in;
  wire [1:0] DIC_in;
  wire [1:0] DID_in;
  wire [4:0] ADDRD_in;

  wire WCLK_dly;
  wire WE_dly;
  wire [1:0] DIA_dly;
  wire [1:0] DIB_dly;
  wire [1:0] DIC_dly;
  wire [1:0] DID_dly;
  wire [4:0] ADDRD_dly;

`ifdef XIL_TIMING
  reg notifier;
`endif

`ifndef XIL_TIMING
  assign ADDRD_dly = ADDRD;
  assign DIA_dly = DIA;
  assign DIB_dly = DIB;
  assign DIC_dly = DIC;
  assign DID_dly = DID;
  assign WCLK_dly = WCLK;
  assign WE_dly = WE;
`endif
    
  assign ADDRD_in = ADDRD_dly;
  assign DIA_in = DIA_dly;
  assign DIB_in = DIB_dly;
  assign DIC_in = DIC_dly;
  assign DID_in = DID_dly;
  assign WCLK_in = WCLK_dly ^ IS_WCLK_INVERTED;
  assign WE_in = (WE === 1'bz) || WE_dly; // rv 1
    
  initial begin
    #1;
    trig_attr = ~trig_attr;
  end

  always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((INIT_A < 64'h0000000000000000) || (INIT_A > 64'hFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-101] INIT_A attribute is set to %h.  Legal values for this attribute are 64'h0000000000000000 to 64'hFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_A);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_B < 64'h0000000000000000) || (INIT_B > 64'hFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-102] INIT_B attribute is set to %h.  Legal values for this attribute are 64'h0000000000000000 to 64'hFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_B);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_C < 64'h0000000000000000) || (INIT_C > 64'hFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-103] INIT_C attribute is set to %h.  Legal values for this attribute are 64'h0000000000000000 to 64'hFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_C);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_D < 64'h0000000000000000) || (INIT_D > 64'hFFFFFFFFFFFFFFFF))) begin
      $display("Error: [Unisim %s-104] INIT_D attribute is set to %h.  Legal values for this attribute are 64'h0000000000000000 to 64'hFFFFFFFFFFFFFFFF. Instance: %m", MODULE_NAME, INIT_D);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_WCLK_INVERTED !== 1'b0) && (IS_WCLK_INVERTED !== 1'b1))) begin
      $display("Error: [Unisim %s-109] IS_WCLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_WCLK_INVERTED);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) $finish;
  end

  reg [63:0] mem_a, mem_b, mem_c, mem_d;
  reg [5:0] addr_in2, addr_in1;

  initial begin
    mem_a = INIT_A;
    mem_b = INIT_B;
    mem_c = INIT_C;
    mem_d = INIT_D;
  end

  always @(ADDRD_in) begin
      addr_in2 = 2 * ADDRD_in;
      addr_in1 = 2 * ADDRD_in + 1;
  end

  always @(posedge WCLK_in)
    if (WE_in) begin
      mem_a[addr_in2] <= #100 DIA_in[0];
      mem_a[addr_in1] <= #100 DIA_in[1];
      mem_b[addr_in2] <= #100 DIB_in[0];
      mem_b[addr_in1] <= #100 DIB_in[1];
      mem_c[addr_in2] <= #100 DIC_in[0];
      mem_c[addr_in1] <= #100 DIC_in[1];
      mem_d[addr_in2] <= #100 DID_in[0];
      mem_d[addr_in1] <= #100 DID_in[1];
  end

   assign  DOA[0] = mem_a[2*ADDRA];
   assign  DOA[1] = mem_a[2*ADDRA + 1];
   assign  DOB[0] = mem_b[2*ADDRB];
   assign  DOB[1] = mem_b[2*ADDRB + 1];
   assign  DOC[0] = mem_c[2*ADDRC];
   assign  DOC[1] = mem_c[2*ADDRC + 1];
   assign  DOD[0] = mem_d[2*ADDRD_in];
   assign  DOD[1] = mem_d[2*ADDRD_in + 1];

`ifdef XIL_TIMING
  always @(notifier) begin
      mem_a[addr_in2] <= 1'bx;
      mem_a[addr_in1] <= 1'bx;
      mem_b[addr_in2] <= 1'bx;
      mem_b[addr_in1] <= 1'bx;
      mem_c[addr_in2] <= 1'bx;
      mem_c[addr_in1] <= 1'bx;
      mem_d[addr_in2] <= 1'bx;
      mem_d[addr_in1] <= 1'bx;
  end
`endif

    
`ifdef XIL_TIMING
  specify
  (WCLK => DOA[0]) = (0:0:0, 0:0:0);
  (WCLK => DOA[1]) = (0:0:0, 0:0:0);
  (WCLK => DOB[0]) = (0:0:0, 0:0:0);
  (WCLK => DOB[1]) = (0:0:0, 0:0:0);
  (WCLK => DOC[0]) = (0:0:0, 0:0:0);
  (WCLK => DOC[1]) = (0:0:0, 0:0:0);
  (WCLK => DOD[0]) = (0:0:0, 0:0:0);
  (WCLK => DOD[1]) = (0:0:0, 0:0:0);
  (ADDRA *> DOA[0]) = (0:0:0, 0:0:0);
  (ADDRA *> DOA[1]) = (0:0:0, 0:0:0);
  (ADDRB *> DOB[0]) = (0:0:0, 0:0:0);
  (ADDRB *> DOB[1]) = (0:0:0, 0:0:0);
  (ADDRC *> DOC[0]) = (0:0:0, 0:0:0);
  (ADDRC *> DOC[1]) = (0:0:0, 0:0:0);
  (ADDRD *> DOD[0]) = (0:0:0, 0:0:0);
  (ADDRD *> DOD[1]) = (0:0:0, 0:0:0);

  $setuphold (posedge WCLK, posedge DIA[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIA_dly[0]);
  $setuphold (posedge WCLK, negedge DIA[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIA_dly[0]);
  $setuphold (posedge WCLK, posedge DIA[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIA_dly[1]);
  $setuphold (posedge WCLK, negedge DIA[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIA_dly[1]);
  $setuphold (posedge WCLK, posedge DIB[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIB_dly[0]);
  $setuphold (posedge WCLK, negedge DIB[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIB_dly[0]);
  $setuphold (posedge WCLK, posedge DIB[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIB_dly[1]);
  $setuphold (posedge WCLK, negedge DIB[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIB_dly[1]);
  $setuphold (posedge WCLK, posedge DIC[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIC_dly[0]);
  $setuphold (posedge WCLK, negedge DIC[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIC_dly[0]);
  $setuphold (posedge WCLK, posedge DIC[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIC_dly[1]);
  $setuphold (posedge WCLK, negedge DIC[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIC_dly[1]);
  $setuphold (posedge WCLK, posedge DID[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DID_dly[0]);
  $setuphold (posedge WCLK, negedge DID[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DID_dly[0]);
  $setuphold (posedge WCLK, posedge DID[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DID_dly[1]);
  $setuphold (posedge WCLK, negedge DID[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DID_dly[1]);
  $setuphold (posedge WCLK, posedge ADDRD[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[0]);
  $setuphold (posedge WCLK, negedge ADDRD[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[0]);
  $setuphold (posedge WCLK, posedge ADDRD[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[1]);
  $setuphold (posedge WCLK, negedge ADDRD[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[1]);
  $setuphold (posedge WCLK, posedge ADDRD[2] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[2]);
  $setuphold (posedge WCLK, negedge ADDRD[2] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[2]);
  $setuphold (posedge WCLK, posedge ADDRD[3] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[3]);
  $setuphold (posedge WCLK, negedge ADDRD[3] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[3]);
  $setuphold (posedge WCLK, posedge ADDRD[4] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[4]);
  $setuphold (posedge WCLK, negedge ADDRD[4] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[4]);
  $setuphold (posedge WCLK, posedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
  $setuphold (posedge WCLK, negedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
  $period (posedge WCLK &&& WE, 0:0:0, notifier);

  $setuphold (negedge WCLK, posedge DIA[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIA_dly[0]);
  $setuphold (negedge WCLK, negedge DIA[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIA_dly[0]);
  $setuphold (negedge WCLK, posedge DIA[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIA_dly[1]);
  $setuphold (negedge WCLK, negedge DIA[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIA_dly[1]);
  $setuphold (negedge WCLK, posedge DIB[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIB_dly[0]);
  $setuphold (negedge WCLK, negedge DIB[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIB_dly[0]);
  $setuphold (negedge WCLK, posedge DIB[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIB_dly[1]);
  $setuphold (negedge WCLK, negedge DIB[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIB_dly[1]);
  $setuphold (negedge WCLK, posedge DIC[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIC_dly[0]);
  $setuphold (negedge WCLK, negedge DIC[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIC_dly[0]);
  $setuphold (negedge WCLK, posedge DIC[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIC_dly[1]);
  $setuphold (negedge WCLK, negedge DIC[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DIC_dly[1]);
  $setuphold (negedge WCLK, posedge DID[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DID_dly[0]);
  $setuphold (negedge WCLK, negedge DID[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DID_dly[0]);
  $setuphold (negedge WCLK, posedge DID[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DID_dly[1]);
  $setuphold (negedge WCLK, negedge DID[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,DID_dly[1]);
  $setuphold (negedge WCLK, posedge ADDRD[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[0]);
  $setuphold (negedge WCLK, negedge ADDRD[0] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[0]);
  $setuphold (negedge WCLK, posedge ADDRD[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[1]);
  $setuphold (negedge WCLK, negedge ADDRD[1] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[1]);
  $setuphold (negedge WCLK, posedge ADDRD[2] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[2]);
  $setuphold (negedge WCLK, negedge ADDRD[2] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[2]);
  $setuphold (negedge WCLK, posedge ADDRD[3] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[3]);
  $setuphold (negedge WCLK, negedge ADDRD[3] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[3]);
  $setuphold (negedge WCLK, posedge ADDRD[4] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[4]);
  $setuphold (negedge WCLK, negedge ADDRD[4] &&& WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,ADDRD_dly[4]);
  $setuphold (negedge WCLK, posedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
  $setuphold (negedge WCLK, negedge WE, 0:0:0, 0:0:0, notifier,,,WCLK_dly,WE_dly);
  $period (negedge WCLK &&& WE, 0:0:0, notifier);

   specparam PATHPULSE$ = 0;

  endspecify

`endif

endmodule

`endcelldefine
