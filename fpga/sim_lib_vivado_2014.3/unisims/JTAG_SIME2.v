///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Jtag TAP Controler for VIRTEX7
// /___/   /\     Filename : JTAG_SIME2.v
// \   \  /  \    Timestamp : Mon May 17 17:10:29 PDT 2010
//  \___\/\___\
//
// Revision:
//    05/17/10 - Initial version.
//    11/30/11 - 632642 - Updated supported devices and corresponding IDCODES.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    07/05/12 - Updated the simulation model (CR 667100).
//    07/23/12 - Fixed IRLengthMax (CR 669116).
// End Revision

`timescale 1 ps/1 ps

`celldefine

module JTAG_SIME2( TDO, TCK, TDI, TMS);


  output TDO;

  input TCK, TDI, TMS;
   
  reg TDO;
  reg notifier;


  parameter PART_NAME = "7A8";

`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif //  `ifdef XIL_TIMING
    
  localparam       TestLogicReset	= 4'h0,
                   RunTestIdle		= 4'h1,
                   SelectDRScan		= 4'h2,
                   CaptureDR		= 4'h3,
                   ShiftDR		= 4'h4,
                   Exit1DR		= 4'h5,
                   PauseDR		= 4'h6,
                   Exit2DR		= 4'h7,
                   UpdateDR		= 4'h8,
                   SelectIRScan		= 4'h9,
                   CaptureIR		= 4'ha,
                   ShiftIR		= 4'hb,
                   Exit1IR		= 4'hc,
                   PauseIR		= 4'hd,
                   Exit2IR		= 4'he,
                   UpdateIR		= 4'hf;

   localparam DELAY_SIG = 1;
   
   reg TRST = 0;

   reg [3:0]    CurrentState = TestLogicReset;
   reg [14*8:0] jtag_state_name = "TestLogicReset";
   reg [14*8:0] jtag_instruction_name = "IDCODE";


//-----------------  Virtex4 Specific Constants ---------
//  localparam IRLengthMax = 10;
    localparam IRLengthMax = 24;
  localparam IDLength    = 32;

  reg [IRLengthMax-1:0] IR_CAPTURE_VAL	= 24'b010001010001010001010001,
                      BYPASS_INSTR      = 24'b111111111111111111111111,
                      IDCODE_INSTR      = 24'b001001001001001001001001,
                      USER1_INSTR       = 24'b000010100100100100100100,
                      USER2_INSTR       = 24'b000011100100100100100100,
                      USER3_INSTR       = 24'b100010100100100100100100,
                      USER4_INSTR       = 24'b100011100100100100100100;

