// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
// Date        : Sun Mar  8 22:11:52 2015
// Host        : edinburgh running 64-bit Ubuntu 14.10
// Command     : write_verilog -force -mode synth_stub
//               /media/sf_D_DRIVE/Users/Greg/git/opl3_fpga/fpga/modules/clks/ip/clk_gen/clk_gen_stub.v
// Design      : clk_gen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_gen(clk125, clk, clk_locked)
/* synthesis syn_black_box black_box_pad_pin="clk125,clk,clk_locked" */;
  input clk125;
  output clk;
  output clk_locked;
endmodule
