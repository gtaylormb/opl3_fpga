-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.1 (lin64) Build 1538259 Fri Apr  8 15:45:23 MDT 2016
-- Date        : Mon Jun  6 23:00:45 2016
-- Host        : edinburgh running 64-bit Ubuntu 15.04
-- Command     : write_vhdl -force -mode synth_stub
--               /home/greg/opl3_fpga_vivado_project/opl3_fpga_vivado_project.srcs/sources_1/ip/clk_gen/clk_gen_stub.vhdl
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
