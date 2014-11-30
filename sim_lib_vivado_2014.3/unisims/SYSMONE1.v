///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 14.6 (P.59)
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                 System Monitor 
// /___/   /\     Filename  : SYSMONE1.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    01/31/13 - Initial version.
//    03/19/13 - Fixed fatal width problem (CR 707214).
//             - Update MUXADDR width (CR 706758).
//    03/20/13 - Fixed output MSB problem (CR 706163).
//             - Remove SCL and SDA ports (CR 707646). 
//    04/26/13 - Add invertible pin support (PR 683925).
//    05/01/13 - Fixed DRC for IS_*_INVERTED parameters (CR 715818).
//    05/08/13 - Changed Vuser1-4 to Vuser 0-3 (CR 716783).
//    06/04/13 - Added I2CSCLK and I2CSDA ports (CR 721147).
//    06/19/13 - Fixed CHANNEL output (CR 717955).
//    10/15/13 - Added I2C simulation support (CR 707725).
//    10/28/13 - Removed DRC for event mode timing (CR 736315).
//    11/15/13 - Updated I2C support for in and output instead of inout (CR 742395).
//    11/22/13 - Updated VBRAM to VCCBRAM (CR 755165).
//    01/21/14 - Added missing timing (CR 767834).
//    01/21/14 - Fixed Vuser (CR 766501).
//    03/20/14 - Fixed event driven mode in single pass sequence (CR 764936).
//    03/21/14 - Balanced all inputs with xor (CR 778933).
//    04/30/14 - Initialized chan_val and chan_valn (CR 782388).
//    05/27/14 - New simulation library message format.
//    06/17/14 - Fixed default mode sequencer (CR 800173)
// End Revision


`timescale 1ps / 1ps

`celldefine

  module SYSMONE1 #(

    parameter  [15:0] INIT_40 = 16'h0,
    parameter  [15:0] INIT_41 = 16'h0,
    parameter  [15:0] INIT_42 = 16'h0,
    parameter  [15:0] INIT_43 = 16'h0,
    parameter  [15:0] INIT_44 = 16'h0,
    parameter  [15:0] INIT_45 = 16'h0,
    parameter  [15:0] INIT_46 = 16'h0,
    parameter  [15:0] INIT_47 = 16'h0,
    parameter  [15:0] INIT_48 = 16'h0,
    parameter  [15:0] INIT_49 = 16'h0,
    parameter  [15:0] INIT_4A = 16'h0,
    parameter  [15:0] INIT_4B = 16'h0,
    parameter  [15:0] INIT_4C = 16'h0,
    parameter  [15:0] INIT_4D = 16'h0,
    parameter  [15:0] INIT_4E = 16'h0,
    parameter  [15:0] INIT_4F = 16'h0,
    parameter  [15:0] INIT_50 = 16'h0,
    parameter  [15:0] INIT_51 = 16'h0,
    parameter  [15:0] INIT_52 = 16'h0,
    parameter  [15:0] INIT_53 = 16'h0,
    parameter  [15:0] INIT_54 = 16'h0,
    parameter  [15:0] INIT_55 = 16'h0,
    parameter  [15:0] INIT_56 = 16'h0,
    parameter  [15:0] INIT_57 = 16'h0,
    parameter  [15:0] INIT_58 = 16'h0,
    parameter  [15:0] INIT_59 = 16'h0,
    parameter  [15:0] INIT_5A = 16'h0,
    parameter  [15:0] INIT_5B = 16'h0,
    parameter  [15:0] INIT_5C = 16'h0,
    parameter  [15:0] INIT_5D = 16'h0,
    parameter  [15:0] INIT_5E = 16'h0,
    parameter  [15:0] INIT_5F = 16'h0,
    parameter  [15:0] INIT_60 = 16'h0,
    parameter  [15:0] INIT_61 = 16'h0,
    parameter  [15:0] INIT_62 = 16'h0,
    parameter  [15:0] INIT_63 = 16'h0,
    parameter  [15:0] INIT_64 = 16'h0,
    parameter  [15:0] INIT_65 = 16'h0,
    parameter  [15:0] INIT_66 = 16'h0,
    parameter  [15:0] INIT_67 = 16'h0,
    parameter  [15:0] INIT_68 = 16'h0,
    parameter  [15:0] INIT_69 = 16'h0,
    parameter  [15:0] INIT_6A = 16'h0,
    parameter  [15:0] INIT_6B = 16'h0,
    parameter  [15:0] INIT_6C = 16'h0,
    parameter  [15:0] INIT_6D = 16'h0,
    parameter  [15:0] INIT_6E = 16'h0,
    parameter  [15:0] INIT_6F = 16'h0,
    parameter  [15:0] INIT_70 = 16'h0,
    parameter  [15:0] INIT_71 = 16'h0,
    parameter  [15:0] INIT_72 = 16'h0,
    parameter  [15:0] INIT_73 = 16'h0,
    parameter  [15:0] INIT_74 = 16'h0,
    parameter  [15:0] INIT_75 = 16'h0,
    parameter  [15:0] INIT_76 = 16'h0,
    parameter  [15:0] INIT_77 = 16'h0,
    parameter  [15:0] INIT_78 = 16'h0,
    parameter  [15:0] INIT_79 = 16'h0,
    parameter  [15:0] INIT_7A = 16'h0,
    parameter  [15:0] INIT_7B = 16'h0,
    parameter  [15:0] INIT_7C = 16'h0,
    parameter  [15:0] INIT_7D = 16'h0,
    parameter  [15:0] INIT_7E = 16'h0,
    parameter  [15:0] INIT_7F = 16'h0,

`ifdef XIL_TIMING
    parameter LOC = "UNPLACED",
`endif
    parameter [0:0] IS_CONVSTCLK_INVERTED = 1'b0,
    parameter [0:0] IS_DCLK_INVERTED = 1'b0,
    parameter SIM_MONITOR_FILE = "design.txt",
    parameter integer SYSMON_VUSER0_BANK = 0,
    parameter SYSMON_VUSER0_MONITOR = "NONE",
    parameter integer SYSMON_VUSER1_BANK = 0,
    parameter SYSMON_VUSER1_MONITOR = "NONE",
    parameter integer SYSMON_VUSER2_BANK = 0,
    parameter SYSMON_VUSER2_MONITOR = "NONE",
    parameter integer SYSMON_VUSER3_BANK = 0,
    parameter SYSMON_VUSER3_MONITOR = "NONE"	    
)(

  output [15:0] ALM,
  output BUSY,
  output [5:0] CHANNEL,
  output [15:0] DO,
  output DRDY,
  output EOC,
  output EOS,
  output I2C_SCLK_TS,
  output I2C_SDA_TS,
  output JTAGBUSY,
  output JTAGLOCKED,
  output JTAGMODIFIED,
  output [4:0] MUXADDR,
  output OT,
  
  input CONVST,
  input CONVSTCLK,
  input [7:0] DADDR,
  input DCLK,
  input DEN,
  input [15:0] DI,
  input DWE,
  input I2C_SCLK,
  input I2C_SDA,
  input RESET,
  input [15:0] VAUXN,
  input [15:0] VAUXP,
  input VN,
  input VP

  );


    localparam  S1_ST = 0,
                S6_ST = 1,
                S2_ST = 2,
                S3_ST = 3,
                S5_ST = 5,
                S4_ST = 6;

    time time_out, prev_time_out;
    
    integer temperature_index = -1, time_index = -1, vccaux_index = -1;
    integer vccbram_index = -1;
    integer vccint_index = -1, vn_index = -1, vp_index = -1;
    integer vccpint_index = -1;
    integer vccpaux_index = -1;
    integer vccpdro_index = -1;
    integer vauxp_idx0 = -1, vauxn_idx0 = -1;
    integer vauxp_idx1 = -1, vauxn_idx1 = -1;
    integer vauxp_idx2 = -1, vauxn_idx2 = -1;
    integer vauxp_idx3 = -1, vauxn_idx3 = -1;
    integer vauxp_idx4 = -1, vauxn_idx4 = -1;
    integer vauxp_idx5 = -1, vauxn_idx5 = -1;
    integer vauxp_idx6 = -1, vauxn_idx6 = -1;
    integer vauxp_idx7 = -1, vauxn_idx7 = -1;
    integer vauxp_idx8 = -1, vauxn_idx8 = -1;
    integer vauxp_idx9 = -1, vauxn_idx9 = -1;
    integer vauxp_idx10 = -1, vauxn_idx10 = -1;
    integer vauxp_idx11 = -1, vauxn_idx11 = -1;
    integer vauxp_idx12 = -1, vauxn_idx12 = -1;
    integer vauxp_idx13 = -1, vauxn_idx13 = -1;
    integer vauxp_idx14 = -1, vauxn_idx14 = -1;
    integer vauxp_idx15 = -1, vauxn_idx15 = -1;
    integer vuser0_index = -1, vuser1_index = -1;
    integer vuser2_index = -1, vuser3_index = -1;
    integer char_1, char_2, fs, fd;
    integer num_arg, num_val;
    integer clk_count, seq_count, seq_count2, seq_count_a;
    integer seq_status_avg, acq_count;
    integer seq_status_avg2;
    integer conv_pj_count [63:0];
    integer conv_acc [31:0];
    integer conv_result_int;
    integer conv_time, conv_count, conv_time_cal, conv_time_cal_1;
    integer h, i, j, k, l, m, n, p;
    integer file_line;

// string    
    reg [8*12:1] label0, label1, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, label12, label13, label14, label15, label16, label17, label18, label19, label20, label21, label22, label23, label24, label25, label26, label27, label28, label29, label30, label31, label32, label33, label34, label35, label36, label37, label38, label39, label40, label41, label42, label43, label44, label45, label46;
    reg [8*600:1] one_line;
    reg [8*12:1] label [46:0];
    reg [8*12:1] tmp_label;
    reg end_of_file;
    
    real tmp_va0, tmp_va1, column_real00, column_real100, column_real101;
    real column_real0, column_real1, column_real2, column_real3, column_real4, column_real5, column_real6, column_real7, column_real8, column_real9, column_real10, column_real11, column_real12, column_real13, column_real14, column_real15, column_real16, column_real17, column_real18, column_real19, column_real20, column_real21, column_real22, column_real23, column_real24, column_real25, column_real26, column_real27, column_real28, column_real29, column_real30, column_real31, column_real32, column_real33, column_real34, column_real35, column_real36, column_real37, column_real38, column_real39, column_real40, column_real41, column_real42, column_real43, column_real44, column_real45, column_real46;

// array of real numbers
    reg [63:0] column_real [46:0];
    reg [63:0] chan_val [35:0];
    reg [63:0] chan_val_tmp [35:0];
    reg [63:0] chan_valn [35:0];
    reg [63:0] chan_valn_tmp [35:0];
    reg [63:0] mn_in_diff [35:0];
    reg [63:0] mn_in2_diff [35:0];
    reg [63:0] mn_in_uni [35:0];
    reg [63:0] mn_in2_uni [35:0];
    reg [63:0] mn_comm_in [35:0];
    reg [63:0] mn_comm2_in [35:0];

    real chan_val_p_tmp, chan_val_n_tmp;
    real mn_mux_in, mn_in_tmp, mn_comm_in_tmp, mn_in_comm;
    real tmp_v, tmp_v1;
    real adc_temp_result, adc_intpwr_result;
    real adc_ext_result;

    reg seq_reset, seq_reset_dly, seq_reset_flag, seq_reset_flag_dly;
    reg soft_reset = 0;
    reg en_data_flag;
    reg first_cal_chan;
    reg seq_en;
    reg seq_en_dly;
    wire [15:0] flag_reg0, flag_reg1;
    reg [15:0] ot_limit_reg = 16'hCA30;
    reg [15:0] tmp_otv;
    reg [23:0] conv_acc_vec;
    reg [15:0] conv_result;
    reg [15:0] conv_result_reg, conv_acc_result;
    wire [7:0] curr_clkdiv_sel;
    reg [15:0]  alarm_out_reg;
    reg [5:0] curr_chan, curr_chan_lat;
    reg [2:0] adc_state, next_state;
    reg conv_start, conv_end;
    reg eos_en, eos_tmp_en;
    reg drdy_out, drdy_out_tmp1, drdy_out_tmp2, drdy_out_tmp3, drdy_out_tmp4;
    reg ot_out_reg;
    reg [15:0] do_out;
    reg [15:0] do_out_rdtmp;
    reg [15:0] data_reg [63:0];
    reg [15:0] dr_sram [255:64];
    reg sysclk, adcclk_tmp;
    wire adcclk;
    wire sysmone1_en, sysmone12_en;
    reg [3:0] curr_seq1_0, curr_seq1_0_lat;
    reg [1:0] tmp_seq1_0 = 2'b00;
    reg curr_e_c, curr_b_u, curr_acq;
    reg ext_mux;
    reg seq_count_en;
    reg [5:0] acq_chan;
    reg [4:0] acq_chan_m;
   
    reg [4:0] ext_mux_chan;
    reg acq_b_u;
    reg adc_s1_flag, acq_acqsel;
    wire acq_e_c;
    reg acq_e_c_tmp5, acq_e_c_tmp6;
    reg [1:0] curr_pj_set;
    reg eoc_en, eoc_en_delay;
    reg eoc_out_tmp, eos_out_tmp;
    reg eoc_out_tmp1, eos_out_tmp1;
    reg eoc_out, eos_out;
    reg eoc_out_t;
    reg busy_r, busy_r_rst;
    reg busy_sync1, busy_sync2;
    wire busy_sync_fall, busy_sync_rise;
    reg notifier, notifier_do;
    reg [5:0] channel_out; 
    wire [4:0]  muxaddr_o; 
    reg  [4:0]  muxaddr_out;
    reg rst_lock, rst_lock_early, rst_lock_late;
    reg sim_file_flag;
    reg [7:0] daddr_in_lat;
    reg [15:0] init40h_tmp, init41h_tmp, init42h_tmp, init4eh_tmp;
    reg [15:0] alarm_out;
    reg       ot_out;
    reg [15:0] curr_seq,  curr_seq_m;
    wire [15:0] curr_seq2;
    reg busy_out, busy_rst, busy_conv, busy_out_tmp, busy_seq_rst;
    reg [3:0] seq1_0, seq_bits;
    reg ot_en, alarm_update, drp_update, cal_chan_update;
    reg [13:0] alarm_en;
    reg [4:0] scon_tmp;
    wire [15:0] seq_chan_reg1, seq_chan_reg2, seq_chan_reg3;
    wire [15:0] seq_acq_reg1, seq_acq_reg2, seq_acq_reg3;
    wire [15:0]	seq_pj_reg1, seq_pj_reg2, seq_pj_reg3;
    wire [15:0] seq_du_reg1, seq_du_reg2, seq_du_reg3;
    reg [15:0] cfg_reg1_init;
 
    reg [5:0] seq_curr_i, seq_curr_ia;
    integer busy_rst_cnt;
    integer si, seq_num, seq_num2;
    integer seq_mem [32:0];
    integer seq_mem2 [32:0];

    wire rst_in, adc_convst;
    wire [15:0] cfg_reg0;
    wire [15:0] cfg_reg1;
    wire [15:0] cfg_reg2;
    wire [15:0]	cfg_reg3;
    wire [15:0] di_in;
    wire [7:0] daddr_in;
    wire [15:0] tmp_data_reg_out, tmp_dr_sram_out;
    wire convst_in_tmp;
    reg  convst_in;
    wire rst_in_not_seq;
    wire adcclk_div1;
    wire gsr_in;
    wire convst_raw_in, convstclk_in, dclk_in, den_in, rst_input, dwe_in;
    wire dclk_inv, convstclk_inv;
    wire DCLK_dly, DEN_dly, DWE_dly, RESET_dly;
    wire [7:0] DADDR_dly;
    wire [15:0] DI_dly;
    reg trig_attr_chk = 0;
    reg trig_dep_attr_chk = 0;
    reg attr_err = 0;
    wire convst_raw_inv, den_inv, dwe_inv, rst_input_inv;
    wire [15:0] di_inv;
    wire [7:0] daddr_inv;

    wire i2c_sclk_in, i2c_sda_in;
    wire i2c_sclk_inv, i2c_sda_inv;
    reg i2c_sda_setup_sync;
    reg i2c_sda_out_tmp;

    assign i2c_sclk_inv = I2C_SCLK;
    assign i2c_sda_inv = I2C_SDA;
    assign I2C_SCLK_TS = i2c_sda_setup_sync;
    assign I2C_SDA_TS = i2c_sda_out_tmp;
   
    reg [15:0] INIT_40_reg = INIT_40;
    reg [15:0] INIT_41_reg = INIT_41;
    reg [15:0] INIT_42_reg = INIT_42;
    reg [15:0] INIT_43_reg = INIT_43;
    reg [15:0] INIT_44_reg = INIT_44;
    reg [15:0] INIT_45_reg = INIT_45;
    reg [15:0] INIT_46_reg = INIT_46;
    reg [15:0] INIT_47_reg = INIT_47;
    reg [15:0] INIT_48_reg = INIT_48;
    reg [15:0] INIT_49_reg = INIT_49;
    reg [15:0] INIT_4A_reg = INIT_4A;
    reg [15:0] INIT_4B_reg = INIT_4B;
    reg [15:0] INIT_4C_reg = INIT_4C;
    reg [15:0] INIT_4D_reg = INIT_4D;
    reg [15:0] INIT_4E_reg = INIT_4E;
    reg [15:0] INIT_4F_reg = INIT_4F;
    reg [15:0] INIT_50_reg = INIT_50;
    reg [15:0] INIT_51_reg = INIT_51;
    reg [15:0] INIT_52_reg = INIT_52;
    reg [15:0] INIT_53_reg = INIT_53;
    reg [15:0] INIT_54_reg = INIT_54;
    reg [15:0] INIT_55_reg = INIT_55;
    reg [15:0] INIT_56_reg = INIT_56;
    reg [15:0] INIT_57_reg = INIT_57;
    reg [15:0] INIT_58_reg = INIT_58;
    reg [15:0] INIT_59_reg = INIT_59;
    reg [15:0] INIT_5A_reg = INIT_5A;
    reg [15:0] INIT_5B_reg = INIT_5B;
    reg [15:0] INIT_5C_reg = INIT_5C;
    reg [15:0] INIT_5D_reg = INIT_5D;
    reg [15:0] INIT_5E_reg = INIT_5E;
    reg [15:0] INIT_5F_reg = INIT_5F;
    reg [15:0] INIT_60_reg = INIT_60;
    reg [15:0] INIT_61_reg = INIT_61;
    reg [15:0] INIT_62_reg = INIT_62;
    reg [15:0] INIT_63_reg = INIT_63;
    reg [15:0] INIT_64_reg = INIT_64;
    reg [15:0] INIT_65_reg = INIT_65;
    reg [15:0] INIT_66_reg = INIT_66;
    reg [15:0] INIT_67_reg = INIT_67;
    reg [15:0] INIT_68_reg = INIT_68;
    reg [15:0] INIT_69_reg = INIT_69;
    reg [15:0] INIT_6A_reg = INIT_6A;
    reg [15:0] INIT_6B_reg = INIT_6B;
    reg [15:0] INIT_6C_reg = INIT_6C;
    reg [15:0] INIT_6D_reg = INIT_6D;
    reg [15:0] INIT_6E_reg = INIT_6E;
    reg [15:0] INIT_6F_reg = INIT_6F;
    reg [15:0] INIT_70_reg = INIT_70;
    reg [15:0] INIT_71_reg = INIT_71;
    reg [15:0] INIT_72_reg = INIT_72;
    reg [15:0] INIT_73_reg = INIT_73;
    reg [15:0] INIT_74_reg = INIT_74;
    reg [15:0] INIT_75_reg = INIT_75;
    reg [15:0] INIT_76_reg = INIT_76;
    reg [15:0] INIT_77_reg = INIT_77;
    reg [15:0] INIT_78_reg = INIT_78;
    reg [15:0] INIT_79_reg = INIT_79;
    reg [15:0] INIT_7A_reg = INIT_7A;
    reg [15:0] INIT_7B_reg = INIT_7B;
    reg [15:0] INIT_7C_reg = INIT_7C;
    reg [15:0] INIT_7D_reg = INIT_7D;
    reg [15:0] INIT_7E_reg = INIT_7E;
    reg [15:0] INIT_7F_reg = INIT_7F;
    reg IS_CONVSTCLK_INVERTED_reg = IS_CONVSTCLK_INVERTED;
    reg	IS_DCLK_INVERTED_reg = IS_DCLK_INVERTED;
   
    localparam MODULE_NAME = "SYSMONE1";
   
