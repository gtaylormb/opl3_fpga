// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.3 (lin64) Build 1034051 Fri Oct  3 16:31:15 MDT 2014
// Date        : Tue Oct 21 23:43:58 2014
// Host        : edinburgh running 64-bit Ubuntu 14.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /media/sf_D_DRIVE/Users/Greg/workspace/OPL3/vivado_logic_only/vivado_logic_only.srcs/sources_1/ip/clk_gen/clk_gen_stub.v
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