//  localparam IRLength = 10;
  localparam IRLength = ( 
	(PART_NAME   == "7A8")		|| (PART_NAME   == "7a8")	 || 
	(PART_NAME   == "7A15")	 	|| (PART_NAME   == "7a15")	 || 
	(PART_NAME   == "7A20")	 	|| (PART_NAME   == "7a20")	 || 
	(PART_NAME   == "7A30T") 	|| (PART_NAME   == "7a30t")	 || 
	(PART_NAME   == "7A50T") 	|| (PART_NAME   == "7a50t")	 || 
	(PART_NAME   == "7A100T") 	|| (PART_NAME   == "7a100t")	 || 
	(PART_NAME   == "7A200T") 	|| (PART_NAME   == "7a200t")	 || 
	(PART_NAME   == "7A350T") 	|| (PART_NAME   == "7a350t")	 || 
	(PART_NAME   == "7K30T") 	|| (PART_NAME   == "7k30t")	 || 
	(PART_NAME   == "7K70T") 	|| (PART_NAME   == "7k70t")	 || 
	(PART_NAME   == "7K125T")	|| (PART_NAME   == "7k125t")	 || 
	(PART_NAME   == "7K160T")	|| (PART_NAME   == "7k160t")	 || 
	(PART_NAME   == "7K235T")	|| (PART_NAME   == "7k235t")	 || 
	(PART_NAME   == "7K290T")	|| (PART_NAME   == "7k290t")	 || 
	(PART_NAME   == "7K325T")	|| (PART_NAME   == "7k325t")	 || 
	(PART_NAME   == "7K355T")	|| (PART_NAME   == "7k355t"))	  ?      6 : (
	(PART_NAME   == "7K410T")	|| (PART_NAME   == "7k410t")	 || 
	(PART_NAME   == "7K420T")	|| (PART_NAME   == "7k420t")	 || 
	(PART_NAME   == "7K480T")	|| (PART_NAME   == "7k480t")	 || 
	(PART_NAME   == "7V160T")	|| (PART_NAME   == "7v160t")	 || 
	(PART_NAME   == "7V450T")	|| (PART_NAME   == "7v450t")	 || 
	(PART_NAME   == "7V585T")	|| (PART_NAME   == "7v585t")	 || 
	(PART_NAME   == "7V855T")	|| (PART_NAME   == "7v855t")	 || 
	(PART_NAME   == "7VX80T")	|| (PART_NAME   == "7vx80t")	 || 
	(PART_NAME   == "7VX82T")	|| (PART_NAME   == "7vx82t")	 || 
	(PART_NAME   == "7VX330T")	|| (PART_NAME   == "7vx330t")	 || 
	(PART_NAME   == "7VX410T")	|| (PART_NAME   == "7vx410t")	 || 
	(PART_NAME   == "7VX415T")	|| (PART_NAME   == "7vx415t")	 || 
	(PART_NAME   == "7VX485T")	|| (PART_NAME   == "7vx485t")	 || 
	(PART_NAME   == "7VX550T")	|| (PART_NAME   == "7vx550t")	 || 
	(PART_NAME   == "7VX690T")	|| (PART_NAME   == "7vx690t")	 || 
	(PART_NAME   == "7VX980T")	|| (PART_NAME   == "7vx980t"))	  ?      18 : (
	(PART_NAME   == "7VX1140")	|| (PART_NAME   == "7vx1140")	 || 
	(PART_NAME   == "7V1500")	|| (PART_NAME   == "7v1500")	 || 
	(PART_NAME   == "7V2000")	|| (PART_NAME   == "7v2000"))	  ?	 24 : ( 
	(PART_NAME   == "7Z010")	|| (PART_NAME   == "7z010")	 || 
	(PART_NAME   == "7Z020")	|| (PART_NAME   == "7z020")	 || 
	(PART_NAME   == "7Z030")	|| (PART_NAME   == "7z030")	 || 
	(PART_NAME   == "7Z045")	|| (PART_NAME   == "7z045"))	  ?       6 : 24 ; 
//----------------- local reg  -------------------------------
  reg CaptureDR_sig = 0, RESET_sig = 0, ShiftDR_sig = 0, UpdateDR_sig = 0; 

  reg ClkIR_active = 0, ClkIR_sig = 0, ClkID_sig = 0; 

  reg ShiftIR_sig, UpdateIR_sig, ClkUpdateIR_sig; 
  
  reg [IRLength-1:0] IRcontent_sig;

  reg [IDLength-1:0] IDCODEval_sig;

  reg  BypassReg = 0, BYPASS_sig = 0, IDCODE_sig = 0, 
       USER1_sig = 0, USER2_sig = 0,
       USER3_sig = 0, USER4_sig = 0;

  reg TDO_latch;

  reg Tlrst_sig = 1; 
  reg TlrstN_sig = 1; 

  reg IRegLastBit_sig = 0, IDregLastBit_sig = 0;

  reg Rti_sig = 0; 
 //-------------------------------------------------------------
  reg [IRLength-1:0] NextIRreg; 
  reg [IRLength-1:0] ir_int; // = IR_CAPTURE_VAL[IRLength-1:0] ;
  reg [IDLength-1:0] IDreg;
 	
