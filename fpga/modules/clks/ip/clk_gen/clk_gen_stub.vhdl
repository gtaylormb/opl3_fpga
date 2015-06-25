-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
-- Date        : Sun Mar  8 22:11:52 2015
-- Host        : edinburgh running 64-bit Ubuntu 14.10
-- Command     : write_vhdl -force -mode synth_stub
--               /media/sf_D_DRIVE/Users/Greg/git/opl3_fpga/fpga/modules/clks/ip/clk_gen/clk_gen_stub.vhdl
-- Design      : clk_gen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_gen is
  Port ( 
    clk125 : in STD_LOGIC;
    clk : out STD_LOGIC;
    clk_locked : out STD_LOGIC
  );

end clk_gen;

architecture stub of clk_gen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk125,clk,clk_locked";
begin
end;