`ifdef XIL_ATTR_TEST
   reg attr_test = 1'b1;
  `else
   reg attr_test = 1'b0;
  `endif
   

   // initialize chan_val and chan_valn
   integer ii, jj;
   
   initial begin
      for (ii = 0; ii < 36; ii = ii + 1) begin
	 chan_val[ii] = 64'h0000000000000000;
      end
      for (jj = 0; jj < 36; jj = jj + 1) begin
	 chan_valn[jj] = 64'h0000000000000000;
      end
   end

   
`ifdef XIL_DR
`include "SYSMONE1_dr.v"
`endif

      
   initial begin
      #1 trig_attr_chk = 1;
      #2 trig_dep_attr_chk = 1;
   end


//CR 675227
    integer halt_adc = 0;
    reg int_rst;
    reg	int_rst_halt_adc = 0;
   
    always @(posedge rst_input)
	halt_adc <= 0;

    always @(seq1_0) begin
	if (halt_adc == 2 && seq1_0 == 4'b0001) begin
	    halt_adc <= 0;
	    int_rst_halt_adc <= 1;
	    @(posedge dclk_in)
		int_rst_halt_adc <= 0;
	end
	
    end
    
    tri0 GSR = glbl.GSR;

  `ifndef XIL_TIMING

    assign  BUSY = busy_out;
    assign  DRDY = drdy_out;
    assign  EOC = eoc_out;
    assign  EOS = eos_out;
    assign  OT = ot_out;
    assign  DO = do_out;
    assign  CHANNEL = channel_out;
    assign  MUXADDR = muxaddr_out;
    assign  ALM = alarm_out;
    
    assign convst_raw_inv = CONVST;
    assign convstclk_inv = CONVSTCLK;
    assign dclk_inv = DCLK;
    assign den_inv = DEN;
    assign rst_input_inv = RESET;
    assign dwe_inv = DWE;
    assign di_inv = DI; 
    assign daddr_inv = DADDR;

  `endif //  `ifndef XIL_TIMING

  `ifdef XIL_TIMING

    assign  BUSY = busy_out;
    assign  DRDY = drdy_out;
    assign  EOC = eoc_out;
    assign  EOS = eos_out;
    assign  OT = ot_out;
    assign  DO = do_out;
    assign  CHANNEL = channel_out;
    assign  MUXADDR = muxaddr_out;
    assign  ALM = alarm_out;
    
    assign convst_raw_inv = CONVST;
    assign convstclk_inv = CONVSTCLK;
    assign dclk_inv = DCLK_dly;
    assign den_inv = DEN_dly;
    assign rst_input_inv = RESET_dly;
    assign dwe_inv = DWE_dly;
    assign di_inv = DI_dly; 
    assign daddr_inv = DADDR_dly;

  `endif //  `ifdef XIL_TIMING

    assign convst_raw_in = convst_raw_inv ^ 1'b0;
    assign den_in = den_inv ^ 1'b0;
    assign dwe_in = dwe_inv ^ 1'b0;
    assign rst_input = rst_input_inv ^ 1'b0;
    assign di_in = di_inv ^ 16'h0000;
    assign daddr_in = daddr_inv ^ 7'b0000000;
    assign i2c_sclk_in = i2c_sclk_inv ^ 1'b0;
    assign i2c_sda_in = i2c_sda_inv ^ 1'b0;
    assign dclk_in = dclk_inv ^ IS_DCLK_INVERTED_reg;
    assign convstclk_in = convstclk_inv ^ IS_CONVSTCLK_INVERTED_reg;
   
    assign gsr_in = GSR;
    assign convst_in_tmp = (convst_raw_in===1 || convstclk_in===1) ? 1: 0;
    assign JTAGLOCKED = 0;
    assign JTAGMODIFIED = 0;
    assign JTAGBUSY = 0;

    always @(posedge convst_in_tmp or negedge convst_in_tmp or posedge rst_in)
       if (rst_in == 1 || rst_lock == 1)
         convst_in <= 0;
       else if (convst_in_tmp == 1)
         convst_in <= 1;
       else if (convst_in_tmp == 0)
           convst_in <= 0;


    always @(trig_dep_attr_chk)  begin

        init40h_tmp = INIT_40_reg;
        init41h_tmp = INIT_41_reg;
        init42h_tmp = INIT_42_reg;
        init4eh_tmp = INIT_4E_reg;

       if ((attr_test == 1'b1) ||
           ((init41h_tmp[15:12]==4'b0011) && (init40h_tmp[8]==1) && (init40h_tmp[5:0] != 6'b000011) && (init40h_tmp[5:0] < 6'b010000)))
             $display("Warning: [Unisim %s-1] INIT_40 attribute is set to %x.  Bit[8] of this attribute must be set to 0. Long acquistion mode is only allowed for external channels. Instance: %m", MODULE_NAME, INIT_40_reg);

       if ((attr_test == 1'b1) ||
           ((init41h_tmp[15:12]!=4'b0011) && (init4eh_tmp[10:0]!=11'b0) && (init4eh_tmp[15:12]!=4'b0)))
             $display("Warning: [Unisim %s-2] INIT_4E attribute is set to %x.  Bit[15:12] and bit[10:0] of this attribute must be set to 0. Long acquistion mode is only allowed for external channels. Instance: %m", MODULE_NAME, INIT_4E_reg);

       if ((attr_test == 1'b1) ||
           ((init41h_tmp[15:12]==4'b0011) && (init40h_tmp[13:12]!=2'b00) && (INIT_48_reg != 16'h0000) &&  (INIT_49_reg != 16'h0000)))
             $display("Warning: [Unisim %s-3] INIT_48 and INIT_49 attributes are set to %x and %x respectively. These attributes must be set to 0000h in single channel mode with averaging enabled. Instance: %m", MODULE_NAME, INIT_48_reg, INIT_49_reg);

    end

    always @(trig_attr_chk) begin
	dr_sram[8'h40] = INIT_40_reg;
	dr_sram[8'h41] = INIT_41_reg;
	dr_sram[8'h42] = INIT_42_reg;
	dr_sram[8'h43] = INIT_43_reg;
	dr_sram[8'h44] = INIT_44_reg;
	dr_sram[8'h45] = INIT_45_reg;
	dr_sram[8'h46] = INIT_46_reg;
	dr_sram[8'h47] = INIT_47_reg;
	dr_sram[8'h48] = INIT_48_reg;
	dr_sram[8'h49] = INIT_49_reg;
	dr_sram[8'h4A] = INIT_4A_reg;
	dr_sram[8'h4B] = INIT_4B_reg;
	dr_sram[8'h4C] = INIT_4C_reg;
	dr_sram[8'h4D] = INIT_4D_reg;
	dr_sram[8'h4E] = INIT_4E_reg;
	dr_sram[8'h4F] = INIT_4F_reg;
	dr_sram[8'h50] = INIT_50_reg;
	dr_sram[8'h51] = INIT_51_reg;
	dr_sram[8'h52] = INIT_52_reg;
        tmp_otv = INIT_53_reg;
   if (tmp_otv [3:0] == 4'b0011) begin
      dr_sram[8'h53] = INIT_53_reg;
      ot_limit_reg  = INIT_53_reg;
   end
   else begin
      dr_sram[8'h53] = 16'hCA30;
      ot_limit_reg  = 16'hCA30;
   end
	dr_sram[8'h54] = INIT_54_reg;
	dr_sram[8'h55] = INIT_55_reg;
	dr_sram[8'h56] = INIT_56_reg;
	dr_sram[8'h57] = INIT_57_reg;
	dr_sram[8'h58] = INIT_58_reg;
	dr_sram[8'h59] = INIT_59_reg;
	dr_sram[8'h5A] = INIT_5A_reg;
	dr_sram[8'h5B] = INIT_5B_reg;
	dr_sram[8'h5C] = INIT_5C_reg;
	dr_sram[8'h5D] = INIT_5D_reg;
	dr_sram[8'h5E] = INIT_5E_reg;
	dr_sram[8'h5F] = INIT_5F_reg;
       	dr_sram[8'h60] = INIT_60_reg;
        dr_sram[8'h61] = INIT_61_reg;
        dr_sram[8'h62] = INIT_62_reg;
        dr_sram[8'h63] = INIT_63_reg;
        dr_sram[8'h68] = INIT_68_reg;
        dr_sram[8'h69] = INIT_69_reg;
        dr_sram[8'h6A] = INIT_6A_reg;
        dr_sram[8'h6B] = INIT_6B_reg;
        dr_sram[8'h78] = INIT_78_reg;
	dr_sram[8'h79] = INIT_79_reg;


// Generated DRC
       
    if ((attr_test == 1'b1) ||
         ((SYSMON_VUSER0_BANK < 0) || (SYSMON_VUSER0_BANK > 999))) begin
      $display("Error: [Unisim %s-168] SYSMON_VUSER0_BANK attribute is set to %d.  Legal values for this attribute are 0 to 999. Instance: %m", MODULE_NAME, SYSMON_VUSER0_BANK);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SYSMON_VUSER1_BANK < 0) || (SYSMON_VUSER1_BANK > 999))) begin
      $display("Error: [Unisim %s-170] SYSMON_VUSER1_BANK attribute is set to %d.  Legal values for this attribute are 0 to 999. Instance: %m", MODULE_NAME, SYSMON_VUSER1_BANK);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SYSMON_VUSER2_BANK < 0) || (SYSMON_VUSER2_BANK > 999))) begin
      $display("Error: [Unisim %s-172] SYSMON_VUSER2_BANK attribute is set to %d.  Legal values for this attribute are 0 to 999. Instance: %m", MODULE_NAME, SYSMON_VUSER2_BANK);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
         ((SYSMON_VUSER3_BANK < 0) || (SYSMON_VUSER3_BANK > 999))) begin
      $display("Error: [Unisim %s-174] SYSMON_VUSER3_BANK attribute is set to %d.  Legal values for this attribute are 0 to 999. Instance: %m", MODULE_NAME, SYSMON_VUSER3_BANK);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_40_reg < 16'h0000) || (INIT_40_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-101] INIT_40 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_40_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_41_reg < 16'h0000) || (INIT_41_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-102] INIT_41 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_41_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_42_reg < 16'h0000) || (INIT_42_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-103] INIT_42 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_42_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_43_reg < 16'h0000) || (INIT_43_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-104] INIT_43 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_43_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_44_reg < 16'h0000) || (INIT_44_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-105] INIT_44 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_44_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_45_reg < 16'h0000) || (INIT_45_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-106] INIT_45 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_45_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_46_reg < 16'h0000) || (INIT_46_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-107] INIT_46 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_46_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_47_reg < 16'h0000) || (INIT_47_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-108] INIT_47 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_47_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_48_reg < 16'h0000) || (INIT_48_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-109] INIT_48 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_48_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_49_reg < 16'h0000) || (INIT_49_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-110] INIT_49 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_49_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_4A_reg < 16'h0000) || (INIT_4A_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-111] INIT_4A attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_4A_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_4B_reg < 16'h0000) || (INIT_4B_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-112] INIT_4B attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_4B_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_4C_reg < 16'h0000) || (INIT_4C_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-113] INIT_4C attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_4C_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_4D_reg < 16'h0000) || (INIT_4D_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-114] INIT_4D attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_4D_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_4E_reg < 16'h0000) || (INIT_4E_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-115] INIT_4E attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_4E_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_4F_reg < 16'h0000) || (INIT_4F_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-116] INIT_4F attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_4F_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_50_reg < 16'h0000) || (INIT_50_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-117] INIT_50 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_50_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_51_reg < 16'h0000) || (INIT_51_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-118] INIT_51 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_51_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_52_reg < 16'h0000) || (INIT_52_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-119] INIT_52 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_52_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_53_reg < 16'h0000) || (INIT_53_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-120] INIT_53 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_53_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_54_reg < 16'h0000) || (INIT_54_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-121] INIT_54 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_54_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_55_reg < 16'h0000) || (INIT_55_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-122] INIT_55 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_55_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_56_reg < 16'h0000) || (INIT_56_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-123] INIT_56 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_56_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_57_reg < 16'h0000) || (INIT_57_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-124] INIT_57 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_57_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_58_reg < 16'h0000) || (INIT_58_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-125] INIT_58 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_58_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_59_reg < 16'h0000) || (INIT_59_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-126] INIT_59 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_59_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_5A_reg < 16'h0000) || (INIT_5A_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-127] INIT_5A attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_5A_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_5B_reg < 16'h0000) || (INIT_5B_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-128] INIT_5B attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_5B_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_5C_reg < 16'h0000) || (INIT_5C_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-129] INIT_5C attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_5C_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_5D_reg < 16'h0000) || (INIT_5D_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-130] INIT_5D attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_5D_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_5E_reg < 16'h0000) || (INIT_5E_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-131] INIT_5E attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_5E_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_5F_reg < 16'h0000) || (INIT_5F_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-132] INIT_5F attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_5F_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_60_reg < 16'h0000) || (INIT_60_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-133] INIT_60 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_60_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_61_reg < 16'h0000) || (INIT_61_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-134] INIT_61 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_61_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_62_reg < 16'h0000) || (INIT_62_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-135] INIT_62 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_62_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_63_reg < 16'h0000) || (INIT_63_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-136] INIT_63 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_63_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_64_reg < 16'h0000) || (INIT_64_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-137] INIT_64 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_64_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_65_reg < 16'h0000) || (INIT_65_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-138] INIT_65 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_65_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_66_reg < 16'h0000) || (INIT_66_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-139] INIT_66 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_66_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_67_reg < 16'h0000) || (INIT_67_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-140] INIT_67 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_67_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_68_reg < 16'h0000) || (INIT_68_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-141] INIT_68 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_68_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_69_reg < 16'h0000) || (INIT_69_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-142] INIT_69 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_69_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_6A_reg < 16'h0000) || (INIT_6A_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-143] INIT_6A attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_6A_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_6B_reg < 16'h0000) || (INIT_6B_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-144] INIT_6B attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_6B_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_6C_reg < 16'h0000) || (INIT_6C_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-145] INIT_6C attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_6C_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_6D_reg < 16'h0000) || (INIT_6D_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-146] INIT_6D attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_6D_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_6E_reg < 16'h0000) || (INIT_6E_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-147] INIT_6E attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_6E_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_6F_reg < 16'h0000) || (INIT_6F_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-148] INIT_6F attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_6F_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_70_reg < 16'h0000) || (INIT_70_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-149] INIT_70 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_70_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_71_reg < 16'h0000) || (INIT_71_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-150] INIT_71 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_71_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_72_reg < 16'h0000) || (INIT_72_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-151] INIT_72 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_72_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_73_reg < 16'h0000) || (INIT_73_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-152] INIT_73 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_73_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_74_reg < 16'h0000) || (INIT_74_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-153] INIT_74 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_74_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_75_reg < 16'h0000) || (INIT_75_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-154] INIT_75 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_75_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_76_reg < 16'h0000) || (INIT_76_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-155] INIT_76 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_76_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_77_reg < 16'h0000) || (INIT_77_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-156] INIT_77 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_77_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_78_reg < 16'h0000) || (INIT_78_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-157] INIT_78 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_78_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_79_reg < 16'h0000) || (INIT_79_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-158] INIT_79 attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_79_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_7A_reg < 16'h0000) || (INIT_7A_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-159] INIT_7A attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_7A_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_7B_reg < 16'h0000) || (INIT_7B_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-160] INIT_7B attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_7B_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_7C_reg < 16'h0000) || (INIT_7C_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-161] INIT_7C attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_7C_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_7D_reg < 16'h0000) || (INIT_7D_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-162] INIT_7D attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_7D_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_7E_reg < 16'h0000) || (INIT_7E_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-163] INIT_7E attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_7E_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INIT_7F_reg < 16'h0000) || (INIT_7F_reg > 16'hFFFF))) begin
      $display("Error: [Unisim %s-164] INIT_7F attribute is set to %h.  Legal values for this attribute are 16'h0000 to 16'hFFFF. Instance: %m", MODULE_NAME, INIT_7F_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_CONVSTCLK_INVERTED_reg !== 1'b0) && (IS_CONVSTCLK_INVERTED_reg !== 1'b1))) begin
      $display("Error: [Unisim %s-165] IS_CONVSTCLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_CONVSTCLK_INVERTED_reg);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((IS_DCLK_INVERTED_reg !== 1'b0) && (IS_DCLK_INVERTED_reg !== 1'b1))) begin
      $display("Error: [Unisim %s-166] IS_DCLK_INVERTED attribute is set to %b.  Legal values for this attribute are 1'b0 to 1'b1. Instance: %m", MODULE_NAME, IS_DCLK_INVERTED_reg);
      attr_err = 1'b1;
    end

// end generated DRC




       
       if (attr_err == 1'b1) $finish;
       
    end // always @ (trig_attr_chk)
   

// read input file
    initial begin
	char_1 = 0;
	char_2 = 0;
        time_out = 0;
        sim_file_flag = 0;
        file_line = -1;
        end_of_file = 0;
	fd = $fopen(SIM_MONITOR_FILE, "r"); 
	if  (fd == 0)
          begin

          $display("Warning: [Unisim %s-4] The analog data file %s was not found. Use the SIM_MONITOR_FILE parameter to specify the analog data file name or use the default name: design.txt. Instance: %m", MODULE_NAME, SIM_MONITOR_FILE);
          sim_file_flag = 1;
        end
	
      if (sim_file_flag == 0) begin
         while (end_of_file==0) begin
            file_line = file_line + 1;
	    char_1 = $fgetc (fd);
	    char_2 = $fgetc (fd);
//             if(char_2==`EOFile) 
             if(char_2== -1) 
                 end_of_file = 1;
             else begin
	    
	    // Ignore Comments
	    if ((char_1 == "/" & char_2 == "/") | char_1 == "#" | (char_1 == "-" & char_2 == "-")) begin

		fs = $ungetc (char_2, fd);
		fs = $ungetc (char_1, fd);
		fs = $fgets (one_line, fd);

	    end
	    // Getting labels
	    else if ((char_1 == "T" & char_2 == "I" ) ||
                    (char_1 == "T" & char_2 == "i" )  ||
                      (char_1 == "t" & char_2 == "i" ) || (char_1 == "t" & char_2 == "I" ))  begin
		
		fs = $ungetc (char_2, fd);
		fs = $ungetc (char_1, fd);
		fs = $fgets (one_line, fd);

		num_arg = $sscanf (one_line, "%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s ", label0, label1, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, label12, label13, label14, label15, label16, label17, label18, label19, label20, label21, label22, label23, label24, label25, label26, label27, label28, label29, label30,label31, label32, label33, label34, label35, label36, label37, label38, label39, label40, label41, label42, label43, label44, label45, label46);
		
 	       label[0] = label0;
	       label[1] = label1;
	       label[2] = label2;
	       label[3] = label3;
	       label[4] = label4;
	       label[5] = label5;
	       label[6] = label6;
	       label[7] = label7;
	       label[8] = label8;
	       label[9] = label9;
 	       label[10] = label10;
	       label[11] = label11;
	       label[12] = label12;
	       label[13] = label13;
	       label[14] = label14;
	       label[15] = label15;
	       label[16] = label16;
	       label[17] = label17;
	       label[18] = label18;
	       label[19] = label19;
	       label[20] = label20;
	       label[21] = label21;
	       label[22] = label22;
	       label[23] = label23;
	       label[24] = label24;
	       label[25] = label25;
	       label[26] = label26;
	       label[27] = label27;
	       label[28] = label28;
	       label[29] = label29;
	       label[30] = label30;
	       label[31] = label31;
	       label[32] = label32;
	       label[33] = label33;
	       label[34] = label34;
	       label[35] = label35;
	       label[36] = label36;
	       label[37] = label37;
	       label[38] = label38;
	       label[39] = label39;
	       label[40] = label40;
	       label[41] = label41;
	       label[42] = label42;
	       label[43] = label43;
	       label[44] = label44;
	       label[45] = label45;	       
	       label[46] = label46;
		
		for (m = 0; m < num_arg; m = m +1) begin
                    tmp_label = 96'b0;
                    tmp_label = to_upcase_label(label[m]);
		    case (tmp_label)
			
		      "TEMP" : temperature_index = m; 
		      "TIME" : time_index = m;
		      "VCCAUX" : vccaux_index = m;
		      "VCCINT" : vccint_index = m;
		      "VCCBRAM" : vccbram_index = m;
                      "VCCPINT" : vccpint_index = m;
                      "VCCPAUX" : vccpaux_index = m;
                      "VCCDDRO" : vccpdro_index = m;
		      "VN" : vn_index = m;
                      "VAUXN[0]" : vauxn_idx0 = m;
                      "VAUXN[1]" : vauxn_idx1 = m;
                      "VAUXN[2]" : vauxn_idx2 = m;
                      "VAUXN[3]" : vauxn_idx3 = m;
                      "VAUXN[4]" : vauxn_idx4 = m;
                      "VAUXN[5]" : vauxn_idx5 = m;
                      "VAUXN[6]" : vauxn_idx6 = m;
                      "VAUXN[7]" : vauxn_idx7 = m;
                      "VAUXN[8]" : vauxn_idx8 = m;
                      "VAUXN[9]" : vauxn_idx9 = m;
                      "VAUXN[10]" : vauxn_idx10 = m;
                      "VAUXN[11]" : vauxn_idx11 = m;
                      "VAUXN[12]" : vauxn_idx12 = m;
                      "VAUXN[13]" : vauxn_idx13 = m;
                      "VAUXN[14]" : vauxn_idx14 = m;
                      "VAUXN[15]" : vauxn_idx15 = m;
		      "VP" : vp_index = m;
                      "VAUXP[0]" : vauxp_idx0 = m;
                      "VAUXP[1]" : vauxp_idx1 = m;
                      "VAUXP[2]" : vauxp_idx2 = m;
                      "VAUXP[3]" : vauxp_idx3 = m;
                      "VAUXP[4]" : vauxp_idx4 = m;
                      "VAUXP[5]" : vauxp_idx5 = m;
                      "VAUXP[6]" : vauxp_idx6 = m;
                      "VAUXP[7]" : vauxp_idx7 = m;
                      "VAUXP[8]" : vauxp_idx8 = m;
                      "VAUXP[9]" : vauxp_idx9 = m;
                      "VAUXP[10]" : vauxp_idx10 = m;
                      "VAUXP[11]" : vauxp_idx11 = m;
                      "VAUXP[12]" : vauxp_idx12 = m;
                      "VAUXP[13]" : vauxp_idx13 = m;
                      "VAUXP[14]" : vauxp_idx14 = m;
                      "VAUXP[15]" : vauxp_idx15 = m;
		      "VUSER0" : vuser0_index = m;
		      "VUSER1" : vuser1_index = m;
		      "VUSER2" : vuser2_index = m;
		      "VUSER3" : vuser3_index = m;

		      default : begin
			 $display("Error: [Unisim %s-5] The channel name %s is invalid in the input file. Instance: %m", MODULE_NAME, tmp_label);
                         infile_format;
 		      end
		    endcase

		end // for (m = 0; m < num_arg; m = m +1)
		    
	    end
	    // Getting column values
	    else if (char_1 == "0" | char_1 == "1" | char_1 == "2" | char_1 == "3" | char_1 == "4" | char_1 == "5" | char_1 == "6" | char_1 == "7" | char_1 == "8" | char_1 == "9") begin
		
	       fs = $ungetc (char_2, fd);
	       fs = $ungetc (char_1, fd);
	       fs = $fgets (one_line, fd);
	       
	       column_real0 = 0.0;
	       column_real1 = 0.0;
	       column_real2 = 0.0;
	       column_real3 = 0.0;
	       column_real4 = 0.0;
	       column_real5 = 0.0;
	       column_real6 = 0.0;
	       column_real7 = 0.0;
	       column_real8 = 0.0;
	       column_real9 = 0.0;
	       column_real10 = 0.0;
	       column_real11 = 0.0;
	       column_real12 = 0.0;
	       column_real13 = 0.0;
	       column_real14 = 0.0;
	       column_real15 = 0.0;
	       column_real16 = 0.0;
	       column_real17 = 0.0;
	       column_real18 = 0.0;
	       column_real19 = 0.0;
	       column_real20 = 0.0;
	       column_real21 = 0.0;
	       column_real22 = 0.0;
	       column_real23 = 0.0;
	       column_real24 = 0.0;
	       column_real25 = 0.0;
	       column_real26 = 0.0;
	       column_real27 = 0.0;
	       column_real28 = 0.0;
	       column_real29 = 0.0;
	       column_real30 = 0.0;
	       column_real31 = 0.0;
	       column_real32 = 0.0;
	       column_real33 = 0.0;
	       column_real34 = 0.0;
	       column_real35 = 0.0;
	       column_real36 = 0.0;
	       column_real37 = 0.0;
	       column_real38 = 0.0;
	       column_real39 = 0.0;
	       column_real40 = 0.0;
	       column_real41 = 0.0;
	       column_real42 = 0.0;
	       column_real43 = 0.0;
	       column_real44 = 0.0;
	       column_real45 = 0.0;
	       column_real46 = 0.0;
	       
		num_val = $sscanf (one_line, "%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f", column_real0, column_real1, column_real2, column_real3, column_real4, column_real5, column_real6, column_real7, column_real8, column_real9, column_real10, column_real11, column_real12, column_real13, column_real14, column_real15, column_real16, column_real17, column_real18, column_real19, column_real20, column_real21, column_real22, column_real23, column_real24, column_real25, column_real26, column_real27, column_real28, column_real29, column_real30, column_real31, column_real32, column_real33, column_real34, column_real35, column_real36, column_real37, column_real38, column_real39, column_real40, column_real41, column_real42, column_real43, column_real44, column_real45, column_real46);

 	       column_real[0] = $realtobits(column_real0);
	       column_real[1] = $realtobits(column_real1);
	       column_real[2] = $realtobits(column_real2);
	       column_real[3] = $realtobits(column_real3);
	       column_real[4] = $realtobits(column_real4);
	       column_real[5] = $realtobits(column_real5);
	       column_real[6] = $realtobits(column_real6);
	       column_real[7] = $realtobits(column_real7);
	       column_real[8] = $realtobits(column_real8);
	       column_real[9] = $realtobits(column_real9);
 	       column_real[10] = $realtobits(column_real10);
	       column_real[11] = $realtobits(column_real11);
	       column_real[12] = $realtobits(column_real12);
	       column_real[13] = $realtobits(column_real13);
	       column_real[14] = $realtobits(column_real14);
	       column_real[15] = $realtobits(column_real15);
	       column_real[16] = $realtobits(column_real16);
	       column_real[17] = $realtobits(column_real17);
	       column_real[18] = $realtobits(column_real18);
	       column_real[19] = $realtobits(column_real19);
	       column_real[20] = $realtobits(column_real20);
	       column_real[21] = $realtobits(column_real21);
	       column_real[22] = $realtobits(column_real22);
	       column_real[23] = $realtobits(column_real23);
	       column_real[24] = $realtobits(column_real24);
	       column_real[25] = $realtobits(column_real25);
	       column_real[26] = $realtobits(column_real26);
	       column_real[27] = $realtobits(column_real27);
	       column_real[28] = $realtobits(column_real28);
	       column_real[29] = $realtobits(column_real29);
	       column_real[30] = $realtobits(column_real30);
	       column_real[31] = $realtobits(column_real31);
	       column_real[32] = $realtobits(column_real32);
	       column_real[33] = $realtobits(column_real33);
	       column_real[34] = $realtobits(column_real34);
	       column_real[35] = $realtobits(column_real35);
	       column_real[36] = $realtobits(column_real36);
	       column_real[37] = $realtobits(column_real37);
	       column_real[38] = $realtobits(column_real38);
	       column_real[39] = $realtobits(column_real39);
	       column_real[40] = $realtobits(column_real40);
	       column_real[41] = $realtobits(column_real41);
	       column_real[42] = $realtobits(column_real42);
	       column_real[43] = $realtobits(column_real43);
	       column_real[44] = $realtobits(column_real44);
	       column_real[45] = $realtobits(column_real45);
	       column_real[46] = $realtobits(column_real46);
	       
	       chan_val[0] = column_real[temperature_index];
	       chan_val[1] = column_real[vccint_index];
	       chan_val[2] = column_real[vccaux_index];
	       chan_val[3] = column_real[vp_index];
	       chan_val[6] = column_real[vccbram_index];
	       chan_val[13] = column_real[vccpint_index];
	       chan_val[14] = column_real[vccpaux_index];
	       chan_val[15] = column_real[vccpdro_index];
	       chan_val[16] = column_real[vauxp_idx0];
	       chan_val[17] = column_real[vauxp_idx1];
	       chan_val[18] = column_real[vauxp_idx2];
	       chan_val[19] = column_real[vauxp_idx3];
	       chan_val[20] = column_real[vauxp_idx4];
	       chan_val[21] = column_real[vauxp_idx5];
	       chan_val[22] = column_real[vauxp_idx6];
	       chan_val[23] = column_real[vauxp_idx7];
	       chan_val[24] = column_real[vauxp_idx8];
	       chan_val[25] = column_real[vauxp_idx9];
	       chan_val[26] = column_real[vauxp_idx10];
	       chan_val[27] = column_real[vauxp_idx11];
	       chan_val[28] = column_real[vauxp_idx12];
	       chan_val[29] = column_real[vauxp_idx13];
	       chan_val[30] = column_real[vauxp_idx14];
	       chan_val[31] = column_real[vauxp_idx15];
	       chan_val[32] = column_real[vuser0_index];
	       chan_val[33] = column_real[vuser1_index];
	       chan_val[34] = column_real[vuser2_index];
	       chan_val[35] = column_real[vuser3_index];
	       
	       chan_valn[3] = column_real[vn_index];
	       chan_valn[16] = column_real[vauxn_idx0];
	       chan_valn[17] = column_real[vauxn_idx1];
	       chan_valn[18] = column_real[vauxn_idx2];
	       chan_valn[19] = column_real[vauxn_idx3];
	       chan_valn[20] = column_real[vauxn_idx4];
	       chan_valn[21] = column_real[vauxn_idx5];
	       chan_valn[22] = column_real[vauxn_idx6];
	       chan_valn[23] = column_real[vauxn_idx7];
	       chan_valn[24] = column_real[vauxn_idx8];
	       chan_valn[25] = column_real[vauxn_idx9];
	       chan_valn[26] = column_real[vauxn_idx10];
	       chan_valn[27] = column_real[vauxn_idx11];
	       chan_valn[28] = column_real[vauxn_idx12];
	       chan_valn[29] = column_real[vauxn_idx13];
	       chan_valn[30] = column_real[vauxn_idx14];
	       chan_valn[31] = column_real[vauxn_idx15];
	       
		
		// identify columns
		if (time_index != -1) begin

		    prev_time_out = time_out;
		    time_out = $bitstoreal(column_real[time_index]);
		    
		    if (prev_time_out > time_out) begin

			$display("Error: [Unisim %s-6] Time value %f is invalid in the input file. Time value should be increasing. Instance: %m", MODULE_NAME, time_out);
                        infile_format;
		    end
		    
		end		
		else begin

		    $display("Error: [Unisim %s-7] No TIME label is found in the analog data file. Instance: %m", MODULE_NAME);
                    infile_format;
		    $finish;
		end

		# ((time_out - prev_time_out) * 1000);

		for (p = 0; p < 36; p = p + 1) begin
		    // assign to real before minus - to work around a bug in modelsim
		    chan_val_tmp[p] = chan_val[p];
		    chan_valn_tmp[p] = chan_valn[p];
		    mn_in_tmp = $bitstoreal(chan_val[p])  - $bitstoreal(chan_valn[p]);
		    mn_in_diff[p] = $realtobits(mn_in_tmp);
		    mn_in_uni[p] = chan_val[p];
		end

//		# ((time_out - prev_time_out) * 1000);

	    end // if (char_1 == "0" | char_1 == "9")
	    // Ignore any non-comment, label
	    else begin

		fs = $ungetc (char_2, fd);
		fs = $ungetc (char_1, fd);
		fs = $fgets (one_line, fd);    

	    end
	    
	end 
       end // while (end_file == 0)
      end // if (sim_file_flag == 0)
    end // initial begin

    task infile_format;
    begin
    $display("\n***** SYSMONE1 Simulation analog Data File Format *****\n");
    $display("NAME: design.txt or user file name passed with parameter/generic SIM_MONITOR_FILE\n");
    $display("FORMAT: First line is header line. Valid column name are: TIME TEMP VCCINT VCCAUX VCCBRAM VCCPINT VCCPAUX VCCDDRO VP VN VAUXP[0] VAUXN[0] ..... \n");
    $display("TIME must be in first column.\n");
    $display("Time value need to be integer in ns scale.\n");
    $display("analog value need to be real and must contain a decimal point '.' ,  e.g. 0.0, 3.0\n");
    $display("Each line including header line can not have extra space after the last character/digit.\n");
    $display("Each data line must have same number of columns as the header line.\n");
    $display("Comment line start with -- or //\n");
    $display("Example:\n");
    $display("TIME TEMP VCCINT  VP VN VAUXP[0] VAUXN[0]\n");
    $display("000  125.6  1.0  0.7  0.4  0.3  0.6\n");
    $display("200  25.6   0.8  0.5  0.3  0.8  0.2\n");
    end
    endtask  //task infile_format

    function [12*8:1] to_upcase_label;
       input  [12*8:1] in_label;
       reg [8:1] tmp_reg;
    begin

        for (i=0; i< 12; i=i+1) begin

           for (j=1; j<=8; j= j+1)
                tmp_reg[j] = in_label[i*8+j];

           if ((tmp_reg >96) && (tmp_reg<123))
                tmp_reg = tmp_reg -32;

           for (j=1; j<=8; j= j+1)
                to_upcase_label[i*8+j] = tmp_reg[j];

        end
    end
    endfunction

// end read input file

// Check if (Vp+Vn)/2 = 0.5 +/- 100 mv,  unipolar only
    always @( posedge busy_r )
    begin
      if (acq_b_u == 0 && rst_in == 0 && ((acq_chan == 3) || (acq_chan >= 16 && acq_chan <= 31))) begin  
         chan_val_p_tmp = $bitstoreal(chan_val_tmp[acq_chan]);
         chan_val_n_tmp = $bitstoreal(chan_valn_tmp[acq_chan]);

         if ( chan_val_n_tmp > chan_val_p_tmp)
              $display("Warning: [Unisim %s-8] The N input for external channel %x must be smaller than P input when in unipolar mode (P=%0.2f N=%0.2f) at %.3f ns. Instance: %m", MODULE_NAME, acq_chan, chan_val_p_tmp, chan_val_n_tmp, $time/1000.0);
         if ( chan_val_n_tmp > 0.5 || chan_val_n_tmp < 0.0)
            $display("Warning: [Unisim %s-9] The range of N input for external channel %x should be between 0V to 0.5V when in unipolar mode (N=%0.2f) at %.3f ns. Instance: %m", MODULE_NAME, acq_chan, chan_val_n_tmp, $time/1000.0);
      end
    end

  reg seq_reset_busy_out = 0;
  wire rst_in_out;

  always @(posedge dclk_in or posedge rst_in_out)
   if (rst_in_out) begin
      busy_rst <= 1;
      rst_lock <= 1;
      rst_lock_early <= 1;
      rst_lock_late <= 1;
      busy_rst_cnt <= 0;
   end
   else begin
    if (rst_lock == 1) begin
        if (busy_rst_cnt < 29) begin
           busy_rst_cnt <= busy_rst_cnt + 1;
           if ( busy_rst_cnt == 26)
                 rst_lock_early <= 0;
        end
        else begin
           busy_rst <= 0;
           rst_lock = 0;
        end
     end
    if (busy_out == 0)
      rst_lock_late <= 0;
   end
  
  initial begin
   busy_out = 0;
   busy_rst = 0;
   busy_conv = 0;
   busy_seq_rst = 0;
   busy_out_tmp = 0;
  end 

   always @(busy_rst or busy_conv or rst_lock)
     if (rst_lock)
         busy_out = busy_rst;
     else
         busy_out = busy_conv;

   always @(posedge dclk_in or posedge rst_in)
     if (rst_in) begin
            busy_conv <= 0;
            cal_chan_update <= 0;
     end
     else begin
        if (seq_reset_flag == 1 && curr_clkdiv_sel <= 8'h03) begin
             busy_conv <= busy_seq_rst; 
         end
         else if (busy_sync_fall)
            busy_conv <= 0;
         else if (busy_sync_rise)
            busy_conv <= 1;
   
         if (conv_count == 21 && curr_chan == 6'b001000)
              cal_chan_update  <= 1;
         else
              cal_chan_update  <= 0;
     end

  always @(posedge dclk_in or rst_lock)
     if (rst_lock) begin
        busy_sync1 <= 0;
        busy_sync2 <= 0;
     end
     else begin
         busy_sync1 <= busy_r;
         busy_sync2 <= busy_sync1;
     end 

  assign busy_sync_fall = (busy_r == 0 && busy_sync1 == 1) ? 1 : 0;
  assign busy_sync_rise = (busy_sync1 == 1 && busy_sync2 == 0 ) ? 1 : 0;

  always @(negedge busy_out or posedge busy_r)
     if (seq_reset_flag == 1 && seq1_0 == 4'b0000 && curr_clkdiv_sel <= 8'h03) begin
         @(posedge dclk_in);
         @(posedge dclk_in);
         @(posedge dclk_in);
         @(posedge dclk_in);
         @(posedge dclk_in)
           busy_seq_rst <= 1;
      end
      else if (seq_reset_flag == 1 && seq1_0 != 4'b0000 && curr_clkdiv_sel <= 8'h03) begin
         @(posedge dclk_in);
         @(posedge dclk_in);
         @(posedge dclk_in);
         @(posedge dclk_in);
         @(posedge dclk_in)
         @(posedge dclk_in)
         @(posedge dclk_in)
           busy_seq_rst <= 1;
      end
      else
        busy_seq_rst <= 0;


  always @(posedge busy_out or posedge rst_in_out or negedge rst_lock_early) 
   if (rst_in_out)
    muxaddr_out <= 5'b0;
   else if (rst_lock_early == 0 && rst_lock_late == 1 )
     muxaddr_out <= muxaddr_o;
   else begin
    @(posedge adcclk);
    @(posedge adcclk);
    @(posedge adcclk);
    @(posedge adcclk);
//    @(posedge adcclk);
    @(posedge adcclk);
    @(posedge adcclk);
    @(posedge adcclk);
    @(posedge adcclk)
    muxaddr_out <= muxaddr_o;
  end 

  always @(negedge busy_out or posedge busy_out or posedge rst_in_out or posedge cal_chan_update )
   if (rst_in_out || rst_lock_late)
         channel_out <= 5'b0;
   else if (busy_out ==1 && (cal_chan_update == 1) )
         channel_out <= 5'b01000;
   else if (busy_out == 0) begin
         if ((curr_seq1_0_lat[3:2] != 2'b10 && sysmone12_en == 0) || sysmone12_en == 1)
           channel_out <= curr_chan;  
         else
           channel_out <= 5'b0;
         curr_chan_lat <= curr_chan;
   end


// START double latch rst_in
    
    reg rst_in1_tmp5;
    reg rst_in2_tmp5;
    reg rst_in1_tmp6;
    reg rst_in2_tmp6;
    wire rst_input_t;
    wire rst_in2;

    initial begin
       int_rst = 1;
       @(posedge dclk_in)
       @(posedge dclk_in)
           int_rst <= 0;
    end

    initial begin
           rst_in1_tmp5 = 0;
           rst_in2_tmp5 = 0;
           rst_in1_tmp6 = 0;
           rst_in2_tmp6 = 0;
    end

    assign #1 rst_input_t = int_rst_halt_adc | rst_input | int_rst | soft_reset;

    
    always@(posedge adcclk or posedge rst_input_t)
           if (rst_input_t) begin
                   rst_in2_tmp6 <= 1;
                   rst_in1_tmp6 <= 1;
           end
           else begin
                   rst_in2_tmp6 <= rst_in1_tmp6;
                   rst_in1_tmp6 <= rst_input_t;
           end

    
    assign rst_in2 =  rst_in2_tmp6;
    assign #10 rst_in_not_seq = rst_in2;
    assign  rst_in = rst_in_not_seq | seq_reset_dly;
    assign rst_in_out = rst_in_not_seq | seq_reset_busy_out;


    always @(posedge seq_reset) begin
      @(posedge dclk_in);
      @(posedge dclk_in)
       seq_reset_dly <= 1;
      @(posedge dclk_in);
      @(negedge dclk_in)
          seq_reset_busy_out <= 1;
      @(posedge dclk_in)
      @(posedge dclk_in)
      @(posedge dclk_in) begin
        seq_reset_dly <= 0;
          seq_reset_busy_out <= 0;
       end
    end
      
    always @(posedge seq_reset_dly or posedge busy_r)
      if (seq_reset_dly)
          seq_reset_flag <= 1;
      else
         seq_reset_flag <= 0; 

      always @(posedge seq_reset_flag or posedge busy_out)
      if (seq_reset_flag)
          seq_reset_flag_dly <= 1;
      else
         seq_reset_flag_dly <= 0;

      always @(posedge busy_out )
      if (seq_reset_flag_dly == 1 && acq_chan == 6'b001000 && seq1_0 == 4'b0000)
         first_cal_chan <= 1;
      else
         first_cal_chan <= 0;
         


    initial begin
       conv_time = 18;   //minus 3
       conv_time_cal_1 = 96;
       conv_time_cal = 96;
       sysclk = 0;
       adcclk_tmp = 0;
       seq_count = 1;
       seq_count_a = 1;
       seq_count2 = 1;
       eos_en = 0;
       eos_tmp_en = 0;
       clk_count = -1;
       acq_acqsel = 0;
       acq_e_c_tmp6 = 0;
       acq_e_c_tmp5 = 0;
       eoc_en = 0;
       eoc_en_delay = 0;
       rst_lock = 0;
       rst_lock_early = 0;
       alarm_update = 0;
       drp_update = 0;
       cal_chan_update = 0;
       adc_state = S3_ST;
       scon_tmp = 5'b0;
       busy_r = 0;
       busy_r_rst = 0;
        busy_sync1 = 0;
        busy_sync2 = 0;
       conv_count = 0;
       conv_end = 0;
       seq_status_avg = 0;
       seq_status_avg2 = 0;
       for (i = 0; i <=20; i = i +1)
       begin
            conv_pj_count[i] = 0;   
            conv_acc[j] = 0;
       end
       adc_s1_flag = 0;
       for (k = 0; k <= 31; k = k + 1) begin
          data_reg[k] = 16'b0;
       end 
       seq_count_en = 0;
       eos_out_tmp = 0;
       eoc_out_tmp = 0;
       eos_out_tmp1 = 0;
       eoc_out_tmp1 = 0;
       eos_out = 0;
       eoc_out = 0;
       eoc_out_t = 0;
       curr_pj_set = 2'b0;
       curr_e_c = 0;
       curr_b_u = 0;
       curr_acq = 0;
       curr_seq1_0 = 4'b0;
       curr_seq1_0_lat = 4'b0;
       seq1_0 = 4'b0;
       ext_mux = 0;
       ext_mux_chan = 5'b0;
       daddr_in_lat = 8'b0;
       data_reg[32] = 16'b0;
       data_reg[33] = 16'b0;
       data_reg[34] = 16'b0;
       data_reg[35] = 16'b0;
       data_reg[36] = 16'b1111111111111111;
       data_reg[37] = 16'b1111111111111111;
       data_reg[38] = 16'b1111111111111111;
       data_reg[39] = 16'b1111111111111111;
       data_reg[40] = 16'b0;
       data_reg[41] = 16'b0;
       data_reg[42] = 16'b0;
       data_reg[43] = 16'b0;
       data_reg[44] = 16'b1111111111111111;
       data_reg[45] = 16'b1111111111111111;
       data_reg[46] = 16'b1111111111111111;
       data_reg[47] = 16'b1111111111111111;
       ot_out_reg = 0;
       ot_out = 0;
       alarm_out_reg = 16'b0;
       alarm_out = 16'b0;
       curr_chan =  6'b0;
       curr_chan_lat =  6'b0;
       busy_out = 0;
       busy_out_tmp = 0;
       curr_seq = 16'b0;
       curr_seq_m = 16'b0;
       seq_num = 0;
       seq_num2 = 0;
       seq_reset_flag_dly = 0;
       seq_reset_flag = 0;
       seq_reset_dly = 0;
       ot_en = 1;
       alarm_en = 13'h1fff;
       do_out_rdtmp = 16'b0;
       acq_chan = 6'b0;
       acq_chan_m = 5'b0;
       acq_b_u = 0;
       conv_result_int = 0;
       conv_result = 0;
       conv_result_reg = 0;
    end


// state machine
    always @(posedge adcclk or posedge rst_in or sim_file_flag) begin
//CR 675227
	if (!(halt_adc == 2 && seq1_0 == 4'b0011)) begin
        if (sim_file_flag == 1'b1)
            adc_state <= S1_ST; 
	else if (rst_in == 1'b1 || rst_lock_early == 1)
	    adc_state <= S1_ST;
	else if (rst_in == 1'b0)
	    adc_state <= next_state;
	end
    end
    
    always @(adc_state or eos_en or conv_start or conv_end or curr_seq1_0_lat) begin

	case (adc_state)
	    S1_ST : next_state = S2_ST;

	    S2_ST : if (conv_start)
				  next_state = S3_ST;
		              else
				  next_state = S2_ST;

	    S3_ST : if (conv_end)
				   next_state = S5_ST;
			           else
               next_state = S3_ST;

	    S5_ST : if (curr_seq1_0_lat == 4'b0001) 
                   begin
//CR 675227			if (eos_en)
			if (eos_tmp_en)
				             next_state = S6_ST;
		                else
				             next_state = S2_ST;
			          end
		             else
				          next_state = S2_ST;
		        
	    S6_ST : next_state = S1_ST;

	    default : next_state = S1_ST;

	endcase // case(adc_state)

    end 
    
// end state machine    
    

// DRPORT - SRAM

    initial begin
        drdy_out = 0;
        drdy_out_tmp1 = 0;
        drdy_out_tmp2 = 0;
        drdy_out_tmp3 = 0;
        drdy_out_tmp4 = 0;
        en_data_flag = 0;
        do_out = 16'b0;
        seq_reset = 0;
        cfg_reg1_init = INIT_41_reg;
        seq_en = 0; 
        seq_en_dly = 0;
        seq_en <= #20 (cfg_reg1_init[15:12] != 4'b0011 ) ? 1 : 0;
        seq_en <= #150 0;
    end

    always @(posedge drdy_out_tmp3 or posedge gsr_in) 
    if (gsr_in == 1) 
         drdy_out <= 0;
    else begin
      @(posedge dclk_in)
         drdy_out  <= 1;
      @(posedge dclk_in)
         drdy_out <= 0;
    end

    always @(posedge dclk_in or posedge gsr_in) 

     if (gsr_in == 1) begin
         daddr_in_lat  <= 8'b0;
         do_out <= 16'b0;
     end
     else  begin
        if (den_in == 1'b1) begin
           if (drdy_out_tmp1 == 1'b0) begin
              drdy_out_tmp1 <= 1'b1;
              en_data_flag = 1;
              daddr_in_lat  <= daddr_in;
           end
           else begin
              if (daddr_in != daddr_in_lat)

		$display("Warning: [Unisim %s-10] Input pin DEN at time %.3f ns can not be continuously set to high. Please wait for DRDY to be high and then set DEN to high again. Instance: %m", MODULE_NAME, $time/1000.0);  
	   end
        end // if (den_in == 1'b1)
        else
           drdy_out_tmp1 <= 1'b0;

        drdy_out_tmp2 <= drdy_out_tmp1;
        drdy_out_tmp3 <= drdy_out_tmp2;

        if (drdy_out_tmp1 == 1)
            en_data_flag = 0;

        if (drdy_out_tmp3 == 1) 
            do_out <= do_out_rdtmp;

        if (den_in == 1 && (daddr_in >8'hAD || (daddr_in > 8'hA5 && daddr_in < 8'hA8) || (daddr_in > 8'h85 && daddr_in < 8'hA0) || (daddr_in > 8'h79 && daddr_in < 8'h80) || (daddr_in > 8'h75 && daddr_in < 8'h78) || (daddr_in > 8'h6D && daddr_in < 8'h73) || (daddr_in > 8'h65 && daddr_in < 8'h68) || (daddr_in > 8'h38 && daddr_in < 8'h3C) || (daddr_in > 8'h32 && daddr_in < 8'h38) || daddr_in == 8'h2B || daddr_in == 8'h2F))
        $display("Warning: [Unisim %s-11] The input DADDR %x at time %.3f ns is accessing an undefined location. The data in this location is invalid. Instance: %m", MODULE_NAME, daddr_in, $time/1000.0);
    
// write  all available daddr addresses

        if (dwe_in == 1'b1 && en_data_flag == 1) begin

          dr_sram[daddr_in] <= di_in;
        
            if (daddr_in == 8'h03)
                 soft_reset <= 1;

            if ( daddr_in == 8'h53) begin
                 if (di_in[3:0] == 4'b0011)
                    ot_limit_reg[15:4] <= di_in[15:4];
             end

            if ( daddr_in == 8'h42 && (di_in[2:0] !=3'b000)) 
                $display("Error: [Unisim %s-12] The input DI bit[2:0] %x at DADDR %x at time %.3f ns is invalid. DI[2:0] must be set to 000. Instance: %m", MODULE_NAME, di_in[2:0], daddr_in, $time/1000.0);

          if ( daddr_in >= 8'h73 && daddr_in <= 8'h75 && (di_in[15:0] != 16'h0000)) 
		$display("Error: [Unisim %s-13] The input DI value %x at DADDR %x at time %.3f ns is invalid. DI must be set to 0000h. Instance: %m", MODULE_NAME, di_in, daddr_in, $time/1000.0);

          if ((daddr_in == 8'h40) && ( di_in[5:0] == 6'b000111 || (di_in[5:0] > 6'b001000 && di_in[5:0] < 6'b010000))) 
		$display("Warning: [Unisim %s-14] The input DI bit [5:0] at address DADDR %x at time %.3f ns is %h, which is an invalid analog channel. Instance: %m", MODULE_NAME, daddr_in, $time/1000.0, di_in[5:0]);

          if (daddr_in == 8'h40) begin
            if ((cfg_reg1[15:12]==4'b0011) && (di_in[8]==1) && (di_in[5:0] != 6'b000011) && (di_in[5:0] < 6'b010000))
             $display("Warning: [Unisim %s-15] The input DI value is %x at DADDR %x at time %.3f ns.  Bit[8] of DI must be set to 0. Long acquistion mode is only allowed for external channels. Instance: %m", MODULE_NAME, di_in, daddr_in, $time/1000.0);


          if ((cfg_reg1[15:12]==4'b0011) && (di_in[13:12]!=2'b00) && (seq_chan_reg1 != 16'h0000) && (seq_chan_reg2 != 16'h0000) && (seq_chan_reg3 != 16'h0000))
             $display("Warning: [Unisim %s-16] The Control Regiter 46h, 48h and 49h are set to %x, %x and %x respectively at time %.3f ns. These registers should be set to 0000h in single channel mode with averaging enabled. Instance: %m", MODULE_NAME, seq_chan_reg3, seq_chan_reg1, seq_chan_reg2, $time/1000.0);

         end

         if (daddr_in == 8'h40 && en_data_flag == 1) begin
           if ((di_in[15:12]==4'b0011) && (cfg_reg0[8]==1) && (cfg_reg0[5:0] != 6'b000011) && (cfg_reg0[5:0] < 6'b010000))
             $display("Warning: [Unisim %s-17] The Control Regiter 40h value is set to %x at time %.3f ns.  Bit[8] of Control Regiter 40h must be set to 0. Long acquistion mode is only allowed for external channels. Instance: %m", MODULE_NAME, cfg_reg0, $time/1000.0);

           if ((di_in[15:12]!=4'b0011) && (seq_acq_reg1[10:0]!=11'b0) && (seq_acq_reg1[15:12]!=4'b0))
             $display("Warning: [Unisim %s-18] The Control Regiter 4Eh value is to %x at time %.3f ns.  Bit[15:12] and bit[10:0] of this register must be set to 0. Long acquistion mode is only allowed for external channels. Instance: %m", MODULE_NAME, seq_acq_reg1, $time/1000.0);

           if ((di_in[15:12]==4'b0011) && (cfg_reg0[13:12]!=2'b00) && (seq_chan_reg1 != 16'h0000) && (seq_chan_reg2 != 16'h0000) && (seq_chan_reg3 != 16'h0000))
             $display("Warning: [Unisim %s-19] The Control Regiter 46h, 48h and 49h are set to %x, %x and %x respectively at time %.3f ns. These registers should be set to 0000h in single channel mode with averaging enabled. Instance: %m", MODULE_NAME, seq_chan_reg3, seq_chan_reg1, seq_chan_reg2, $time/1000.0);

      end
		
      if (daddr_in == 8'h41  && en_data_flag == 1) begin
	     if (den_in == 1'b1 && dwe_in == 1'b1) begin
          if (di_in[15:12] != cfg_reg1[15:12])  // writing with the same seq[3:0] will not restart the sequence, matching with hw
			    seq_reset <= 1'b1;
		    else
			    seq_reset <= 1'b0;

		    if (di_in[15:12] != 4'b0011 )
			    seq_en <= 1'b1;
		    else
			    seq_en <= 1'b0;
	     end
        else  begin
			 seq_reset <= 1'b0;
			 seq_en <= 1'b0;
	     end
      end
     end // dwe ==1			

     if (seq_en == 1) 
         seq_en <= 1'b0;
     if (seq_reset == 1)
			seq_reset <= 1'b0;
     if (soft_reset == 1)
         soft_reset <= 0;

   end // if (gsr == 1)
		

// DO bus data out


   assign  tmp_dr_sram_out = ( daddr_in_lat >= 8'h40 && daddr_in_lat <= 8'hAD) ? 
                                                      dr_sram[daddr_in_lat] : 16'b0;

   assign flag_reg0 = {8'b0,  alarm_out[6:3], ot_out, alarm_out[2:0]};
   assign flag_reg1 = {10'b0, alarm_out[13:8]};

   assign tmp_data_reg_out = (daddr_in_lat >= 8'h00 && daddr_in_lat <= 8'h3D) ?
                                                      data_reg[daddr_in_lat] : 16'b0;

   always @( daddr_in_lat or  tmp_data_reg_out or tmp_dr_sram_out or flag_reg0 or flag_reg1 ) begin
     if ((daddr_in_lat > 8'hAD || (daddr_in_lat >= 8'h86 && daddr_in_lat < 8'hA0))) begin
		   do_out_rdtmp = 16'bx;
     end
      

     if (daddr_in_lat == 8'h3E)
            do_out_rdtmp = flag_reg1;
     else if (daddr_in_lat == 8'h3F)
            do_out_rdtmp = flag_reg0;


     if ((daddr_in_lat >= 8'h00  && daddr_in_lat <= 8'h3D)) 
	   	do_out_rdtmp = tmp_data_reg_out;
	  else if (daddr_in_lat >= 8'h40 && daddr_in_lat <= 8'hAD)
	      do_out_rdtmp = tmp_dr_sram_out;
   end

// end DRP RAM

    
     assign cfg_reg0 = dr_sram[8'h40];
     assign cfg_reg1 = dr_sram[8'h41];
     assign cfg_reg2 = dr_sram[8'h42];
     assign cfg_reg3 = dr_sram[8'h43];
     assign seq_chan_reg1 = dr_sram[8'h48];
     assign seq_chan_reg2 = dr_sram[8'h49];
     assign seq_chan_reg3 = dr_sram[8'h46];
     assign seq_pj_reg1 = dr_sram[8'h4A];
     assign seq_pj_reg2 = dr_sram[8'h4B];
     assign seq_pj_reg3 = dr_sram[8'h47];
     assign seq_du_reg1 = dr_sram[8'h4C];
     assign seq_du_reg2 = dr_sram[8'h4D];
     assign seq_du_reg3 = dr_sram[8'h78];
     assign seq_acq_reg1 = dr_sram[8'h4E];
     assign seq_acq_reg2 = dr_sram[8'h4F];
     assign seq_acq_reg3 = dr_sram[8'h79];
 
    always @(cfg_reg1)
        seq1_0 = cfg_reg1[15:12];

    always @(cfg_reg0) begin
        ext_mux = cfg_reg0[11];
        ext_mux_chan = cfg_reg0[4:0];
    end

    always @(posedge drp_update or posedge rst_in) 
    begin
      if (rst_in) begin
           @(posedge dclk_in)
           @(posedge dclk_in)
               seq_bits = seq1_0;
       end
       else
           seq_bits = curr_seq1_0;
  
      if (seq_bits == 4'b0000) begin
         alarm_en <= 13'b0;
         ot_en <= 1;
      end
      else begin
         ot_en  <= ~cfg_reg1[0];
         alarm_en[2:0] <= ~cfg_reg1[3:1];
         alarm_en[6:3] <= ~cfg_reg1[11:8];
	 alarm_en[11:8] <= ~cfg_reg3[3:0];
      end
   end

// end DRPORT - sram    

   
//////////////////////////////////////// I2C  start /////////////////////////////////////

   reg i2c_sda_in_sync, i2c_sda_in_sync_d1, i2c_sda_in_sync_d2;
   reg i2c_sclk_in_sync, i2c_sclk_in_sync_d1, i2c_sclk_in_sync_d2;
   reg detect_ack;
   integer byte_cnt = 0;
   integer bit_cnt = 8;
   integer i2c_sda_setup_cnt;
   reg [31:0] i2c_data_in = 32'b0;
   reg [7:0] i2c_data_in70 = 8'b0;
   reg [7:0] i2c_data_in158 = 8'b0;
   reg [7:0] i2c_data_in2316 = 8'b0;
   reg [7:0] i2c_data_in3124 = 8'b0;
   reg [7:0] i2c_sda_out_70_tmp;
   reg [7:0] i2c_sda_out_158_tmp;
   reg [7:0] i2c_address;
   reg i2c_clk = 0;
   reg [15:0] data_ff = 16'b0;
   reg [7:0] addr_ff = 8'b0;  
   reg den_ff = 0;
   reg dwe_ff = 0;   
   reg addr_match = 0;
   reg new_written_data = 0;
   reg i2c_start = 0;
   reg i2c_stop = 0;
   reg [2:0] i2c_state;
   reg [6:0] i2c_addr;
   reg [7:0] i2c_header = 8'b0;
   reg sclk_falling_sync, sclk_rising_sync;
   reg sclk_falling_sync_d3, sclk_falling_sync_d2, sclk_falling_sync_d1;
   reg i2c_sda_xmit;
   
   parameter IDLE       = 3'b000, 
	     HEADER     = 3'b001, 
             ACK_HEADER = 3'b010, 
             RCV_DATA   = 3'b011, 
             ACK_DATA   = 3'b100,
             XMIT_DATA  = 3'b101, 
             WAIT_ACK   = 3'b110;
   
   initial forever #10000 i2c_clk = ~i2c_clk;  // 50 Mhz oscillator
   

   always @(posedge i2c_clk or posedge rst_input) begin
      if (rst_input) begin
	 i2c_sda_in_sync <= 0;
	 i2c_sda_in_sync_d1 <= 0;
	 i2c_sda_in_sync_d2 <= 0;
	 i2c_sclk_in_sync <= 0;
	 i2c_sclk_in_sync_d1 <= 0;
	 i2c_sclk_in_sync_d2 <= 0;
      end
      else begin
	 i2c_sda_in_sync <= i2c_sda_in;
	 i2c_sda_in_sync_d1 <= i2c_sda_in_sync;
	 i2c_sda_in_sync_d2 <= i2c_sda_in_sync_d1;
	 i2c_sclk_in_sync <= i2c_sclk_in;
	 i2c_sclk_in_sync_d1 <= i2c_sclk_in_sync;
	 i2c_sclk_in_sync_d2 <= i2c_sclk_in_sync_d1;
      end
   end

   assign sda_falling = i2c_sda_in_sync_d2 & ~i2c_sda_in_sync_d1;
   assign sda_rising = ~i2c_sda_in_sync_d2 & i2c_sda_in_sync_d1;
   assign sda_changing = sda_falling | sda_rising;  
   

// detect i2c start
   always @(posedge i2c_clk or posedge rst_input) begin
      if(rst_input)
	i2c_start = 1'b0;
      else if (cfg_reg3[7] == 1'b1) begin
	 if (i2c_state == HEADER)
	   i2c_start = 1'b0;
	 else begin
	    if(i2c_sda_in_sync_d2 && ~i2c_sda_in_sync_d1) begin
               if(i2c_sclk_in_sync_d1) begin
		  i2c_start = 1'b1;
	       end
               else
		 i2c_start = 1'b0;
	    end      
	 end
      end
   end

   
   // detect i2c stop
   always @(posedge i2c_clk or posedge rst_input) begin
      if(rst_input)
	i2c_stop <= 1'b0;
      else if (cfg_reg3[7] == 1'b1) begin
	 if(~i2c_sda_in_sync_d2 & i2c_sda_in_sync_d1) begin
            if(i2c_sclk_in_sync_d1)
	      i2c_stop <= 1'b1;
            else
	      i2c_stop <= 1'b0;
	 end      
      end
   end
   

   

   always @(posedge i2c_clk or posedge rst_input) begin
      if (rst_input) begin
	 sclk_falling_sync <= 0;
	 sclk_rising_sync <= 0;
      end
      else begin
	 sclk_falling_sync <= i2c_sclk_in_sync_d2 & ~i2c_sclk_in_sync_d1;
	 sclk_falling_sync_d1 <= sclk_falling_sync;
	 sclk_falling_sync_d2 <= sclk_falling_sync_d1;
	 sclk_falling_sync_d3 <= sclk_falling_sync_d2;
	 sclk_rising_sync <= ~i2c_sclk_in_sync_d2 & i2c_sclk_in_sync_d1;
      end
   end

   

   always @(posedge i2c_clk or posedge rst_input) begin
      if (rst_input)
	detect_ack <= 0;
      else
	 if (sclk_rising_sync)
	   detect_ack <= i2c_sda_in_sync_d1;  // 0 = ack, 1 nack
   end
   
      
// I2C slave address mapping
   always @(cfg_reg3[15:7] or data_reg[3]) begin

      if (cfg_reg3[7] == 1'b1) begin
	 
	 if (cfg_reg3[15] == 1'b1)
	   
	   i2c_addr = cfg_reg3[14:8];
	 
	 else begin
	    
	    case (data_reg[3][15:12])
	       4'h0 : i2c_addr = 7'b0110010;
	       4'h1 : i2c_addr = 7'b0001011;
	       4'h2 : i2c_addr = 7'b0010011;
	       4'h3 : i2c_addr = 7'b0011011;
	       4'h4 : i2c_addr = 7'b0100011;
	       4'h5 : i2c_addr = 7'b0101011;
	       4'h6 : i2c_addr = 7'b0110011;
	       4'h7 : i2c_addr = 7'b0111011;
	       4'h8 : i2c_addr = 7'b1000011;
	       4'h9 : i2c_addr = 7'b1001011;
	       4'ha : i2c_addr = 7'b1010011;
	       4'hb : i2c_addr = 7'b1011011;
	       4'hc : i2c_addr = 7'b1100011;
	       4'hd : i2c_addr = 7'b1101011;
	       4'he : i2c_addr = 7'b1110011;
	       4'hf : i2c_addr = 7'b0111010;
	     endcase
	 
	 end // else: !if(cfg_reg3[15] == 1'b1)

      end // if (cfg_reg3[7] == 1'b1)
   
   end // always @ (cfg_reg3[15:7] or data_reg[3])


   always @(posedge i2c_clk or posedge rst_input) begin // I2C FSM

      if(rst_input) begin
	 i2c_state   <= IDLE;
      end
      else if (sclk_falling_sync_d2) begin
     
	 case (i2c_state)
           IDLE :    begin
                       if(i2c_start)
                         i2c_state <= HEADER;
                     end    
              
           HEADER :  begin    
                       if(bit_cnt == 0)
                         i2c_state <= ACK_HEADER;
                     end    

           ACK_HEADER : begin
                          if(detect_ack == 1'b0) begin       // Ack has been received
                             if(addr_match) begin                // If aas_ff is true then addressed as slave
				if(i2c_header[0] ==  1'b0) begin  // Check i2c_header[0] to determine direction
				   i2c_state <= RCV_DATA;              // Receive Mode
				end                      
				else begin
				   i2c_state <= XMIT_DATA;             // Transmit Mode  
				end 
			     end   
			     else begin
				i2c_state <= IDLE;
			     end  
                          end   
	                end
	   
           RCV_DATA :   begin
                       if(i2c_start) begin
                         i2c_state <= HEADER;
                       end  
                       else if(bit_cnt == 0) begin
                          i2c_state <= ACK_DATA;
                         end  
                       end
                   

	   XMIT_DATA :  begin
                       if(i2c_start) begin
                         i2c_state <= HEADER;
                       end  
                       else if(bit_cnt == 1) begin   // after transmitted 8 bit now wait for acknowledge
                         i2c_state <= WAIT_ACK;
                       end  
                     end
                         
           ACK_DATA :   begin
	                  if (detect_ack == 1'b0)
			    i2c_state <= RCV_DATA;
			  else  // NACK received
			    i2c_state <= IDLE;
                        end    

           WAIT_ACK :   begin
                       if(detect_ack == 1'b0) begin // wait for acknowlege from master 0 ack, 1 nack
                         i2c_state <= XMIT_DATA;
                       end  
                       else begin
                         i2c_state <= IDLE;
                       end   
                     end
                         
           default :    begin
                          i2c_state <= IDLE;
                        end                                                                                                                    
	 endcase
     
	 if(i2c_stop) begin
	    i2c_state   <= IDLE;
	 end
     
      end  
   end


   // bit count from 8 to 1 -> bit 7 to bit 0
   always @(posedge i2c_clk or posedge rst_input) begin
      if((rst_input) || (i2c_state == IDLE) || (i2c_state == ACK_HEADER) || (i2c_state == ACK_DATA) || 
	      (i2c_state == WAIT_ACK) || i2c_start) begin
	 bit_cnt <= 8;
      end
      else if(((i2c_state == HEADER)    && sclk_falling_sync) || 
	      ((i2c_state == RCV_DATA)  && sclk_falling_sync) || 
	      ((i2c_state == XMIT_DATA) && sclk_falling_sync_d2)) begin
	 bit_cnt <= bit_cnt - 1;
      end
   end // always @ (posedge i2c_clk or posedge rst_input)

   
   // byte count
   always @(posedge i2c_clk or posedge rst_input) begin
      if((rst_input) || (i2c_state == IDLE) || (i2c_state == ACK_HEADER) || i2c_start) begin
	 byte_cnt <= 0;
      end
      else if ((i2c_state == RCV_DATA && sclk_falling_sync_d1 && byte_cnt <= 3 && bit_cnt == 0) ||
	       (i2c_state == XMIT_DATA && sclk_falling_sync_d1 && byte_cnt <= 1 && bit_cnt == 1)) begin
	          byte_cnt <= byte_cnt + 1;
      end
      
   end

   
   // Getting I2C header
   always @(posedge i2c_clk) begin
      if (!rst_input)
	 if (i2c_state == HEADER && sclk_rising_sync && bit_cnt > 0)
	    i2c_header <= {i2c_header[6:0], i2c_sda_in_sync_d1};
   end
   

   // matching I2C slave address from i2c_sda bus
   always @(i2c_header[7:1] or i2c_addr) begin                           
      if(i2c_header[7:1] == i2c_addr[6:0])
	 addr_match = 1'b1;
      else
	 addr_match = 1'b0; 
   end      
   

   // I2C Data recevie
   always @(posedge i2c_clk or posedge rst_input) begin
      if (rst_input) begin
	 i2c_data_in70 <= 8'b0;
	 i2c_data_in158 <= 8'b0;
	 i2c_data_in2316 <= 8'b0;
	 i2c_data_in3124 <= 8'b0;
      end
      else begin

	 if (i2c_state == RCV_DATA && sclk_rising_sync && ~i2c_start && bit_cnt > 0)
	    
	   if (byte_cnt == 0)
	     i2c_data_in70 <= {i2c_data_in70[6:0], i2c_sda_in_sync_d1};
	   else if (byte_cnt == 1)
	     i2c_data_in158 <= {i2c_data_in158[6:0], i2c_sda_in_sync_d1};
	   else if (byte_cnt == 2)
	     i2c_data_in2316 <= {i2c_data_in2316[6:0], i2c_sda_in_sync_d1};
	   else if (byte_cnt == 3)
	     i2c_data_in3124 <= {i2c_data_in3124[6:0], i2c_sda_in_sync_d1};
	    
      end // else: !if(i2c_stop)
   end
 

   always @(posedge i2c_clk or posedge rst_input) begin
      if (rst_input)
	 i2c_data_in <= 32'b0;
      else
	 if (bit_cnt == 0 && byte_cnt == 4) begin
	    i2c_data_in <= {i2c_data_in3124, i2c_data_in2316, i2c_data_in158, i2c_data_in70};
	    new_written_data = 1;
	 end
	 else
	    new_written_data = 0;
   end
      
      
      // Decode I2C incoming data
   always@(posedge i2c_clk or posedge rst_input) begin
      if(rst_input) begin
	 data_ff <= 16'b0;
	 addr_ff <= 8'b0;  
	 den_ff  <= 1'b0;
	 dwe_ff  <= 1'b0;         
      end
      else begin
	 
	 if(new_written_data) begin          
	    data_ff <= i2c_data_in[15:0];
	    addr_ff <= i2c_data_in[23:16];                 
	    
	    case(i2c_data_in[29:26])
              4'b0001: begin
                 den_ff <= 1'b1;
                 dwe_ff <= 1'b0;
              end              
              4'b0010: begin            
                 den_ff <= 1'b1;    
                 dwe_ff <= 1'b1;
              end              
              default: begin            
                 den_ff <= 1'b0;
                 dwe_ff <= 1'b0;
              end
	    endcase    

	    
	    if (den_ff == 1'b1  && dwe_ff == 1'b1) begin        // write
	       if (addr_ff >= 8'h40 && addr_ff <= 8'h79)
		  dr_sram[addr_ff] <= data_ff;
	    end
	    else if (den_ff == 1'b1 && dwe_ff == 1'b0) begin    // read
	       if (addr_ff >= 64) begin
		  i2c_sda_out_70_tmp <= dr_sram[addr_ff][7:0];
	       	  i2c_sda_out_158_tmp <= dr_sram[addr_ff][15:8];
	       end
	       else if (addr_ff < 64) begin
		  i2c_sda_out_70_tmp <= data_reg[addr_ff][7:0];
	       	  i2c_sda_out_158_tmp <= data_reg[addr_ff][15:8];
               end
	       
	    end 
	 end    
      end        
   end // always@ (posedge i2c_clk or posedge rst_input)


   // clock stretching
   always @(posedge i2c_clk or posedge rst_input) begin
      if(rst_input) begin
	 i2c_sda_setup_sync <= 1'b1;
      end  
      else begin
	 if((i2c_sda_in != i2c_sda_in_sync) && ~i2c_sclk_in) begin
	    i2c_sda_setup_sync <= 1'b0;
	 end
	 else if(i2c_sda_setup_cnt == 15) begin   // i2c_clk predefined by HW as 15
	    i2c_sda_setup_sync <= 1'b1; 
	 end 
      end  
   end
   

   always @(posedge i2c_clk or sda_changing or rst_input) begin
      if (rst_input)
	 i2c_sda_setup_cnt = 0;
      else if (sda_changing)
	 i2c_sda_setup_cnt = 1;
      else if (i2c_sda_setup_sync == 1'b0)
	 i2c_sda_setup_cnt = i2c_sda_setup_cnt + 1;
   end


   
   
   // I2C Data transmit
   always @(posedge i2c_clk) begin

      if(i2c_state == XMIT_DATA && sclk_falling_sync_d3 && ~i2c_start) begin    // as transmitter
	 if (den_ff == 1'b1 && dwe_ff == 1'b0) begin    // read
	    
	    if (byte_cnt == 0) begin
	       i2c_sda_xmit <= i2c_sda_out_70_tmp[7];
	       i2c_sda_out_70_tmp <= i2c_sda_out_70_tmp << 1;
	    end
	    else if (byte_cnt == 1) begin
	       i2c_sda_xmit <= i2c_sda_out_158_tmp[7];
	       i2c_sda_out_158_tmp <= i2c_sda_out_158_tmp << 1;
	    end
	    
         end
      end
   end
      
      
   // sending sda out   
   always @(posedge i2c_clk or posedge rst_input) begin
      if (rst_input) begin
	 i2c_sda_out_tmp <= 1'b1;
      end  
      else begin
	 if ((addr_match && i2c_state == ACK_HEADER) || (i2c_state == ACK_DATA))  // send ACK
	    i2c_sda_out_tmp <= 1'b0;   
	 else if (i2c_state == XMIT_DATA)
	    i2c_sda_out_tmp <= i2c_sda_xmit;
	 else
	    i2c_sda_out_tmp <= 1'b1;  
      end   
   end
   

/////////////////////////////////////////// I2C end /////////////////////////////////////////   
   
// Clock divider, generate  and adcclk

    always @(posedge dclk_in)
      sysclk <= ~sysclk;

   always @(posedge dclk_in) 
	if (curr_clkdiv_sel > 8'b00000010 ) begin
	    if (clk_count >= curr_clkdiv_sel - 1) 
		    clk_count = 0;
        else 
		    clk_count = clk_count + 1;

	    if (clk_count > (curr_clkdiv_sel/2) - 1)
               adcclk_tmp <= 1;
            else
               adcclk_tmp <= 0;
	end 
   else 
             adcclk_tmp <= ~adcclk_tmp;

       assign curr_clkdiv_sel = cfg_reg2[15:8];
       assign sysmone1_en = (cfg_reg2[5]===1 && cfg_reg2[4]===1) ? 0 : 1;
       assign sysmone12_en = (cfg_reg2[5]===1 ) ? 0 : 1;
       assign adcclk_div1 = (curr_clkdiv_sel > 8'b00000010) ? 0 : 1;
       assign adcclk_r = (adcclk_div1) ? ~sysclk : adcclk_tmp;
       assign adcclk = (sysmone1_en) ? adcclk_r : 0;

// end clock divider	
	  
// latch configuration registers
  wire [15:0] cfg_reg0_seq, cfg_reg0_adc;
  reg [15:0] cfg_reg0_seq_tmp5, cfg_reg0_adc_tmp5;
  reg [15:0] cfg_reg0_seq_tmp6, cfg_reg0_adc_tmp6;
  reg [1:0] acq_avg;

   
  assign muxaddr_o = (rst_lock_early) ? 5'b0 : (curr_seq1_0_lat[3:2] != 2'b10 && sysmone12_en == 0 || sysmone12_en == 1) ?  acq_chan_m : 5'b0;

  always @( seq1_0 or adc_s1_flag or curr_seq_m  or cfg_reg0_adc or rst_in) begin

    if (rst_in == 0) begin
       if (seq1_0[3:2] == 2'b11) begin
            acq_chan_m = curr_seq_m[4:0];
      end
      else if (seq1_0 != 4'b0011 && adc_s1_flag == 0) begin
            acq_chan_m = curr_seq_m[4:0];
      end
      else begin
            acq_chan_m = cfg_reg0_adc[4:0];
      end
     end
   end

//CR 675227  always @( seq1_0 or adc_s1_flag or curr_seq or curr_seq2 or cfg_reg0_adc or rst_in) begin
   always @(adc_s1_flag or curr_seq or curr_seq2 or cfg_reg0_adc or rst_in) begin      
      if ((seq1_0 == 4'b0001 && adc_s1_flag == 0) || seq1_0 == 4'b0010 || seq1_0[3:2] == 2'b11) begin
	 acq_acqsel = curr_seq[8];
      end
      else if (seq1_0 == 4'b0011) begin
         acq_acqsel = cfg_reg0_adc[8];
      end
      else begin
         acq_acqsel = 0;
      end
      
      if (rst_in == 0) begin
	 
	 if (seq1_0[3:2] == 2'b11) begin
            acq_avg  = 2'b01;
            acq_chan = curr_seq[5:0];
            acq_b_u = 0;
	 end
	 else if (seq1_0 != 4'b0011 && adc_s1_flag == 0) begin
            acq_avg  = curr_seq[13:12];
            acq_chan = curr_seq[5:0];
            acq_b_u = curr_seq[10];
	 end
	 else begin
            acq_avg  = cfg_reg0_adc[13:12];
            acq_chan = cfg_reg0_adc[5:0];
            acq_b_u = cfg_reg0_adc[10];
	    
	    //CR 675227	  
// CR 764936	    if (seq1_0 == 4'b0001) begin
	    if (seq1_0 == 4'b0001 && acq_e_c == 1'b0) begin
	       halt_adc = halt_adc + 1;
	       
	       if (halt_adc == 2)
		 dr_sram[8'h41][15:12] = 4'b0011;
	       
	    end
	 end
      end
   end

    reg single_chan_conv_end;
    reg [3:0] conv_end_reg_read;
    reg busy_reg_read;
    reg first_after_reset_tmp5;
    reg first_after_reset_tmp6;

    always@(posedge adcclk or posedge rst_in)
        begin
            if(rst_in) conv_end_reg_read <= 4'b0;
            else       conv_end_reg_read <= {conv_end_reg_read[2:0], single_chan_conv_end | conv_end};
        end
        
    always@(posedge DCLK or posedge rst_in)
        begin
                if(rst_in) busy_reg_read <= 1;
                else       busy_reg_read <= ~conv_end_reg_read[2];
        end

// i2c write   
    assign cfg_reg0_adc =  (i2c_stop) ? cfg_reg0 : cfg_reg0_adc_tmp6;   
//    assign cfg_reg0_adc =  cfg_reg0_adc_tmp6; 
    assign cfg_reg0_seq =  cfg_reg0_seq_tmp6;
    assign acq_e_c =  acq_e_c_tmp6;

    always @(negedge busy_out or rst_in)
            if(rst_in) begin
                        cfg_reg0_seq_tmp6 <= 16'b0;
                        cfg_reg0_adc_tmp6 <= 16'b0;
                        acq_e_c_tmp6 <= 0;
                        first_after_reset_tmp6 <= 1;
            end
            else begin
                        repeat(3) @(posedge DCLK);
                        if(first_after_reset_tmp6) begin
                           first_after_reset_tmp6<=0;
                           cfg_reg0_adc_tmp6 <= cfg_reg0;
                           cfg_reg0_seq_tmp6 <= cfg_reg0;
                        end
                        else begin
                           cfg_reg0_adc_tmp6 <= cfg_reg0_seq;
                           cfg_reg0_seq_tmp6 <= cfg_reg0;
                        end
                        acq_e_c_tmp6      <= cfg_reg0[9];
              end

    always @(posedge conv_start or  posedge busy_r_rst or posedge rst_in) 
         if (rst_in ==1)
            busy_r <= 0;
         else if (conv_start && rst_lock == 0)
            busy_r <= 1;
         else if (busy_r_rst)
           busy_r <= 0;
   
    always @(negedge busy_out )
            if (adc_s1_flag == 1)
	      if (curr_seq1_0 == 4'b0001 || curr_seq1_0 == 4'b0011)  // CR 764936
		curr_seq1_0 <= 4'b0011;
	      else
                curr_seq1_0 <= 4'b0000;
            else
                curr_seq1_0 <= seq1_0;

   always @(posedge conv_start or  rst_in ) 
	if (rst_in == 1) begin
	    mn_mux_in <= 0.0;
	    curr_chan <= 6'b0;
	end
	else  begin
        if ((acq_chan == 6'b000011) || (acq_chan >= 6'b010000 && acq_chan <= 6'b011111)) begin
           if (ext_mux == 1) begin
              tmp_v = $bitstoreal(mn_in_diff[ext_mux_chan]);
              mn_mux_in <= tmp_v; 
           end
           else begin
              tmp_v = $bitstoreal(mn_in_diff[acq_chan]);
              mn_mux_in <= tmp_v; 
           end
        end
        else
           mn_mux_in <= $bitstoreal(mn_in_uni[acq_chan]);
  
           tmp_seq1_0 = curr_seq1_0[3:2];

           curr_chan <= acq_chan;
           curr_seq1_0_lat <= curr_seq1_0;

	    
	   if ( acq_chan == 6'b000111  || (acq_chan >= 6'b001001 && acq_chan <= 6'b001111) || acq_chan > 6'b100011)

	     $display("Warning: [Unisim %s-20] The analog channel %x at time %.3f ns is invalid. Instance: %m", MODULE_NAME, acq_chan, $time/1000.0);
	
	    
	   if ((seq1_0 == 4'b0001 && adc_s1_flag == 0) || seq1_0 == 4'b0010 || seq1_0 == 4'b0000 || seq1_0[3:2] == 2'b11) begin
              curr_pj_set <= curr_seq[13:12];
              curr_b_u <=  curr_seq[10];
              curr_e_c <= curr_seq[9];
              curr_acq <= curr_seq[8];
	   end
	   else  begin
              curr_pj_set <= acq_avg;
              curr_b_u <= acq_b_u;
	      curr_e_c <= cfg_reg0[9];
	      curr_acq <= cfg_reg0[8];
	   end

	end // if (rst_in == 0)

    
	
// end latch configuration registers
    
// sequence control

    always @(seq_en )
          seq_en_dly <= #1 seq_en;


    always @(posedge  seq_en_dly) 
    if (seq1_0  == 4'b0001 || seq1_0 == 4'b0010) begin
       seq_num = 0;
       for (si=0; si<= 15; si=si+1) begin
           if (seq_chan_reg1[si] ==1)  begin
                seq_num = seq_num + 1;
                  seq_mem[seq_num] = si;
           end
       end
       for (si=16; si<= 31; si=si+1) begin
           if (seq_chan_reg2[si-16] ==1) begin
                seq_num = seq_num + 1;
                seq_mem[seq_num] = si;
           end
       end
       for (si=32; si<= 35; si=si+1) begin
           if (seq_chan_reg3[si-32] ==1) begin
                seq_num = seq_num + 1;
                seq_mem[seq_num] = si;
           end
       end
    end
    else if (seq1_0  == 4'b0000 || seq1_0[3:2] == 2'b11) begin
      seq_num = 5;
      seq_mem[1] = 0;
      seq_mem[2] = 8;
      seq_mem[3] = 9;
      seq_mem[4] = 10;
      seq_mem[5] = 14;
    end

              
    always @( seq_count  or negedge seq_en_dly) begin
        seq_curr_i = seq_mem[seq_count];
         curr_seq = 16'b0;
        if (seq_curr_i >= 0 && seq_curr_i <= 15) begin
           curr_seq [2:0] =  seq_curr_i[2:0];
           curr_seq [4:3] = 2'b01;
           curr_seq [8] = seq_acq_reg1[seq_curr_i];
           curr_seq [10] = seq_du_reg1[seq_curr_i];

           if (seq1_0 == 4'b0000 ||  seq1_0[3:2] == 2'b11)
              curr_seq [13:12] = 2'b01;
           else if (seq_pj_reg1[seq_curr_i] == 1)
              curr_seq [13:12] = cfg_reg0[13:12];
           else
              curr_seq [13:12] = 2'b00;

           if (seq_curr_i >= 0 && seq_curr_i <=7) 
              curr_seq [4:3] = 2'b01;
           else
              curr_seq [4:3] = 2'b00;
        end
        else if (seq_curr_i >= 16 && seq_curr_i <= 31) begin
           curr_seq [4:0] = seq_curr_i;
           curr_seq [8] = seq_acq_reg2[seq_curr_i - 16];
           curr_seq [10] = seq_du_reg2[seq_curr_i - 16];
           if (seq_pj_reg2[seq_curr_i - 16] == 1)
              curr_seq [13:12] = cfg_reg0[13:12];
           else
              curr_seq [13:12] = 2'b00;
        end // if (seq_curr_i >= 16 && seq_curr_i <= 31)
        else if (seq_curr_i > 31 && seq_curr_i <= 35) begin
           curr_seq [5:0] = seq_curr_i;
           curr_seq [8] = seq_acq_reg3[seq_curr_i - 32];
           curr_seq [10] = seq_du_reg3[seq_curr_i - 32];
           if (seq_pj_reg3[seq_curr_i - 32] == 1)
              curr_seq [13:12] = cfg_reg0[13:12];
           else
              curr_seq [13:12] = 2'b00;
        end
    end


    always @( seq_count_a  or negedge seq_en_dly) begin
        seq_curr_ia = seq_mem[seq_count_a];
         curr_seq_m = 16'b0;
        if (seq_curr_ia >= 0 && seq_curr_ia <= 15) begin
           curr_seq_m [2:0] =  seq_curr_ia[2:0];
           curr_seq_m [4:3] = 2'b01;
           curr_seq_m [8] = seq_acq_reg1[seq_curr_ia];
           curr_seq_m [10] = seq_du_reg1[seq_curr_ia];

           if (seq1_0 == 4'b0000 ||  seq1_0[3:2] == 2'b11)
              curr_seq_m [13:12] = 2'b01;
           else if (seq_pj_reg1[seq_curr_ia] == 1)
              curr_seq_m [13:12] = cfg_reg0[13:12];
           else
              curr_seq_m [13:12] = 2'b00;

           if (seq_curr_ia >= 0 && seq_curr_ia <=7) 
              curr_seq_m [4:3] = 2'b01;
           else
              curr_seq_m [4:3] = 2'b00;
        end
        else if (seq_curr_ia >= 16 && seq_curr_ia <= 31) begin
           curr_seq_m [4:0] = seq_curr_ia;
           curr_seq_m [8] = seq_acq_reg2[seq_curr_ia - 16];
           curr_seq_m [10] = seq_du_reg2[seq_curr_ia - 16];
           if (seq_pj_reg2[seq_curr_ia - 16] == 1)
              curr_seq_m [13:12] = cfg_reg0[13:12];
           else
              curr_seq_m [13:12] = 2'b00;
        end
        else if (seq_curr_ia > 31 && seq_curr_ia <= 35) begin
           curr_seq_m [5:0] = seq_curr_ia;
           curr_seq_m [8] = seq_acq_reg3[seq_curr_ia - 32];
           curr_seq_m [10] = seq_du_reg3[seq_curr_ia - 32];
           if (seq_pj_reg3[seq_curr_ia - 32] == 1)
              curr_seq_m [13:12] = cfg_reg0[13:12];
           else
              curr_seq_m [13:12] = 2'b00;
	end
    end // always @ ( seq_count_a  or negedge seq_en_dly)
   

   always @(posedge busy_out or posedge rst_in )
  	if (rst_in == 1 || rst_lock == 1 ) begin
	       seq_count_a <= 1;
	end
	else  begin
	    if ( curr_seq1_0_lat == 4'b0011  )
		    seq_count_a <= 1;
	    else  begin
	       if (seq_count_a >= 37 || seq_count_a >= seq_num)
                 seq_count_a <= 1;
           else
		           seq_count_a <= seq_count_a +1;
        end
    end
		

   always @(posedge adcclk or posedge rst_in) 
	if (rst_in == 1 ) begin
	    seq_count <= 1;
	    seq_count2 <= 1;
	    eos_en <= 0;
	end
	else  begin

	   if ((seq_count == seq_num  ) && (adc_state == S3_ST && next_state == S5_ST) && (curr_seq1_0_lat != 4'b0011) && rst_lock == 0)
		    eos_tmp_en <= 1;
	    else
		    eos_tmp_en <= 0;

      if (eos_tmp_en == 1 && seq_status_avg == 0 ) // delay by 1 adcclk
          eos_en <= 1;
      else
          eos_en <= 0;


	    if (eos_tmp_en == 1 || curr_seq1_0_lat == 4'b0011  )
		    seq_count <= 1;
	    else if (seq_count_en == 1) begin
	       if (seq_count >= 37)
                 seq_count <= 1;
           else
		           seq_count <= seq_count +1;
        end
		
	end // else: !if(rst_in == 1)
    
// end sequence control
    
// Acquisition
       reg first_acq;
       reg shorten_acq;
       wire busy_out_dly;

       assign #10 busy_out_dly = busy_out;

        always @(adc_state or posedge rst_in or first_acq) 
        begin
                if(rst_in) shorten_acq = 0;
                else if(busy_out_dly==0 && adc_state==S2_ST && first_acq==1)
                        shorten_acq = 1;
                else
                        shorten_acq = 0;
        end


   always @(posedge adcclk or posedge rst_in)
//	if (rst_in == 1) begin
	if (rst_in == 1 || rst_lock == 1) begin
	    acq_count <= 1;
            first_acq <=1;
        end
	else  begin 
	    if (adc_state == S2_ST && rst_lock == 0 && (acq_e_c==0)) begin
                first_acq <= 0;

		if (acq_acqsel == 1) begin
		    if (acq_count <= 11)
			acq_count <= acq_count + 1 + shorten_acq;
		end
		else begin
		    if (acq_count <= 4)
			acq_count <= acq_count + 1 + shorten_acq;
		end // else: !if(acq_acqsel == 1)
             
		if (next_state == S3_ST)
		    if ((acq_acqsel == 1 && acq_count < 10) || (acq_acqsel == 0 && acq_count < 4))
			$display ("Warning: [Unisim %s-21] Acquisition time is not long enough at time %t. Instance: %m", MODULE_NAME, $time);
	    end // if (adc_state == S2_ST)
	    else
		acq_count <=  (first_acq) ? 1 : 0;

	end // if (rst_in == 0)

// continuous mode
   reg  conv_start_cont;
   wire reset_conv_start;
   wire conv_start_sel;

   always @(adc_state or acq_acqsel or acq_count)
        if (adc_state == S2_ST) begin
        if (rst_lock == 0) begin
//CR 800173                if (    ((seq_reset_flag == 0 || (seq_reset_flag == 1 && curr_clkdiv_sel > 8'h03))
//             && ( (acq_acqsel == 1 && acq_count > 10) || (acq_acqsel == 0 && acq_count > 4)) ) )
	   if ((acq_acqsel == 1 && acq_count > 10) || (acq_acqsel == 0 && acq_count > 4))
                    conv_start_cont = 1;
                else
                    conv_start_cont = 0;
        end
        end // if (adc_state == S2_ST)
        else
            conv_start_cont = 0;

        assign conv_start_sel = (acq_e_c) ? convst_in : conv_start_cont;

        assign reset_conv_start = rst_in | (conv_count==2);

        always@(posedge conv_start_sel or posedge reset_conv_start)
        begin
                if(reset_conv_start) conv_start <= 0;
                else                 conv_start <= 1;
        end


// end acquisition    
    
// Conversion
   always @(adc_state or next_state or curr_chan  or mn_mux_in or curr_b_u) begin
      
	if ((adc_state == S3_ST && next_state == S5_ST) ||  adc_state == S5_ST) begin
	    if (curr_chan == 0) begin    // temperature conversion
		    adc_temp_result = (mn_mux_in + 273.15) * 0.001984226*65536;
		    if (adc_temp_result >= 65535.0)
			conv_result_int = 65535;
		    else if (adc_temp_result < 0.0)
			conv_result_int = 0;
		    else begin
			conv_result_int = $rtoi(adc_temp_result);
			if (adc_temp_result - conv_result_int > 0.9999)
			    conv_result_int = conv_result_int + 1;
		    end
	    end
	    else if (curr_chan == 1 || curr_chan == 2 || curr_chan ==6 ||
                     curr_chan == 13 || curr_chan == 14 || curr_chan ==  15 || 
		     (curr_chan >= 32 && curr_chan <= 35)) begin     // internal power conversion
		    adc_intpwr_result = mn_mux_in * 65536.0 / 3.0;
		    if (adc_intpwr_result >= 65535.0)
			conv_result_int = 65535;
		    else if (adc_intpwr_result < 0.0)
			conv_result_int = 0;
		    else begin
			conv_result_int = $rtoi(adc_intpwr_result);
			if (adc_intpwr_result - conv_result_int > 0.9999)
			    conv_result_int = conv_result_int + 1;
		    end
	    end
	    else if (curr_chan == 3 || (curr_chan >=16 && curr_chan <= 31)) begin

                    adc_ext_result =  (mn_mux_in) * 65536.0;
		        if (curr_b_u == 1) begin
                        if (adc_ext_result > 32767.0)
                             conv_result_int = 32767;
                        else if (adc_ext_result < -32768.0)
                             conv_result_int = -32768;
                        else begin
                             conv_result_int = $rtoi(adc_ext_result);
                             if (adc_ext_result - conv_result_int > 0.9999)
                                conv_result_int = conv_result_int + 1;
                        end
                    end
                    else begin
                       if (adc_ext_result > 65535.0)
                             conv_result_int = 65535;
                        else if (adc_ext_result < 0.0)
                             conv_result_int = 0;
                        else begin
                             conv_result_int = $rtoi(adc_ext_result);
                             if (adc_ext_result - conv_result_int > 0.9999)
                                conv_result_int = conv_result_int + 1;

			end
		    end
            end
            else begin
                conv_result_int = 0;
            end
	end 

        conv_result = conv_result_int;
	
    end // always @ ( adc_state or curr_chan or mn_mux_in, curr_b_u)

    
    reg busy_r_rst_done;
    
   always @(posedge adcclk or  posedge rst_in) 
	if (rst_in == 1) begin
	    conv_count <= 6;
	    conv_end <= 0;
	    seq_status_avg <= 0;
                busy_r_rst <= 0;        
                busy_r_rst_done <= 0;
	    for (i = 0; i <=31; i = i +1) begin
		    conv_pj_count[i] <= 0;     // array of integer
       end
            single_chan_conv_end <= 0;
	end
	else  begin
               if(adc_state == S2_ST)
                begin
                        if(busy_r_rst_done == 0) busy_r_rst <= 1;
                else                             busy_r_rst <= 0;
                        busy_r_rst_done <= 1;
                end

	    if (adc_state == S2_ST && conv_start == 1) begin
		         conv_count <= 0;
		         conv_end <= 0;
	    end
	    else if (adc_state == S3_ST ) begin
                busy_r_rst_done <= 0;
                
		conv_count = conv_count + 1;
               
		if ((curr_chan != 5'b01000 ) && (conv_count == conv_time ) ||
              (curr_chan == 5'b01000 ) && (conv_count == conv_time_cal_1 ) && (first_cal_chan==1)
              || (curr_chan == 5'b01000 ) && (conv_count == conv_time_cal) && (first_cal_chan == 0))
		    conv_end <= 1;
		else
		    conv_end <= 0;
	    end
	    else begin
		conv_end <= 0;
		conv_count <= 0;
	    end
                // jmcgrath - to model the behaviour correctly when a cal chanel is being converted
                // an signal to signify the conversion has ended must be produced - this is for single channel mode
                single_chan_conv_end <= 0;
                if( (conv_count == conv_time) || (conv_count == 44))
                        single_chan_conv_end <= 1;


	    if (adc_state == S3_ST && next_state == S5_ST && rst_lock == 0) begin
		case (curr_pj_set)
		    2'b00 : begin
			        eoc_en <= 1;
			        conv_pj_count[curr_chan] <= 0;
			         end
		    2'b01 : if (conv_pj_count[curr_chan] == 15) begin
			            eoc_en <= 1;
			            conv_pj_count[curr_chan] <= 0;
				         seq_status_avg <= seq_status_avg - 1;
				     end
			        else begin
				       eoc_en <= 0;
				       if (conv_pj_count[curr_chan] == 0)
					      seq_status_avg <= seq_status_avg + 1;
				    
			          conv_pj_count[curr_chan] <= conv_pj_count[curr_chan] + 1;
				      end
		    2'b10 : if (conv_pj_count[curr_chan] == 63) begin
			            eoc_en <= 1;
			            conv_pj_count[curr_chan] <= 0;
				         seq_status_avg <= seq_status_avg - 1;
				     end
			        else begin
				        eoc_en <= 0;
				        if (conv_pj_count[curr_chan] == 0)
					        seq_status_avg <= seq_status_avg + 1;
				    
				        conv_pj_count[curr_chan] <= conv_pj_count[curr_chan] + 1;
				    end
		    2'b11 : if (conv_pj_count[curr_chan] == 255) begin
			            eoc_en <= 1;
			            conv_pj_count[curr_chan] <= 0;
				         seq_status_avg <= seq_status_avg - 1;
				     end
			        else begin
				         eoc_en <= 0;
			            if (conv_pj_count[curr_chan] == 0)
					        seq_status_avg <= seq_status_avg + 1;
				    
				         conv_pj_count[curr_chan] <= conv_pj_count[curr_chan] + 1;
				     end
		    default : eoc_en <= 0;
		 endcase // case(curr_pj_set)

	    end // if (adc_state == S3_ST && next_state == S5_ST)
	    else  begin
		   eoc_en <= 0;
	    end
	    
	   if (adc_state == S5_ST) begin
	      conv_result_reg <= conv_result;
	   end
	end // if (rst_in == 0)
    
// end conversion

    
// average
   always @(adc_state or conv_acc[curr_chan]) 
	if (adc_state == S5_ST ) 
	    // no signed or unsigned differences for bit vector conv_acc_vec
	    conv_acc_vec = conv_acc[curr_chan];
	else
	    conv_acc_vec = 24'b00000000000000000000;


    always @(posedge adcclk or posedge rst_in) 
	if (rst_in == 1) begin
	    for (j = 0; j <= 31; j = j + 1) begin
		    conv_acc[j] <= 0;
	    end
	   conv_acc_result <= 16'b0000000000000000;
	end
	else  begin
	    if (adc_state == S3_ST && next_state == S5_ST) begin
		    if (curr_pj_set != 2'b00 && rst_lock != 1)
             conv_acc[curr_chan] <= conv_acc[curr_chan] + conv_result_int;
		    else
		       conv_acc[curr_chan] <= 0;

	    end // if (adc_state == S3_ST && next_state == S5_ST)
	    else if (eoc_en == 1) begin
		    case (curr_pj_set)
                    2'b00 : conv_acc_result <= 16'b0000000000000000;
                    2'b01 : conv_acc_result <= conv_acc_vec[19:4];
                    2'b10 : conv_acc_result <= conv_acc_vec[21:6];
                    2'b11 : conv_acc_result <= conv_acc_vec[23:8];
		    endcase 
		    conv_acc[curr_chan] <= 0;
	    end 
	end // if (rst_in == 0)
        
// end average    
		
// single sequence
    always @(posedge adcclk or posedge rst_in) 
	if (rst_in == 1)
	    adc_s1_flag <= 0;
	else  
	    if (adc_state == S6_ST)
		adc_s1_flag <= 1;

//  end state    

    always @(posedge adcclk or posedge rst_in)
	if (rst_in == 1) begin
	    seq_count_en <= 0;
	    eos_out_tmp <= 0;
	    eoc_out_tmp <= 0;
	end 
	else  begin
	    if ((adc_state == S3_ST && next_state == S5_ST) && (curr_seq1_0_lat != 4'b0011) && (rst_lock == 0))
		    seq_count_en <= 1;
	    else
		    seq_count_en <= 0;
	    
       if (rst_lock == 0) begin
	         eos_out_tmp <= eos_en;
	         eoc_en_delay <= eoc_en;
	         eoc_out_tmp <= eoc_en_delay;
       end 
       else begin
                 eos_out_tmp <= 0;
                 eoc_en_delay <= 0;
                 eoc_out_tmp <= 0;
       end
    end


   always @(eoc_out)
     eoc_out_t <= #1 eoc_out;


    always @(posedge eoc_out_t or posedge rst_in_not_seq) 
	 if (rst_in_not_seq == 1) begin
	    for (k = 32; k <= 39; k = k + 1)
		   if (k >= 36)
		    data_reg[k] <= 16'b1111111111111111;
		   else
		    data_reg[k] <= 16'b0000000000000000;

       for (k = 40; k <= 42; k = k + 1)
          data_reg[k] <= 16'b0000000000000000;

       for (k = 44; k <= 46; k = k + 1)
          data_reg[k] <= 16'b1111111111111111;
	 end 
	 else 
	 if ( rst_lock == 0) begin
      if (eoc_out == 1) begin
	 if ((curr_chan_lat >= 0 && curr_chan_lat <= 3)  || (curr_chan_lat == 6) ||
	     (curr_chan_lat >= 13 && curr_chan_lat <= 31)) begin
	    if (curr_pj_set == 2'b00)
	      data_reg[curr_chan_lat] <= conv_result_reg;
	    else
	      data_reg[curr_chan_lat] <= conv_acc_result;
	 end
	 else if (curr_chan_lat >= 32 && curr_chan_lat <= 35) begin
	    if (curr_pj_set == 2'b00)
	      dr_sram[curr_chan_lat + 96] <= conv_result_reg;
	    else
	      dr_sram[curr_chan_lat + 96] <= conv_acc_result;
	 end

	if (curr_chan_lat == 4)
            data_reg[curr_chan_lat] <= 16'hD555;
	if (curr_chan_lat == 5)
            data_reg[curr_chan_lat] <= 16'h0000;
               
	if (curr_chan_lat == 0 || curr_chan_lat == 1 || curr_chan_lat == 2) begin
	   if (curr_pj_set == 2'b00) begin
	      if (conv_result_reg > data_reg[32 + curr_chan_lat])
		data_reg[32 + curr_chan_lat] <= conv_result_reg;
	      if (conv_result_reg < data_reg[36 + curr_chan_lat])
		data_reg[36 + curr_chan_lat] <= conv_result_reg;
		  end
	   else begin
	      if (conv_acc_result > data_reg[32 + curr_chan_lat])
		data_reg[32 + curr_chan_lat] <= conv_acc_result;
	      if (conv_acc_result < data_reg[36 + curr_chan_lat])
		data_reg[36 + curr_chan_lat] <= conv_acc_result;
	   end	
	end

	if (curr_chan_lat == 6) begin
           if (curr_pj_set == 2'b00) begin
              if (conv_result_reg > data_reg[35])
		data_reg[35] <= conv_result_reg;
              if (conv_result_reg < data_reg[39])
		data_reg[39] <= conv_result_reg;
           end
           else begin
              if (conv_acc_result > data_reg[35])
		data_reg[35] <= conv_acc_result;
              if (conv_acc_result < data_reg[39])
		data_reg[39] <= conv_acc_result;
           end
	end
	if (curr_chan_lat == 13) begin
           if (curr_pj_set == 2'b00) begin
              if (conv_result_reg < data_reg[40])
		data_reg[40] <= conv_result_reg;
              if (conv_result_reg > data_reg[44])
		data_reg[44] <= conv_result_reg;
           end
           else begin
              if (conv_acc_result < data_reg[40])
		data_reg[40] <= conv_acc_result;
              if (conv_acc_result > data_reg[44])
		data_reg[44] <= conv_acc_result;
           end
	end
	if (curr_chan_lat == 14) begin
           if (curr_pj_set == 2'b00) begin
              if (conv_result_reg < data_reg[41])
		data_reg[41] <= conv_result_reg;
              if (conv_result_reg > data_reg[45])
		data_reg[45] <= conv_result_reg;
           end
           else begin
              if (conv_acc_result < data_reg[41])
		data_reg[41] <= conv_acc_result;
              if (conv_acc_result > data_reg[45])
		data_reg[45] <= conv_acc_result;
           end
	end
	if (curr_chan_lat == 15) begin
           if (curr_pj_set == 2'b00) begin
              if (conv_result_reg < data_reg[42])
		data_reg[42] <= conv_result_reg;
              if (conv_result_reg > data_reg[46])
		data_reg[46] <= conv_result_reg;
           end
           else begin
              if (conv_acc_result < data_reg[42])
		data_reg[42] <= conv_acc_result;
              if (conv_acc_result > data_reg[46])
		data_reg[46] <= conv_acc_result;
           end
	end

	if (curr_chan_lat == 32) begin   //Vuser0
           if (curr_pj_set == 2'b00) begin
              if (conv_result_reg < dr_sram[168])
		dr_sram[168] <= conv_result_reg;
              if (conv_result_reg > dr_sram[160])
		data_reg[160] <= conv_result_reg;
           end
           else begin
              if (conv_acc_result < dr_sram[168])
		dr_sram[168] <= conv_acc_result;
              if (conv_acc_result > dr_sram[160])
		dr_sram[160] <= conv_acc_result;
           end
	end
	 
	if (curr_chan_lat == 33) begin   //Vuser1
           if (curr_pj_set == 2'b00) begin
              if (conv_result_reg < dr_sram[169])
		dr_sram[169] <= conv_result_reg;
              if (conv_result_reg > dr_sram[161])
		data_reg[161] <= conv_result_reg;
           end
           else begin
              if (conv_acc_result < dr_sram[169])
		dr_sram[169] <= conv_acc_result;
              if (conv_acc_result > dr_sram[161])
		dr_sram[161] <= conv_acc_result;
           end
	end

	if (curr_chan_lat == 34) begin   //Vuser2
           if (curr_pj_set == 2'b00) begin
              if (conv_result_reg < dr_sram[170])
		dr_sram[170] <= conv_result_reg;
              if (conv_result_reg > dr_sram[162])
		data_reg[162] <= conv_result_reg;
           end
           else begin
              if (conv_acc_result < dr_sram[170])
		dr_sram[170] <= conv_acc_result;
              if (conv_acc_result > dr_sram[162])
		dr_sram[162] <= conv_acc_result;
           end
	end

	if (curr_chan_lat == 35) begin   //Vuser3
           if (curr_pj_set == 2'b00) begin
              if (conv_result_reg < dr_sram[171])
		dr_sram[171] <= conv_result_reg;
              if (conv_result_reg > dr_sram[163])
		data_reg[163] <= conv_result_reg;
           end
           else begin
              if (conv_acc_result < dr_sram[171])
		dr_sram[171] <= conv_acc_result;
              if (conv_acc_result > dr_sram[163])
		dr_sram[163] <= conv_acc_result;
           end
	end

     end // if (eoc_out == 1)

   end // if ( rst_lock == 0)
   

   reg [15:0] data_written;

   always @(negedge busy_r or posedge rst_in_not_seq)
        if (rst_in_not_seq)
            data_written <= 16'b0;
        else begin
             if (curr_pj_set == 2'b00) 
                  data_written <= conv_result_reg;
             else
                  data_written <= conv_acc_result;
        end


    reg [4:0] op_count=15;
    reg       busy_out_sync;
    wire      busy_out_low_edge;
    
// eos and eoc

    always @( posedge eoc_out_tmp or posedge eoc_out or posedge rst_in)
           if (rst_in ==1)
              eoc_out_tmp1 <= 0;
           else if ( eoc_out ==1)
               eoc_out_tmp1 <= 0;
           else if ( eoc_out_tmp == 1) begin
               if (curr_chan != 5'b01000 && ( sysmone12_en == 1 || (curr_seq1_0[3:2] != 2'b10 && sysmone12_en == 0)))    
                  eoc_out_tmp1 <= 1; 
               else
                  eoc_out_tmp1 <= 0;
           end

    always @( posedge eos_out_tmp or posedge eos_out or posedge rst_in)
           if (rst_in ==1)
              eos_out_tmp1 <= 0;
           else if ( eos_out ==1)
               eos_out_tmp1 <= 0;
           else if ( eos_out_tmp == 1 &&  ( sysmone12_en == 1 || (curr_seq1_0[3:2] != 2'b10 && sysmone12_en == 0)))    
               eos_out_tmp1 <= 1; 

    assign busy_out_low_edge = (busy_out==0 && busy_out_sync==1) ? 1 : 0;

    always @( posedge dclk_in or posedge rst_in)
    begin
               
         if (rst_in) begin
            op_count <= 15;
            busy_out_sync <= 0;
         end

         drp_update   <= 0;
         alarm_update <= 0;
         eoc_out      <= 0;
         eos_out      <= 0;
         if(rst_in==0)
           begin
              busy_out_sync <= busy_out;
              if(op_count==3)
                drp_update <= 1;
	      if(op_count==5 && eoc_out_tmp1==1)
                alarm_update <=1;
              if(op_count== 16)
                 eoc_out <= eoc_out_tmp1;
              if(op_count==16)
                eos_out <= eos_out_tmp1;
              if (busy_out_low_edge==1 )
                op_count <= 0;
              else if(op_count < 22)
		op_count <= op_count +1;
           end
    end

// end eos and eoc

// alarm

    always @( posedge alarm_update or posedge rst_in_not_seq ) 
     if (rst_in_not_seq == 1) begin
        ot_out_reg <= 0;
        alarm_out_reg <= 8'b0;
     end
     else 
       if (rst_lock == 0) begin
        if (curr_chan_lat == 0) begin
	      if (data_written >= ot_limit_reg)
		      ot_out_reg <= 1;
	      else if (data_written < dr_sram[8'h57])  
                ot_out_reg <= 0;

            if (data_written > dr_sram[8'h50])  
	             alarm_out_reg[0] <= 1;
	           else if (data_written < dr_sram[8'h54])
	             alarm_out_reg[0] <= 0;
          end
	
         if (curr_chan_lat == 1) begin
	         if (data_written > dr_sram[8'h51] || data_written < dr_sram[8'h55])
		          alarm_out_reg[1] <= 1;
	         else
		          alarm_out_reg[1] <= 0;
          end

          if (curr_chan_lat == 2) begin
	          if (data_written > dr_sram[8'h52] || data_written < dr_sram[8'h56])
		          alarm_out_reg[2] <= 1;
	             else
		          alarm_out_reg[2] <= 0;
          end

          if (curr_chan_lat == 6) begin
             if (data_written > dr_sram[8'h58] || data_written < dr_sram[8'h5C])
                alarm_out_reg[3] <= 1;
             else
                alarm_out_reg[3] <= 0;
          end
          if (curr_chan_lat == 5'b01101) begin
             if (data_written > dr_sram[8'h59] || data_written < dr_sram[8'h5D])
                alarm_out_reg[4] <= 1;
             else
                alarm_out_reg[4] <= 0;
          end
          if (curr_chan_lat == 5'b01110) begin
             if (data_written > dr_sram[8'h5A] || data_written < dr_sram[8'h5E])
                alarm_out_reg[5] <= 1;
             else
                alarm_out_reg[5] <= 0;
          end
          if (curr_chan_lat == 5'b01111) begin
             if (data_written > dr_sram[8'h5B] || data_written < dr_sram[8'h5F])
                alarm_out_reg[6] <= 1;
             else
                alarm_out_reg[6] <= 0;
          end
          if (curr_chan_lat == 32) begin
             if (data_written > dr_sram[8'h60] || data_written < dr_sram[8'h68])
                alarm_out_reg[8] <= 1;
             else
                alarm_out_reg[8] <= 0;
          end
	  if (curr_chan_lat == 33) begin
             if (data_written > dr_sram[8'h61] || data_written < dr_sram[8'h69])
                alarm_out_reg[9] <= 1;
             else
                alarm_out_reg[9] <= 0;
          end
	  if (curr_chan_lat == 34) begin
             if (data_written > dr_sram[8'h62] || data_written < dr_sram[8'h6A])
                alarm_out_reg[10] <= 1;
             else
                alarm_out_reg[10] <= 0;
          end
	  if (curr_chan_lat == 35) begin
             if (data_written > dr_sram[8'h63] || data_written < dr_sram[8'h6B])
                alarm_out_reg[11] <= 1;
             else
                alarm_out_reg[11] <= 0;
          end
 
    end // always 

    always @(ot_out_reg or ot_en or alarm_out_reg or alarm_en)
       begin
          ot_out = ot_out_reg & ot_en;
          alarm_out[6:0] = alarm_out_reg[6:0] & alarm_en[6:0];
	  alarm_out[11:8] = alarm_out_reg[11:8] & alarm_en[11:8];
          alarm_out[7] = |alarm_out[6:0];
	  alarm_out[15] = |alarm_out[14:8];
      end

// end alarm

//*** Timing_Checks_Start_here

    always @(notifier) begin
	    alarm_out_reg = 16'bx;
	    ot_out = 1'bx;
	    busy_out = 1'bx;
	    eoc_out = 1'bx;
	    eos_out = 1'bx;
	    curr_chan = 5'bx;
	    drdy_out = 1'bx;
	    do_out = 16'bx;
    end 
    
    always @(notifier_do) begin
	     drdy_out = 1'bx;
	     do_out = 16'bx;
    end
    
specify

    (DCLK => ALM[0]) = (100:100:100, 100:100:100);
    (DCLK => ALM[10]) = (100:100:100, 100:100:100);
    (DCLK => ALM[11]) = (100:100:100, 100:100:100);
    (DCLK => ALM[12]) = (100:100:100, 100:100:100);
    (DCLK => ALM[13]) = (100:100:100, 100:100:100);
    (DCLK => ALM[15]) = (100:100:100, 100:100:100);
    (DCLK => ALM[1]) = (100:100:100, 100:100:100);
    (DCLK => ALM[2]) = (100:100:100, 100:100:100);
    (DCLK => ALM[3]) = (100:100:100, 100:100:100);
    (DCLK => ALM[4]) = (100:100:100, 100:100:100);
    (DCLK => ALM[5]) = (100:100:100, 100:100:100);
    (DCLK => ALM[6]) = (100:100:100, 100:100:100);
    (DCLK => ALM[7]) = (100:100:100, 100:100:100);
    (DCLK => ALM[8]) = (100:100:100, 100:100:100);
    (DCLK => ALM[9]) = (100:100:100, 100:100:100);
    (DCLK => BUSY) = (100:100:100, 100:100:100);
    (DCLK => CHANNEL[0]) = (100:100:100, 100:100:100);
    (DCLK => CHANNEL[1]) = (100:100:100, 100:100:100);
    (DCLK => CHANNEL[2]) = (100:100:100, 100:100:100);
    (DCLK => CHANNEL[3]) = (100:100:100, 100:100:100);
    (DCLK => CHANNEL[4]) = (100:100:100, 100:100:100);
    (DCLK => CHANNEL[5]) = (100:100:100, 100:100:100);
    (DCLK => DO[0]) = (100:100:100, 100:100:100);
    (DCLK => DO[10]) = (100:100:100, 100:100:100);
    (DCLK => DO[11]) = (100:100:100, 100:100:100);
    (DCLK => DO[12]) = (100:100:100, 100:100:100);
    (DCLK => DO[13]) = (100:100:100, 100:100:100);
    (DCLK => DO[14]) = (100:100:100, 100:100:100);
    (DCLK => DO[15]) = (100:100:100, 100:100:100);
    (DCLK => DO[1]) = (100:100:100, 100:100:100);
    (DCLK => DO[2]) = (100:100:100, 100:100:100);
    (DCLK => DO[3]) = (100:100:100, 100:100:100);
    (DCLK => DO[4]) = (100:100:100, 100:100:100);
    (DCLK => DO[5]) = (100:100:100, 100:100:100);
    (DCLK => DO[6]) = (100:100:100, 100:100:100);
    (DCLK => DO[7]) = (100:100:100, 100:100:100);
    (DCLK => DO[8]) = (100:100:100, 100:100:100);
    (DCLK => DO[9]) = (100:100:100, 100:100:100);
    (DCLK => DRDY) = (100:100:100, 100:100:100);
    (DCLK => EOC) = (100:100:100, 100:100:100);
    (DCLK => EOS) = (100:100:100, 100:100:100);
    (DCLK => JTAGBUSY) = (100:100:100, 100:100:100);
    (DCLK => JTAGLOCKED) = (100:100:100, 100:100:100);
    (DCLK => JTAGMODIFIED) = (100:100:100, 100:100:100);
    (DCLK => MUXADDR[0]) = (100:100:100, 100:100:100);
    (DCLK => MUXADDR[1]) = (100:100:100, 100:100:100);
    (DCLK => MUXADDR[2]) = (100:100:100, 100:100:100);
    (DCLK => MUXADDR[3]) = (100:100:100, 100:100:100);
    (DCLK => MUXADDR[4]) = (100:100:100, 100:100:100);
    (DCLK => OT) = (100:100:100, 100:100:100);
   
  `ifdef XIL_TIMING

        $recrem ( negedge RESET, negedge DCLK, 0:0:0, 0:0:0, notifier,,, RESET_dly, DCLK_dly);
        $recrem ( negedge RESET, posedge DCLK, 0:0:0, 0:0:0, notifier,,, RESET_dly, DCLK_dly);
        $recrem ( posedge RESET, negedge DCLK, 0:0:0, 0:0:0, notifier,,, RESET_dly, DCLK_dly);
        $recrem ( posedge RESET, posedge DCLK, 0:0:0, 0:0:0, notifier,,, RESET_dly, DCLK_dly);
        $period (posedge CONVST, 0:0:0, notifier);
        $period (posedge CONVSTCLK, 0:0:0, notifier);
        $period (posedge DCLK, 0:0:0, notifier);
        $period (negedge CONVST, 0:0:0, notifier);
        $period (negedge CONVSTCLK, 0:0:0, notifier);
        $period (negedge DCLK, 0:0:0, notifier);
        $width (negedge CONVSTCLK, 0:0:0, 0, notifier);
        $width (negedge DCLK, 0:0:0, 0, notifier);
        $width (posedge CONVSTCLK, 0:0:0, 0, notifier);
        $width (posedge DCLK, 0:0:0, 0, notifier);
        $setuphold (posedge DCLK, negedge DADDR[0] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[0]);
        $setuphold (posedge DCLK, negedge DADDR[1] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[1]);
        $setuphold (posedge DCLK, negedge DADDR[2] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[2]);
        $setuphold (posedge DCLK, negedge DADDR[3] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[3]);
        $setuphold (posedge DCLK, negedge DADDR[4] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[4]);
        $setuphold (posedge DCLK, negedge DADDR[5] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[5]);
        $setuphold (posedge DCLK, negedge DADDR[6] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[6]);
        $setuphold (posedge DCLK, negedge DADDR[7] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[7]);   
        $setuphold (posedge DCLK, negedge DEN &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DEN_dly);
        $setuphold (posedge DCLK, negedge DI[0] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[0]);
        $setuphold (posedge DCLK, negedge DI[1] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[1]);
        $setuphold (posedge DCLK, negedge DI[2] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[2]);
        $setuphold (posedge DCLK, negedge DI[3] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[3]);
        $setuphold (posedge DCLK, negedge DI[4] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[4]);
        $setuphold (posedge DCLK, negedge DI[5] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[5]);
        $setuphold (posedge DCLK, negedge DI[6] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[6]);
        $setuphold (posedge DCLK, negedge DI[7] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[7]);
        $setuphold (posedge DCLK, negedge DI[8] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[8]);
        $setuphold (posedge DCLK, negedge DI[9] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[9]);
        $setuphold (posedge DCLK, negedge DI[10] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[10]);
        $setuphold (posedge DCLK, negedge DI[11] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[11]);
        $setuphold (posedge DCLK, negedge DI[12] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[12]);
        $setuphold (posedge DCLK, negedge DI[13] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[13]);
        $setuphold (posedge DCLK, negedge DI[14] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[14]);   
        $setuphold (posedge DCLK, negedge DI[15] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[15]);      
        $setuphold (posedge DCLK, negedge DWE &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DWE_dly);
        $setuphold (posedge DCLK, posedge DADDR[0] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[0]);
        $setuphold (posedge DCLK, posedge DADDR[1] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[1]);
        $setuphold (posedge DCLK, posedge DADDR[2] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[2]);
        $setuphold (posedge DCLK, posedge DADDR[3] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[3]);
        $setuphold (posedge DCLK, posedge DADDR[4] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[4]);
        $setuphold (posedge DCLK, posedge DADDR[5] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[5]);
        $setuphold (posedge DCLK, posedge DADDR[6] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[6]);
        $setuphold (posedge DCLK, posedge DADDR[7] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[7]);   
        $setuphold (posedge DCLK, posedge DEN &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DEN_dly);
        $setuphold (posedge DCLK, posedge DI[0] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[0]);
        $setuphold (posedge DCLK, posedge DI[1] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[1]);
        $setuphold (posedge DCLK, posedge DI[2] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[2]);
        $setuphold (posedge DCLK, posedge DI[3] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[3]);
        $setuphold (posedge DCLK, posedge DI[4] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[4]);
        $setuphold (posedge DCLK, posedge DI[5] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[5]);
        $setuphold (posedge DCLK, posedge DI[6] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[6]);
        $setuphold (posedge DCLK, posedge DI[7] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[7]);
        $setuphold (posedge DCLK, posedge DI[8] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[8]);
        $setuphold (posedge DCLK, posedge DI[9] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[9]);
        $setuphold (posedge DCLK, posedge DI[10] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[10]);
        $setuphold (posedge DCLK, posedge DI[11] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[11]);
        $setuphold (posedge DCLK, posedge DI[12] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[12]);
        $setuphold (posedge DCLK, posedge DI[13] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[13]);
        $setuphold (posedge DCLK, posedge DI[14] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[14]);   
        $setuphold (posedge DCLK, posedge DI[15] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[15]);      
        $setuphold (posedge DCLK, posedge DWE &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DWE_dly);
        $setuphold (negedge DCLK, negedge DADDR[0] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[0]);
        $setuphold (negedge DCLK, negedge DADDR[1] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[1]);
        $setuphold (negedge DCLK, negedge DADDR[2] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[2]);
        $setuphold (negedge DCLK, negedge DADDR[3] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[3]);
        $setuphold (negedge DCLK, negedge DADDR[4] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[4]);
        $setuphold (negedge DCLK, negedge DADDR[5] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[5]);
        $setuphold (negedge DCLK, negedge DADDR[6] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[6]);
        $setuphold (negedge DCLK, negedge DADDR[7] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[7]);
   
        $setuphold (negedge DCLK, negedge DEN &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DEN_dly);
        $setuphold (negedge DCLK, negedge DI[0] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[0]);
        $setuphold (negedge DCLK, negedge DI[1] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[1]);
        $setuphold (negedge DCLK, negedge DI[2] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[2]);
        $setuphold (negedge DCLK, negedge DI[3] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[3]);
        $setuphold (negedge DCLK, negedge DI[4] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[4]);
        $setuphold (negedge DCLK, negedge DI[5] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[5]);
        $setuphold (negedge DCLK, negedge DI[6] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[6]);
        $setuphold (negedge DCLK, negedge DI[7] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[7]);
        $setuphold (negedge DCLK, negedge DI[8] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[8]);
        $setuphold (negedge DCLK, negedge DI[9] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[9]);
        $setuphold (negedge DCLK, negedge DI[10] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[10]);
        $setuphold (negedge DCLK, negedge DI[11] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[11]);
        $setuphold (negedge DCLK, negedge DI[12] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[12]);
        $setuphold (negedge DCLK, negedge DI[13] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[13]);
        $setuphold (negedge DCLK, negedge DI[14] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[14]);   
        $setuphold (negedge DCLK, negedge DI[15] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[15]);
        $setuphold (negedge DCLK, negedge DWE &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DWE_dly);
        $setuphold (negedge DCLK, posedge DADDR[0] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[0]);
        $setuphold (negedge DCLK, posedge DADDR[1] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[1]);
        $setuphold (negedge DCLK, posedge DADDR[2] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[2]);
        $setuphold (negedge DCLK, posedge DADDR[3] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[3]);
        $setuphold (negedge DCLK, posedge DADDR[4] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[4]);
        $setuphold (negedge DCLK, posedge DADDR[5] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[5]);
        $setuphold (negedge DCLK, posedge DADDR[6] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[6]);
        $setuphold (negedge DCLK, posedge DADDR[7] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DADDR_dly[7]);
        $setuphold (negedge DCLK, posedge DEN &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DEN_dly);
        $setuphold (negedge DCLK, posedge DI[0] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[0]);
        $setuphold (negedge DCLK, posedge DI[1] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[1]);
        $setuphold (negedge DCLK, posedge DI[2] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[2]);
        $setuphold (negedge DCLK, posedge DI[3] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[3]);
        $setuphold (negedge DCLK, posedge DI[4] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[4]);
        $setuphold (negedge DCLK, posedge DI[5] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[5]);
        $setuphold (negedge DCLK, posedge DI[6] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[6]);
        $setuphold (negedge DCLK, posedge DI[7] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[7]);
        $setuphold (negedge DCLK, posedge DI[8] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[8]);
        $setuphold (negedge DCLK, posedge DI[9] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[9]);
        $setuphold (negedge DCLK, posedge DI[10] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[10]);
        $setuphold (negedge DCLK, posedge DI[11] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[11]);
        $setuphold (negedge DCLK, posedge DI[12] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[12]);
        $setuphold (negedge DCLK, posedge DI[13] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[13]);
        $setuphold (negedge DCLK, posedge DI[14] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[14]);   
        $setuphold (negedge DCLK, posedge DI[15] &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DI_dly[15]);     
        $setuphold (negedge DCLK, posedge DWE &&& (rst_input === 0), 0:0:0, 0:0:0, notifier_do,,,DCLK_dly,DWE_dly);

  `endif //  `ifdef XIL_TIMING

	specparam PATHPULSE$ = 0;

endspecify

endmodule 

`endcelldefine