//####################################################################
//#####                     Initialize                           #####
//####################################################################
   initial begin
      case (PART_NAME)
		"7A8",		"7a8"		: IDCODEval_sig <= 32'h03628093;
		"7A15",		"7a15"		: IDCODEval_sig <= 32'h03627093;
		"7A20",		"7a20"		: IDCODEval_sig <= 32'h03622093;
		"7A30T",	"7a30t"		: IDCODEval_sig <= 32'h0362D093;
		"7A50T",	"7a50t"		: IDCODEval_sig <= 32'h0362C093;
		"7A100T",	"7a100t"	: IDCODEval_sig <= 32'h03631093;
		"7A200T",	"7a200t"	: IDCODEval_sig <= 32'h03636093;
		"7A350T",	"7a350t"	: IDCODEval_sig <= 32'h0363B093;
		"7K30T",	"7k30t"		: IDCODEval_sig <= 32'h03642093;
		"7K70T",	"7k70t"		: IDCODEval_sig <= 32'h03647093;
		"7K125T",	"7k125t"	: IDCODEval_sig <= 32'h0365C093;
		"7K160T",	"7k160t"	: IDCODEval_sig <= 32'h0364C093;
		"7K235T",	"7k235t"	: IDCODEval_sig <= 32'h0365B093;
		"7K290T",	"7k290t"	: IDCODEval_sig <= 32'h0365D093;
		"7K325T",	"7k325t"	: IDCODEval_sig <= 32'h03651093;
		"7K355T",	"7k355t"	: IDCODEval_sig <= 32'h03747093;
		"7K410T",	"7k410t"	: IDCODEval_sig <= 32'h03656093;
		"7K420T",	"7k420t"	: IDCODEval_sig <= 32'h03752093;
		"7K480T",	"7k480t"	: IDCODEval_sig <= 32'h03751093;
		"7V160T",	"7v160t"	: IDCODEval_sig <= 32'h03662093;
		"7V450T",	"7v450t"	: IDCODEval_sig <= 32'h0366C093;
		"7V585T",	"7v585t"	: IDCODEval_sig <= 32'h03671093;
		"7V855T",	"7v855t"	: IDCODEval_sig <= 32'h03676093;
		"7VX80T",	"7vx80t"	: IDCODEval_sig <= 32'h03680093;
		"7VX82T",	"7vx82t"	: IDCODEval_sig <= 32'h03681093;
		"7VX330T",	"7vx330t"	: IDCODEval_sig <= 32'h03667093;
		"7VX410T",	"7vx410t"	: IDCODEval_sig <= 32'h0369B093;
		"7VX415T",	"7vx415t"	: IDCODEval_sig <= 32'h03682093;
		"7VX485T",	"7vx485t"	: IDCODEval_sig <= 32'h03687093;
		"7VX550T",	"7vx550t"	: IDCODEval_sig <= 32'h03692093;
		"7VX690T",	"7vx690t"	: IDCODEval_sig <= 32'h03691093;
		"7VX980T",	"7vx980t"	: IDCODEval_sig <= 32'h03696093;
		"7VX1140",	"7vx1140"	: IDCODEval_sig <= 32'h036D5093;
		"7V1500",	"7v1500"	: IDCODEval_sig <= 32'h036B1093;
		"7V2000",	"7v2000"	: IDCODEval_sig <= 32'h036B3093;
		"7Z010",	"7z010"		: IDCODEval_sig <= 32'h03722093;
		"7Z020",	"7z020"		: IDCODEval_sig <= 32'h03727093;
		"7Z030",	"7z030"		: IDCODEval_sig <= 32'h0372C093;
		"7Z045",	"7z045"		: IDCODEval_sig <= 32'h03731093;

         default : begin

                        $display("Attribute Syntax Error : The attribute PART_NAME on JTAG_SIME2 instance %m is set to %s. The legal values for this attributes are 7A8, 7A15, 7A20, 7A30T, 7A50T, 7A100T, 7A200T, 7A350T, 7K30T, 7K70T, 7K125T, 7K160T, 7K235T, 7K290T, 7K325T, 7K355T, 7K410T, 7K420T, 7K480T, 7V160T, 7V450T, 7V585T, 7V855T, 7VX80T, 7VX82T, 7VX330T, 7VX410T, 7VX415T, 7VX485T, 7VX550T, 7VX690T, 7VX980T, 7VX1140, 7V1500, 7V2000, 7Z010, 7Z020, 7Z030 or 7Z045.",  PART_NAME);
         end
       endcase // case(PART_NAME)

       ir_int <= IR_CAPTURE_VAL[IRLength-1:0];

    end // initial begin
