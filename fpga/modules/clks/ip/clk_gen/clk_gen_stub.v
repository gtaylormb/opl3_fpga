// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (lin64) Build 1538259 Fri Apr  8 15:45:23 MDT 2016
// Date        : Mon Jun  6 23:00:45 2016
// Host        : edinburgh running 64-bit Ubuntu 15.04
// Command     : write_verilog -force -mode synth_stub
//               /home/greg/opl3_fpga_vivado_project/opl3_fpga_vivado_project.srcs/sources_1/ip/clk_gen/clk_gen_stub.v
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
