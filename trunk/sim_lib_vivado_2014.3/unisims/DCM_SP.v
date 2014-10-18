// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/versclibs/data/simprims/DCM_SP.v,v 1.5 2004/03/31 22:46:10 patrickp Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.i (O.73)
//  \   \         Description : Xilinx Function Simulation Library Component
//  /   /                  Digital Clock Manager
// /___/   /\     Filename : DCM_SP.v
// \   \  /  \    Timestamp : 
//  \___\/\___\
//
// Revision:
//    02/28/06 - Initial version.
//    05/09/06 - Add clkin_ps_mkup and clkin_ps_mkup_win for phase shifting (CR 229789).
//    06/14/06 - Add clkin_ps_mkup_flag for multiple cycle delays (CR233283).
//    07/21/06 - Change range of variable phase shifting to +/- integer of 20*(Period-3ns).
//               Give warning not support initial phase shifting for variable phase shifting.
//               (CR 235216).
//    09/22/06 - Add lock_period and lock_fb to clkfb_div block (CR 418722).
//    12/19/06 - Add clkfb_div_en for clkfb2x divider (CR431210).
//    04/06/07 - Enable the clock out in clock low time after reset in model 
//               clock_divide_by_2  (CR 437471).
//    07/10/07 - Remove modulaton of ps_delay_md for none and fixed delay type (CR441155)
//    08/29/07 - Change delay of lock_fb_dly to 0.75*period, same as verilog (CR447628).
//    01/22/08 - Add () to ps_in * period_in of ps_delay_md calculation (CR466293).
//    02/21/08 - Align clk2x to both clk0 pos and neg edges. (CR467858).
//    03/01/08 - Disable alignment of clkfb and clkin_fb check when ps_lock high (CR468893)
//    03/20/08 - Not check clock lost when negative edge period smaller than positive
//               edge period in dcm_sp_clock_lost module (CR469499).
//             - always generate clk2x with even duty cycle regardless CLKIN duty cycle.(CR467858).
//    05/13/08 - Change min input clock freq from 1.0Mhz to 0.2Mhz (CR467770)
//    07/16/08 - remove condition for lock_out[0] when 2x feedback (CR476637).
//    04/20/09 - Delay LOCKED (CR518620)
//    12/03/09 - Add STATUS[5]=CLKFX STATUS[7]=CLKIN (CR538362)
//    08/10/11 - change ps_max_range (CR618799).
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
// End Revision


`timescale  1 ps / 1 ps
`celldefine
    
module DCM_SP (
	CLK0, CLK180, CLK270, CLK2X, CLK2X180, CLK90,
	CLKDV, CLKFX, CLKFX180, LOCKED, PSDONE, STATUS,
	CLKFB, CLKIN, DSSEN, PSCLK, PSEN, PSINCDEC, RST);

parameter real CLKDV_DIVIDE = 2.0;
parameter integer CLKFX_DIVIDE = 1;
parameter integer CLKFX_MULTIPLY = 4;
parameter CLKIN_DIVIDE_BY_2 = "FALSE";
parameter real CLKIN_PERIOD = 10.0;			// non-simulatable
parameter CLKOUT_PHASE_SHIFT = "NONE";
parameter CLK_FEEDBACK = "1X";
parameter DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS";	// non-simulatable
parameter DFS_FREQUENCY_MODE = "LOW";
parameter DLL_FREQUENCY_MODE = "LOW";
parameter DSS_MODE = "NONE";			// non-simulatable
parameter DUTY_CYCLE_CORRECTION = "TRUE";
parameter FACTORY_JF = 16'hC080;		// non-simulatable
parameter integer MAXPERCLKIN = 5000000;		// non-modifiable simulation parameter
parameter integer MAXPERPSCLK = 100000000;		// non-modifiable simulation parameter
parameter integer PHASE_SHIFT = 0;
parameter integer SIM_CLKIN_CYCLE_JITTER = 300;		// non-modifiable simulation parameter
parameter integer SIM_CLKIN_PERIOD_JITTER = 1000;	// non-modifiable simulation parameter
parameter STARTUP_WAIT = "FALSE";		// non-simulatable
parameter LOC = "UNPLACED";

localparam PS_STEP = 25;

input CLKFB, CLKIN, DSSEN;
input PSCLK, PSEN, PSINCDEC, RST;

output CLK0, CLK180, CLK270, CLK2X, CLK2X180, CLK90;
output CLKDV, CLKFX, CLKFX180, LOCKED, PSDONE;
output [7:0] STATUS;

reg CLK0, CLK180, CLK270, CLK2X, CLK2X180, CLK90;
reg CLKDV, CLKFX, CLKFX180;

wire clkin_lost_out, clkfx_lost_out;
wire locked_out_out;
wire clkfb_in, clkin_in, dssen_in;
wire psclk_in, psen_in, psincdec_in, rst_in;
reg clk0_out;
reg clk2x_out, clkdv_out;
reg clkfx_out, clkfx180_en;
reg rst_flag;
reg locked_out, psdone_out, ps_overflow_out, ps_lock;
reg locked_out0;
reg locked_out_dly;
reg clkfb_div, clkfb_chk, clkfb_div_en;
integer clkdv_cnt;

reg [1:0] clkfb_type;
reg [8:0] divide_type;
reg clkin_type;
reg [1:0] ps_type;
reg [3:0] deskew_adjust_mode;
reg dfs_mode_type;
reg dll_mode_type;
reg clk1x_type;
integer ps_in;

reg lock_period, lock_delay, lock_clkin, lock_clkfb;
reg first_time_locked;
reg en_status;
reg ps_overflow_out_ext;
reg clkin_lost_out_ext;
reg clkfx_lost_out_ext;
reg [1:0] lock_out;
reg lock_out1_neg;
reg lock_fb, lock_ps, lock_ps_dly, lock_fb_dly, lock_fb_dly_tmp;
reg fb_delay_found;
reg clock_stopped;
reg clkin_chkin, clkfb_chkin;

wire chk_enable, chk_rst;
wire clkin_div;
wire lock_period_pulse;
wire lock_period_dly, lock_period_dly1;