//####################################################################
//#####                      JtagTapSM                           #####
//####################################################################
  always@(posedge TCK or posedge TRST)
     begin
       if(TRST) begin
          CurrentState = TestLogicReset;
       end
       else begin
            case(CurrentState)
 
               TestLogicReset:
                 begin
                   if(TMS == 0) begin
                      CurrentState = RunTestIdle;
                      jtag_state_name = "RunTestIdle";
                   end
                 end

               RunTestIdle:
                 begin
                   if(TMS == 1) begin
                      CurrentState = SelectDRScan;
                      jtag_state_name = "SelectDRScan";
                   end
                 end
               //-------------------------------
               // ------  DR path ---------------
               // -------------------------------
               SelectDRScan:
                 begin
                   if(TMS == 0) begin
                      CurrentState = CaptureDR;
                      jtag_state_name = "CaptureDR";
                   end
                   else if(TMS == 1) begin
                      CurrentState = SelectIRScan;
                      jtag_state_name = "SelectIRScan";
                   end
                 end
 
               CaptureDR:
                 begin
                   if(TMS == 0) begin
                      CurrentState = ShiftDR;
                      jtag_state_name = "ShiftDR";
                   end
                   else if(TMS == 1) begin
                      CurrentState = Exit1DR;
                      jtag_state_name = "Exit1DR";
                   end
                 end
              
               ShiftDR:
                 begin
                    if(IRcontent_sig == BYPASS_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)]) 
                      BypassReg = TDI;

                   if(TMS == 1) begin
                      CurrentState = Exit1DR;
                      jtag_state_name = "Exit1DR";
                   end
                 end
              
               Exit1DR:
                 begin
                   if(TMS == 0) begin
                      CurrentState = PauseDR;
                      jtag_state_name = "PauseDR";
                   end
                   else if(TMS == 1) begin
                      CurrentState = UpdateDR;
                      jtag_state_name = "UpdateDR";
                   end
                 end
              
               PauseDR:
                 begin
                   if(TMS == 1) begin
                      CurrentState =  Exit2DR;
                      jtag_state_name = "Exit2DR";
                   end
                 end
            
               Exit2DR:
                 begin
                   if(TMS == 0) begin
                      CurrentState = ShiftDR;
                      jtag_state_name = "ShiftDR";
                   end
                   else if(TMS == 1) begin
                      CurrentState = UpdateDR;
                      jtag_state_name = "UpdateDR";
                   end
                 end
              
               UpdateDR:
                 begin
                   if(TMS == 0) begin
                      CurrentState = RunTestIdle;
                      jtag_state_name = "RunTestIdle";
                   end
                   else if(TMS == 1) begin
                      CurrentState = SelectDRScan;
                      jtag_state_name = "SelectDRScan";
                   end
                 end
               //-------------------------------
               // ------  IR path ---------------
               // -------------------------------
               SelectIRScan:
                 begin
                   if(TMS == 0) begin
                      CurrentState = CaptureIR;
                      jtag_state_name = "CaptureIR";
                   end
                   else if(TMS == 1) begin
                      CurrentState = TestLogicReset;
                      jtag_state_name = "TestLogicReset";
                   end
                 end
 
               CaptureIR:
                 begin
                   if(TMS == 0) begin
                      CurrentState = ShiftIR;
                      jtag_state_name = "ShiftIR";
                   end
                   else if(TMS == 1) begin
                      CurrentState = Exit1IR;
                      jtag_state_name = "Exit1IR";
                   end
                  end
              
               ShiftIR:
                 begin
