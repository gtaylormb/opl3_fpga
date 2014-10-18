-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.3 (lin64) Build 1034051 Fri Oct  3 16:31:15 MDT 2014
-- Date        : Fri Oct 17 21:54:20 2014
-- Host        : edinburgh running 64-bit Ubuntu 14.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /media/sf_D_DRIVE/Users/Greg/workspace/OPL3/vivado_logic_only/vivado_logic_only.srcs/sources_1/ip/clk_gen/clk_gen_stub.vhdl
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
    locked : out STD_LOGIC
  );

end clk_gen;

architecture stub of clk_gen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk125,clk,locked";
begin
end;