reg clkin_ps, clkin_ps_tmp, clkin_ps_mkup, clkin_ps_mkup_win, clkin_ps_mkup_flag;
reg clkin_fb;

time FINE_SHIFT_RANGE;
//time ps_delay, ps_delay_init, ps_delay_md, ps_delay_all, ps_max_range;
integer ps_delay, ps_delay_init, ps_delay_md, ps_delay_all, ps_max_range;
integer ps_delay_last;
integer ps_acc;
time clkin_edge;
time clkin_div_edge;
time clkin_ps_edge;
time delay_edge;
time clkin_period [2:0];
time period, period_50, period_25;
integer period_int, period_int2, period_int3, period_ps_tmp;
time period_div;
integer period_orig_int;
time period_orig1;
time period_orig;
time period_ps;
time clkout_delay;
time fb_delay;
time period_fx, remain_fx;
time period_dv_high, period_dv_low;
time cycle_jitter, period_jitter;

reg clkin_window, clkfb_window;
reg [2:0] rst_reg;
reg [12:0] numerator, denominator, gcd;
reg [23:0] i, n, d, p;

reg notifier;

initial begin
    #1;
    if ($realtime == 0) begin
	$display ("Simulator Resolution Error : Simulator resolution is set to a value greater than 1 ps.");
	$display ("In order to simulate the DCM_SP, the simulator resolution must be set to 1ps or smaller.");
	$finish;
    end
end