//                   ClkIR_sig = 1;

                   if(TMS == 1) begin
                      CurrentState = Exit1IR;
                      jtag_state_name = "Exit1IR";
                   end
                 end
             
               Exit1IR:
                 begin
                   if(TMS == 0) begin
                      CurrentState = PauseIR;
                      jtag_state_name = "PauseIR";
                   end
                   else if(TMS == 1) begin
                      CurrentState = UpdateIR;
                      jtag_state_name = "UpdateIR";
                   end
                 end
              
               PauseIR:
                 begin
                   if(TMS == 1) begin
                      CurrentState =  Exit2IR;
                      jtag_state_name = "Exit2IR";
                   end
                 end
            
               Exit2IR:
                 begin
                   if(TMS == 0) begin
                      CurrentState = ShiftIR;
                      jtag_state_name = "ShiftIR";
                   end 
                   else if(TMS == 1) begin
                      CurrentState = UpdateIR;
                      jtag_state_name = "UpdateIR";
                   end
                 end
              
               UpdateIR:
                 begin
                  //-- FP
//                   ClkIR_sig = 1;

                   if(TMS == 0) begin
                      CurrentState = RunTestIdle;
                      jtag_state_name = "RunTestIdle";
                   end
                   else if(TMS == 1) begin
                      CurrentState = SelectDRScan;
                      jtag_state_name = "SelectDRScan";
                   end
                 end
             endcase // case(CurrentState)
       end // else

     end // always

//--------------------------------------------------------
  always@(CurrentState, TCK, TRST)
  begin
      ClkIR_sig = 1;

      if(TRST == 1 ) begin
            Tlrst_sig     = #DELAY_SIG 1;
            CaptureDR_sig = #DELAY_SIG 0;
            ShiftDR_sig   = #DELAY_SIG 0;
            UpdateDR_sig  = #DELAY_SIG 0;
            ShiftIR_sig   = #DELAY_SIG 0;
            UpdateIR_sig  = #DELAY_SIG 0;
      end
      else if(TRST == 0) begin
         
         case (CurrentState)
            TestLogicReset:  begin 
                  Tlrst_sig     = #DELAY_SIG 1;
                  Rti_sig       = #DELAY_SIG 0;
                  CaptureDR_sig = #DELAY_SIG 0;
                  ShiftDR_sig   = #DELAY_SIG 0;
                  UpdateDR_sig  = #DELAY_SIG 0;
                  ShiftIR_sig   = #DELAY_SIG 0;
                  UpdateIR_sig  = #DELAY_SIG 0;
            end
            RunTestIdle:  begin 
                  Tlrst_sig     = #DELAY_SIG 0;
                  Rti_sig       = #DELAY_SIG 1;
                  CaptureDR_sig = #DELAY_SIG 0;
                  ShiftDR_sig   = #DELAY_SIG 0;
                  UpdateDR_sig  = #DELAY_SIG 0;
                  ShiftIR_sig   = #DELAY_SIG 0;
                  UpdateIR_sig  = #DELAY_SIG 0;
            end
            CaptureDR:  begin 
                  Tlrst_sig     = #DELAY_SIG 0;
                  Rti_sig       = #DELAY_SIG 0;
                  CaptureDR_sig = #DELAY_SIG 1;
                  ShiftDR_sig   = #DELAY_SIG 0;
                  UpdateDR_sig  = #DELAY_SIG 0;
                  ShiftIR_sig   = #DELAY_SIG 0;
                  UpdateIR_sig  = #DELAY_SIG 0;
            end
            ShiftDR:  begin 
                  Tlrst_sig     = #DELAY_SIG 0;
                  Rti_sig       = #DELAY_SIG 0;
                  CaptureDR_sig = #DELAY_SIG 0;
                  ShiftDR_sig   = #DELAY_SIG 1;
                  UpdateDR_sig  = #DELAY_SIG 0;
                  ShiftIR_sig   = #DELAY_SIG 0;
                  UpdateIR_sig  = #DELAY_SIG 0;
            end
            UpdateDR:  begin 
                  Tlrst_sig     = #DELAY_SIG 0;
                  Rti_sig       = #DELAY_SIG 0;
                  CaptureDR_sig = #DELAY_SIG 0;
                  ShiftDR_sig   = #DELAY_SIG 0;
                  UpdateDR_sig  = #DELAY_SIG 1;
                  ShiftIR_sig   = #DELAY_SIG 0;
                  UpdateIR_sig  = #DELAY_SIG 0;
            end
            CaptureIR:  begin 
                  Tlrst_sig     = #DELAY_SIG 0;
                  Rti_sig       = #DELAY_SIG 0;
                  CaptureDR_sig = #DELAY_SIG 0;
                  ShiftDR_sig   = #DELAY_SIG 0;
                  UpdateDR_sig  = #DELAY_SIG 0;
                  ShiftIR_sig   = #DELAY_SIG 0;
                  UpdateIR_sig  = #DELAY_SIG 0;
                  ClkIR_sig     = TCK;
            end
            ShiftIR:  begin 
                  Tlrst_sig     = #DELAY_SIG 0;
                  Rti_sig       = #DELAY_SIG 0;
                  CaptureDR_sig = #DELAY_SIG 0;
                  ShiftDR_sig   = #DELAY_SIG 0;
                  UpdateDR_sig  = #DELAY_SIG 0;
                  ShiftIR_sig   = #DELAY_SIG 1;
                  UpdateIR_sig  = #DELAY_SIG 0;
                  ClkIR_sig     = TCK;
            end
            UpdateIR: begin 
                         Tlrst_sig     = #DELAY_SIG 0;
                         Rti_sig       = #DELAY_SIG 0;
                         CaptureDR_sig = #DELAY_SIG 0;
                         ShiftDR_sig   = #DELAY_SIG 0;
                         UpdateDR_sig  = #DELAY_SIG 0;
                         ShiftIR_sig   = #DELAY_SIG 0;
                         UpdateIR_sig  = #DELAY_SIG 1;
                     end
            default: begin 
                         Tlrst_sig     = #DELAY_SIG 0;
                         Rti_sig       = #DELAY_SIG 0;
                         CaptureDR_sig = #DELAY_SIG 0;
                         ShiftDR_sig   = #DELAY_SIG 0;
                         UpdateDR_sig  = #DELAY_SIG 0;
                         ShiftIR_sig   = #DELAY_SIG 0;
                         UpdateIR_sig  = #DELAY_SIG 0;
                     end
         endcase

      end

    end // always(CurrentState)
//-----------------------------------------------------
  always@(TCK)
  begin
//       ClkIR_sig = ShiftIR_sig & TCK;
       ClkUpdateIR_sig = UpdateIR_sig & ~TCK;
  end // always
   
  always@(TCK)
  begin
       ClkID_sig = IDCODE_sig & TCK;
  end // always

// RESET 
  always@(Tlrst_sig)
  begin
     glbl.JTAG_RESET_GLBL   <= Tlrst_sig;
  end

// RUNTEST
  always@(Rti_sig)
  begin
     glbl.JTAG_RUNTEST_GLBL   <= Rti_sig;
  end
//-------------- TCK  NEGATIVE EDGE activities ----------
  always@(negedge TCK, negedge UpdateDR_sig)
  begin
     if(TCK == 0) begin
        glbl.JTAG_CAPTURE_GLBL <= CaptureDR_sig;
        glbl.JTAG_SHIFT_GLBL   <= ShiftDR_sig;
        TlrstN_sig             <= Tlrst_sig;
     end

     glbl.JTAG_UPDATE_GLBL  <= UpdateDR_sig;

  end // always

//--####################################################################
//--#####                       JtagIR                             #####
//--####################################################################
   always@(posedge ClkIR_sig) begin
      NextIRreg = {TDI, ir_int[IRLength-1:1]};

      if ((TRST== 0) && (TlrstN_sig == 0)) begin
         if(ShiftIR_sig == 1) begin 
            ir_int = NextIRreg;
            IRegLastBit_sig = ir_int[0];
         end
         else begin
            ir_int = IR_CAPTURE_VAL; 
            IRegLastBit_sig = ir_int[0];
         end
      end
   end //always 
//--------------------------------------------------------
   always@(posedge ClkUpdateIR_sig or posedge TlrstN_sig or
           posedge TRST) begin
      if ((TRST== 1) || (TlrstN_sig == 1)) begin
         IRcontent_sig = IDCODE_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)];
         IRegLastBit_sig = ir_int[0];
      end
      else if( (TRST == 0) && (TlrstN_sig == 0)) begin 
               IRcontent_sig = ir_int;
      end
   end //always 