initial begin
    case (CLKDV_DIVIDE)
	1.5  : divide_type = 'd3;
	2.0  : divide_type = 'd4;
	2.5  : divide_type = 'd5;
	3.0  : divide_type = 'd6;
	3.5  : divide_type = 'd7;
	4.0  : divide_type = 'd8;
	4.5  : divide_type = 'd9;
	5.0  : divide_type = 'd10;
	5.5  : divide_type = 'd11;
	6.0  : divide_type = 'd12;
	6.5  : divide_type = 'd13;
	7.0  : divide_type = 'd14;
	7.5  : divide_type = 'd15;
	8.0  : divide_type = 'd16;
	9.0  : divide_type = 'd18;
	10.0 : divide_type = 'd20;
	11.0 : divide_type = 'd22;
	12.0 : divide_type = 'd24;
	13.0 : divide_type = 'd26;
	14.0 : divide_type = 'd28;
	15.0 : divide_type = 'd30;
	16.0 : divide_type = 'd32;
	default : begin
	    $display("Attribute Syntax Error : The attribute CLKDV_DIVIDE on DCM_SP instance %m is set to %0.1f.  Legal values for this attribute are 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, or 16.0.", CLKDV_DIVIDE);
	    $finish;
	end
    endcase

    if ((CLKFX_DIVIDE <= 0) || (32 < CLKFX_DIVIDE)) begin
	$display("Attribute Syntax Error : The attribute CLKFX_DIVIDE on DCM_SP instance %m is set to %d.  Legal values for this attribute are 1 ... 32.", CLKFX_DIVIDE);
	$finish;
    end

    if ((CLKFX_MULTIPLY <= 1) || (32 < CLKFX_MULTIPLY)) begin
	$display("Attribute Syntax Error : The attribute CLKFX_MULTIPLY on DCM_SP instance %m is set to %d.  Legal values for this attribute are 2 ... 32.", CLKFX_MULTIPLY);
	$finish;
    end

    case (CLKIN_DIVIDE_BY_2)
	"false" : clkin_type = 0;
	"FALSE" : clkin_type = 0;
	"true"  : clkin_type = 1;
	"TRUE"  : clkin_type = 1;
	default : begin
	    $display("Attribute Syntax Error : The attribute CLKIN_DIVIDE_BY_2 on DCM_SP instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", CLKIN_DIVIDE_BY_2);
	    $finish;
	end
    endcase

    case (CLKOUT_PHASE_SHIFT)
	"NONE"     : begin
			 ps_in = 256;
			 ps_type = 2'b0;
		     end
	"none"     : begin
			 ps_in = 256;
			 ps_type = 2'b0;
		     end
	"FIXED"    : begin
			 ps_in = PHASE_SHIFT + 256;
			 ps_type = 2'b01;
		     end
	"fixed"    : begin
			 ps_in = PHASE_SHIFT + 256;
			 ps_type = 2'b01;
		     end
	"VARIABLE" : begin
			 ps_in = PHASE_SHIFT + 256;
			 ps_type = 2'b10;
		     end
	"variable" : begin
			 ps_in = PHASE_SHIFT + 256;
			 ps_type = 2'b10;
                         if (PHASE_SHIFT != 0)
	                     $display("Attribute Syntax Warning : The attribute PHASE_SHIFT on DCM_SP instance %m is set to %d.  The maximum variable phase shift range is only valid when initial phase shift PHASE_SHIFT is zero.", PHASE_SHIFT);
		     end
	default : begin
	    $display("Attribute Syntax Error : The attribute CLKOUT_PHASE_SHIFT on DCM_SP instance %m is set to %s.  Legal values for this attribute are NONE, FIXED or VARIABLE.", CLKOUT_PHASE_SHIFT);
	    $finish;
	end
    endcase


    case (CLK_FEEDBACK)
	"none" : clkfb_type = 2'b00;
	"NONE" : clkfb_type = 2'b00;
	"1x"   : clkfb_type = 2'b01;
	"1X"   : clkfb_type = 2'b01;
	"2x"   : clkfb_type = 2'b10;
	"2X"   : clkfb_type = 2'b10;
	default : begin
	    $display("Attribute Syntax Error : The attribute CLK_FEEDBACK on DCM_SP instance %m is set to %s.  Legal values for this attribute are NONE, 1X or 2X.", CLK_FEEDBACK);
	    $finish;
	end
    endcase

    case (DESKEW_ADJUST)
	"source_synchronous" : deskew_adjust_mode = 8;
	"SOURCE_SYNCHRONOUS" : deskew_adjust_mode = 8;
	"system_synchronous" : deskew_adjust_mode = 11;
	"SYSTEM_SYNCHRONOUS" : deskew_adjust_mode = 11;
	"0"		     : deskew_adjust_mode = 0;
	"1"		     : deskew_adjust_mode = 1;
	"2"		     : deskew_adjust_mode = 2;
	"3"		     : deskew_adjust_mode = 3;
	"4"		     : deskew_adjust_mode = 4;
	"5"		     : deskew_adjust_mode = 5;
	"6"		     : deskew_adjust_mode = 6;
	"7"		     : deskew_adjust_mode = 7;
	"8"		     : deskew_adjust_mode = 8;
	"9"		     : deskew_adjust_mode = 9;
	"10"		     : deskew_adjust_mode = 10;
	"11"		     : deskew_adjust_mode = 11;
	"12"		     : deskew_adjust_mode = 12;
	"13"		     : deskew_adjust_mode = 13;
	"14"		     : deskew_adjust_mode = 14;
	"15"		     : deskew_adjust_mode = 15;
	default : begin
	    $display("Attribute Syntax Error : The attribute DESKEW_ADJUST on DCM_SP instance %m is set to %s.  Legal values for this attribute are SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or 0 ... 15.", DESKEW_ADJUST);
	    $finish;
	end
    endcase

    case (DFS_FREQUENCY_MODE)
	"high" : dfs_mode_type = 1;
	"HIGH" : dfs_mode_type = 1;
	"low"  : dfs_mode_type = 0;
	"LOW"  : dfs_mode_type = 0;
	default : begin
	    $display("Attribute Syntax Error : The attribute DFS_FREQUENCY_MODE on DCM_SP instance %m is set to %s.  Legal values for this attribute are HIGH or LOW.", DFS_FREQUENCY_MODE);
	    $finish;
	end
    endcase

    period_jitter = SIM_CLKIN_PERIOD_JITTER;
    cycle_jitter = SIM_CLKIN_CYCLE_JITTER;

    case (DLL_FREQUENCY_MODE)
	"high" : dll_mode_type = 1;
	"HIGH" : dll_mode_type = 1;
	"low"  : dll_mode_type = 0;
	"LOW"  : dll_mode_type = 0;
	default : begin
	    $display("Attribute Syntax Error : The attribute DLL_FREQUENCY_MODE on DCM_SP instance %m is set to %s.  Legal values for this attribute are HIGH or LOW.", DLL_FREQUENCY_MODE);
	    $finish;
	end
    endcase

    if ((dll_mode_type ==1) && (clkfb_type == 2'b10)) begin
	    $display("Attribute Syntax Error : The attributes DLL_FREQUENCY_MODE on DCM_SP instance %m is set to %s and CLK_FEEDBACK is set to %s.  CLK_FEEDBACK 2X is not supported when DLL_FREQUENCY_MODE is  HIGH.", DLL_FREQUENCY_MODE, CLK_FEEDBACK);
           $finish;
    end 

    case (DSS_MODE)
	"none" : ;
	"NONE" : ;
	default : begin
	    $display("Attribute Syntax Error : The attribute DSS_MODE on DCM_SP instance %m is set to %s.  Legal values for this attribute is NONE.", DSS_MODE);
	    $finish;
	end
    endcase

    case (DUTY_CYCLE_CORRECTION)
	"false" : clk1x_type = 0;
	"FALSE" : clk1x_type = 0;
	"true"  : clk1x_type = 1;
	"TRUE"  : clk1x_type = 1;
	default : begin
	    $display("Attribute Syntax Error : The attribute DUTY_CYCLE_CORRECTION on DCM_SP instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", DUTY_CYCLE_CORRECTION);
	    $finish;
	end
    endcase

    if ((PHASE_SHIFT < -255) || (PHASE_SHIFT > 255)) begin
	$display("Attribute Syntax Error : The attribute PHASE_SHIFT on DCM_SP instance %m is set to %d.  Legal values for this attribute are -255 ... 255.", PHASE_SHIFT);
	$display("Error : PHASE_SHIFT = %d is not -255 ... 255.", PHASE_SHIFT);
	$finish;
    end

    case (STARTUP_WAIT)
	"false" : ;
	"FALSE" : ;
	"true"  : ;
	"TRUE"  : ;
	default : begin
	    $display("Attribute Syntax Error : The attribute STARTUP_WAIT on DCM_SP instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", STARTUP_WAIT);
	    $finish;
	end
    endcase
end

//
// fx parameters
//

initial begin
    gcd = 1;
    for (i = 2; i <= CLKFX_MULTIPLY; i = i + 1) begin
	if (((CLKFX_MULTIPLY % i) == 0) && ((CLKFX_DIVIDE % i) == 0))
	    gcd = i;
    end
    numerator = CLKFX_MULTIPLY / gcd;
    denominator = CLKFX_DIVIDE / gcd;
end

//
// input wire delays
//

buf b_clkin (clkin_in, CLKIN);
buf b_clkfb (clkfb_in, CLKFB);
buf b_dssen (dssen_in, DSSEN);
buf b_psclk (psclk_in, PSCLK);
buf b_psen (psen_in, PSEN);
buf b_psincdec (psincdec_in, PSINCDEC);
buf b_rst (rst_in, RST);
buf b_LOCKED (LOCKED, locked_out_out);
buf b_PSDONE (PSDONE, psdone_out);
buf b_ps_overflow (STATUS[0], ps_overflow_out_ext);
buf b_clkin_lost (STATUS[1], clkin_lost_out_ext);
buf b_clkfx_lost (STATUS[2], clkfx_lost_out_ext);
buf b_sts_5 (STATUS[5], clkfx_out);
buf b_sts_7 (STATUS[7], clkin_in);

assign STATUS[4:3] = 2'b0;
assign STATUS[6] = 1'b0;

dcm_sp_clock_divide_by_2 i_clock_divide_by_2 (clkin_in, clkin_type, clkin_div, rst_in);

dcm_sp_maximum_period_check #("CLKIN", MAXPERCLKIN) i_max_clkin (clkin_in, rst_in);
dcm_sp_maximum_period_check #("PSCLK", MAXPERPSCLK) i_max_psclk (psclk_in, rst_in);

dcm_sp_clock_lost i_clkin_lost (clkin_in, first_time_locked, clkin_lost_out, rst_in);
dcm_sp_clock_lost i_clkfx_lost (CLKFX, first_time_locked, clkfx_lost_out, rst_in);

always @(rst_in or en_status or clkfx_lost_out or clkin_lost_out or ps_overflow_out)
   if (rst_in == 1 || en_status == 0)  begin
       ps_overflow_out_ext = 0;
       clkin_lost_out_ext = 0;
       clkfx_lost_out_ext = 0;
    end
   else
   begin
      ps_overflow_out_ext = ps_overflow_out;
      clkin_lost_out_ext = clkin_lost_out;
      clkfx_lost_out_ext = clkfx_lost_out;
   end

always @(posedge rst_in or posedge LOCKED)
  if (rst_in == 1)
      en_status <= 0;
   else
      en_status <= 1;


always @(clkin_div)
    clkin_ps_tmp <= #(ps_delay_md) clkin_div;

always @(clkin_ps_tmp or clkin_ps_mkup or clkin_ps_mkup_win)
  if (clkin_ps_mkup_win)
       clkin_ps = clkin_ps_mkup;
  else
       clkin_ps = clkin_ps_tmp;   

always @(ps_delay_last or period_int or ps_delay) begin
    period_int2 = 2 * period_int;
    period_int3 = 3 * period_int;
  if ((ps_delay_last >= period_int  && ps_delay < period_int) ||
       (ps_delay_last >= period_int2  && ps_delay < period_int2) ||
       (ps_delay_last >= period_int3  && ps_delay < period_int3))
           clkin_ps_mkup_flag = 1;
   else 
           clkin_ps_mkup_flag = 0;
end

always @(posedge clkin_div or negedge clkin_div) begin
 if (ps_type == 2'b10) begin
  if ((ps_delay_last > 0  && ps_delay <= 0 ) || clkin_ps_mkup_flag == 1) begin 
     if (clkin_div) begin
        clkin_ps_mkup_win <= 1;
        clkin_ps_mkup <= 1;
        #1;
        @(negedge clkin_div) begin
           clkin_ps_mkup_win <= 1;
           clkin_ps_mkup <= 0;
        end
     end
     else begin
        clkin_ps_mkup_win <= 0;
        clkin_ps_mkup <= 0;
        #1;
        @(posedge clkin_div) begin
           clkin_ps_mkup_win <= 1;
           clkin_ps_mkup <= 1;
        end 
        @(negedge clkin_div) begin
           clkin_ps_mkup_win <= 1;
           clkin_ps_mkup <= 0;
        end
     end
   end
   else begin
        clkin_ps_mkup_win <= 0;
        clkin_ps_mkup <= 0;
   end
   ps_delay_last <= ps_delay;
 end
end

always @(clkin_ps or lock_fb)
    clkin_fb =  clkin_ps & lock_fb;

always @(negedge clkfb_in or posedge rst_in)
    if (rst_in)
        clkfb_div_en <= 0;
    else
       if (lock_fb_dly && lock_period && lock_fb && ~clkin_ps)
          clkfb_div_en <= 1;

always @(posedge clkfb_in or posedge rst_in)
    if (rst_in)
        clkfb_div <= 0;
    else
      if (clkfb_div_en )
        clkfb_div <= ~clkfb_div;

always @(clkfb_in or clkfb_div )
    if (clkfb_type == 2'b10 )
         clkfb_chk = clkfb_div;
    else 
         clkfb_chk = clkfb_in & lock_fb_dly;

always @(posedge clkin_fb or posedge chk_rst)
    if (chk_rst)
       clkin_chkin <= 0;
    else 
       clkin_chkin <= 1;

always @(posedge clkfb_chk or posedge chk_rst)
    if (chk_rst)
       clkfb_chkin <= 0;
    else 
       clkfb_chkin <= 1;

    assign chk_rst = (rst_in==1 || clock_stopped==1 ) ? 1 : 0;
    assign chk_enable = (clkin_chkin == 1 && clkfb_chkin == 1 && 
                         lock_ps ==1 && lock_fb ==1 && lock_fb_dly == 1) ? 1 : 0;

always @(posedge clkin_div or posedge rst_in)
  if (rst_in) begin
     period_div <= 0;
     clkin_div_edge <= 0;
   end
  else
   if ( clkin_div ==1 ) begin
      clkin_div_edge <= $time;
      if (($time - clkin_div_edge) <= (1.5 * period_div))
	  period_div <= $time - clkin_div_edge;
      else if ((period_div == 0) && (clkin_div_edge != 0))
	  period_div <= $time - clkin_div_edge;
   end

always @(posedge clkin_ps or posedge rst_in) 
  if (rst_in) begin
        period_ps <= 0;
        clkin_ps_edge <= 0;
  end
  else 
  if (clkin_ps == 1 ) begin
    clkin_ps_edge <= $time;
    if (($time - clkin_ps_edge) <= (1.5 * period_ps))
	period_ps <= $time - clkin_ps_edge;
    else if ((period_ps == 0) && (clkin_ps_edge != 0))
	period_ps <= $time - clkin_ps_edge;
 end

always @(posedge clkin_ps) begin
    lock_ps <= lock_period;
    lock_ps_dly <= lock_ps;
    lock_fb <= lock_ps_dly;
    lock_fb_dly_tmp <= lock_fb;
end

always @(negedge clkin_ps or posedge rst_in) 
  if (rst_in)
    lock_fb_dly <= 1'b0;
  else
    lock_fb_dly <= #(period * 0.75) lock_fb_dly_tmp;


always @(period or fb_delay or posedge rst_in)
  if (rst_in)
     clkout_delay = 0;
  else begin
    if (fb_delay == 0)
      clkout_delay = 0;
    else
      clkout_delay = period - fb_delay;
  end

//
// generate master reset signal
//

always @(posedge clkin_in) begin
    rst_reg[0] <= rst_in;
    rst_reg[1] <= rst_reg[0] & rst_in;
    rst_reg[2] <= rst_reg[1] & rst_reg[0] & rst_in;
end

reg rst_tmp1, rst_tmp2;
initial
begin
rst_tmp1 = 0;
rst_tmp2 = 0;
rst_flag = 0;
end

always @(rst_in) 
begin
   if (rst_in)
       rst_flag = 0;

   rst_tmp1 = rst_in;
   if (rst_tmp1 == 0 && rst_tmp2 == 1) begin
      if ((rst_reg[2] & rst_reg[1] & rst_reg[0]) == 0) begin
         rst_flag = 1;
	$display("Input Error : RST on instance %m must be asserted for 3 CLKIN clock cycles.");
      end
   end
   rst_tmp2 = rst_tmp1; 
end

initial begin
    CLK0 = 0;
    CLK180 = 0;
    CLK270 = 0;
    CLK2X = 0;
    CLK2X180 = 0;
    CLK90 = 0;
    CLKDV = 0;
    CLKFX = 0;
    CLKFX180 = 0;
    clk0_out = 0;
    clk2x_out = 0;
    clkdv_out = 0;
    clkdv_cnt = 0;
    clkfb_window = 0;
    clkfx_out = 0;
    clkfx180_en = 0;
    clkin_div_edge = 0;
    clkin_period[0] = 0;
    clkin_period[1] = 0;
    clkin_period[2] = 0;
    clkin_edge = 0;
    clkin_ps_edge = 0;
    clkin_window = 0;
    clkout_delay = 0;
    clock_stopped = 1;
    fb_delay  = 0;
    fb_delay_found = 0;
    lock_clkfb = 0;
    lock_clkin = 0;
    lock_delay = 0;
    lock_fb = 0;
    lock_fb_dly = 0;
    lock_out = 2'b00;
    lock_out1_neg = 0;
    lock_period = 0;
    lock_ps = 0;
    lock_ps_dly = 0;
    locked_out = 0;
    locked_out0 = 0;
    locked_out_dly = 0;
    period = 0;
    period_int = 0;
    period_int2 = 0;
    period_int3 = 0;
    period_div = 0;
    period_fx = 0;
    period_orig = 0;
    period_orig_int = 0;
    period_ps = 0;
    psdone_out = 0;
    ps_delay = 0;
    ps_delay_md = 0;
    ps_delay_init = 0;
    ps_acc = 0;
    ps_delay_all = 0; 
    ps_lock = 0;
    ps_overflow_out = 0;
    ps_overflow_out_ext = 0;
    clkin_lost_out_ext = 0;
    clkfx_lost_out_ext = 0;
    rst_reg = 3'b000;
    first_time_locked = 0;
    en_status = 0;
    clkfb_div = 0;
    clkin_chkin = 0;
    clkfb_chkin = 0;
    clkin_ps_mkup = 0;
    clkin_ps_mkup_win = 0;
    clkin_ps_mkup_flag = 0;
    ps_delay_last = 0;
    clkin_ps_tmp = 0;
end

// RST less than 3 cycles, lock = x

  assign locked_out_out = (rst_flag) ? 1'bx : locked_out_dly;

  always @(locked_out)
    locked_out_dly <= #clkout_delay locked_out;

//
// detect_first_time_locked
//
always @(posedge locked_out)
  if (first_time_locked == 0)
          first_time_locked <= 1;

//
// phase shift parameters
//

always @(posedge lock_period) 
    ps_delay_init <= ps_in * period_orig /256;


always @(period) begin
    period_int = period;
    if (clkin_type==1)
       period_ps_tmp = 2 * period;
    else 
       period_ps_tmp = period;

   if (period_ps_tmp > 3000) begin
      if (period_ps_tmp > 16667)
        ps_max_range = (10 * (period_ps_tmp - 3000))/1000;
      else
        ps_max_range = (15 * (period_ps_tmp - 3000))/1000;
   end
   else
     ps_max_range = 0;
end

always @(ps_delay or rst_in or period_int or fb_delay_found)
  if ( rst_in)
       ps_delay_md = 0;
  else if (fb_delay_found) begin
     if (ps_type == 2'b10)
       ps_delay_md =   period_int + ps_delay %  period_int;
     else
       ps_delay_md =   period_int + (ps_in * period_int) /256;
  end 

always @(posedge psclk_in or posedge rst_in or posedge lock_period_pulse) 
  if (rst_in) begin
     ps_delay <= 0;
     ps_overflow_out <= 0;
     ps_acc <= 0;
  end
  else if (lock_period_pulse) 
     ps_delay <= ps_delay_init;
  else begin
    if (ps_type == 2'b10)
	if (psen_in) begin
	    if (ps_lock == 1)
		  $display(" Warning : Please wait for PSDONE signal before adjusting the Phase Shift.");
	    else if (lock_ps)  begin
	      if (psincdec_in == 1) begin
		if (ps_acc > ps_max_range)
		    ps_overflow_out <= 1;
		else begin
		    ps_delay <= ps_delay  + PS_STEP;
                    ps_acc <= ps_acc + 1;
		    ps_overflow_out <= 0;
		end
		ps_lock <= 1;
	      end
	      else if (psincdec_in == 0) begin
		if (ps_acc < -ps_max_range)
		      ps_overflow_out <= 1;
		else begin
		    ps_delay <= ps_delay - PS_STEP;
                    ps_acc <= ps_acc - 1;
		    ps_overflow_out <= 0;
		end
		ps_lock <= 1;
	      end
           end
     end
     if (psdone_out)
         ps_lock <= 0;
  end

always @(posedge ps_lock) begin
    @(posedge clkin_ps);
    @(posedge psclk_in);
    @(posedge psclk_in);
    @(posedge psclk_in)
	psdone_out <= 1;
    @(posedge psclk_in)
	psdone_out <= 0;
//	ps_lock <= 0;
end

//
// determine clock period
//

always @(posedge clkin_div or negedge clkin_div or posedge rst_in)
  if (rst_in == 1) begin
    clkin_period[0] <= 0;
    clkin_period[1] <= 0;
    clkin_period[2] <= 0;
    clkin_edge <= 0;
  end
  else
  if (clkin_div == 1) begin
    clkin_edge <= $time;
    clkin_period[2] <= clkin_period[1];
    clkin_period[1] <= clkin_period[0];
    if (clkin_edge != 0)
	clkin_period[0] <= $time - clkin_edge;
  end
  else if (clkin_div == 0)
      if (lock_period == 1) 
        if (100000000 < clkin_period[0]/1000)
        begin
        end
        else if ((period_orig * 2 < clkin_period[0]) && (clock_stopped == 0)) begin
          clkin_period[0] <= clkin_period[1];
        end

always @(negedge clkin_div or posedge rst_in) 
  if (rst_in == 1) begin
      lock_period <= 0;
      clock_stopped <= 1;
  end
  else begin
    if (lock_period == 1'b0) begin
	if ((clkin_period[0] != 0) &&
		(clkin_period[0] - cycle_jitter <= clkin_period[1]) &&
		(clkin_period[1] <= clkin_period[0] + cycle_jitter) &&
		(clkin_period[1] - cycle_jitter <= clkin_period[2]) &&
		(clkin_period[2] <= clkin_period[1] + cycle_jitter)) begin
	    lock_period <= 1;
	    period_orig <= (clkin_period[0] +
			    clkin_period[1] +
			    clkin_period[2]) / 3;
	    period <= clkin_period[0];
	end
    end
    else if (lock_period == 1'b1) begin
	if (100000000 < (clkin_period[0] / 1000)) begin
	    $display(" Warning : CLKIN stopped toggling on instance %m exceeds %d ms.  Current CLKIN Period = %1.3f ns.", 100, clkin_period[0] / 1000.0);
	    lock_period <= 0;
	    @(negedge rst_reg[2]);
	end
	else if ((period_orig * 2 < clkin_period[0]) && clock_stopped == 1'b0) begin
	    clock_stopped <= 1'b1;
	end
	else if ((clkin_period[0] < period_orig - period_jitter) ||
		(period_orig + period_jitter < clkin_period[0])) begin
	    $display(" Warning : Input Clock Period Jitter on instance %m exceeds %1.3f ns.  Locked CLKIN Period = %1.3f.  Current CLKIN Period = %1.3f.", period_jitter / 1000.0, period_orig / 1000.0, clkin_period[0] / 1000.0);
	    lock_period <= 0;
	    @(negedge rst_reg[2]);
	end
	else if ((clkin_period[0] < clkin_period[1] - cycle_jitter) ||
		(clkin_period[1] + cycle_jitter < clkin_period[0])) begin
	    $display(" Warning : Input Clock Cycle-Cycle Jitter on instance %m exceeds %1.3f ns.  Previous CLKIN Period = %1.3f.  Current CLKIN Period = %1.3f.", cycle_jitter / 1000.0, clkin_period[1] / 1000.0, clkin_period[0] / 1000.0);
	    lock_period <= 0;
	    @(negedge rst_reg[2]);
	end
	else begin
	    period <= clkin_period[0];
	    clock_stopped <= 1'b0;
	end
    end
end

  assign #1 lock_period_dly1 = lock_period;
  assign #(period_50) lock_period_dly = lock_period_dly1;
  assign lock_period_pulse = (lock_period_dly1==1 && lock_period_dly==0) ? 1 : 0;

//
// determine clock delay
//

  assign lock_out_fbd = lock_out[0];

always @(posedge lock_out_fbd or posedge rst_in) 
  if (rst_in) begin
    fb_delay  <= 0;
    fb_delay_found <= 0;
  end
  else begin
  if ( clkfb_type != 2'b00 && fb_delay_found == 0) begin
	if (clkfb_type == 2'b01) begin
	    @(posedge CLK0 or rst_in)
		delay_edge = $time;
	end
	else if (clkfb_type == 2'b10) begin
	    @(posedge CLK2X or rst_in)
		delay_edge = $time;
	end
	@(posedge clkfb_in or rst_in) begin
     if (clkfb_type == 2'b10) begin
        period_orig1 = period_orig / 2;
        fb_delay <= ($time - delay_edge) % period_orig1;
     end
     else
       fb_delay <= ($time - delay_edge) % period_orig;

      fb_delay_found <= 1;
     end
    end
  end

//
// determine feedback lock
//

always @(posedge clkfb_chk or posedge rst_in) 
  if (rst_in)
      clkfb_window <= 0;
  else begin
      clkfb_window <= 1;
    #cycle_jitter clkfb_window <= 0;
  end

always @(posedge clkin_fb or posedge rst_in) 
  if (rst_in)
      clkin_window <= 0;
  else begin
      clkin_window <= 1;
    #cycle_jitter clkin_window <= 0;
  end

always @(posedge clkin_fb or posedge rst_in) 
  if (rst_in)
     lock_clkin <= 0;
  else begin
    #1
    if ((clkfb_window && fb_delay_found) || (clkin_lost_out == 1'b1 && lock_out[0]==1'b1)) 
	lock_clkin <= 1;
    else
       if (chk_enable==1 && ps_lock == 0)
	 lock_clkin <= 0;
  end

always @(posedge clkfb_chk or posedge rst_in) 
  if (rst_in)
    lock_clkfb <= 0;
  else begin
    #1
    if ((clkin_window && fb_delay_found) || (clkin_lost_out == 1'b1 && lock_out[0]==1'b1))  
	lock_clkfb <= 1;
    else
       if (chk_enable ==1 && ps_lock == 0)
	lock_clkfb <= 0;
  end

always @(negedge clkin_fb or posedge rst_in) 
  if (rst_in)
    lock_delay <= 0;
  else
    lock_delay <= lock_clkin || lock_clkfb;

//
// generate lock signal
//

always @(posedge clkin_ps or posedge rst_in) 
  if (rst_in) begin
      lock_out <= 2'b0;
      locked_out <=0;
      locked_out0 <=0;
  end
  else begin
	 lock_out[0] <= lock_period;
    lock_out[1] <= lock_out[0];
    if (lock_fb_dly_tmp == 1)
      locked_out0 <= lock_out[1];
      locked_out <= locked_out0;
  end

always @(negedge clkin_ps or posedge rst_in)
  if (rst_in)
    lock_out1_neg <= 0;
  else
//    lock_out1_neg <= lock_out[1];
    lock_out1_neg <= locked_out0;


//
// generate the clk1x_out
//

always @(period) begin
     period_25 = period /4;
     period_50 = 2 * period_25;
end

always @(posedge clkin_ps or negedge clkin_ps or posedge rst_in) 
  if (rst_in) 
      clk0_out <= 0;
  else 
    if (clkin_ps ==1)
       if (clk1x_type==1 && lock_out[0]) begin
          clk0_out <= 1;
          #(period_50)
             clk0_out <= 0;
       end
       else
          clk0_out <= 1;
    else
      if (clkin_ps == 0 && ((clk1x_type && lock_out[0]) == 0 || (lock_out[0]== 1 && lock_out[1]== 0)))
          clk0_out <= 0;

//
// generate the clk2x_out
//

always @(posedge clkin_ps or posedge rst_in )
  if (rst_in)
     clk2x_out <= 0;
  else begin
    clk2x_out <= 1;
    #(period_25)
    clk2x_out <= 0;
    if (lock_out[0]) begin
          #(period_25);
           clk2x_out <= 1;
          #(period_25);
           clk2x_out <= 0;
    end
    else begin
        #(period_50);
    end
  end

//
// generate the clkdv_out
//

always @(posedge clkin_ps or negedge clkin_ps or posedge rst_in)
  if (rst_in) begin
       clkdv_out <= 1'b0;
       clkdv_cnt <= 0;
  end
  else
    if (lock_out1_neg) begin
      if (clkdv_cnt >= divide_type -1)
           clkdv_cnt <= 0;
      else
           clkdv_cnt <= clkdv_cnt + 1;

      if (clkdv_cnt < divide_type /2)
          clkdv_out <= 1'b1;
      else
         if ( (divide_type[0] == 1'b1) && dll_mode_type == 1'b0)
             clkdv_out <= #(period_25) 1'b0;
         else
            clkdv_out <= 1'b0;
    end


//
// generate fx output signal
//

always @(lock_period or period or denominator or numerator) begin
    if (lock_period == 1'b1) begin
	period_fx = (period * denominator) / (numerator * 2);
	remain_fx = (period * denominator) % (numerator * 2);
    end
end

always @(posedge clkin_ps or posedge clkin_lost_out or posedge rst_in ) 
    if (rst_in == 1) 
       clkfx_out = 1'b0;
    else if (clkin_lost_out == 1'b1 ) begin
           if (locked_out == 1)
            @(negedge rst_reg[2]);
        end
    else
      if (locked_out0 == 1) begin
	clkfx_out = 1'b1;
	for (p = 0; p < (numerator * 2 - 1); p = p + 1) begin
	    #(period_fx);
	    if (p < remain_fx)
		#1;
	    clkfx_out = !clkfx_out;
	end
	if (period_fx > (period_50)) begin
	    #(period_fx - (period_50));
	end
      end

//
// generate all output signal
//

always @(rst_in)
if (rst_in) begin
   assign CLK0 = 0;
   assign CLK90 = 0;
   assign CLK180 = 0;
   assign CLK270 = 0;
   assign CLK2X = 0;
   assign CLK2X180 =0;
   assign CLKDV = 0;
   assign CLKFX = 0;
   assign CLKFX180 = 0;
end
else begin
   deassign CLK0;
   deassign CLK90;
   deassign CLK180;
   deassign CLK270;
   deassign CLK2X;
   deassign CLK2X180;
   deassign CLKDV;
   deassign CLKFX;
   deassign CLKFX180;
end

always @(clk0_out) begin
    CLK0 <= #(clkout_delay) clk0_out && (clkfb_type != 2'b00);
    CLK90 <= #(clkout_delay + period_25) clk0_out && !dll_mode_type && (clkfb_type != 2'b00);
    CLK180 <= #(clkout_delay) ~clk0_out && (clkfb_type != 2'b00);
    CLK270 <= #(clkout_delay + period_25) ~clk0_out && !dll_mode_type && (clkfb_type != 2'b00);
  end

always @(clk2x_out) begin
    CLK2X <= #(clkout_delay) clk2x_out && !dll_mode_type && (clkfb_type != 2'b00);
     CLK2X180 <= #(clkout_delay) ~clk2x_out && !dll_mode_type && (clkfb_type != 2'b00);
end

always @(clkdv_out) 
    CLKDV <= #(clkout_delay) clkdv_out && (clkfb_type != 2'b00);

always @(clkfx_out )
    CLKFX <= #(clkout_delay) clkfx_out;

always @( clkfx_out or  first_time_locked or locked_out)
  if ( ~first_time_locked)
     CLKFX180 = 0;
  else
     CLKFX180 <=  #(clkout_delay) ~clkfx_out;

specify
	(CLKIN => LOCKED) = (100:100:100, 100:100:100);
	(PSCLK => PSDONE) = (100:100:100, 100:100:100);

        $setuphold (posedge PSCLK, posedge PSEN, 0:0:0, 0:0:0, notifier);
        $setuphold (posedge PSCLK, negedge PSEN, 0:0:0, 0:0:0, notifier);
        $setuphold (posedge PSCLK, posedge PSINCDEC, 0:0:0, 0:0:0, notifier);
        $setuphold (posedge PSCLK, negedge PSINCDEC, 0:0:0, 0:0:0, notifier);

        $period (posedge CLKIN, 1111, notifier);
        $period (posedge PSCLK, 1111, notifier);
        $width (posedge CLKIN, 0:0:0, 0, notifier);
        $width (negedge CLKIN, 0:0:0, 0, notifier);
        $width (posedge PSCLK, 0:0:0, 0, notifier);
        $width (negedge PSCLK, 0:0:0, 0, notifier);
        $width (posedge RST, 0:0:0, 0, notifier);

	specparam PATHPULSE$ = 0;
endspecify

endmodule

//////////////////////////////////////////////////////

module dcm_sp_clock_divide_by_2 (clock, clock_type, clock_out, rst);
input clock;
input clock_type;
input rst;
output clock_out;

reg clock_out;
reg clock_div2;
reg [2:0] rst_reg;
wire clk_src;

initial begin
    clock_out = 1'b0;
    clock_div2 = 1'b0;
end

always @(posedge clock) 
    clock_div2 <= ~clock_div2;

always @(posedge clock) begin
    rst_reg[0] <= rst;
    rst_reg[1] <= rst_reg[0] & rst;
    rst_reg[2] <= rst_reg[1] & rst_reg[0] & rst;
end

assign clk_src = (clock_type) ? clock_div2 : clock;

always @(clk_src or rst or rst_reg) 
    if (rst == 1'b0)
        clock_out = clk_src;
    else if (rst == 1'b1) begin
        clock_out = 1'b0;
        @(negedge rst_reg[2]);
        if (clk_src == 1'b1)
          @(negedge clk_src);
    end


endmodule

module dcm_sp_maximum_period_check (clock, rst);
parameter clock_name = "";
parameter maximum_period = 0;
input clock;
input rst;

time clock_edge;
time clock_period;

initial begin
    clock_edge = 0;
    clock_period = 0;
end

always @(posedge clock) begin
    clock_edge <= $time;
//    clock_period <= $time - clock_edge;
    clock_period = $time - clock_edge;
    if (clock_period > maximum_period ) begin
        if (rst == 0) 
	$display(" Warning : Input clock period of %1.3f ns, on the %s port of instance %m exceeds allowed value of %1.3f ns at time %1.3f ns.", clock_period/1000.0, clock_name, maximum_period/1000.0, $time/1000.0);
    end
end
endmodule

module dcm_sp_clock_lost (clock, enable, lost, rst);
input clock;
input enable;
input rst;
output lost;

time clock_edge, clock_edge_neg;
time period, period_neg, period_tmp, period_neg_tmp, period_tmp_win, period_neg_tmp_win;
time period_chk_win;
integer clock_low, clock_high;
integer clock_posedge, clock_negedge;
integer clock_second_pos, clock_second_neg;
reg lost_r, lost_f, lost;

initial begin
    clock_edge = 0;
    clock_edge_neg = 0;
    clock_high = 0;
    clock_low = 0;
    lost_r = 0;
    lost_f = 0;
    period = 0;
    period_neg = 0;
    period_tmp = 0;
    period_tmp_win = 0;
    period_neg_tmp = 0;
    period_neg_tmp_win = 0;
    period_chk_win = 0;
    clock_posedge = 0;
    clock_negedge = 0;
    clock_second_pos = 0;
    clock_second_neg = 0;
end

always @(posedge clock or posedge rst)
  if (rst==1) 
    period <= 0;
  else begin
    clock_edge <= $time;
    period_tmp = $time - clock_edge;
    if (period != 0 && (period_tmp <= period_tmp_win))
        period <= period_tmp;
    else if (period != 0 && (period_tmp > period_tmp_win))
        period <= 0;
    else if ((period == 0) && (clock_edge != 0) && clock_second_pos == 1)
        period <= period_tmp;
  end

always @(period) begin
      period_tmp_win = 1.5 * period;
      period_chk_win = (period * 9.1) / 10;
end

always @(negedge clock or posedge rst)
  if (rst)
    period_neg <= 0;
  else begin
    clock_edge_neg <= $time;
    period_neg_tmp = $time - clock_edge_neg;
    if (period_neg != 0 && ( period_neg_tmp <=  period_neg_tmp_win))
        period_neg <= period_neg_tmp;
    else if (period_neg != 0 && (period_neg_tmp > period_neg_tmp_win))
        period_neg <= 0;
    else if ((period_neg == 0) && (clock_edge_neg != 0) && clock_second_neg == 1)
        period_neg <= period_neg_tmp;
  end

always @(period_neg)
      period_neg_tmp_win = 1.5 * period_neg;


always @(posedge clock or posedge rst)
  if (rst) 
    lost_r <= 0;
  else 
  if (enable == 1 && clock_second_pos == 1) begin
      #1;
      if ( period != 0)
         lost_r <= 0;
      #(period_chk_win)
      if ((clock_low != 1) && (clock_posedge != 1) && rst == 0)
        lost_r <= 1;
    end

always @(posedge clock or negedge clock or posedge rst)
  if (rst) begin
     clock_second_pos <= 0;
     clock_second_neg <= 0;
  end
  else if (clock)
     clock_second_pos <= 1;
  else if (~clock)
     clock_second_neg <= 1;

always @(negedge clock or posedge rst)
  if (rst==1) begin
     lost_f <= 0;
   end
   else begin
     if (enable == 1 && clock_second_neg == 1) begin
      if ( period != 0)
        lost_f <= 0;
      #(period_chk_win)
      if ((clock_high != 1) && (clock_negedge != 1) && rst == 0 && (period <= period_neg))
        lost_f <= 1;
    end
  end

always @( lost_r or  lost_f or enable)
begin
  if (enable == 1)
         lost = lost_r | lost_f;
  else
        lost = 0;
end


always @(posedge clock or negedge clock or posedge rst)
  if (rst==1) begin
           clock_low   <= 0;
           clock_high  <= 0;
           clock_posedge  <= 0;
           clock_negedge <= 0;
  end
  else begin
    if (clock ==1) begin
           clock_low   <= 0;
           clock_high  <= 1;
           clock_posedge  <= 0;
           clock_negedge <= 1;
    end
    else if (clock == 0) begin
           clock_low   <= 1;
           clock_high  <= 0;
           clock_posedge  <= 1;
           clock_negedge <= 0;
    end
end


endmodule

`endcelldefine
    