//--####################################################################
//--#####                       JtagDecodeIR                       #####
//--####################################################################
   always@(IRcontent_sig) begin

      case(IRcontent_sig)

//          IR_CAPTURE_VAL : begin
//               ;
//               jtag_instruction_name = "IR_CAPTURE";
//          end

          BYPASS_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)] : begin
             jtag_instruction_name = "BYPASS";
             // if BYPASS instruction, set BYPASS signal to 1
             BYPASS_sig <= 1;
             IDCODE_sig <= 0;
             USER1_sig  <= 0;
             USER2_sig  <= 0;
             USER3_sig  <= 0;
             USER4_sig  <= 0;
          end

          IDCODE_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)] : begin
             jtag_instruction_name = "IDCODE";
             // if IDCODE instruction, set IDCODE signal to 1
             BYPASS_sig <= 0;
             IDCODE_sig <= 1;
             USER1_sig  <= 0;
             USER2_sig  <= 0;
             USER3_sig  <= 0;
             USER4_sig  <= 0;
          end

          USER1_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)] : begin
             jtag_instruction_name = "USER1";
             // if USER1 instruction, set USER1 signal to 1 
             BYPASS_sig <= 0;
             IDCODE_sig <= 0;
             USER1_sig  <= 1;
             USER2_sig  <= 0;
             USER3_sig  <= 0;
             USER4_sig  <= 0;
          end

          USER2_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)] : begin
             jtag_instruction_name = "USER2";
             // if USER2 instruction, set USER2 signal to 1 
             BYPASS_sig <= 0;
             IDCODE_sig <= 0;
             USER1_sig  <= 0;
             USER2_sig  <= 1;
             USER3_sig  <= 0;
             USER4_sig  <= 0;
          end

          USER3_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)] : begin
             jtag_instruction_name = "USER3";
             // if USER3 instruction, set USER3 signal to 1 
             BYPASS_sig <= 0;
             USER1_sig  <= 0;
             USER2_sig  <= 0;
             IDCODE_sig <= 0;
             USER3_sig  <= 1;
             USER4_sig  <= 0;
           end

          USER4_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)] : begin
             jtag_instruction_name = "USER4";
             // if USER4 instruction, set USER4 signal to 1 
             BYPASS_sig <= 0;
             IDCODE_sig <= 0;
             USER1_sig  <= 0;
             USER2_sig  <= 0;
             USER3_sig  <= 0;
             USER4_sig  <= 1;
          end
          default : begin
             jtag_instruction_name = "UNKNOWN";
             // if UNKNOWN instruction, set all signals to 0 
             BYPASS_sig <= 0;
             IDCODE_sig <= 0;
             USER1_sig  <= 0;
             USER2_sig  <= 0;
             USER3_sig  <= 0;
             USER4_sig  <= 0;
          end

      endcase
   end //always
//--####################################################################
//--#####                       JtagIDCODE                         #####
//--####################################################################
   always@(posedge ClkID_sig) begin
//     reg [(IDLength -1) : 0] IDreg;
     if(ShiftDR_sig == 1) begin
        IDreg = IDreg >> 1;
        IDreg[IDLength -1] = TDI;
     end
     else
        IDreg = IDCODEval_sig;

     IDregLastBit_sig = IDreg[0];
   end // always

//--####################################################################
//--#####                    JtagSetGlobalSignals                  #####
//--####################################################################
   always@(ClkUpdateIR_sig, Tlrst_sig, USER1_sig, USER2_sig, USER3_sig, USER4_sig) begin
      if(Tlrst_sig == 1) begin 
         glbl.JTAG_SEL1_GLBL <= 0;
         glbl.JTAG_SEL2_GLBL <= 0;
         glbl.JTAG_SEL3_GLBL <= 0;
         glbl.JTAG_SEL4_GLBL <= 0;
      end
      else if(Tlrst_sig == 0) begin
              if(USER1_sig == 1) begin
                 glbl.JTAG_SEL1_GLBL <= USER1_sig;
                 glbl.JTAG_SEL2_GLBL <= 0;
                 glbl.JTAG_SEL3_GLBL <= 0;
                 glbl.JTAG_SEL4_GLBL <= 0;
              end
              else if(USER2_sig == 1) begin
                 glbl.JTAG_SEL1_GLBL <= 0;
                 glbl.JTAG_SEL2_GLBL <= 1;
                 glbl.JTAG_SEL3_GLBL <= 0;
                 glbl.JTAG_SEL4_GLBL <= 0;
              end
              else if(USER3_sig == 1) begin
                 glbl.JTAG_SEL1_GLBL <= 0;
                 glbl.JTAG_SEL2_GLBL <= 0;
                 glbl.JTAG_SEL3_GLBL <= 1;
                 glbl.JTAG_SEL4_GLBL <= 0;
              end
              else if(USER4_sig == 1) begin
                 glbl.JTAG_SEL1_GLBL <= 0;
                 glbl.JTAG_SEL2_GLBL <= 0;
                 glbl.JTAG_SEL3_GLBL <= 0;
                 glbl.JTAG_SEL4_GLBL <= 1;
              end
              else if(ClkUpdateIR_sig == 1) begin
                 glbl.JTAG_SEL1_GLBL <= 0;
                 glbl.JTAG_SEL2_GLBL <= 0;
                 glbl.JTAG_SEL3_GLBL <= 0;
                 glbl.JTAG_SEL4_GLBL <= 0;
              end

      end
       
   end //always

//--####################################################################
//--#####                         OUTPUT                           #####
//--####################################################################
  assign glbl.JTAG_TDI_GLBL = TDI;
  assign glbl.JTAG_TCK_GLBL = TCK;
  assign glbl.JTAG_TMS_GLBL = TMS;

  always@(CurrentState, IRcontent_sig, BypassReg,
          IRegLastBit_sig, IDregLastBit_sig,  glbl.JTAG_USER_TDO1_GLBL,
          glbl.JTAG_USER_TDO2_GLBL, glbl.JTAG_USER_TDO3_GLBL, 
          glbl.JTAG_USER_TDO4_GLBL) 
  begin
      case (CurrentState)
         ShiftIR:  begin
                      TDO_latch <= IRegLastBit_sig;
                   end 
         ShiftDR:  begin
                      if(IRcontent_sig == IDCODE_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)]) 
                          TDO_latch <= IDregLastBit_sig;
                      else if(IRcontent_sig == BYPASS_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)]) 
                          TDO_latch <= BypassReg; 
                      else if(IRcontent_sig == USER1_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)]) 
                          TDO_latch <= glbl.JTAG_USER_TDO1_GLBL; 
                      else if(IRcontent_sig == USER2_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)]) 
                          TDO_latch <= glbl.JTAG_USER_TDO2_GLBL; 
                      else if(IRcontent_sig == USER3_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)]) 
                          TDO_latch <= glbl.JTAG_USER_TDO3_GLBL; 
                      else if(IRcontent_sig == USER4_INSTR[IRLengthMax - 1 : (IRLengthMax - IRLength)]) 
                          TDO_latch <= glbl.JTAG_USER_TDO4_GLBL; 
                      else
                          TDO_latch <= 1'bz;
                      end 
         default : begin
                          TDO_latch <= 1'bz;
                   end
      endcase // case(PART_NAME)
  end // always

  always@(negedge TCK)
  begin
// 213980 NCsim compile error fix
     TDO <= # 6000 TDO_latch;
  end // always
   
//--####################################################################
//--#####                         Timing                           #####
//--####################################################################

`ifdef XIL_TIMING
    
  specify
// 213980 NCsim compile error fix
//     (TCK => TDO) = (6000:6000:6000, 6000:6000:6000);

     $setuphold (posedge TCK, posedge TDI , 1000:1000:1000, 2000:2000:2000, notifier);
     $setuphold (posedge TCK, negedge TDI , 1000:1000:1000, 2000:2000:2000, notifier);

     $setuphold (posedge TCK, posedge TMS , 1000:1000:1000, 2000:2000:2000, notifier);
     $setuphold (posedge TCK, negedge TMS , 1000:1000:1000, 2000:2000:2000, notifier);

  endspecify

`endif //  `ifdef XIL_TIMING
    
endmodule // JTAG_SIME2

`endcelldefine

