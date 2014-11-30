-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.3 (lin64) Build 1034051 Fri Oct  3 16:31:15 MDT 2014
-- Date        : Sun Nov  2 16:51:54 2014
-- Host        : edinburgh running 64-bit Ubuntu 14.04.1 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /media/sf_D_DRIVE/Users/Greg/workspace/OPL3/vivado_logic_only/vivado_logic_only.srcs/sources_1/ip/axi_protocol_converter_0/axi_protocol_converter_0_funcsim.vhdl
-- Design      : axi_protocol_converter_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd is
  port (
    O1 : out STD_LOGIC;
    axaddr_incr_reg : out STD_LOGIC_VECTOR ( 11 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O5 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    incr_next_pending : in STD_LOGIC;
    aclk : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    I6 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    b_push : in STD_LOGIC;
    I12 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_awvalid : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    I13 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I14 : in STD_LOGIC;
    axaddr_incr0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I22 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I23 : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd : entity is "axi_protocol_converter_v2_1_b2s_incr_cmd";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd is
  signal \^o2\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^axaddr_incr_reg\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal data : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \n_0_axaddr_incr[0]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_incr[10]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr[11]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr[1]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr[2]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr[3]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr[4]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr[5]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr[6]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr[7]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr[8]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr[9]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[0]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[10]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[10]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[11]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[1]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[1]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[2]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[2]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[3]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[3]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[4]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[4]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[5]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[5]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[6]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[6]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[7]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[7]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[8]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[8]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[9]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[9]_i_3\ : STD_LOGIC;
  signal \n_0_axlen_cnt[2]_i_1\ : STD_LOGIC;
  signal \n_0_axlen_cnt[3]_i_2\ : STD_LOGIC;
  signal \n_0_axlen_cnt[4]_i_1\ : STD_LOGIC;
  signal \n_0_axlen_cnt[5]_i_1\ : STD_LOGIC;
  signal \n_0_axlen_cnt[6]_i_1\ : STD_LOGIC;
  signal \n_0_axlen_cnt[7]_i_2\ : STD_LOGIC;
  signal \n_0_axlen_cnt[7]_i_3\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[2]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[3]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[4]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[5]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[6]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[7]\ : STD_LOGIC;
  signal n_0_next_pending_r_i_5 : STD_LOGIC;
  signal n_0_sel_first_i_1 : STD_LOGIC;
  signal \n_1_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_1_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_1_axaddr_incr_reg[8]_i_4\ : STD_LOGIC;
  signal \n_2_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_2_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_2_axaddr_incr_reg[8]_i_4\ : STD_LOGIC;
  signal \n_3_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_3_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_3_axaddr_incr_reg[8]_i_4\ : STD_LOGIC;
  signal \NLW_axaddr_incr_reg[8]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_axaddr_incr_reg[9]_i_3_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_axaddr_incr_reg[9]_i_3_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \axaddr_incr_reg[1]_i_3_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \axaddr_incr_reg[1]_i_3_CARRY4\ : label is "LO:O";
  attribute XILINX_LEGACY_PRIM of \axaddr_incr_reg[5]_i_3_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \axaddr_incr_reg[5]_i_3_CARRY4\ : label is "LO:O";
  attribute XILINX_LEGACY_PRIM of \axaddr_incr_reg[9]_i_3_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \axaddr_incr_reg[9]_i_3_CARRY4\ : label is "LO:O";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axlen_cnt[4]_i_1\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \axlen_cnt[6]_i_1\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \axlen_cnt[7]_i_2\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \axlen_cnt[7]_i_3\ : label is "soft_lutpair101";
begin
  O2 <= \^o2\;
  Q(1 downto 0) <= \^q\(1 downto 0);
  axaddr_incr_reg(11 downto 0) <= \^axaddr_incr_reg\(11 downto 0);
\axaddr_incr[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE100E1"
    )
    port map (
      I0 => I6(2),
      I1 => I6(1),
      I2 => \^axaddr_incr_reg\(0),
      I3 => \^o2\,
      I4 => data(0),
      O => \n_0_axaddr_incr[0]_i_3\
    );
\axaddr_incr[10]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => data(10),
      I1 => \^o2\,
      I2 => \^axaddr_incr_reg\(10),
      O => \n_0_axaddr_incr[10]_i_2\
    );
\axaddr_incr[11]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => data(11),
      I1 => \^o2\,
      I2 => \^axaddr_incr_reg\(11),
      O => \n_0_axaddr_incr[11]_i_2\
    );
\axaddr_incr[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD200D2"
    )
    port map (
      I0 => I6(1),
      I1 => I6(2),
      I2 => \^axaddr_incr_reg\(1),
      I3 => \^o2\,
      I4 => data(1),
      O => \n_0_axaddr_incr[1]_i_2\
    );
\axaddr_incr[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD200D2"
    )
    port map (
      I0 => I6(2),
      I1 => I6(1),
      I2 => \^axaddr_incr_reg\(2),
      I3 => \^o2\,
      I4 => data(2),
      O => \n_0_axaddr_incr[2]_i_2\
    );
\axaddr_incr[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF780078"
    )
    port map (
      I0 => I6(2),
      I1 => I6(1),
      I2 => \^axaddr_incr_reg\(3),
      I3 => \^o2\,
      I4 => data(3),
      O => \n_0_axaddr_incr[3]_i_2\
    );
\axaddr_incr[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => data(4),
      I1 => \^o2\,
      I2 => \^axaddr_incr_reg\(4),
      O => \n_0_axaddr_incr[4]_i_2\
    );
\axaddr_incr[5]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => data(5),
      I1 => \^o2\,
      I2 => \^axaddr_incr_reg\(5),
      O => \n_0_axaddr_incr[5]_i_2\
    );
\axaddr_incr[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => data(6),
      I1 => \^o2\,
      I2 => \^axaddr_incr_reg\(6),
      O => \n_0_axaddr_incr[6]_i_2\
    );
\axaddr_incr[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => data(7),
      I1 => \^o2\,
      I2 => \^axaddr_incr_reg\(7),
      O => \n_0_axaddr_incr[7]_i_2\
    );
\axaddr_incr[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => data(8),
      I1 => \^o2\,
      I2 => \^axaddr_incr_reg\(8),
      O => \n_0_axaddr_incr[8]_i_2\
    );
\axaddr_incr[9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => data(9),
      I1 => \^o2\,
      I2 => \^axaddr_incr_reg\(9),
      O => \n_0_axaddr_incr[9]_i_2\
    );
\axaddr_incr_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[0]_i_2\,
      Q => \^axaddr_incr_reg\(0),
      R => '0'
    );
\axaddr_incr_reg[0]_i_4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_axaddr_incr_reg[0]_i_4\,
      CO(2) => \n_1_axaddr_incr_reg[0]_i_4\,
      CO(1) => \n_2_axaddr_incr_reg[0]_i_4\,
      CO(0) => \n_3_axaddr_incr_reg[0]_i_4\,
      CYINIT => '0',
      DI(3) => I6(0),
      DI(2 downto 0) => axaddr_incr0(2 downto 0),
      O(3 downto 0) => data(3 downto 0),
      S(3 downto 0) => S(3 downto 0)
    );
\axaddr_incr_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[10]_i_1\,
      Q => \^axaddr_incr_reg\(10),
      R => '0'
    );
\axaddr_incr_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[11]_i_1\,
      Q => \^axaddr_incr_reg\(11),
      R => '0'
    );
\axaddr_incr_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[1]_i_1\,
      Q => \^axaddr_incr_reg\(1),
      R => '0'
    );
\axaddr_incr_reg[1]_i_3_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_axaddr_incr_reg[4]_i_3\,
      CO(2) => \n_0_axaddr_incr_reg[3]_i_3\,
      CO(1) => \n_0_axaddr_incr_reg[2]_i_3\,
      CO(0) => \n_0_axaddr_incr_reg[1]_i_3\,
      CYINIT => '0',
      DI(3) => I10,
      DI(2) => I9,
      DI(1) => I8,
      DI(0) => I7,
      O(3) => \n_0_axaddr_incr_reg[3]_i_1\,
      O(2) => \n_0_axaddr_incr_reg[2]_i_1\,
      O(1) => \n_0_axaddr_incr_reg[1]_i_1\,
      O(0) => \n_0_axaddr_incr_reg[0]_i_2\,
      S(3) => \n_0_axaddr_incr[3]_i_2\,
      S(2) => \n_0_axaddr_incr[2]_i_2\,
      S(1) => \n_0_axaddr_incr[1]_i_2\,
      S(0) => \n_0_axaddr_incr[0]_i_3\
    );
\axaddr_incr_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[2]_i_1\,
      Q => \^axaddr_incr_reg\(2),
      R => '0'
    );
\axaddr_incr_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[3]_i_1\,
      Q => \^axaddr_incr_reg\(3),
      R => '0'
    );
\axaddr_incr_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[4]_i_1\,
      Q => \^axaddr_incr_reg\(4),
      R => '0'
    );
\axaddr_incr_reg[4]_i_4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_incr_reg[0]_i_4\,
      CO(3) => \n_0_axaddr_incr_reg[4]_i_4\,
      CO(2) => \n_1_axaddr_incr_reg[4]_i_4\,
      CO(1) => \n_2_axaddr_incr_reg[4]_i_4\,
      CO(0) => \n_3_axaddr_incr_reg[4]_i_4\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => data(7 downto 4),
      S(3 downto 0) => I22(3 downto 0)
    );
\axaddr_incr_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[5]_i_1\,
      Q => \^axaddr_incr_reg\(5),
      R => '0'
    );
\axaddr_incr_reg[5]_i_3_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_incr_reg[4]_i_3\,
      CO(3) => \n_0_axaddr_incr_reg[8]_i_3\,
      CO(2) => \n_0_axaddr_incr_reg[7]_i_3\,
      CO(1) => \n_0_axaddr_incr_reg[6]_i_3\,
      CO(0) => \n_0_axaddr_incr_reg[5]_i_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_0_axaddr_incr_reg[7]_i_1\,
      O(2) => \n_0_axaddr_incr_reg[6]_i_1\,
      O(1) => \n_0_axaddr_incr_reg[5]_i_1\,
      O(0) => \n_0_axaddr_incr_reg[4]_i_1\,
      S(3) => \n_0_axaddr_incr[7]_i_2\,
      S(2) => \n_0_axaddr_incr[6]_i_2\,
      S(1) => \n_0_axaddr_incr[5]_i_2\,
      S(0) => \n_0_axaddr_incr[4]_i_2\
    );
\axaddr_incr_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[6]_i_1\,
      Q => \^axaddr_incr_reg\(6),
      R => '0'
    );
\axaddr_incr_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[7]_i_1\,
      Q => \^axaddr_incr_reg\(7),
      R => '0'
    );
\axaddr_incr_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[8]_i_1\,
      Q => \^axaddr_incr_reg\(8),
      R => '0'
    );
\axaddr_incr_reg[8]_i_4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_incr_reg[4]_i_4\,
      CO(3) => \NLW_axaddr_incr_reg[8]_i_4_CO_UNCONNECTED\(3),
      CO(2) => \n_1_axaddr_incr_reg[8]_i_4\,
      CO(1) => \n_2_axaddr_incr_reg[8]_i_4\,
      CO(0) => \n_3_axaddr_incr_reg[8]_i_4\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => data(11 downto 8),
      S(3 downto 0) => I23(3 downto 0)
    );
\axaddr_incr_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[9]_i_1\,
      Q => \^axaddr_incr_reg\(9),
      R => '0'
    );
\axaddr_incr_reg[9]_i_3_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_incr_reg[8]_i_3\,
      CO(3 downto 2) => \NLW_axaddr_incr_reg[9]_i_3_CARRY4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \n_0_axaddr_incr_reg[10]_i_3\,
      CO(0) => \n_0_axaddr_incr_reg[9]_i_3\,
      CYINIT => '0',
      DI(3) => \NLW_axaddr_incr_reg[9]_i_3_CARRY4_DI_UNCONNECTED\(3),
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_0_axaddr_incr_reg[11]_i_1\,
      O(2) => \n_0_axaddr_incr_reg[10]_i_1\,
      O(1) => \n_0_axaddr_incr_reg[9]_i_1\,
      O(0) => \n_0_axaddr_incr_reg[8]_i_1\,
      S(3) => \n_0_axaddr_incr[11]_i_2\,
      S(2) => \n_0_axaddr_incr[10]_i_2\,
      S(1) => \n_0_axaddr_incr[9]_i_2\,
      S(0) => \n_0_axaddr_incr[8]_i_2\
    );
\axlen_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8F8F88F88888888"
    )
    port map (
      I0 => E(0),
      I1 => I6(3),
      I2 => \n_0_axlen_cnt_reg[2]\,
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => I4,
      O => \n_0_axlen_cnt[2]_i_1\
    );
\axlen_cnt[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA90000FFFFFFFF"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[3]\,
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \n_0_axlen_cnt_reg[2]\,
      I4 => I4,
      I5 => I5,
      O => \n_0_axlen_cnt[3]_i_2\
    );
\axlen_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[4]\,
      I1 => \n_0_axlen_cnt_reg[2]\,
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \n_0_axlen_cnt_reg[3]\,
      O => \n_0_axlen_cnt[4]_i_1\
    );
\axlen_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA9"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[5]\,
      I1 => \n_0_axlen_cnt_reg[3]\,
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \n_0_axlen_cnt_reg[2]\,
      I5 => \n_0_axlen_cnt_reg[4]\,
      O => \n_0_axlen_cnt[5]_i_1\
    );
\axlen_cnt[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[6]\,
      I1 => \n_0_axlen_cnt[7]_i_3\,
      I2 => \n_0_axlen_cnt_reg[5]\,
      O => \n_0_axlen_cnt[6]_i_1\
    );
\axlen_cnt[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[7]\,
      I1 => \n_0_axlen_cnt[7]_i_3\,
      I2 => \n_0_axlen_cnt_reg[5]\,
      I3 => \n_0_axlen_cnt_reg[6]\,
      O => \n_0_axlen_cnt[7]_i_2\
    );
\axlen_cnt[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[4]\,
      I1 => \n_0_axlen_cnt_reg[2]\,
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \n_0_axlen_cnt_reg[3]\,
      O => \n_0_axlen_cnt[7]_i_3\
    );
\axlen_cnt_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I13,
      D => D(0),
      Q => \^q\(0),
      R => '0'
    );
\axlen_cnt_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I13,
      D => D(1),
      Q => \^q\(1),
      R => '0'
    );
\axlen_cnt_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I13,
      D => \n_0_axlen_cnt[2]_i_1\,
      Q => \n_0_axlen_cnt_reg[2]\,
      R => '0'
    );
\axlen_cnt_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I13,
      D => \n_0_axlen_cnt[3]_i_2\,
      Q => \n_0_axlen_cnt_reg[3]\,
      R => '0'
    );
\axlen_cnt_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I13,
      D => \n_0_axlen_cnt[4]_i_1\,
      Q => \n_0_axlen_cnt_reg[4]\,
      R => I14
    );
\axlen_cnt_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I13,
      D => \n_0_axlen_cnt[5]_i_1\,
      Q => \n_0_axlen_cnt_reg[5]\,
      R => I14
    );
\axlen_cnt_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I13,
      D => \n_0_axlen_cnt[6]_i_1\,
      Q => \n_0_axlen_cnt_reg[6]\,
      R => I14
    );
\axlen_cnt_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I13,
      D => \n_0_axlen_cnt[7]_i_2\,
      Q => \n_0_axlen_cnt_reg[7]\,
      R => I14
    );
next_pending_r_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[3]\,
      I1 => \n_0_axlen_cnt_reg[4]\,
      I2 => \^q\(1),
      I3 => \n_0_axlen_cnt_reg[2]\,
      I4 => n_0_next_pending_r_i_5,
      I5 => \n_0_axlen_cnt_reg[7]\,
      O => O5
    );
next_pending_r_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[5]\,
      I1 => \n_0_axlen_cnt_reg[6]\,
      O => n_0_next_pending_r_i_5
    );
next_pending_r_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => incr_next_pending,
      Q => O1,
      R => '0'
    );
sel_first_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF44440F04"
    )
    port map (
      I0 => b_push,
      I1 => \^o2\,
      I2 => I12(1),
      I3 => si_rs_awvalid,
      I4 => I12(0),
      I5 => areset_d1,
      O => n_0_sel_first_i_1
    );
sel_first_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => n_0_sel_first_i_1,
      Q => \^o2\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd_2 is
  port (
    incr_next_pending : out STD_LOGIC;
    axaddr_incr_reg : out STD_LOGIC_VECTOR ( 11 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O3 : out STD_LOGIC;
    O1 : out STD_LOGIC;
    aclk : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    I6 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    I11 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    I14 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_arvalid : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    I15 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I16 : in STD_LOGIC;
    I26 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S : in STD_LOGIC_VECTOR ( 0 to 0 );
    I23 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I24 : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd_2 : entity is "axi_protocol_converter_v2_1_b2s_incr_cmd";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd_2;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd_2 is
  signal \^o1\ : STD_LOGIC;
  signal \^o3\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^axaddr_incr_reg\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \^incr_next_pending\ : STD_LOGIC;
  signal \n_0_axaddr_incr[0]_i_10\ : STD_LOGIC;
  signal \n_0_axaddr_incr[0]_i_3__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr[0]_i_8\ : STD_LOGIC;
  signal \n_0_axaddr_incr[0]_i_9\ : STD_LOGIC;
  signal \n_0_axaddr_incr[10]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr[11]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr[1]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr[2]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr[3]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr[4]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr[5]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr[6]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr[7]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr[8]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr[9]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[0]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[10]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[10]_i_3__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[11]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[1]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[1]_i_3__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[2]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[2]_i_3__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[3]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[3]_i_3__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[4]_i_3__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[5]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[5]_i_3__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[6]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[6]_i_3__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[7]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[7]_i_3__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[8]_i_3__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[9]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_incr_reg[9]_i_3__0\ : STD_LOGIC;
  signal \n_0_axlen_cnt[2]_i_1__1\ : STD_LOGIC;
  signal \n_0_axlen_cnt[3]_i_2__1\ : STD_LOGIC;
  signal \n_0_axlen_cnt[4]_i_1__0\ : STD_LOGIC;
  signal \n_0_axlen_cnt[5]_i_1__0\ : STD_LOGIC;
  signal \n_0_axlen_cnt[6]_i_1__0\ : STD_LOGIC;
  signal \n_0_axlen_cnt[7]_i_2__0\ : STD_LOGIC;
  signal \n_0_axlen_cnt[7]_i_3__0\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[2]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[3]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[4]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[5]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[6]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[7]\ : STD_LOGIC;
  signal \n_0_next_pending_r_i_5__0\ : STD_LOGIC;
  signal n_0_next_pending_r_reg : STD_LOGIC;
  signal n_0_sel_first_i_1 : STD_LOGIC;
  signal \n_1_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_1_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_1_axaddr_incr_reg[8]_i_4\ : STD_LOGIC;
  signal \n_2_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_2_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_2_axaddr_incr_reg[8]_i_4\ : STD_LOGIC;
  signal \n_3_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_3_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_3_axaddr_incr_reg[8]_i_4\ : STD_LOGIC;
  signal \n_4_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_4_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_4_axaddr_incr_reg[8]_i_4\ : STD_LOGIC;
  signal \n_5_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_5_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_5_axaddr_incr_reg[8]_i_4\ : STD_LOGIC;
  signal \n_6_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_6_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_6_axaddr_incr_reg[8]_i_4\ : STD_LOGIC;
  signal \n_7_axaddr_incr_reg[0]_i_4\ : STD_LOGIC;
  signal \n_7_axaddr_incr_reg[4]_i_4\ : STD_LOGIC;
  signal \n_7_axaddr_incr_reg[8]_i_4\ : STD_LOGIC;
  signal \NLW_axaddr_incr_reg[8]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_axaddr_incr_reg[9]_i_3__0_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_axaddr_incr_reg[9]_i_3__0_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \axaddr_incr_reg[1]_i_3__0_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \axaddr_incr_reg[1]_i_3__0_CARRY4\ : label is "LO:O";
  attribute XILINX_LEGACY_PRIM of \axaddr_incr_reg[5]_i_3__0_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \axaddr_incr_reg[5]_i_3__0_CARRY4\ : label is "LO:O";
  attribute XILINX_LEGACY_PRIM of \axaddr_incr_reg[9]_i_3__0_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \axaddr_incr_reg[9]_i_3__0_CARRY4\ : label is "LO:O";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axlen_cnt[4]_i_1__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \axlen_cnt[6]_i_1__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \axlen_cnt[7]_i_2__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \axlen_cnt[7]_i_3__0\ : label is "soft_lutpair7";
begin
  O1 <= \^o1\;
  O3 <= \^o3\;
  Q(1 downto 0) <= \^q\(1 downto 0);
  axaddr_incr_reg(11 downto 0) <= \^axaddr_incr_reg\(11 downto 0);
  incr_next_pending <= \^incr_next_pending\;
\axaddr_incr[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000A6AAAAAA"
    )
    port map (
      I0 => I6(0),
      I1 => I14(0),
      I2 => I14(1),
      I3 => m_axi_arready,
      I4 => I6(3),
      I5 => I6(4),
      O => \n_0_axaddr_incr[0]_i_10\
    );
\axaddr_incr[0]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE100E1"
    )
    port map (
      I0 => I6(4),
      I1 => I6(3),
      I2 => \^axaddr_incr_reg\(0),
      I3 => \^o1\,
      I4 => \n_7_axaddr_incr_reg[0]_i_4\,
      O => \n_0_axaddr_incr[0]_i_3__0\
    );
\axaddr_incr[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
    port map (
      I0 => I6(2),
      I1 => I14(0),
      I2 => I14(1),
      I3 => m_axi_arready,
      I4 => I6(4),
      I5 => I6(3),
      O => \n_0_axaddr_incr[0]_i_8\
    );
\axaddr_incr[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AAAAA6AAAAAA"
    )
    port map (
      I0 => I6(1),
      I1 => I14(0),
      I2 => I14(1),
      I3 => m_axi_arready,
      I4 => I6(4),
      I5 => I6(3),
      O => \n_0_axaddr_incr[0]_i_9\
    );
\axaddr_incr[10]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_5_axaddr_incr_reg[8]_i_4\,
      I1 => \^o1\,
      I2 => \^axaddr_incr_reg\(10),
      O => \n_0_axaddr_incr[10]_i_2__0\
    );
\axaddr_incr[11]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_4_axaddr_incr_reg[8]_i_4\,
      I1 => \^o1\,
      I2 => \^axaddr_incr_reg\(11),
      O => \n_0_axaddr_incr[11]_i_2__0\
    );
\axaddr_incr[1]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD200D2"
    )
    port map (
      I0 => I6(3),
      I1 => I6(4),
      I2 => \^axaddr_incr_reg\(1),
      I3 => \^o1\,
      I4 => \n_6_axaddr_incr_reg[0]_i_4\,
      O => \n_0_axaddr_incr[1]_i_2__0\
    );
\axaddr_incr[2]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD200D2"
    )
    port map (
      I0 => I6(4),
      I1 => I6(3),
      I2 => \^axaddr_incr_reg\(2),
      I3 => \^o1\,
      I4 => \n_5_axaddr_incr_reg[0]_i_4\,
      O => \n_0_axaddr_incr[2]_i_2__0\
    );
\axaddr_incr[3]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF780078"
    )
    port map (
      I0 => I6(4),
      I1 => I6(3),
      I2 => \^axaddr_incr_reg\(3),
      I3 => \^o1\,
      I4 => \n_4_axaddr_incr_reg[0]_i_4\,
      O => \n_0_axaddr_incr[3]_i_2__0\
    );
\axaddr_incr[4]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_7_axaddr_incr_reg[4]_i_4\,
      I1 => \^o1\,
      I2 => \^axaddr_incr_reg\(4),
      O => \n_0_axaddr_incr[4]_i_2__0\
    );
\axaddr_incr[5]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_6_axaddr_incr_reg[4]_i_4\,
      I1 => \^o1\,
      I2 => \^axaddr_incr_reg\(5),
      O => \n_0_axaddr_incr[5]_i_2__0\
    );
\axaddr_incr[6]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_5_axaddr_incr_reg[4]_i_4\,
      I1 => \^o1\,
      I2 => \^axaddr_incr_reg\(6),
      O => \n_0_axaddr_incr[6]_i_2__0\
    );
\axaddr_incr[7]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_4_axaddr_incr_reg[4]_i_4\,
      I1 => \^o1\,
      I2 => \^axaddr_incr_reg\(7),
      O => \n_0_axaddr_incr[7]_i_2__0\
    );
\axaddr_incr[8]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_7_axaddr_incr_reg[8]_i_4\,
      I1 => \^o1\,
      I2 => \^axaddr_incr_reg\(8),
      O => \n_0_axaddr_incr[8]_i_2__0\
    );
\axaddr_incr[9]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \n_6_axaddr_incr_reg[8]_i_4\,
      I1 => \^o1\,
      I2 => \^axaddr_incr_reg\(9),
      O => \n_0_axaddr_incr[9]_i_2__0\
    );
\axaddr_incr_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[0]_i_2__0\,
      Q => \^axaddr_incr_reg\(0),
      R => '0'
    );
\axaddr_incr_reg[0]_i_4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_axaddr_incr_reg[0]_i_4\,
      CO(2) => \n_1_axaddr_incr_reg[0]_i_4\,
      CO(1) => \n_2_axaddr_incr_reg[0]_i_4\,
      CO(0) => \n_3_axaddr_incr_reg[0]_i_4\,
      CYINIT => '0',
      DI(3) => I6(2),
      DI(2 downto 0) => I26(2 downto 0),
      O(3) => \n_4_axaddr_incr_reg[0]_i_4\,
      O(2) => \n_5_axaddr_incr_reg[0]_i_4\,
      O(1) => \n_6_axaddr_incr_reg[0]_i_4\,
      O(0) => \n_7_axaddr_incr_reg[0]_i_4\,
      S(3) => \n_0_axaddr_incr[0]_i_8\,
      S(2) => \n_0_axaddr_incr[0]_i_9\,
      S(1) => \n_0_axaddr_incr[0]_i_10\,
      S(0) => S(0)
    );
\axaddr_incr_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[10]_i_1__0\,
      Q => \^axaddr_incr_reg\(10),
      R => '0'
    );
\axaddr_incr_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[11]_i_1__0\,
      Q => \^axaddr_incr_reg\(11),
      R => '0'
    );
\axaddr_incr_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[1]_i_1__0\,
      Q => \^axaddr_incr_reg\(1),
      R => '0'
    );
\axaddr_incr_reg[1]_i_3__0_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_axaddr_incr_reg[4]_i_3__0\,
      CO(2) => \n_0_axaddr_incr_reg[3]_i_3__0\,
      CO(1) => \n_0_axaddr_incr_reg[2]_i_3__0\,
      CO(0) => \n_0_axaddr_incr_reg[1]_i_3__0\,
      CYINIT => '0',
      DI(3) => I10,
      DI(2) => I9,
      DI(1) => I8,
      DI(0) => I7,
      O(3) => \n_0_axaddr_incr_reg[3]_i_1__0\,
      O(2) => \n_0_axaddr_incr_reg[2]_i_1__0\,
      O(1) => \n_0_axaddr_incr_reg[1]_i_1__0\,
      O(0) => \n_0_axaddr_incr_reg[0]_i_2__0\,
      S(3) => \n_0_axaddr_incr[3]_i_2__0\,
      S(2) => \n_0_axaddr_incr[2]_i_2__0\,
      S(1) => \n_0_axaddr_incr[1]_i_2__0\,
      S(0) => \n_0_axaddr_incr[0]_i_3__0\
    );
\axaddr_incr_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[2]_i_1__0\,
      Q => \^axaddr_incr_reg\(2),
      R => '0'
    );
\axaddr_incr_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[3]_i_1__0\,
      Q => \^axaddr_incr_reg\(3),
      R => '0'
    );
\axaddr_incr_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[4]_i_1__0\,
      Q => \^axaddr_incr_reg\(4),
      R => '0'
    );
\axaddr_incr_reg[4]_i_4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_incr_reg[0]_i_4\,
      CO(3) => \n_0_axaddr_incr_reg[4]_i_4\,
      CO(2) => \n_1_axaddr_incr_reg[4]_i_4\,
      CO(1) => \n_2_axaddr_incr_reg[4]_i_4\,
      CO(0) => \n_3_axaddr_incr_reg[4]_i_4\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_axaddr_incr_reg[4]_i_4\,
      O(2) => \n_5_axaddr_incr_reg[4]_i_4\,
      O(1) => \n_6_axaddr_incr_reg[4]_i_4\,
      O(0) => \n_7_axaddr_incr_reg[4]_i_4\,
      S(3 downto 0) => I23(3 downto 0)
    );
\axaddr_incr_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[5]_i_1__0\,
      Q => \^axaddr_incr_reg\(5),
      R => '0'
    );
\axaddr_incr_reg[5]_i_3__0_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_incr_reg[4]_i_3__0\,
      CO(3) => \n_0_axaddr_incr_reg[8]_i_3__0\,
      CO(2) => \n_0_axaddr_incr_reg[7]_i_3__0\,
      CO(1) => \n_0_axaddr_incr_reg[6]_i_3__0\,
      CO(0) => \n_0_axaddr_incr_reg[5]_i_3__0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_0_axaddr_incr_reg[7]_i_1__0\,
      O(2) => \n_0_axaddr_incr_reg[6]_i_1__0\,
      O(1) => \n_0_axaddr_incr_reg[5]_i_1__0\,
      O(0) => \n_0_axaddr_incr_reg[4]_i_1__0\,
      S(3) => \n_0_axaddr_incr[7]_i_2__0\,
      S(2) => \n_0_axaddr_incr[6]_i_2__0\,
      S(1) => \n_0_axaddr_incr[5]_i_2__0\,
      S(0) => \n_0_axaddr_incr[4]_i_2__0\
    );
\axaddr_incr_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[6]_i_1__0\,
      Q => \^axaddr_incr_reg\(6),
      R => '0'
    );
\axaddr_incr_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[7]_i_1__0\,
      Q => \^axaddr_incr_reg\(7),
      R => '0'
    );
\axaddr_incr_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[8]_i_1__0\,
      Q => \^axaddr_incr_reg\(8),
      R => '0'
    );
\axaddr_incr_reg[8]_i_4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_incr_reg[4]_i_4\,
      CO(3) => \NLW_axaddr_incr_reg[8]_i_4_CO_UNCONNECTED\(3),
      CO(2) => \n_1_axaddr_incr_reg[8]_i_4\,
      CO(1) => \n_2_axaddr_incr_reg[8]_i_4\,
      CO(0) => \n_3_axaddr_incr_reg[8]_i_4\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_axaddr_incr_reg[8]_i_4\,
      O(2) => \n_5_axaddr_incr_reg[8]_i_4\,
      O(1) => \n_6_axaddr_incr_reg[8]_i_4\,
      O(0) => \n_7_axaddr_incr_reg[8]_i_4\,
      S(3 downto 0) => I24(3 downto 0)
    );
\axaddr_incr_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I3,
      D => \n_0_axaddr_incr_reg[9]_i_1__0\,
      Q => \^axaddr_incr_reg\(9),
      R => '0'
    );
\axaddr_incr_reg[9]_i_3__0_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_incr_reg[8]_i_3__0\,
      CO(3 downto 2) => \NLW_axaddr_incr_reg[9]_i_3__0_CARRY4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \n_0_axaddr_incr_reg[10]_i_3__0\,
      CO(0) => \n_0_axaddr_incr_reg[9]_i_3__0\,
      CYINIT => '0',
      DI(3) => \NLW_axaddr_incr_reg[9]_i_3__0_CARRY4_DI_UNCONNECTED\(3),
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_0_axaddr_incr_reg[11]_i_1__0\,
      O(2) => \n_0_axaddr_incr_reg[10]_i_1__0\,
      O(1) => \n_0_axaddr_incr_reg[9]_i_1__0\,
      O(0) => \n_0_axaddr_incr_reg[8]_i_1__0\,
      S(3) => \n_0_axaddr_incr[11]_i_2__0\,
      S(2) => \n_0_axaddr_incr[10]_i_2__0\,
      S(1) => \n_0_axaddr_incr[9]_i_2__0\,
      S(0) => \n_0_axaddr_incr[8]_i_2__0\
    );
\axlen_cnt[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8F8F88F88888888"
    )
    port map (
      I0 => E(0),
      I1 => I6(5),
      I2 => \n_0_axlen_cnt_reg[2]\,
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => I4,
      O => \n_0_axlen_cnt[2]_i_1__1\
    );
\axlen_cnt[3]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA90000FFFFFFFF"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[3]\,
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \n_0_axlen_cnt_reg[2]\,
      I4 => I4,
      I5 => I5,
      O => \n_0_axlen_cnt[3]_i_2__1\
    );
\axlen_cnt[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[4]\,
      I1 => \n_0_axlen_cnt_reg[2]\,
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \n_0_axlen_cnt_reg[3]\,
      O => \n_0_axlen_cnt[4]_i_1__0\
    );
\axlen_cnt[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA9"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[5]\,
      I1 => \n_0_axlen_cnt_reg[3]\,
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \n_0_axlen_cnt_reg[2]\,
      I5 => \n_0_axlen_cnt_reg[4]\,
      O => \n_0_axlen_cnt[5]_i_1__0\
    );
\axlen_cnt[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[6]\,
      I1 => \n_0_axlen_cnt[7]_i_3__0\,
      I2 => \n_0_axlen_cnt_reg[5]\,
      O => \n_0_axlen_cnt[6]_i_1__0\
    );
\axlen_cnt[7]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[7]\,
      I1 => \n_0_axlen_cnt[7]_i_3__0\,
      I2 => \n_0_axlen_cnt_reg[5]\,
      I3 => \n_0_axlen_cnt_reg[6]\,
      O => \n_0_axlen_cnt[7]_i_2__0\
    );
\axlen_cnt[7]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[4]\,
      I1 => \n_0_axlen_cnt_reg[2]\,
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \n_0_axlen_cnt_reg[3]\,
      O => \n_0_axlen_cnt[7]_i_3__0\
    );
\axlen_cnt_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I15,
      D => D(0),
      Q => \^q\(0),
      R => '0'
    );
\axlen_cnt_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I15,
      D => D(1),
      Q => \^q\(1),
      R => '0'
    );
\axlen_cnt_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I15,
      D => \n_0_axlen_cnt[2]_i_1__1\,
      Q => \n_0_axlen_cnt_reg[2]\,
      R => '0'
    );
\axlen_cnt_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I15,
      D => \n_0_axlen_cnt[3]_i_2__1\,
      Q => \n_0_axlen_cnt_reg[3]\,
      R => '0'
    );
\axlen_cnt_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I15,
      D => \n_0_axlen_cnt[4]_i_1__0\,
      Q => \n_0_axlen_cnt_reg[4]\,
      R => I16
    );
\axlen_cnt_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I15,
      D => \n_0_axlen_cnt[5]_i_1__0\,
      Q => \n_0_axlen_cnt_reg[5]\,
      R => I16
    );
\axlen_cnt_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I15,
      D => \n_0_axlen_cnt[6]_i_1__0\,
      Q => \n_0_axlen_cnt_reg[6]\,
      R => I16
    );
\axlen_cnt_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I15,
      D => \n_0_axlen_cnt[7]_i_2__0\,
      Q => \n_0_axlen_cnt_reg[7]\,
      R => I16
    );
\next_pending_r_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF05C5"
    )
    port map (
      I0 => \^o3\,
      I1 => n_0_next_pending_r_reg,
      I2 => I11,
      I3 => E(0),
      I4 => I12,
      O => \^incr_next_pending\
    );
\next_pending_r_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[7]\,
      I1 => \n_0_next_pending_r_i_5__0\,
      I2 => \n_0_axlen_cnt_reg[3]\,
      I3 => \n_0_axlen_cnt_reg[4]\,
      I4 => \^q\(1),
      I5 => \n_0_axlen_cnt_reg[2]\,
      O => \^o3\
    );
\next_pending_r_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[5]\,
      I1 => \n_0_axlen_cnt_reg[6]\,
      O => \n_0_next_pending_r_i_5__0\
    );
next_pending_r_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \^incr_next_pending\,
      Q => n_0_next_pending_r_reg,
      R => '0'
    );
sel_first_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFA2A2AFAA"
    )
    port map (
      I0 => \^o1\,
      I1 => m_axi_arready,
      I2 => I14(1),
      I3 => si_rs_arvalid,
      I4 => I14(0),
      I5 => areset_d1,
      O => n_0_sel_first_i_1
    );
sel_first_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => n_0_sel_first_i_1,
      Q => \^o1\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_rd_cmd_fsm is
  port (
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O1 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O5 : out STD_LOGIC;
    O6 : out STD_LOGIC;
    O7 : out STD_LOGIC;
    O8 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    O9 : out STD_LOGIC;
    O10 : out STD_LOGIC;
    sel_first_i : out STD_LOGIC;
    wrap_next_pending : out STD_LOGIC;
    O11 : out STD_LOGIC;
    O12 : out STD_LOGIC;
    O13 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O14 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O15 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O16 : out STD_LOGIC;
    r_push : out STD_LOGIC;
    m_axi_arvalid : out STD_LOGIC;
    O17 : out STD_LOGIC_VECTOR ( 0 to 0 );
    I1 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_arvalid : in STD_LOGIC;
    I2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arready : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I7 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I8 : in STD_LOGIC;
    I6 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I9 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I10 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I11 : in STD_LOGIC;
    incr_next_pending : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    I13 : in STD_LOGIC;
    I14 : in STD_LOGIC;
    I15 : in STD_LOGIC;
    I16 : in STD_LOGIC;
    I17 : in STD_LOGIC;
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_rd_cmd_fsm : entity is "axi_protocol_converter_v2_1_b2s_rd_cmd_fsm";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_rd_cmd_fsm;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_rd_cmd_fsm is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^o1\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^o3\ : STD_LOGIC;
  signal \^o4\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^o6\ : STD_LOGIC;
  signal \^o7\ : STD_LOGIC;
  signal \^o8\ : STD_LOGIC;
  signal \^o9\ : STD_LOGIC;
  signal \n_0_state[0]_rep_i_1\ : STD_LOGIC;
  signal \n_0_state[1]_rep_i_1\ : STD_LOGIC;
  signal \n_0_wrap_second_len_r[0]_i_2__0\ : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^sel_first_i\ : STD_LOGIC;
  signal \^wrap_next_pending\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axaddr_incr[0]_i_1__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \axaddr_wrap[11]_i_1__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \axlen_cnt[3]_i_1__1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \axlen_cnt[3]_i_1__2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \axlen_cnt[3]_i_3__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \axlen_cnt[7]_i_1__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \m_payload_i[31]_i_1__1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \next_pending_r_i_3__1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of r_push_r_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \s_axburst_eq0_i_1__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \s_axburst_eq1_i_1__0\ : label is "soft_lutpair1";
  attribute KEEP : string;
  attribute KEEP of \state_reg[0]\ : label is "yes";
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of \state_reg[0]\ : label is "state_reg[0]";
  attribute KEEP of \state_reg[0]_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \state_reg[0]_rep\ : label is "state_reg[0]";
  attribute KEEP of \state_reg[1]\ : label is "yes";
  attribute ORIG_CELL_NAME of \state_reg[1]\ : label is "state_reg[1]";
  attribute KEEP of \state_reg[1]_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \state_reg[1]_rep\ : label is "state_reg[1]";
  attribute SOFT_HLUTNM of \wrap_boundary_axaddr_r[11]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wrap_cnt_r[1]_i_1__0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \wrap_cnt_r[3]_i_1__0\ : label is "soft_lutpair2";
begin
  E(0) <= \^e\(0);
  O1(2 downto 0) <= \^o1\(2 downto 0);
  O3 <= \^o3\;
  O4(1 downto 0) <= \^o4\(1 downto 0);
  O6 <= \^o6\;
  O7 <= \^o7\;
  O8 <= \^o8\;
  O9 <= \^o9\;
  sel_first_i <= \^sel_first_i\;
  wrap_next_pending <= \^wrap_next_pending\;
\axaddr_incr[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEAA"
    )
    port map (
      I0 => I17,
      I1 => m_axi_arready,
      I2 => \^o8\,
      I3 => \^o7\,
      O => O16
    );
\axaddr_offset_r[2]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \^o9\,
      O => O15(0)
    );
\axaddr_offset_r[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555553F5555"
    )
    port map (
      I0 => I10(0),
      I1 => I2(3),
      I2 => I16,
      I3 => \^o8\,
      I4 => si_rs_arvalid,
      I5 => \^o7\,
      O => \^o9\
    );
\axaddr_wrap[11]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0C0A"
    )
    port map (
      I0 => si_rs_arvalid,
      I1 => m_axi_arready,
      I2 => \^o4\(1),
      I3 => \^o4\(0),
      O => O13(0)
    );
\axlen_cnt[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444F4444444444"
    )
    port map (
      I0 => Q(0),
      I1 => \^o3\,
      I2 => \^o4\(1),
      I3 => si_rs_arvalid,
      I4 => \^o4\(0),
      I5 => I2(1),
      O => O2(0)
    );
\axlen_cnt[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F88F8888"
    )
    port map (
      I0 => \^e\(0),
      I1 => I2(2),
      I2 => Q(0),
      I3 => Q(1),
      I4 => \^o3\,
      O => O2(1)
    );
\axlen_cnt[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0C0A"
    )
    port map (
      I0 => si_rs_arvalid,
      I1 => m_axi_arready,
      I2 => \^o4\(1),
      I3 => \^o4\(0),
      O => O12
    );
\axlen_cnt[3]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0C0A"
    )
    port map (
      I0 => si_rs_arvalid,
      I1 => m_axi_arready,
      I2 => \^o8\,
      I3 => \^o4\(0),
      O => O14(0)
    );
\axlen_cnt[3]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FB"
    )
    port map (
      I0 => \^o4\(0),
      I1 => si_rs_arvalid,
      I2 => \^o4\(1),
      I3 => I3,
      O => \^o3\
    );
\axlen_cnt[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00003120"
    )
    port map (
      I0 => \^o4\(0),
      I1 => \^o4\(1),
      I2 => m_axi_arready,
      I3 => si_rs_arvalid,
      I4 => \^o3\,
      O => O5
    );
m_axi_arvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^o7\,
      I1 => \^o8\,
      O => m_axi_arvalid
    );
\m_payload_i[31]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B3"
    )
    port map (
      I0 => \^o8\,
      I1 => si_rs_arvalid,
      I2 => \^o7\,
      O => O17(0)
    );
\next_pending_r_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF404F"
    )
    port map (
      I0 => \^e\(0),
      I1 => I13,
      I2 => \^o6\,
      I3 => I14,
      I4 => I15,
      O => \^wrap_next_pending\
    );
\next_pending_r_i_3__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
    port map (
      I0 => \^o7\,
      I1 => \^o8\,
      I2 => m_axi_arready,
      O => \^o6\
    );
r_push_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => m_axi_arready,
      I1 => \^o8\,
      I2 => \^o7\,
      O => r_push
    );
\s_axburst_eq0_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA8A"
    )
    port map (
      I0 => incr_next_pending,
      I1 => \^sel_first_i\,
      I2 => I2(0),
      I3 => \^wrap_next_pending\,
      O => O10
    );
\s_axburst_eq1_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE02"
    )
    port map (
      I0 => incr_next_pending,
      I1 => I2(0),
      I2 => \^sel_first_i\,
      I3 => \^wrap_next_pending\,
      O => O11
    );
\sel_first_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCFFFFFCCCECCCE"
    )
    port map (
      I0 => si_rs_arvalid,
      I1 => areset_d1,
      I2 => \^o4\(0),
      I3 => \^o4\(1),
      I4 => m_axi_arready,
      I5 => I12,
      O => \^sel_first_i\
    );
\state[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"005E0A5E0A5E0A5E"
    )
    port map (
      I0 => \^o4\(0),
      I1 => si_rs_arvalid,
      I2 => \^o4\(1),
      I3 => I7,
      I4 => m_axi_arready,
      I5 => I4,
      O => next_state(0)
    );
\state[0]_rep_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"005E0A5E0A5E0A5E"
    )
    port map (
      I0 => \^o7\,
      I1 => si_rs_arvalid,
      I2 => \^o4\(1),
      I3 => I7,
      I4 => m_axi_arready,
      I5 => I4,
      O => \n_0_state[0]_rep_i_1\
    );
\state[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FC00040"
    )
    port map (
      I0 => I4,
      I1 => m_axi_arready,
      I2 => \^o7\,
      I3 => \^o4\(1),
      I4 => I7,
      O => next_state(1)
    );
\state[1]_rep_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FC00040"
    )
    port map (
      I0 => I4,
      I1 => m_axi_arready,
      I2 => \^o4\(0),
      I3 => \^o8\,
      I4 => I7,
      O => \n_0_state[1]_rep_i_1\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => next_state(0),
      Q => \^o4\(0),
      R => areset_d1
    );
\state_reg[0]_rep\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_state[0]_rep_i_1\,
      Q => \^o7\,
      R => areset_d1
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => next_state(1),
      Q => \^o4\(1),
      R => areset_d1
    );
\state_reg[1]_rep\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_state[1]_rep_i_1\,
      Q => \^o8\,
      R => areset_d1
    );
\wrap_boundary_axaddr_r[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => \^o8\,
      I1 => si_rs_arvalid,
      I2 => \^o7\,
      O => \^e\(0)
    );
\wrap_cnt_r[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555855AAAAA8AA"
    )
    port map (
      I0 => \n_0_wrap_second_len_r[0]_i_2__0\,
      I1 => I8,
      I2 => \^o4\(1),
      I3 => si_rs_arvalid,
      I4 => \^o4\(0),
      I5 => I6(0),
      O => D(0)
    );
\wrap_cnt_r[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^o1\(1),
      I1 => I1,
      O => D(1)
    );
\wrap_cnt_r[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A6AA"
    )
    port map (
      I0 => \^o1\(2),
      I1 => \^o1\(1),
      I2 => I1,
      I3 => I5(0),
      O => D(2)
    );
\wrap_second_len_r[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCC0CCCCCCCACC"
    )
    port map (
      I0 => \n_0_wrap_second_len_r[0]_i_2__0\,
      I1 => I6(0),
      I2 => \^o4\(0),
      I3 => si_rs_arvalid,
      I4 => \^o4\(1),
      I5 => I8,
      O => \^o1\(0)
    );
\wrap_second_len_r[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF2FFFFFFFF"
    )
    port map (
      I0 => I10(1),
      I1 => \^e\(0),
      I2 => I11,
      I3 => I9(1),
      I4 => I9(0),
      I5 => \^o9\,
      O => \n_0_wrap_second_len_r[0]_i_2__0\
    );
\wrap_second_len_r[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3AAC0AAC3AAC3AA"
    )
    port map (
      I0 => I6(1),
      I1 => I9(0),
      I2 => I9(1),
      I3 => \^e\(0),
      I4 => I9(2),
      I5 => \^o9\,
      O => \^o1\(1)
    );
\wrap_second_len_r[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FD00FFFFFD00FD00"
    )
    port map (
      I0 => \^o9\,
      I1 => I9(0),
      I2 => I9(1),
      I3 => I11,
      I4 => \^e\(0),
      I5 => I6(2),
      O => \^o1\(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo is
  port (
    bresp_push : out STD_LOGIC;
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mhandshake_r : in STD_LOGIC;
    shandshake_r : in STD_LOGIC;
    b_push : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo : entity is "axi_protocol_converter_v2_1_b2s_simple_fifo";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo is
  signal \^o1\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal \^o3\ : STD_LOGIC;
  signal \^bresp_push\ : STD_LOGIC;
  signal cnt_read : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal cnt_read_0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \n_0_cnt_read[0]_rep_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[0]_rep_rep_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_rep__0_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_rep_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[1]_rep\ : STD_LOGIC;
  signal \n_0_memory_reg[3][0]_srl4\ : STD_LOGIC;
  signal \n_0_memory_reg[3][0]_srl4_i_2__0\ : STD_LOGIC;
  signal \n_0_memory_reg[3][0]_srl4_i_3\ : STD_LOGIC;
  signal \n_0_memory_reg[3][0]_srl4_i_4\ : STD_LOGIC;
  signal \n_0_memory_reg[3][0]_srl4_i_5\ : STD_LOGIC;
  signal \n_0_memory_reg[3][0]_srl4_i_6\ : STD_LOGIC;
  signal \n_0_memory_reg[3][1]_srl4\ : STD_LOGIC;
  signal \n_0_memory_reg[3][2]_srl4\ : STD_LOGIC;
  signal \n_0_memory_reg[3][3]_srl4\ : STD_LOGIC;
  signal \n_0_memory_reg[3][4]_srl4\ : STD_LOGIC;
  signal \n_0_memory_reg[3][5]_srl4\ : STD_LOGIC;
  signal \n_0_memory_reg[3][6]_srl4\ : STD_LOGIC;
  signal \n_0_memory_reg[3][7]_srl4\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_read[0]_i_1\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \cnt_read[0]_rep_i_1\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \cnt_read[0]_rep_rep_i_1\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \cnt_read[1]_i_1\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \cnt_read[1]_rep__0_i_1\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \cnt_read[1]_rep_i_1\ : label is "soft_lutpair107";
  attribute KEEP : string;
  attribute KEEP of \cnt_read_reg[0]\ : label is "yes";
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[0]_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]_rep\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[0]_rep_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]_rep_rep\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[1]\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[1]\ : label is "cnt_read_reg[1]";
  attribute KEEP of \cnt_read_reg[1]_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[1]_rep\ : label is "cnt_read_reg[1]";
  attribute KEEP of \cnt_read_reg[1]_rep__0\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[1]_rep__0\ : label is "cnt_read_reg[1]";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \memory_reg[3][0]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name : string;
  attribute srl_name of \memory_reg[3][0]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][0]_srl4 ";
  attribute SOFT_HLUTNM of \memory_reg[3][0]_srl4_i_5\ : label is "soft_lutpair104";
  attribute srl_bus_name of \memory_reg[3][1]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][1]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][1]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][2]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][2]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][2]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][3]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][3]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][3]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][4]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][4]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][4]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][5]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][5]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][5]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][6]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][6]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][6]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][7]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][7]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][7]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][8]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][8]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][8]_srl4 ";
  attribute SOFT_HLUTNM of \state[0]_i_2\ : label is "soft_lutpair104";
begin
  O1 <= \^o1\;
  O2 <= \^o2\;
  O3 <= \^o3\;
  bresp_push <= \^bresp_push\;
\bresp_cnt[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => areset_d1,
      I1 => \^bresp_push\,
      O => SR(0)
    );
\cnt_read[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => cnt_read_0(0),
      I1 => shandshake_r,
      I2 => b_push,
      O => cnt_read(0)
    );
\cnt_read[0]_rep_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => \^o1\,
      I1 => shandshake_r,
      I2 => b_push,
      O => \n_0_cnt_read[0]_rep_i_1\
    );
\cnt_read[0]_rep_rep_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => \^o3\,
      I1 => shandshake_r,
      I2 => b_push,
      O => \n_0_cnt_read[0]_rep_rep_i_1\
    );
\cnt_read[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DB24"
    )
    port map (
      I0 => \^o3\,
      I1 => shandshake_r,
      I2 => b_push,
      I3 => cnt_read_0(1),
      O => cnt_read(1)
    );
\cnt_read[1]_rep__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DB24"
    )
    port map (
      I0 => \^o1\,
      I1 => shandshake_r,
      I2 => b_push,
      I3 => \^o2\,
      O => \n_0_cnt_read[1]_rep__0_i_1\
    );
\cnt_read[1]_rep_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DB24"
    )
    port map (
      I0 => \^o1\,
      I1 => shandshake_r,
      I2 => b_push,
      I3 => \n_0_cnt_read_reg[1]_rep\,
      O => \n_0_cnt_read[1]_rep_i_1\
    );
\cnt_read_reg[0]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => cnt_read(0),
      Q => cnt_read_0(0),
      S => areset_d1
    );
\cnt_read_reg[0]_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_rep_i_1\,
      Q => \^o1\,
      S => areset_d1
    );
\cnt_read_reg[0]_rep_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_rep_rep_i_1\,
      Q => \^o3\,
      S => areset_d1
    );
\cnt_read_reg[1]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => cnt_read(1),
      Q => cnt_read_0(1),
      S => areset_d1
    );
\cnt_read_reg[1]_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_rep_i_1\,
      Q => \n_0_cnt_read_reg[1]_rep\,
      S => areset_d1
    );
\cnt_read_reg[1]_rep__0\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_rep__0_i_1\,
      Q => \^o2\,
      S => areset_d1
    );
\memory_reg[3][0]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => cnt_read_0(0),
      A1 => \n_0_cnt_read_reg[1]_rep\,
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(0),
      Q => \n_0_memory_reg[3][0]_srl4\
    );
\memory_reg[3][0]_srl4_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"99090000"
    )
    port map (
      I0 => Q(6),
      I1 => \n_0_memory_reg[3][6]_srl4\,
      I2 => \n_0_memory_reg[3][5]_srl4\,
      I3 => Q(5),
      I4 => \n_0_memory_reg[3][0]_srl4_i_2__0\,
      O => \^bresp_push\
    );
\memory_reg[3][0]_srl4_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000808000000000"
    )
    port map (
      I0 => \n_0_memory_reg[3][0]_srl4_i_3\,
      I1 => \n_0_memory_reg[3][0]_srl4_i_4\,
      I2 => \n_0_memory_reg[3][0]_srl4_i_5\,
      I3 => Q(0),
      I4 => \n_0_memory_reg[3][0]_srl4\,
      I5 => \n_0_memory_reg[3][0]_srl4_i_6\,
      O => \n_0_memory_reg[3][0]_srl4_i_2__0\
    );
\memory_reg[3][0]_srl4_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000090099009"
    )
    port map (
      I0 => Q(7),
      I1 => \n_0_memory_reg[3][7]_srl4\,
      I2 => \n_0_memory_reg[3][4]_srl4\,
      I3 => Q(4),
      I4 => Q(2),
      I5 => \n_0_memory_reg[3][2]_srl4\,
      O => \n_0_memory_reg[3][0]_srl4_i_3\
    );
\memory_reg[3][0]_srl4_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD0D0000DD0DDD0D"
    )
    port map (
      I0 => Q(0),
      I1 => \n_0_memory_reg[3][0]_srl4\,
      I2 => Q(5),
      I3 => \n_0_memory_reg[3][5]_srl4\,
      I4 => Q(3),
      I5 => \n_0_memory_reg[3][3]_srl4\,
      O => \n_0_memory_reg[3][0]_srl4_i_4\
    );
\memory_reg[3][0]_srl4_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"70007070"
    )
    port map (
      I0 => \^o1\,
      I1 => \^o2\,
      I2 => mhandshake_r,
      I3 => \n_0_memory_reg[3][1]_srl4\,
      I4 => Q(1),
      O => \n_0_memory_reg[3][0]_srl4_i_5\
    );
\memory_reg[3][0]_srl4_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD0D0000DD0DDD0D"
    )
    port map (
      I0 => Q(3),
      I1 => \n_0_memory_reg[3][3]_srl4\,
      I2 => Q(2),
      I3 => \n_0_memory_reg[3][2]_srl4\,
      I4 => Q(1),
      I5 => \n_0_memory_reg[3][1]_srl4\,
      O => \n_0_memory_reg[3][0]_srl4_i_6\
    );
\memory_reg[3][1]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => cnt_read_0(0),
      A1 => \n_0_cnt_read_reg[1]_rep\,
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(1),
      Q => \n_0_memory_reg[3][1]_srl4\
    );
\memory_reg[3][2]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => cnt_read_0(0),
      A1 => \n_0_cnt_read_reg[1]_rep\,
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(2),
      Q => \n_0_memory_reg[3][2]_srl4\
    );
\memory_reg[3][3]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => cnt_read_0(0),
      A1 => \n_0_cnt_read_reg[1]_rep\,
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(3),
      Q => \n_0_memory_reg[3][3]_srl4\
    );
\memory_reg[3][4]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => cnt_read_0(0),
      A1 => cnt_read_0(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => '0',
      Q => \n_0_memory_reg[3][4]_srl4\
    );
\memory_reg[3][5]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => cnt_read_0(0),
      A1 => cnt_read_0(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => '0',
      Q => \n_0_memory_reg[3][5]_srl4\
    );
\memory_reg[3][6]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => cnt_read_0(0),
      A1 => cnt_read_0(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => '0',
      Q => \n_0_memory_reg[3][6]_srl4\
    );
\memory_reg[3][7]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => cnt_read_0(0),
      A1 => cnt_read_0(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => '0',
      Q => \n_0_memory_reg[3][7]_srl4\
    );
\memory_reg[3][8]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => cnt_read_0(0),
      A1 => cnt_read_0(1),
      A2 => '0',
      A3 => '0',
      CE => b_push,
      CLK => aclk,
      D => \in\(4),
      Q => \out\(0)
    );
\state[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^o2\,
      I1 => \^o1\,
      O => O4
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized0\ is
  port (
    O1 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    mhandshake : out STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    O5 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    I1 : in STD_LOGIC;
    O2 : in STD_LOGIC;
    shandshake_r : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \in\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    mhandshake_r : in STD_LOGIC;
    bresp_push : in STD_LOGIC;
    aclk : in STD_LOGIC;
    areset_d1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized0\ : entity is "axi_protocol_converter_v2_1_b2s_simple_fifo";
end \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized0\;

architecture STRUCTURE of \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized0\ is
  signal cnt_read : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^mhandshake\ : STD_LOGIC;
  signal \n_0_cnt_read[0]_i_1__0\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_i_1__0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_read[0]_i_1__0\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \cnt_read[1]_i_1__0\ : label is "soft_lutpair109";
  attribute KEEP : string;
  attribute KEEP of \cnt_read_reg[0]\ : label is "yes";
  attribute KEEP of \cnt_read_reg[1]\ : label is "yes";
  attribute SOFT_HLUTNM of m_axi_bready_INST_0 : label is "soft_lutpair108";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \memory_reg[3][0]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3] ";
  attribute srl_name : string;
  attribute srl_name of \memory_reg[3][0]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][0]_srl4 ";
  attribute srl_bus_name of \memory_reg[3][1]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3] ";
  attribute srl_name of \memory_reg[3][1]_srl4\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][1]_srl4 ";
  attribute SOFT_HLUTNM of mhandshake_r_i_1 : label is "soft_lutpair108";
begin
  mhandshake <= \^mhandshake\;
bvalid_i_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000777"
    )
    port map (
      I0 => cnt_read(1),
      I1 => cnt_read(0),
      I2 => I1,
      I3 => O2,
      I4 => shandshake_r,
      O => O1
    );
\cnt_read[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => cnt_read(0),
      I1 => shandshake_r,
      I2 => bresp_push,
      O => \n_0_cnt_read[0]_i_1__0\
    );
\cnt_read[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DB24"
    )
    port map (
      I0 => cnt_read(0),
      I1 => shandshake_r,
      I2 => bresp_push,
      I3 => cnt_read(1),
      O => \n_0_cnt_read[1]_i_1__0\
    );
\cnt_read_reg[0]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_i_1__0\,
      Q => cnt_read(0),
      S => areset_d1
    );
\cnt_read_reg[1]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_i_1__0\,
      Q => cnt_read(1),
      S => areset_d1
    );
m_axi_bready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => mhandshake_r,
      I1 => cnt_read(1),
      I2 => cnt_read(0),
      O => m_axi_bready
    );
\memory_reg[3][0]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => cnt_read(0),
      A1 => cnt_read(1),
      A2 => '0',
      A3 => '0',
      CE => bresp_push,
      CLK => aclk,
      D => \in\(0),
      Q => O5(0)
    );
\memory_reg[3][1]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => cnt_read(0),
      A1 => cnt_read(1),
      A2 => '0',
      A3 => '0',
      CE => bresp_push,
      CLK => aclk,
      D => \in\(1),
      Q => O5(1)
    );
mhandshake_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => m_axi_bvalid,
      I1 => cnt_read(0),
      I2 => cnt_read(1),
      I3 => mhandshake_r,
      O => \^mhandshake\
    );
\s_bresp_acc[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"088A0808"
    )
    port map (
      I0 => \^mhandshake\,
      I1 => m_axi_bresp(1),
      I2 => \in\(1),
      I3 => \in\(0),
      I4 => m_axi_bresp(0),
      O => O3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized1\ is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    O3 : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 33 downto 0 );
    si_rs_rready : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    I1 : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 33 downto 0 );
    aclk : in STD_LOGIC;
    areset_d1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized1\ : entity is "axi_protocol_converter_v2_1_b2s_simple_fifo";
end \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized1\;

architecture STRUCTURE of \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized1\ is
  signal \^o1\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal cnt_read : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \n_0_cnt_read[0]_i_1__1\ : STD_LOGIC;
  signal \n_0_cnt_read[0]_rep__0_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[0]_rep__1_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[0]_rep__2_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[0]_rep__2_rep__0_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[0]_rep__2_rep__1_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[0]_rep__2_rep_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[0]_rep__2_rep_rep_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[0]_rep_i_1__0\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_i_1__1\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_rep__0_i_1__0\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_rep__1_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_rep__2_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_rep__3_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_rep__4_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_rep__4_rep_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_rep_i_1__0\ : STD_LOGIC;
  signal \n_0_cnt_read[2]_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[2]_rep__0_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[2]_rep__1_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[2]_rep__2_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[2]_rep__3_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[2]_rep__3_rep_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[2]_rep_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[3]_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[3]_rep__0_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[3]_rep__1_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[3]_rep__2_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[3]_rep__3_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[3]_rep__3_rep_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[3]_rep_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[4]_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[4]_i_2\ : STD_LOGIC;
  signal \n_0_cnt_read[4]_i_3\ : STD_LOGIC;
  signal \n_0_cnt_read[4]_rep__0_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[4]_rep__1_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[4]_rep__2_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[4]_rep__3_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read[4]_rep_i_1\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[0]_rep\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[0]_rep__0\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[0]_rep__1\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[0]_rep__2\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[0]_rep__2_rep\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[0]_rep__2_rep__0\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[0]_rep__2_rep__1\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[0]_rep__2_rep_rep\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[1]_rep\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[1]_rep__0\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[1]_rep__1\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[1]_rep__2\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[1]_rep__3\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[1]_rep__4\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[1]_rep__4_rep\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[2]_rep\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[2]_rep__0\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[2]_rep__1\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[2]_rep__2\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[2]_rep__3\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[2]_rep__3_rep\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[3]_rep\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[3]_rep__0\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[3]_rep__1\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[3]_rep__2\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[3]_rep__3\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[3]_rep__3_rep\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[4]_rep\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[4]_rep__0\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[4]_rep__1\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[4]_rep__2\ : STD_LOGIC;
  signal \n_0_cnt_read_reg[4]_rep__3\ : STD_LOGIC;
  signal wr_en0 : STD_LOGIC;
  signal \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][13]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][14]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][15]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][16]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][17]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][18]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][19]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][20]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][21]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][22]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][23]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][24]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][25]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][26]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][27]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][28]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][29]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][30]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][31]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][32]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][33]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_read[0]_i_1__1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \cnt_read[0]_rep__0_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \cnt_read[0]_rep__1_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \cnt_read[0]_rep__2_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \cnt_read[0]_rep__2_rep__0_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \cnt_read[0]_rep__2_rep__1_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \cnt_read[0]_rep__2_rep_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \cnt_read[0]_rep__2_rep_rep_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cnt_read[0]_rep_i_1__0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \cnt_read[1]_i_1__1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \cnt_read[1]_rep__0_i_1__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \cnt_read[1]_rep__1_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \cnt_read[1]_rep__2_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \cnt_read[1]_rep__3_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \cnt_read[1]_rep__4_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \cnt_read[1]_rep__4_rep_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \cnt_read[1]_rep_i_1__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \cnt_read[2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \cnt_read[2]_rep__2_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cnt_read[2]_rep__3_rep_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \cnt_read[4]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \cnt_read[4]_i_3\ : label is "soft_lutpair14";
  attribute KEEP : string;
  attribute KEEP of \cnt_read_reg[0]\ : label is "yes";
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[0]_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]_rep\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[0]_rep__0\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]_rep__0\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[0]_rep__1\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]_rep__1\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[0]_rep__2\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]_rep__2\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[0]_rep__2_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]_rep__2_rep\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[0]_rep__2_rep__0\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]_rep__2_rep__0\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[0]_rep__2_rep__1\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]_rep__2_rep__1\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[0]_rep__2_rep_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[0]_rep__2_rep_rep\ : label is "cnt_read_reg[0]";
  attribute KEEP of \cnt_read_reg[1]\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[1]\ : label is "cnt_read_reg[1]";
  attribute KEEP of \cnt_read_reg[1]_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[1]_rep\ : label is "cnt_read_reg[1]";
  attribute KEEP of \cnt_read_reg[1]_rep__0\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[1]_rep__0\ : label is "cnt_read_reg[1]";
  attribute KEEP of \cnt_read_reg[1]_rep__1\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[1]_rep__1\ : label is "cnt_read_reg[1]";
  attribute KEEP of \cnt_read_reg[1]_rep__2\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[1]_rep__2\ : label is "cnt_read_reg[1]";
  attribute KEEP of \cnt_read_reg[1]_rep__3\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[1]_rep__3\ : label is "cnt_read_reg[1]";
  attribute KEEP of \cnt_read_reg[1]_rep__4\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[1]_rep__4\ : label is "cnt_read_reg[1]";
  attribute KEEP of \cnt_read_reg[1]_rep__4_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[1]_rep__4_rep\ : label is "cnt_read_reg[1]";
  attribute KEEP of \cnt_read_reg[2]\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[2]\ : label is "cnt_read_reg[2]";
  attribute KEEP of \cnt_read_reg[2]_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[2]_rep\ : label is "cnt_read_reg[2]";
  attribute KEEP of \cnt_read_reg[2]_rep__0\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[2]_rep__0\ : label is "cnt_read_reg[2]";
  attribute KEEP of \cnt_read_reg[2]_rep__1\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[2]_rep__1\ : label is "cnt_read_reg[2]";
  attribute KEEP of \cnt_read_reg[2]_rep__2\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[2]_rep__2\ : label is "cnt_read_reg[2]";
  attribute KEEP of \cnt_read_reg[2]_rep__3\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[2]_rep__3\ : label is "cnt_read_reg[2]";
  attribute KEEP of \cnt_read_reg[2]_rep__3_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[2]_rep__3_rep\ : label is "cnt_read_reg[2]";
  attribute KEEP of \cnt_read_reg[3]\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[3]\ : label is "cnt_read_reg[3]";
  attribute KEEP of \cnt_read_reg[3]_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[3]_rep\ : label is "cnt_read_reg[3]";
  attribute KEEP of \cnt_read_reg[3]_rep__0\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[3]_rep__0\ : label is "cnt_read_reg[3]";
  attribute KEEP of \cnt_read_reg[3]_rep__1\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[3]_rep__1\ : label is "cnt_read_reg[3]";
  attribute KEEP of \cnt_read_reg[3]_rep__2\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[3]_rep__2\ : label is "cnt_read_reg[3]";
  attribute KEEP of \cnt_read_reg[3]_rep__3\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[3]_rep__3\ : label is "cnt_read_reg[3]";
  attribute KEEP of \cnt_read_reg[3]_rep__3_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[3]_rep__3_rep\ : label is "cnt_read_reg[3]";
  attribute KEEP of \cnt_read_reg[4]\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[4]\ : label is "cnt_read_reg[4]";
  attribute KEEP of \cnt_read_reg[4]_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[4]_rep\ : label is "cnt_read_reg[4]";
  attribute KEEP of \cnt_read_reg[4]_rep__0\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[4]_rep__0\ : label is "cnt_read_reg[4]";
  attribute KEEP of \cnt_read_reg[4]_rep__1\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[4]_rep__1\ : label is "cnt_read_reg[4]";
  attribute KEEP of \cnt_read_reg[4]_rep__2\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[4]_rep__2\ : label is "cnt_read_reg[4]";
  attribute KEEP of \cnt_read_reg[4]_rep__3\ : label is "yes";
  attribute ORIG_CELL_NAME of \cnt_read_reg[4]_rep__3\ : label is "cnt_read_reg[4]";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \memory_reg[31][0]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name : string;
  attribute srl_name of \memory_reg[31][0]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][0]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][10]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][10]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][10]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][11]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][11]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][11]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][12]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][12]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][12]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][13]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][13]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][13]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][14]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][14]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][14]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][15]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][15]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][15]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][16]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][16]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][16]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][17]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][17]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][17]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][18]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][18]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][18]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][19]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][19]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][19]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][1]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][1]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][1]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][20]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][20]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][20]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][21]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][21]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][21]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][22]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][22]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][22]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][23]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][23]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][23]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][24]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][24]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][24]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][25]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][25]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][25]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][26]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][26]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][26]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][27]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][27]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][27]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][28]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][28]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][28]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][29]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][29]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][29]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][2]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][2]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][2]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][30]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][30]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][30]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][31]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][31]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][31]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][32]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][32]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][32]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][33]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][33]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][33]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][3]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][3]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][3]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][4]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][4]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][4]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][5]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][5]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][5]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][6]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][6]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][6]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][7]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][7]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][7]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][8]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][8]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][8]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][9]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][9]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][9]_srl32 ";
begin
  O1 <= \^o1\;
  O2 <= \^o2\;
\cnt_read[0]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => cnt_read(0),
      I1 => \^o1\,
      I2 => wr_en0,
      O => \n_0_cnt_read[0]_i_1__1\
    );
\cnt_read[0]_rep__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__0\,
      I1 => \^o1\,
      I2 => wr_en0,
      O => \n_0_cnt_read[0]_rep__0_i_1\
    );
\cnt_read[0]_rep__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__1\,
      I1 => \^o1\,
      I2 => wr_en0,
      O => \n_0_cnt_read[0]_rep__1_i_1\
    );
\cnt_read[0]_rep__2_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2\,
      I1 => \^o1\,
      I2 => wr_en0,
      O => \n_0_cnt_read[0]_rep__2_i_1\
    );
\cnt_read[0]_rep__2_rep__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep__0\,
      I1 => \^o1\,
      I2 => wr_en0,
      O => \n_0_cnt_read[0]_rep__2_rep__0_i_1\
    );
\cnt_read[0]_rep__2_rep__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep__1\,
      I1 => \^o1\,
      I2 => wr_en0,
      O => \n_0_cnt_read[0]_rep__2_rep__1_i_1\
    );
\cnt_read[0]_rep__2_rep_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep\,
      I1 => \^o1\,
      I2 => wr_en0,
      O => \n_0_cnt_read[0]_rep__2_rep_i_1\
    );
\cnt_read[0]_rep__2_rep_rep_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep_rep\,
      I1 => \^o1\,
      I2 => wr_en0,
      O => \n_0_cnt_read[0]_rep__2_rep_rep_i_1\
    );
\cnt_read[0]_rep_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep\,
      I1 => \^o1\,
      I2 => wr_en0,
      O => \n_0_cnt_read[0]_rep_i_1__0\
    );
\cnt_read[1]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7E81"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep__0\,
      I1 => wr_en0,
      I2 => \^o1\,
      I3 => cnt_read(1),
      O => \n_0_cnt_read[1]_i_1__1\
    );
\cnt_read[1]_rep__0_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7E81"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep_rep\,
      I1 => wr_en0,
      I2 => \^o1\,
      I3 => \n_0_cnt_read_reg[1]_rep__0\,
      O => \n_0_cnt_read[1]_rep__0_i_1__0\
    );
\cnt_read[1]_rep__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7E81"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep_rep\,
      I1 => wr_en0,
      I2 => \^o1\,
      I3 => \n_0_cnt_read_reg[1]_rep__1\,
      O => \n_0_cnt_read[1]_rep__1_i_1\
    );
\cnt_read[1]_rep__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7E81"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep__1\,
      I1 => wr_en0,
      I2 => \^o1\,
      I3 => \n_0_cnt_read_reg[1]_rep__2\,
      O => \n_0_cnt_read[1]_rep__2_i_1\
    );
\cnt_read[1]_rep__3_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7E81"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep__1\,
      I1 => wr_en0,
      I2 => \^o1\,
      I3 => \n_0_cnt_read_reg[1]_rep__3\,
      O => \n_0_cnt_read[1]_rep__3_i_1\
    );
\cnt_read[1]_rep__4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7E81"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep__1\,
      I1 => wr_en0,
      I2 => \^o1\,
      I3 => \n_0_cnt_read_reg[1]_rep__4\,
      O => \n_0_cnt_read[1]_rep__4_i_1\
    );
\cnt_read[1]_rep__4_rep_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7E81"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2\,
      I1 => wr_en0,
      I2 => \^o1\,
      I3 => \n_0_cnt_read_reg[1]_rep__4_rep\,
      O => \n_0_cnt_read[1]_rep__4_rep_i_1\
    );
\cnt_read[1]_rep_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7E81"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep_rep\,
      I1 => wr_en0,
      I2 => \^o1\,
      I3 => \n_0_cnt_read_reg[1]_rep\,
      O => \n_0_cnt_read[1]_rep_i_1__0\
    );
\cnt_read[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFE8001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__3\,
      I1 => \n_0_cnt_read_reg[0]_rep__2_rep__0\,
      I2 => wr_en0,
      I3 => \^o1\,
      I4 => cnt_read(2),
      O => \n_0_cnt_read[2]_i_1\
    );
\cnt_read[2]_rep__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFE8001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__3\,
      I1 => \n_0_cnt_read_reg[0]_rep__2_rep\,
      I2 => wr_en0,
      I3 => \^o1\,
      I4 => \n_0_cnt_read_reg[2]_rep__0\,
      O => \n_0_cnt_read[2]_rep__0_i_1\
    );
\cnt_read[2]_rep__1_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFE8001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__3\,
      I1 => \n_0_cnt_read_reg[0]_rep__2_rep\,
      I2 => wr_en0,
      I3 => \^o1\,
      I4 => \n_0_cnt_read_reg[2]_rep__1\,
      O => \n_0_cnt_read[2]_rep__1_i_1\
    );
\cnt_read[2]_rep__2_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFE8001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__3\,
      I1 => \n_0_cnt_read_reg[0]_rep__2_rep_rep\,
      I2 => wr_en0,
      I3 => \^o1\,
      I4 => \n_0_cnt_read_reg[2]_rep__2\,
      O => \n_0_cnt_read[2]_rep__2_i_1\
    );
\cnt_read[2]_rep__3_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFE8001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__3\,
      I1 => \n_0_cnt_read_reg[0]_rep__2_rep_rep\,
      I2 => wr_en0,
      I3 => \^o1\,
      I4 => \n_0_cnt_read_reg[2]_rep__3\,
      O => \n_0_cnt_read[2]_rep__3_i_1\
    );
\cnt_read[2]_rep__3_rep_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFE8001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__3\,
      I1 => \n_0_cnt_read_reg[0]_rep__2_rep\,
      I2 => wr_en0,
      I3 => \^o1\,
      I4 => \n_0_cnt_read_reg[2]_rep__3_rep\,
      O => \n_0_cnt_read[2]_rep__3_rep_i_1\
    );
\cnt_read[2]_rep_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFE8001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__3\,
      I1 => \n_0_cnt_read_reg[0]_rep__2_rep\,
      I2 => wr_en0,
      I3 => \^o1\,
      I4 => \n_0_cnt_read_reg[2]_rep\,
      O => \n_0_cnt_read[2]_rep_i_1\
    );
\cnt_read[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FFFE0001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__4_rep\,
      I1 => \^o1\,
      I2 => wr_en0,
      I3 => \n_0_cnt_read_reg[0]_rep__2_rep__0\,
      I4 => cnt_read(3),
      I5 => \n_0_cnt_read_reg[2]_rep__3_rep\,
      O => \n_0_cnt_read[3]_i_1\
    );
\cnt_read[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => \^o2\,
      I1 => si_rs_rready,
      O => \^o1\
    );
\cnt_read[3]_rep__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FFFE0001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__4\,
      I1 => \^o1\,
      I2 => wr_en0,
      I3 => \n_0_cnt_read_reg[0]_rep__2_rep__1\,
      I4 => \n_0_cnt_read_reg[3]_rep__0\,
      I5 => \n_0_cnt_read_reg[2]_rep__3_rep\,
      O => \n_0_cnt_read[3]_rep__0_i_1\
    );
\cnt_read[3]_rep__1_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FFFE0001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__4\,
      I1 => \^o1\,
      I2 => wr_en0,
      I3 => \n_0_cnt_read_reg[0]_rep__2\,
      I4 => \n_0_cnt_read_reg[3]_rep__1\,
      I5 => \n_0_cnt_read_reg[2]_rep__3\,
      O => \n_0_cnt_read[3]_rep__1_i_1\
    );
\cnt_read[3]_rep__2_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FFFE0001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__4\,
      I1 => \^o1\,
      I2 => wr_en0,
      I3 => \n_0_cnt_read_reg[0]_rep__2\,
      I4 => \n_0_cnt_read_reg[3]_rep__2\,
      I5 => \n_0_cnt_read_reg[2]_rep__3\,
      O => \n_0_cnt_read[3]_rep__2_i_1\
    );
\cnt_read[3]_rep__3_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FFFE0001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__4\,
      I1 => \^o1\,
      I2 => wr_en0,
      I3 => \n_0_cnt_read_reg[0]_rep__2\,
      I4 => \n_0_cnt_read_reg[3]_rep__3\,
      I5 => \n_0_cnt_read_reg[2]_rep__3\,
      O => \n_0_cnt_read[3]_rep__3_i_1\
    );
\cnt_read[3]_rep__3_rep_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FFFE0001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__4\,
      I1 => \^o1\,
      I2 => wr_en0,
      I3 => \n_0_cnt_read_reg[0]_rep__2\,
      I4 => \n_0_cnt_read_reg[3]_rep__3_rep\,
      I5 => \n_0_cnt_read_reg[2]_rep__3\,
      O => \n_0_cnt_read[3]_rep__3_rep_i_1\
    );
\cnt_read[3]_rep_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FFFE0001"
    )
    port map (
      I0 => \n_0_cnt_read_reg[1]_rep__4\,
      I1 => \^o1\,
      I2 => wr_en0,
      I3 => \n_0_cnt_read_reg[0]_rep__2_rep__1\,
      I4 => \n_0_cnt_read_reg[3]_rep\,
      I5 => \n_0_cnt_read_reg[2]_rep__3_rep\,
      O => \n_0_cnt_read[3]_rep_i_1\
    );
\cnt_read[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAA9AA6"
    )
    port map (
      I0 => cnt_read(4),
      I1 => \n_0_cnt_read[4]_i_2\,
      I2 => \n_0_cnt_read_reg[3]_rep__3_rep\,
      I3 => \n_0_cnt_read_reg[2]_rep__3_rep\,
      I4 => \n_0_cnt_read[4]_i_3\,
      O => \n_0_cnt_read[4]_i_1\
    );
\cnt_read[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4FFFFFFF"
    )
    port map (
      I0 => \^o2\,
      I1 => si_rs_rready,
      I2 => wr_en0,
      I3 => \n_0_cnt_read_reg[0]_rep__2_rep__0\,
      I4 => \n_0_cnt_read_reg[1]_rep__4_rep\,
      O => \n_0_cnt_read[4]_i_2\
    );
\cnt_read[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFEF"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep__0\,
      I1 => wr_en0,
      I2 => si_rs_rready,
      I3 => \^o2\,
      I4 => \n_0_cnt_read_reg[1]_rep__4_rep\,
      O => \n_0_cnt_read[4]_i_3\
    );
\cnt_read[4]_rep__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAA9AA6"
    )
    port map (
      I0 => \n_0_cnt_read_reg[4]_rep__0\,
      I1 => \n_0_cnt_read[4]_i_2\,
      I2 => \n_0_cnt_read_reg[3]_rep__3\,
      I3 => \n_0_cnt_read_reg[2]_rep__3\,
      I4 => \n_0_cnt_read[4]_i_3\,
      O => \n_0_cnt_read[4]_rep__0_i_1\
    );
\cnt_read[4]_rep__1_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAA9AA6"
    )
    port map (
      I0 => \n_0_cnt_read_reg[4]_rep__1\,
      I1 => \n_0_cnt_read[4]_i_2\,
      I2 => \n_0_cnt_read_reg[3]_rep__3\,
      I3 => \n_0_cnt_read_reg[2]_rep__3\,
      I4 => \n_0_cnt_read[4]_i_3\,
      O => \n_0_cnt_read[4]_rep__1_i_1\
    );
\cnt_read[4]_rep__2_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAA9AA6"
    )
    port map (
      I0 => \n_0_cnt_read_reg[4]_rep__2\,
      I1 => \n_0_cnt_read[4]_i_2\,
      I2 => \n_0_cnt_read_reg[3]_rep__3\,
      I3 => \n_0_cnt_read_reg[2]_rep__3\,
      I4 => \n_0_cnt_read[4]_i_3\,
      O => \n_0_cnt_read[4]_rep__2_i_1\
    );
\cnt_read[4]_rep__3_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAA9AA6"
    )
    port map (
      I0 => \n_0_cnt_read_reg[4]_rep__3\,
      I1 => \n_0_cnt_read[4]_i_2\,
      I2 => \n_0_cnt_read_reg[3]_rep__3\,
      I3 => \n_0_cnt_read_reg[2]_rep__3\,
      I4 => \n_0_cnt_read[4]_i_3\,
      O => \n_0_cnt_read[4]_rep__3_i_1\
    );
\cnt_read[4]_rep_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAA9AA6"
    )
    port map (
      I0 => \n_0_cnt_read_reg[4]_rep\,
      I1 => \n_0_cnt_read[4]_i_2\,
      I2 => \n_0_cnt_read_reg[3]_rep__3\,
      I3 => \n_0_cnt_read_reg[2]_rep__3\,
      I4 => \n_0_cnt_read[4]_i_3\,
      O => \n_0_cnt_read[4]_rep_i_1\
    );
\cnt_read_reg[0]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_i_1__1\,
      Q => cnt_read(0),
      S => areset_d1
    );
\cnt_read_reg[0]_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_rep_i_1__0\,
      Q => \n_0_cnt_read_reg[0]_rep\,
      S => areset_d1
    );
\cnt_read_reg[0]_rep__0\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_rep__0_i_1\,
      Q => \n_0_cnt_read_reg[0]_rep__0\,
      S => areset_d1
    );
\cnt_read_reg[0]_rep__1\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_rep__1_i_1\,
      Q => \n_0_cnt_read_reg[0]_rep__1\,
      S => areset_d1
    );
\cnt_read_reg[0]_rep__2\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_rep__2_i_1\,
      Q => \n_0_cnt_read_reg[0]_rep__2\,
      S => areset_d1
    );
\cnt_read_reg[0]_rep__2_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_rep__2_rep_i_1\,
      Q => \n_0_cnt_read_reg[0]_rep__2_rep\,
      S => areset_d1
    );
\cnt_read_reg[0]_rep__2_rep__0\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_rep__2_rep__0_i_1\,
      Q => \n_0_cnt_read_reg[0]_rep__2_rep__0\,
      S => areset_d1
    );
\cnt_read_reg[0]_rep__2_rep__1\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_rep__2_rep__1_i_1\,
      Q => \n_0_cnt_read_reg[0]_rep__2_rep__1\,
      S => areset_d1
    );
\cnt_read_reg[0]_rep__2_rep_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_rep__2_rep_rep_i_1\,
      Q => \n_0_cnt_read_reg[0]_rep__2_rep_rep\,
      S => areset_d1
    );
\cnt_read_reg[1]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_i_1__1\,
      Q => cnt_read(1),
      S => areset_d1
    );
\cnt_read_reg[1]_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_rep_i_1__0\,
      Q => \n_0_cnt_read_reg[1]_rep\,
      S => areset_d1
    );
\cnt_read_reg[1]_rep__0\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_rep__0_i_1__0\,
      Q => \n_0_cnt_read_reg[1]_rep__0\,
      S => areset_d1
    );
\cnt_read_reg[1]_rep__1\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_rep__1_i_1\,
      Q => \n_0_cnt_read_reg[1]_rep__1\,
      S => areset_d1
    );
\cnt_read_reg[1]_rep__2\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_rep__2_i_1\,
      Q => \n_0_cnt_read_reg[1]_rep__2\,
      S => areset_d1
    );
\cnt_read_reg[1]_rep__3\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_rep__3_i_1\,
      Q => \n_0_cnt_read_reg[1]_rep__3\,
      S => areset_d1
    );
\cnt_read_reg[1]_rep__4\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_rep__4_i_1\,
      Q => \n_0_cnt_read_reg[1]_rep__4\,
      S => areset_d1
    );
\cnt_read_reg[1]_rep__4_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_rep__4_rep_i_1\,
      Q => \n_0_cnt_read_reg[1]_rep__4_rep\,
      S => areset_d1
    );
\cnt_read_reg[2]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[2]_i_1\,
      Q => cnt_read(2),
      S => areset_d1
    );
\cnt_read_reg[2]_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[2]_rep_i_1\,
      Q => \n_0_cnt_read_reg[2]_rep\,
      S => areset_d1
    );
\cnt_read_reg[2]_rep__0\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[2]_rep__0_i_1\,
      Q => \n_0_cnt_read_reg[2]_rep__0\,
      S => areset_d1
    );
\cnt_read_reg[2]_rep__1\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[2]_rep__1_i_1\,
      Q => \n_0_cnt_read_reg[2]_rep__1\,
      S => areset_d1
    );
\cnt_read_reg[2]_rep__2\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[2]_rep__2_i_1\,
      Q => \n_0_cnt_read_reg[2]_rep__2\,
      S => areset_d1
    );
\cnt_read_reg[2]_rep__3\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[2]_rep__3_i_1\,
      Q => \n_0_cnt_read_reg[2]_rep__3\,
      S => areset_d1
    );
\cnt_read_reg[2]_rep__3_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[2]_rep__3_rep_i_1\,
      Q => \n_0_cnt_read_reg[2]_rep__3_rep\,
      S => areset_d1
    );
\cnt_read_reg[3]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[3]_i_1\,
      Q => cnt_read(3),
      S => areset_d1
    );
\cnt_read_reg[3]_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[3]_rep_i_1\,
      Q => \n_0_cnt_read_reg[3]_rep\,
      S => areset_d1
    );
\cnt_read_reg[3]_rep__0\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[3]_rep__0_i_1\,
      Q => \n_0_cnt_read_reg[3]_rep__0\,
      S => areset_d1
    );
\cnt_read_reg[3]_rep__1\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[3]_rep__1_i_1\,
      Q => \n_0_cnt_read_reg[3]_rep__1\,
      S => areset_d1
    );
\cnt_read_reg[3]_rep__2\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[3]_rep__2_i_1\,
      Q => \n_0_cnt_read_reg[3]_rep__2\,
      S => areset_d1
    );
\cnt_read_reg[3]_rep__3\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[3]_rep__3_i_1\,
      Q => \n_0_cnt_read_reg[3]_rep__3\,
      S => areset_d1
    );
\cnt_read_reg[3]_rep__3_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[3]_rep__3_rep_i_1\,
      Q => \n_0_cnt_read_reg[3]_rep__3_rep\,
      S => areset_d1
    );
\cnt_read_reg[4]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[4]_i_1\,
      Q => cnt_read(4),
      S => areset_d1
    );
\cnt_read_reg[4]_rep\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[4]_rep_i_1\,
      Q => \n_0_cnt_read_reg[4]_rep\,
      S => areset_d1
    );
\cnt_read_reg[4]_rep__0\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[4]_rep__0_i_1\,
      Q => \n_0_cnt_read_reg[4]_rep__0\,
      S => areset_d1
    );
\cnt_read_reg[4]_rep__1\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[4]_rep__1_i_1\,
      Q => \n_0_cnt_read_reg[4]_rep__1\,
      S => areset_d1
    );
\cnt_read_reg[4]_rep__2\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[4]_rep__2_i_1\,
      Q => \n_0_cnt_read_reg[4]_rep__2\,
      S => areset_d1
    );
\cnt_read_reg[4]_rep__3\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[4]_rep__3_i_1\,
      Q => \n_0_cnt_read_reg[4]_rep__3\,
      S => areset_d1
    );
m_axi_rready_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F77F777F"
    )
    port map (
      I0 => \n_0_cnt_read_reg[4]_rep__3\,
      I1 => \n_0_cnt_read_reg[3]_rep__3_rep\,
      I2 => \n_0_cnt_read_reg[1]_rep__3\,
      I3 => \n_0_cnt_read_reg[2]_rep__3_rep\,
      I4 => \n_0_cnt_read_reg[0]_rep__2_rep__0\,
      O => m_axi_rready
    );
m_valid_i_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF80000000"
    )
    port map (
      I0 => \n_0_cnt_read_reg[3]_rep__3_rep\,
      I1 => \n_0_cnt_read_reg[4]_rep__3\,
      I2 => \n_0_cnt_read_reg[1]_rep__4\,
      I3 => \n_0_cnt_read_reg[2]_rep__3_rep\,
      I4 => \n_0_cnt_read_reg[0]_rep__2_rep\,
      I5 => I1,
      O => \^o2\
    );
\memory_reg[31][0]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__2\,
      A(3) => \n_0_cnt_read_reg[3]_rep__2\,
      A(2) => \n_0_cnt_read_reg[2]_rep__2\,
      A(1) => \n_0_cnt_read_reg[1]_rep__2\,
      A(0) => \n_0_cnt_read_reg[0]_rep__1\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(0),
      Q => \out\(0),
      Q31 => \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][0]_srl32_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA2A2AAA2A2A2AAA"
    )
    port map (
      I0 => m_axi_rvalid,
      I1 => \n_0_cnt_read_reg[4]_rep__3\,
      I2 => \n_0_cnt_read_reg[3]_rep__3_rep\,
      I3 => \n_0_cnt_read_reg[1]_rep__4_rep\,
      I4 => \n_0_cnt_read_reg[2]_rep__3_rep\,
      I5 => \n_0_cnt_read_reg[0]_rep__2_rep__0\,
      O => wr_en0
    );
\memory_reg[31][10]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__1\,
      A(3) => \n_0_cnt_read_reg[3]_rep__1\,
      A(2) => \n_0_cnt_read_reg[2]_rep__1\,
      A(1) => \n_0_cnt_read_reg[1]_rep__1\,
      A(0) => \n_0_cnt_read_reg[0]_rep__0\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(10),
      Q => \out\(10),
      Q31 => \NLW_memory_reg[31][10]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][11]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__1\,
      A(3) => \n_0_cnt_read_reg[3]_rep__1\,
      A(2) => \n_0_cnt_read_reg[2]_rep__1\,
      A(1) => \n_0_cnt_read_reg[1]_rep__1\,
      A(0) => \n_0_cnt_read_reg[0]_rep__0\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(11),
      Q => \out\(11),
      Q31 => \NLW_memory_reg[31][11]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][12]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__1\,
      A(3) => \n_0_cnt_read_reg[3]_rep__1\,
      A(2) => \n_0_cnt_read_reg[2]_rep__1\,
      A(1) => \n_0_cnt_read_reg[1]_rep__1\,
      A(0) => \n_0_cnt_read_reg[0]_rep__0\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(12),
      Q => \out\(12),
      Q31 => \NLW_memory_reg[31][12]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][13]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__0\,
      A(3) => \n_0_cnt_read_reg[3]_rep__0\,
      A(2) => \n_0_cnt_read_reg[2]_rep__0\,
      A(1) => \n_0_cnt_read_reg[1]_rep__0\,
      A(0) => \n_0_cnt_read_reg[0]_rep__0\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(13),
      Q => \out\(13),
      Q31 => \NLW_memory_reg[31][13]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][14]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__0\,
      A(3) => \n_0_cnt_read_reg[3]_rep__0\,
      A(2) => \n_0_cnt_read_reg[2]_rep__0\,
      A(1) => \n_0_cnt_read_reg[1]_rep__0\,
      A(0) => \n_0_cnt_read_reg[0]_rep__0\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(14),
      Q => \out\(14),
      Q31 => \NLW_memory_reg[31][14]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][15]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__0\,
      A(3) => \n_0_cnt_read_reg[3]_rep__0\,
      A(2) => \n_0_cnt_read_reg[2]_rep__0\,
      A(1) => \n_0_cnt_read_reg[1]_rep__0\,
      A(0) => \n_0_cnt_read_reg[0]_rep__0\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(15),
      Q => \out\(15),
      Q31 => \NLW_memory_reg[31][15]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][16]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__0\,
      A(3) => \n_0_cnt_read_reg[3]_rep__0\,
      A(2) => \n_0_cnt_read_reg[2]_rep__0\,
      A(1) => \n_0_cnt_read_reg[1]_rep__0\,
      A(0) => \n_0_cnt_read_reg[0]_rep\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(16),
      Q => \out\(16),
      Q31 => \NLW_memory_reg[31][16]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][17]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__0\,
      A(3) => \n_0_cnt_read_reg[3]_rep__0\,
      A(2) => \n_0_cnt_read_reg[2]_rep__0\,
      A(1) => \n_0_cnt_read_reg[1]_rep__0\,
      A(0) => \n_0_cnt_read_reg[0]_rep\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(17),
      Q => \out\(17),
      Q31 => \NLW_memory_reg[31][17]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][18]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__0\,
      A(3) => \n_0_cnt_read_reg[3]_rep__0\,
      A(2) => \n_0_cnt_read_reg[2]_rep__0\,
      A(1) => \n_0_cnt_read_reg[1]_rep__0\,
      A(0) => \n_0_cnt_read_reg[0]_rep\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(18),
      Q => \out\(18),
      Q31 => \NLW_memory_reg[31][18]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][19]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__0\,
      A(3) => \n_0_cnt_read_reg[3]_rep__0\,
      A(2) => \n_0_cnt_read_reg[2]_rep__0\,
      A(1) => \n_0_cnt_read_reg[1]_rep__0\,
      A(0) => \n_0_cnt_read_reg[0]_rep\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(19),
      Q => \out\(19),
      Q31 => \NLW_memory_reg[31][19]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][1]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__2\,
      A(3) => \n_0_cnt_read_reg[3]_rep__2\,
      A(2) => \n_0_cnt_read_reg[2]_rep__2\,
      A(1) => \n_0_cnt_read_reg[1]_rep__2\,
      A(0) => \n_0_cnt_read_reg[0]_rep__1\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(1),
      Q => \out\(1),
      Q31 => \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][20]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep\,
      A(3) => \n_0_cnt_read_reg[3]_rep\,
      A(2) => \n_0_cnt_read_reg[2]_rep\,
      A(1) => \n_0_cnt_read_reg[1]_rep\,
      A(0) => \n_0_cnt_read_reg[0]_rep\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(20),
      Q => \out\(20),
      Q31 => \NLW_memory_reg[31][20]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][21]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep\,
      A(3) => \n_0_cnt_read_reg[3]_rep\,
      A(2) => \n_0_cnt_read_reg[2]_rep\,
      A(1) => \n_0_cnt_read_reg[1]_rep\,
      A(0) => \n_0_cnt_read_reg[0]_rep\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(21),
      Q => \out\(21),
      Q31 => \NLW_memory_reg[31][21]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][22]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep\,
      A(3) => \n_0_cnt_read_reg[3]_rep\,
      A(2) => \n_0_cnt_read_reg[2]_rep\,
      A(1) => \n_0_cnt_read_reg[1]_rep\,
      A(0) => \n_0_cnt_read_reg[0]_rep\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(22),
      Q => \out\(22),
      Q31 => \NLW_memory_reg[31][22]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][23]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep\,
      A(3) => \n_0_cnt_read_reg[3]_rep\,
      A(2) => \n_0_cnt_read_reg[2]_rep\,
      A(1) => \n_0_cnt_read_reg[1]_rep\,
      A(0) => \n_0_cnt_read_reg[0]_rep\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(23),
      Q => \out\(23),
      Q31 => \NLW_memory_reg[31][23]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][24]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep\,
      A(3) => \n_0_cnt_read_reg[3]_rep\,
      A(2) => \n_0_cnt_read_reg[2]_rep\,
      A(1) => \n_0_cnt_read_reg[1]_rep\,
      A(0) => \n_0_cnt_read_reg[0]_rep\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(24),
      Q => \out\(24),
      Q31 => \NLW_memory_reg[31][24]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][25]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep\,
      A(3) => \n_0_cnt_read_reg[3]_rep\,
      A(2) => \n_0_cnt_read_reg[2]_rep\,
      A(1) => \n_0_cnt_read_reg[1]_rep\,
      A(0) => cnt_read(0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(25),
      Q => \out\(25),
      Q31 => \NLW_memory_reg[31][25]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][26]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep\,
      A(3) => \n_0_cnt_read_reg[3]_rep\,
      A(2) => \n_0_cnt_read_reg[2]_rep\,
      A(1) => \n_0_cnt_read_reg[1]_rep\,
      A(0) => cnt_read(0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(26),
      Q => \out\(26),
      Q31 => \NLW_memory_reg[31][26]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][27]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4 downto 0) => cnt_read(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(27),
      Q => \out\(27),
      Q31 => \NLW_memory_reg[31][27]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][28]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4 downto 0) => cnt_read(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(28),
      Q => \out\(28),
      Q31 => \NLW_memory_reg[31][28]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][29]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4 downto 0) => cnt_read(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(29),
      Q => \out\(29),
      Q31 => \NLW_memory_reg[31][29]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][2]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__2\,
      A(3) => \n_0_cnt_read_reg[3]_rep__2\,
      A(2) => \n_0_cnt_read_reg[2]_rep__2\,
      A(1) => \n_0_cnt_read_reg[1]_rep__2\,
      A(0) => \n_0_cnt_read_reg[0]_rep__1\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(2),
      Q => \out\(2),
      Q31 => \NLW_memory_reg[31][2]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][30]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4 downto 0) => cnt_read(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(30),
      Q => \out\(30),
      Q31 => \NLW_memory_reg[31][30]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][31]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4 downto 0) => cnt_read(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(31),
      Q => \out\(31),
      Q31 => \NLW_memory_reg[31][31]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][32]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4 downto 0) => cnt_read(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(32),
      Q => \out\(32),
      Q31 => \NLW_memory_reg[31][32]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][33]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4 downto 0) => cnt_read(4 downto 0),
      CE => wr_en0,
      CLK => aclk,
      D => \in\(33),
      Q => \out\(33),
      Q31 => \NLW_memory_reg[31][33]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][3]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__2\,
      A(3) => \n_0_cnt_read_reg[3]_rep__2\,
      A(2) => \n_0_cnt_read_reg[2]_rep__2\,
      A(1) => \n_0_cnt_read_reg[1]_rep__2\,
      A(0) => \n_0_cnt_read_reg[0]_rep__1\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(3),
      Q => \out\(3),
      Q31 => \NLW_memory_reg[31][3]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][4]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__2\,
      A(3) => \n_0_cnt_read_reg[3]_rep__2\,
      A(2) => \n_0_cnt_read_reg[2]_rep__2\,
      A(1) => \n_0_cnt_read_reg[1]_rep__2\,
      A(0) => \n_0_cnt_read_reg[0]_rep__1\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(4),
      Q => \out\(4),
      Q31 => \NLW_memory_reg[31][4]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][5]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__2\,
      A(3) => \n_0_cnt_read_reg[3]_rep__2\,
      A(2) => \n_0_cnt_read_reg[2]_rep__2\,
      A(1) => \n_0_cnt_read_reg[1]_rep__2\,
      A(0) => \n_0_cnt_read_reg[0]_rep__1\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(5),
      Q => \out\(5),
      Q31 => \NLW_memory_reg[31][5]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][6]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__1\,
      A(3) => \n_0_cnt_read_reg[3]_rep__1\,
      A(2) => \n_0_cnt_read_reg[2]_rep__1\,
      A(1) => \n_0_cnt_read_reg[1]_rep__1\,
      A(0) => \n_0_cnt_read_reg[0]_rep__1\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(6),
      Q => \out\(6),
      Q31 => \NLW_memory_reg[31][6]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][7]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__1\,
      A(3) => \n_0_cnt_read_reg[3]_rep__1\,
      A(2) => \n_0_cnt_read_reg[2]_rep__1\,
      A(1) => \n_0_cnt_read_reg[1]_rep__1\,
      A(0) => \n_0_cnt_read_reg[0]_rep__0\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(7),
      Q => \out\(7),
      Q31 => \NLW_memory_reg[31][7]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][8]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__1\,
      A(3) => \n_0_cnt_read_reg[3]_rep__1\,
      A(2) => \n_0_cnt_read_reg[2]_rep__1\,
      A(1) => \n_0_cnt_read_reg[1]_rep__1\,
      A(0) => \n_0_cnt_read_reg[0]_rep__0\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(8),
      Q => \out\(8),
      Q31 => \NLW_memory_reg[31][8]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][9]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4) => \n_0_cnt_read_reg[4]_rep__1\,
      A(3) => \n_0_cnt_read_reg[3]_rep__1\,
      A(2) => \n_0_cnt_read_reg[2]_rep__1\,
      A(1) => \n_0_cnt_read_reg[1]_rep__1\,
      A(0) => \n_0_cnt_read_reg[0]_rep__0\,
      CE => wr_en0,
      CLK => aclk,
      D => \in\(9),
      Q => \out\(9),
      Q31 => \NLW_memory_reg[31][9]_srl32_Q31_UNCONNECTED\
    );
\state[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7C000000"
    )
    port map (
      I0 => \n_0_cnt_read_reg[0]_rep__2_rep__0\,
      I1 => \n_0_cnt_read_reg[2]_rep__3_rep\,
      I2 => \n_0_cnt_read_reg[1]_rep__4_rep\,
      I3 => \n_0_cnt_read_reg[3]_rep__3_rep\,
      I4 => \n_0_cnt_read_reg[4]_rep__3\,
      O => O3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized2\ is
  port (
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    I1 : in STD_LOGIC;
    r_push_r : in STD_LOGIC;
    I2 : in STD_LOGIC;
    O1 : in STD_LOGIC;
    si_rs_rready : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    aclk : in STD_LOGIC;
    areset_d1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized2\ : entity is "axi_protocol_converter_v2_1_b2s_simple_fifo";
end \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized2\;

architecture STRUCTURE of \axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized2\ is
  signal cnt_read : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \n_0_cnt_read[0]_i_1__2\ : STD_LOGIC;
  signal \n_0_cnt_read[1]_i_1__2\ : STD_LOGIC;
  signal \n_0_cnt_read[2]_i_1__0\ : STD_LOGIC;
  signal \n_0_cnt_read[3]_i_1__0\ : STD_LOGIC;
  signal \n_0_cnt_read[4]_i_1__0\ : STD_LOGIC;
  signal \n_0_cnt_read[4]_i_2__0\ : STD_LOGIC;
  signal \n_0_cnt_read[4]_i_3__0\ : STD_LOGIC;
  signal \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_read[1]_i_1__2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \cnt_read[2]_i_1__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \cnt_read[4]_i_2__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \cnt_read[4]_i_3__0\ : label is "soft_lutpair23";
  attribute KEEP : string;
  attribute KEEP of \cnt_read_reg[0]\ : label is "yes";
  attribute KEEP of \cnt_read_reg[1]\ : label is "yes";
  attribute KEEP of \cnt_read_reg[2]\ : label is "yes";
  attribute KEEP of \cnt_read_reg[3]\ : label is "yes";
  attribute KEEP of \cnt_read_reg[4]\ : label is "yes";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \memory_reg[31][0]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name : string;
  attribute srl_name of \memory_reg[31][0]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][0]_srl32 ";
  attribute srl_bus_name of \memory_reg[31][1]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31] ";
  attribute srl_name of \memory_reg[31][1]_srl32\ : label is "inst/\gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][1]_srl32 ";
begin
\cnt_read[0]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => cnt_read(0),
      I1 => I1,
      I2 => r_push_r,
      O => \n_0_cnt_read[0]_i_1__2\
    );
\cnt_read[1]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7E81"
    )
    port map (
      I0 => cnt_read(0),
      I1 => r_push_r,
      I2 => I1,
      I3 => cnt_read(1),
      O => \n_0_cnt_read[1]_i_1__2\
    );
\cnt_read[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFE8001"
    )
    port map (
      I0 => cnt_read(1),
      I1 => cnt_read(0),
      I2 => r_push_r,
      I3 => I1,
      I4 => cnt_read(2),
      O => \n_0_cnt_read[2]_i_1__0\
    );
\cnt_read[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FFFE0001"
    )
    port map (
      I0 => cnt_read(1),
      I1 => I1,
      I2 => r_push_r,
      I3 => cnt_read(0),
      I4 => cnt_read(3),
      I5 => cnt_read(2),
      O => \n_0_cnt_read[3]_i_1__0\
    );
\cnt_read[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAA9AA6"
    )
    port map (
      I0 => cnt_read(4),
      I1 => \n_0_cnt_read[4]_i_2__0\,
      I2 => cnt_read(3),
      I3 => cnt_read(2),
      I4 => \n_0_cnt_read[4]_i_3__0\,
      O => \n_0_cnt_read[4]_i_1__0\
    );
\cnt_read[4]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4FFFFFFF"
    )
    port map (
      I0 => O1,
      I1 => si_rs_rready,
      I2 => r_push_r,
      I3 => cnt_read(0),
      I4 => cnt_read(1),
      O => \n_0_cnt_read[4]_i_2__0\
    );
\cnt_read[4]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFEF"
    )
    port map (
      I0 => cnt_read(0),
      I1 => r_push_r,
      I2 => si_rs_rready,
      I3 => O1,
      I4 => cnt_read(1),
      O => \n_0_cnt_read[4]_i_3__0\
    );
\cnt_read_reg[0]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[0]_i_1__2\,
      Q => cnt_read(0),
      S => areset_d1
    );
\cnt_read_reg[1]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[1]_i_1__2\,
      Q => cnt_read(1),
      S => areset_d1
    );
\cnt_read_reg[2]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[2]_i_1__0\,
      Q => cnt_read(2),
      S => areset_d1
    );
\cnt_read_reg[3]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[3]_i_1__0\,
      Q => cnt_read(3),
      S => areset_d1
    );
\cnt_read_reg[4]\: unisim.vcomponents.FDSE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_cnt_read[4]_i_1__0\,
      Q => cnt_read(4),
      S => areset_d1
    );
m_valid_i_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => cnt_read(2),
      I1 => cnt_read(1),
      I2 => cnt_read(0),
      I3 => cnt_read(4),
      I4 => cnt_read(3),
      O => O3
    );
\memory_reg[31][0]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4 downto 0) => cnt_read(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(0),
      Q => O4(0),
      Q31 => \NLW_memory_reg[31][0]_srl32_Q31_UNCONNECTED\
    );
\memory_reg[31][1]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      A(4 downto 0) => cnt_read(4 downto 0),
      CE => r_push_r,
      CLK => aclk,
      D => \in\(1),
      Q => O4(1),
      Q31 => \NLW_memory_reg[31][1]_srl32_Q31_UNCONNECTED\
    );
\state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFAAAAAAAAAAAAA"
    )
    port map (
      I0 => I2,
      I1 => cnt_read(0),
      I2 => cnt_read(1),
      I3 => cnt_read(2),
      I4 => cnt_read(4),
      I5 => cnt_read(3),
      O => O2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wr_cmd_fsm is
  port (
    O1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O4 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O5 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O6 : out STD_LOGIC;
    O7 : out STD_LOGIC;
    O8 : out STD_LOGIC;
    wrap_next_pending : out STD_LOGIC;
    sel_first_i : out STD_LOGIC;
    incr_next_pending : out STD_LOGIC;
    O9 : out STD_LOGIC;
    O10 : out STD_LOGIC;
    O11 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O12 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O13 : out STD_LOGIC;
    O14 : out STD_LOGIC;
    O15 : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    si_rs_awvalid : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I6 : in STD_LOGIC;
    I7 : in STD_LOGIC;
    I4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I5 : in STD_LOGIC;
    I11 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    I13 : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    I14 : in STD_LOGIC;
    I15 : in STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    I16 : in STD_LOGIC;
    I17 : in STD_LOGIC;
    I18 : in STD_LOGIC;
    I19 : in STD_LOGIC;
    I20 : in STD_LOGIC;
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wr_cmd_fsm : entity is "axi_protocol_converter_v2_1_b2s_wr_cmd_fsm";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wr_cmd_fsm;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wr_cmd_fsm is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^o10\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal \^o3\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^incr_next_pending\ : STD_LOGIC;
  signal \n_0_state[0]_rep_i_1__0\ : STD_LOGIC;
  signal \n_0_state[1]_rep_i_1__0\ : STD_LOGIC;
  signal \n_0_state_reg[0]_rep\ : STD_LOGIC;
  signal \n_0_state_reg[1]_rep\ : STD_LOGIC;
  signal \next\ : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^sel_first_i\ : STD_LOGIC;
  signal \^wrap_next_pending\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axaddr_incr[0]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \axaddr_wrap[11]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \axlen_cnt[3]_i_1\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \axlen_cnt[3]_i_1__0\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \axlen_cnt[3]_i_3\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \axlen_cnt[7]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of m_axi_awvalid_INST_0 : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \m_payload_i[31]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of s_axburst_eq0_i_1 : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of s_axburst_eq1_i_1 : label is "soft_lutpair98";
  attribute KEEP : string;
  attribute KEEP of \state_reg[0]\ : label is "yes";
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of \state_reg[0]\ : label is "state_reg[0]";
  attribute KEEP of \state_reg[0]_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \state_reg[0]_rep\ : label is "state_reg[0]";
  attribute KEEP of \state_reg[1]\ : label is "yes";
  attribute ORIG_CELL_NAME of \state_reg[1]\ : label is "state_reg[1]";
  attribute KEEP of \state_reg[1]_rep\ : label is "yes";
  attribute ORIG_CELL_NAME of \state_reg[1]_rep\ : label is "state_reg[1]";
  attribute SOFT_HLUTNM of \wrap_boundary_axaddr_r[11]_i_1__0\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \wrap_cnt_r[3]_i_3\ : label is "soft_lutpair99";
begin
  E(0) <= \^e\(0);
  O10 <= \^o10\;
  O2 <= \^o2\;
  O3 <= \^o3\;
  Q(1 downto 0) <= \^q\(1 downto 0);
  incr_next_pending <= \^incr_next_pending\;
  sel_first_i <= \^sel_first_i\;
  wrap_next_pending <= \^wrap_next_pending\;
\axaddr_incr[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EEFE"
    )
    port map (
      I0 => I17,
      I1 => \^o2\,
      I2 => \n_0_state_reg[1]_rep\,
      I3 => \n_0_state_reg[0]_rep\,
      O => O14
    );
\axaddr_incr[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000006366CCCC"
    )
    port map (
      I0 => \^o2\,
      I1 => I2(1),
      I2 => \n_0_state_reg[0]_rep\,
      I3 => \n_0_state_reg[1]_rep\,
      I4 => I2(4),
      I5 => I2(5),
      O => S(1)
    );
\axaddr_incr[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000006366"
    )
    port map (
      I0 => \^o2\,
      I1 => I2(0),
      I2 => \n_0_state_reg[0]_rep\,
      I3 => \n_0_state_reg[1]_rep\,
      I4 => I2(5),
      I5 => I2(4),
      O => S(0)
    );
\axaddr_incr[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6366CCCCCCCCCCCC"
    )
    port map (
      I0 => \^o2\,
      I1 => I2(3),
      I2 => \n_0_state_reg[0]_rep\,
      I3 => \n_0_state_reg[1]_rep\,
      I4 => I2(5),
      I5 => I2(4),
      O => S(3)
    );
\axaddr_incr[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000CCCC6366CCCC"
    )
    port map (
      I0 => \^o2\,
      I1 => I2(2),
      I2 => \n_0_state_reg[0]_rep\,
      I3 => \n_0_state_reg[1]_rep\,
      I4 => I2(5),
      I5 => I2(4),
      O => S(2)
    );
\axaddr_wrap[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CCFE"
    )
    port map (
      I0 => si_rs_awvalid,
      I1 => \^o2\,
      I2 => \n_0_state_reg[1]_rep\,
      I3 => \n_0_state_reg[0]_rep\,
      O => O12(0)
    );
\axlen_cnt[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444F4444444444"
    )
    port map (
      I0 => I1(0),
      I1 => \^o3\,
      I2 => \^q\(1),
      I3 => si_rs_awvalid,
      I4 => \^q\(0),
      I5 => I2(7),
      O => D(0)
    );
\axlen_cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F88F8888"
    )
    port map (
      I0 => \^e\(0),
      I1 => I2(8),
      I2 => I1(0),
      I3 => I1(1),
      I4 => \^o3\,
      O => D(1)
    );
\axlen_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CCFE"
    )
    port map (
      I0 => si_rs_awvalid,
      I1 => \^o2\,
      I2 => \^q\(1),
      I3 => \n_0_state_reg[0]_rep\,
      O => O11(0)
    );
\axlen_cnt[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CCFE"
    )
    port map (
      I0 => si_rs_awvalid,
      I1 => \^o2\,
      I2 => \n_0_state_reg[1]_rep\,
      I3 => \n_0_state_reg[0]_rep\,
      O => O13
    );
\axlen_cnt[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
    port map (
      I0 => I5,
      I1 => \^q\(0),
      I2 => si_rs_awvalid,
      I3 => \^q\(1),
      O => \^o3\
    );
\axlen_cnt[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F5F4"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^o2\,
      I3 => si_rs_awvalid,
      I4 => \^o3\,
      O => O1
    );
m_axi_awvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_state_reg[0]_rep\,
      I1 => \n_0_state_reg[1]_rep\,
      O => m_axi_awvalid
    );
\m_payload_i[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => \^o2\,
      I1 => si_rs_awvalid,
      O => O15(0)
    );
\memory_reg[3][0]_srl4_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA0A2202AA0A0000"
    )
    port map (
      I0 => \n_0_state_reg[0]_rep\,
      I1 => I16,
      I2 => I19,
      I3 => I18,
      I4 => \n_0_state_reg[1]_rep\,
      I5 => m_axi_awready,
      O => \^o2\
    );
next_pending_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8BBB8B88"
    )
    port map (
      I0 => I11,
      I1 => \^e\(0),
      I2 => I8,
      I3 => \next\,
      I4 => I12,
      O => \^wrap_next_pending\
    );
\next_pending_r_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I11,
      I1 => \^e\(0),
      I2 => I13,
      I3 => \^o10\,
      I4 => I5,
      O => \^incr_next_pending\
    );
next_pending_r_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0CCE0EECCCCCCCC"
    )
    port map (
      I0 => m_axi_awready,
      I1 => \n_0_state_reg[1]_rep\,
      I2 => I18,
      I3 => I19,
      I4 => I16,
      I5 => \n_0_state_reg[0]_rep\,
      O => \next\
    );
\next_pending_r_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F331F1133333333"
    )
    port map (
      I0 => m_axi_awready,
      I1 => \n_0_state_reg[1]_rep\,
      I2 => I18,
      I3 => I19,
      I4 => I16,
      I5 => \n_0_state_reg[0]_rep\,
      O => \^o10\
    );
s_axburst_eq0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => \^wrap_next_pending\,
      I1 => I2(6),
      I2 => \^sel_first_i\,
      I3 => \^incr_next_pending\,
      O => O8
    );
s_axburst_eq1_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => \^wrap_next_pending\,
      I1 => I2(6),
      I2 => \^sel_first_i\,
      I3 => \^incr_next_pending\,
      O => O9
    );
sel_first_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCEFCFFCCCECCCE"
    )
    port map (
      I0 => si_rs_awvalid,
      I1 => areset_d1,
      I2 => \n_0_state_reg[0]_rep\,
      I3 => \n_0_state_reg[1]_rep\,
      I4 => \^o2\,
      I5 => I14,
      O => \^sel_first_i\
    );
\state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F232FE3EFE32FE3E"
    )
    port map (
      I0 => si_rs_awvalid,
      I1 => \^q\(0),
      I2 => \n_0_state_reg[1]_rep\,
      I3 => I15,
      I4 => m_axi_awready,
      I5 => I16,
      O => next_state(0)
    );
\state[0]_rep_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F232FE3EFE32FE3E"
    )
    port map (
      I0 => si_rs_awvalid,
      I1 => \n_0_state_reg[0]_rep\,
      I2 => \n_0_state_reg[1]_rep\,
      I3 => I15,
      I4 => m_axi_awready,
      I5 => I16,
      O => \n_0_state[0]_rep_i_1__0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0CAE0C0000000000"
    )
    port map (
      I0 => I16,
      I1 => I19,
      I2 => I18,
      I3 => \^q\(1),
      I4 => m_axi_awready,
      I5 => \n_0_state_reg[0]_rep\,
      O => next_state(1)
    );
\state[1]_rep_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0CAE0C0000000000"
    )
    port map (
      I0 => I16,
      I1 => I19,
      I2 => I20,
      I3 => \n_0_state_reg[1]_rep\,
      I4 => m_axi_awready,
      I5 => \^q\(0),
      O => \n_0_state[1]_rep_i_1__0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => next_state(0),
      Q => \^q\(0),
      R => areset_d1
    );
\state_reg[0]_rep\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_state[0]_rep_i_1__0\,
      Q => \n_0_state_reg[0]_rep\,
      R => areset_d1
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => next_state(1),
      Q => \^q\(1),
      R => areset_d1
    );
\state_reg[1]_rep\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_state[1]_rep_i_1__0\,
      Q => \n_0_state_reg[1]_rep\,
      R => areset_d1
    );
\wrap_boundary_axaddr_r[11]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => \n_0_state_reg[1]_rep\,
      I1 => si_rs_awvalid,
      I2 => \n_0_state_reg[0]_rep\,
      O => \^e\(0)
    );
\wrap_cnt_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA8A5575AA8A5545"
    )
    port map (
      I0 => I3(0),
      I1 => \^q\(0),
      I2 => si_rs_awvalid,
      I3 => \^q\(1),
      I4 => I6,
      I5 => I7,
      O => O4(0)
    );
\wrap_cnt_r[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAA8A"
    )
    port map (
      I0 => I4(0),
      I1 => \^q\(0),
      I2 => si_rs_awvalid,
      I3 => \^q\(1),
      I4 => I9,
      I5 => I10(0),
      O => O6
    );
\wrap_cnt_r[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
    port map (
      I0 => I3(0),
      I1 => \^q\(0),
      I2 => si_rs_awvalid,
      I3 => \^q\(1),
      O => O7
    );
\wrap_second_len_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA8AAA8AAA8AAABA"
    )
    port map (
      I0 => I3(0),
      I1 => \^q\(0),
      I2 => si_rs_awvalid,
      I3 => \^q\(1),
      I4 => I6,
      I5 => I7,
      O => O5(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd is
  port (
    O2 : out STD_LOGIC;
    O6 : out STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    O8 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O9 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wrap_next_pending : in STD_LOGIC;
    aclk : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    I6 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    I11 : in STD_LOGIC;
    axaddr_incr_reg : in STD_LOGIC_VECTOR ( 11 downto 0 );
    I15 : in STD_LOGIC;
    I16 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I17 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I18 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I19 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I20 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    I21 : in STD_LOGIC_VECTOR ( 0 to 0 );
    b_push : in STD_LOGIC;
    I12 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_awvalid : in STD_LOGIC;
    areset_d1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd : entity is "axi_protocol_converter_v2_1_b2s_wrap_cmd";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd is
  signal axaddr_wrap : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axaddr_wrap0 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \n_0_axaddr_wrap[0]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[10]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_4\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_5\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_6\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_7\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_8\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_9\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[1]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[2]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[3]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[3]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[3]_i_4\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[3]_i_5\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[3]_i_6\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[4]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[5]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[6]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[7]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[7]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[7]_i_4\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[7]_i_5\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[7]_i_6\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[8]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[9]_i_1\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal \n_0_axlen_cnt[0]_i_1__0\ : STD_LOGIC;
  signal \n_0_axlen_cnt[1]_i_1__0\ : STD_LOGIC;
  signal \n_0_axlen_cnt[2]_i_1__0\ : STD_LOGIC;
  signal \n_0_axlen_cnt[3]_i_2__0\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[0]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[1]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[2]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[3]\ : STD_LOGIC;
  signal n_0_sel_first_i_1 : STD_LOGIC;
  signal n_0_sel_first_reg : STD_LOGIC;
  signal \n_1_axaddr_wrap_reg[11]_i_3\ : STD_LOGIC;
  signal \n_1_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_1_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal \n_2_axaddr_wrap_reg[11]_i_3\ : STD_LOGIC;
  signal \n_2_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_2_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal \n_3_axaddr_wrap_reg[11]_i_3\ : STD_LOGIC;
  signal \n_3_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_3_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal wrap_boundary_axaddr_r : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal wrap_cnt_r : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axaddr_wrap[11]_i_4\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \next_pending_r_i_2__0\ : label is "soft_lutpair103";
begin
\axaddr_offset_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I16(0),
      Q => O8(0),
      R => '0'
    );
\axaddr_offset_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I16(1),
      Q => O8(1),
      R => '0'
    );
\axaddr_offset_r_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I16(2),
      Q => O8(2),
      R => '0'
    );
\axaddr_offset_r_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I16(3),
      Q => O8(3),
      R => '0'
    );
\axaddr_wrap[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(0),
      I1 => I11,
      I2 => axaddr_wrap0(0),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(0),
      O => \n_0_axaddr_wrap[0]_i_1\
    );
\axaddr_wrap[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(10),
      I1 => I11,
      I2 => axaddr_wrap0(10),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(10),
      O => \n_0_axaddr_wrap[10]_i_1\
    );
\axaddr_wrap[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(11),
      I1 => I11,
      I2 => axaddr_wrap0(11),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(11),
      O => \n_0_axaddr_wrap[11]_i_2\
    );
\axaddr_wrap[11]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6F"
    )
    port map (
      I0 => wrap_cnt_r(3),
      I1 => \n_0_axlen_cnt_reg[3]\,
      I2 => \n_0_axaddr_wrap[11]_i_9\,
      O => \n_0_axaddr_wrap[11]_i_4\
    );
\axaddr_wrap[11]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => axaddr_wrap(11),
      O => \n_0_axaddr_wrap[11]_i_5\
    );
\axaddr_wrap[11]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => axaddr_wrap(10),
      O => \n_0_axaddr_wrap[11]_i_6\
    );
\axaddr_wrap[11]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => axaddr_wrap(9),
      O => \n_0_axaddr_wrap[11]_i_7\
    );
\axaddr_wrap[11]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => axaddr_wrap(8),
      O => \n_0_axaddr_wrap[11]_i_8\
    );
\axaddr_wrap[11]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => wrap_cnt_r(0),
      I1 => \n_0_axlen_cnt_reg[0]\,
      I2 => \n_0_axlen_cnt_reg[2]\,
      I3 => wrap_cnt_r(2),
      I4 => \n_0_axlen_cnt_reg[1]\,
      I5 => wrap_cnt_r(1),
      O => \n_0_axaddr_wrap[11]_i_9\
    );
\axaddr_wrap[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(1),
      I1 => I11,
      I2 => axaddr_wrap0(1),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(1),
      O => \n_0_axaddr_wrap[1]_i_1\
    );
\axaddr_wrap[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(2),
      I1 => I11,
      I2 => axaddr_wrap0(2),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(2),
      O => \n_0_axaddr_wrap[2]_i_1\
    );
\axaddr_wrap[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(3),
      I1 => I11,
      I2 => axaddr_wrap0(3),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(3),
      O => \n_0_axaddr_wrap[3]_i_1\
    );
\axaddr_wrap[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => axaddr_wrap(3),
      I1 => I6(12),
      I2 => I6(13),
      O => \n_0_axaddr_wrap[3]_i_3\
    );
\axaddr_wrap[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
    port map (
      I0 => axaddr_wrap(2),
      I1 => I6(12),
      I2 => I6(13),
      O => \n_0_axaddr_wrap[3]_i_4\
    );
\axaddr_wrap[3]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
    port map (
      I0 => axaddr_wrap(1),
      I1 => I6(13),
      I2 => I6(12),
      O => \n_0_axaddr_wrap[3]_i_5\
    );
\axaddr_wrap[3]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => axaddr_wrap(0),
      I1 => I6(12),
      I2 => I6(13),
      O => \n_0_axaddr_wrap[3]_i_6\
    );
\axaddr_wrap[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(4),
      I1 => I11,
      I2 => axaddr_wrap0(4),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(4),
      O => \n_0_axaddr_wrap[4]_i_1\
    );
\axaddr_wrap[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(5),
      I1 => I11,
      I2 => axaddr_wrap0(5),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(5),
      O => \n_0_axaddr_wrap[5]_i_1\
    );
\axaddr_wrap[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(6),
      I1 => I11,
      I2 => axaddr_wrap0(6),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(6),
      O => \n_0_axaddr_wrap[6]_i_1\
    );
\axaddr_wrap[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(7),
      I1 => I11,
      I2 => axaddr_wrap0(7),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(7),
      O => \n_0_axaddr_wrap[7]_i_1\
    );
\axaddr_wrap[7]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => axaddr_wrap(7),
      O => \n_0_axaddr_wrap[7]_i_3\
    );
\axaddr_wrap[7]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => axaddr_wrap(6),
      O => \n_0_axaddr_wrap[7]_i_4\
    );
\axaddr_wrap[7]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => axaddr_wrap(5),
      O => \n_0_axaddr_wrap[7]_i_5\
    );
\axaddr_wrap[7]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => axaddr_wrap(4),
      O => \n_0_axaddr_wrap[7]_i_6\
    );
\axaddr_wrap[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(8),
      I1 => I11,
      I2 => axaddr_wrap0(8),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(8),
      O => \n_0_axaddr_wrap[8]_i_1\
    );
\axaddr_wrap[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(9),
      I1 => I11,
      I2 => axaddr_wrap0(9),
      I3 => \n_0_axaddr_wrap[11]_i_4\,
      I4 => wrap_boundary_axaddr_r(9),
      O => \n_0_axaddr_wrap[9]_i_1\
    );
\axaddr_wrap_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[0]_i_1\,
      Q => axaddr_wrap(0),
      R => '0'
    );
\axaddr_wrap_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[10]_i_1\,
      Q => axaddr_wrap(10),
      R => '0'
    );
\axaddr_wrap_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[11]_i_2\,
      Q => axaddr_wrap(11),
      R => '0'
    );
\axaddr_wrap_reg[11]_i_3\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_wrap_reg[7]_i_2\,
      CO(3) => \NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED\(3),
      CO(2) => \n_1_axaddr_wrap_reg[11]_i_3\,
      CO(1) => \n_2_axaddr_wrap_reg[11]_i_3\,
      CO(0) => \n_3_axaddr_wrap_reg[11]_i_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => axaddr_wrap0(11 downto 8),
      S(3) => \n_0_axaddr_wrap[11]_i_5\,
      S(2) => \n_0_axaddr_wrap[11]_i_6\,
      S(1) => \n_0_axaddr_wrap[11]_i_7\,
      S(0) => \n_0_axaddr_wrap[11]_i_8\
    );
\axaddr_wrap_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[1]_i_1\,
      Q => axaddr_wrap(1),
      R => '0'
    );
\axaddr_wrap_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[2]_i_1\,
      Q => axaddr_wrap(2),
      R => '0'
    );
\axaddr_wrap_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[3]_i_1\,
      Q => axaddr_wrap(3),
      R => '0'
    );
\axaddr_wrap_reg[3]_i_2\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_axaddr_wrap_reg[3]_i_2\,
      CO(2) => \n_1_axaddr_wrap_reg[3]_i_2\,
      CO(1) => \n_2_axaddr_wrap_reg[3]_i_2\,
      CO(0) => \n_3_axaddr_wrap_reg[3]_i_2\,
      CYINIT => '0',
      DI(3 downto 0) => axaddr_wrap(3 downto 0),
      O(3 downto 0) => axaddr_wrap0(3 downto 0),
      S(3) => \n_0_axaddr_wrap[3]_i_3\,
      S(2) => \n_0_axaddr_wrap[3]_i_4\,
      S(1) => \n_0_axaddr_wrap[3]_i_5\,
      S(0) => \n_0_axaddr_wrap[3]_i_6\
    );
\axaddr_wrap_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[4]_i_1\,
      Q => axaddr_wrap(4),
      R => '0'
    );
\axaddr_wrap_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[5]_i_1\,
      Q => axaddr_wrap(5),
      R => '0'
    );
\axaddr_wrap_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[6]_i_1\,
      Q => axaddr_wrap(6),
      R => '0'
    );
\axaddr_wrap_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[7]_i_1\,
      Q => axaddr_wrap(7),
      R => '0'
    );
\axaddr_wrap_reg[7]_i_2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_wrap_reg[3]_i_2\,
      CO(3) => \n_0_axaddr_wrap_reg[7]_i_2\,
      CO(2) => \n_1_axaddr_wrap_reg[7]_i_2\,
      CO(1) => \n_2_axaddr_wrap_reg[7]_i_2\,
      CO(0) => \n_3_axaddr_wrap_reg[7]_i_2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => axaddr_wrap0(7 downto 4),
      S(3) => \n_0_axaddr_wrap[7]_i_3\,
      S(2) => \n_0_axaddr_wrap[7]_i_4\,
      S(1) => \n_0_axaddr_wrap[7]_i_5\,
      S(0) => \n_0_axaddr_wrap[7]_i_6\
    );
\axaddr_wrap_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[8]_i_1\,
      Q => axaddr_wrap(8),
      R => '0'
    );
\axaddr_wrap_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I21(0),
      D => \n_0_axaddr_wrap[9]_i_1\,
      Q => axaddr_wrap(9),
      R => '0'
    );
\axlen_cnt[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF555400005554"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[0]\,
      I1 => \n_0_axlen_cnt_reg[1]\,
      I2 => \n_0_axlen_cnt_reg[2]\,
      I3 => \n_0_axlen_cnt_reg[3]\,
      I4 => E(0),
      I5 => I6(15),
      O => \n_0_axlen_cnt[0]_i_1__0\
    );
\axlen_cnt[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAC3AAC3AAC3AAC0"
    )
    port map (
      I0 => I6(16),
      I1 => \n_0_axlen_cnt_reg[0]\,
      I2 => \n_0_axlen_cnt_reg[1]\,
      I3 => E(0),
      I4 => \n_0_axlen_cnt_reg[2]\,
      I5 => \n_0_axlen_cnt_reg[3]\,
      O => \n_0_axlen_cnt[1]_i_1__0\
    );
\axlen_cnt[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAACCC3AAAACCC0"
    )
    port map (
      I0 => I6(17),
      I1 => \n_0_axlen_cnt_reg[2]\,
      I2 => \n_0_axlen_cnt_reg[1]\,
      I3 => \n_0_axlen_cnt_reg[0]\,
      I4 => E(0),
      I5 => \n_0_axlen_cnt_reg[3]\,
      O => \n_0_axlen_cnt[2]_i_1__0\
    );
\axlen_cnt[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAA80000AAA8"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[3]\,
      I1 => \n_0_axlen_cnt_reg[2]\,
      I2 => \n_0_axlen_cnt_reg[0]\,
      I3 => \n_0_axlen_cnt_reg[1]\,
      I4 => E(0),
      I5 => I6(18),
      O => \n_0_axlen_cnt[3]_i_2__0\
    );
\axlen_cnt_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I18(0),
      D => \n_0_axlen_cnt[0]_i_1__0\,
      Q => \n_0_axlen_cnt_reg[0]\,
      R => '0'
    );
\axlen_cnt_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I18(0),
      D => \n_0_axlen_cnt[1]_i_1__0\,
      Q => \n_0_axlen_cnt_reg[1]\,
      R => '0'
    );
\axlen_cnt_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I18(0),
      D => \n_0_axlen_cnt[2]_i_1__0\,
      Q => \n_0_axlen_cnt_reg[2]\,
      R => '0'
    );
\axlen_cnt_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I18(0),
      D => \n_0_axlen_cnt[3]_i_2__0\,
      Q => \n_0_axlen_cnt_reg[3]\,
      R => '0'
    );
\m_axi_awaddr[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(0),
      I2 => I6(14),
      I3 => axaddr_incr_reg(0),
      I4 => I15,
      I5 => I6(0),
      O => m_axi_awaddr(0)
    );
\m_axi_awaddr[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(10),
      I2 => I6(14),
      I3 => axaddr_incr_reg(10),
      I4 => I15,
      I5 => I6(10),
      O => m_axi_awaddr(10)
    );
\m_axi_awaddr[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(11),
      I2 => I6(14),
      I3 => axaddr_incr_reg(11),
      I4 => I15,
      I5 => I6(11),
      O => m_axi_awaddr(11)
    );
\m_axi_awaddr[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(1),
      I2 => I6(14),
      I3 => axaddr_incr_reg(1),
      I4 => I15,
      I5 => I6(1),
      O => m_axi_awaddr(1)
    );
\m_axi_awaddr[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(2),
      I2 => I6(14),
      I3 => axaddr_incr_reg(2),
      I4 => I15,
      I5 => I6(2),
      O => m_axi_awaddr(2)
    );
\m_axi_awaddr[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(3),
      I2 => I6(14),
      I3 => axaddr_incr_reg(3),
      I4 => I15,
      I5 => I6(3),
      O => m_axi_awaddr(3)
    );
\m_axi_awaddr[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(4),
      I2 => I6(14),
      I3 => axaddr_incr_reg(4),
      I4 => I15,
      I5 => I6(4),
      O => m_axi_awaddr(4)
    );
\m_axi_awaddr[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(5),
      I2 => I6(14),
      I3 => axaddr_incr_reg(5),
      I4 => I15,
      I5 => I6(5),
      O => m_axi_awaddr(5)
    );
\m_axi_awaddr[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(6),
      I2 => I6(14),
      I3 => axaddr_incr_reg(6),
      I4 => I15,
      I5 => I6(6),
      O => m_axi_awaddr(6)
    );
\m_axi_awaddr[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(7),
      I2 => I6(14),
      I3 => axaddr_incr_reg(7),
      I4 => I15,
      I5 => I6(7),
      O => m_axi_awaddr(7)
    );
\m_axi_awaddr[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(8),
      I2 => I6(14),
      I3 => axaddr_incr_reg(8),
      I4 => I15,
      I5 => I6(8),
      O => m_axi_awaddr(8)
    );
\m_axi_awaddr[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => axaddr_wrap(9),
      I2 => I6(14),
      I3 => axaddr_incr_reg(9),
      I4 => I15,
      I5 => I6(9),
      O => m_axi_awaddr(9)
    );
\next_pending_r_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[3]\,
      I1 => \n_0_axlen_cnt_reg[2]\,
      I2 => \n_0_axlen_cnt_reg[1]\,
      O => O6
    );
next_pending_r_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => wrap_next_pending,
      Q => O2,
      R => '0'
    );
sel_first_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF44440F04"
    )
    port map (
      I0 => b_push,
      I1 => n_0_sel_first_reg,
      I2 => I12(1),
      I3 => si_rs_awvalid,
      I4 => I12(0),
      I5 => areset_d1,
      O => n_0_sel_first_i_1
    );
sel_first_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => n_0_sel_first_i_1,
      Q => n_0_sel_first_reg,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I20(0),
      Q => wrap_boundary_axaddr_r(0),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I6(10),
      Q => wrap_boundary_axaddr_r(10),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I6(11),
      Q => wrap_boundary_axaddr_r(11),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I20(1),
      Q => wrap_boundary_axaddr_r(1),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I20(2),
      Q => wrap_boundary_axaddr_r(2),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I20(3),
      Q => wrap_boundary_axaddr_r(3),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I20(4),
      Q => wrap_boundary_axaddr_r(4),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I20(5),
      Q => wrap_boundary_axaddr_r(5),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I20(6),
      Q => wrap_boundary_axaddr_r(6),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I6(7),
      Q => wrap_boundary_axaddr_r(7),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I6(8),
      Q => wrap_boundary_axaddr_r(8),
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I6(9),
      Q => wrap_boundary_axaddr_r(9),
      R => '0'
    );
\wrap_cnt_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I19(0),
      Q => wrap_cnt_r(0),
      R => '0'
    );
\wrap_cnt_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I19(1),
      Q => wrap_cnt_r(1),
      R => '0'
    );
\wrap_cnt_r_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I19(2),
      Q => wrap_cnt_r(2),
      R => '0'
    );
\wrap_cnt_r_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I19(3),
      Q => wrap_cnt_r(3),
      R => '0'
    );
\wrap_second_len_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I17(0),
      Q => O9(0),
      R => '0'
    );
\wrap_second_len_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I17(1),
      Q => O9(1),
      R => '0'
    );
\wrap_second_len_r_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I17(2),
      Q => O9(2),
      R => '0'
    );
\wrap_second_len_r_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I17(3),
      Q => O9(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd_3 is
  port (
    O1 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    O7 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O8 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wrap_next_pending : in STD_LOGIC;
    aclk : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    I6 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    I11 : in STD_LOGIC;
    axaddr_incr_reg : in STD_LOGIC_VECTOR ( 11 downto 0 );
    I13 : in STD_LOGIC;
    I17 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I18 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I19 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I20 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I21 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    I22 : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arready : in STD_LOGIC;
    I14 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_arvalid : in STD_LOGIC;
    areset_d1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd_3 : entity is "axi_protocol_converter_v2_1_b2s_wrap_cmd";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd_3;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd_3 is
  signal \n_0_axaddr_wrap[0]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[10]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_4__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_5__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_6__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_7__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_8__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[11]_i_9__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[1]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[2]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[3]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[3]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[3]_i_4\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[3]_i_5\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[3]_i_6\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[4]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[5]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[6]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[7]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[7]_i_3__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[7]_i_4__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[7]_i_5__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[7]_i_6__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[8]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap[9]_i_1__0\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[0]\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[10]\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[11]\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[1]\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[2]\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[3]\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[4]\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[5]\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[6]\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[7]\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[8]\ : STD_LOGIC;
  signal \n_0_axaddr_wrap_reg[9]\ : STD_LOGIC;
  signal \n_0_axlen_cnt[0]_i_1__2\ : STD_LOGIC;
  signal \n_0_axlen_cnt[1]_i_1__2\ : STD_LOGIC;
  signal \n_0_axlen_cnt[2]_i_1__2\ : STD_LOGIC;
  signal \n_0_axlen_cnt[3]_i_2__2\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[0]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[1]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[2]\ : STD_LOGIC;
  signal \n_0_axlen_cnt_reg[3]\ : STD_LOGIC;
  signal n_0_sel_first_i_1 : STD_LOGIC;
  signal n_0_sel_first_reg : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[0]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[10]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[11]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[1]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[2]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[3]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[4]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[5]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[6]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[7]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[8]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r_reg[9]\ : STD_LOGIC;
  signal \n_0_wrap_cnt_r_reg[0]\ : STD_LOGIC;
  signal \n_0_wrap_cnt_r_reg[1]\ : STD_LOGIC;
  signal \n_0_wrap_cnt_r_reg[2]\ : STD_LOGIC;
  signal \n_0_wrap_cnt_r_reg[3]\ : STD_LOGIC;
  signal \n_1_axaddr_wrap_reg[11]_i_3\ : STD_LOGIC;
  signal \n_1_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_1_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal \n_2_axaddr_wrap_reg[11]_i_3\ : STD_LOGIC;
  signal \n_2_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_2_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal \n_3_axaddr_wrap_reg[11]_i_3\ : STD_LOGIC;
  signal \n_3_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_3_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal \n_4_axaddr_wrap_reg[11]_i_3\ : STD_LOGIC;
  signal \n_4_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_4_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal \n_5_axaddr_wrap_reg[11]_i_3\ : STD_LOGIC;
  signal \n_5_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_5_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal \n_6_axaddr_wrap_reg[11]_i_3\ : STD_LOGIC;
  signal \n_6_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_6_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal \n_7_axaddr_wrap_reg[11]_i_3\ : STD_LOGIC;
  signal \n_7_axaddr_wrap_reg[3]_i_2\ : STD_LOGIC;
  signal \n_7_axaddr_wrap_reg[7]_i_2\ : STD_LOGIC;
  signal \NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axaddr_wrap[11]_i_4__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \next_pending_r_i_2__1\ : label is "soft_lutpair9";
begin
\axaddr_offset_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I17(0),
      Q => O7(0),
      R => '0'
    );
\axaddr_offset_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I17(1),
      Q => O7(1),
      R => '0'
    );
\axaddr_offset_r_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I17(2),
      Q => O7(2),
      R => '0'
    );
\axaddr_offset_r_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I17(3),
      Q => O7(3),
      R => '0'
    );
\axaddr_wrap[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(0),
      I1 => I11,
      I2 => \n_7_axaddr_wrap_reg[3]_i_2\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[0]\,
      O => \n_0_axaddr_wrap[0]_i_1__0\
    );
\axaddr_wrap[10]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(10),
      I1 => I11,
      I2 => \n_5_axaddr_wrap_reg[11]_i_3\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[10]\,
      O => \n_0_axaddr_wrap[10]_i_1__0\
    );
\axaddr_wrap[11]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(11),
      I1 => I11,
      I2 => \n_4_axaddr_wrap_reg[11]_i_3\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[11]\,
      O => \n_0_axaddr_wrap[11]_i_2__0\
    );
\axaddr_wrap[11]_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6F"
    )
    port map (
      I0 => \n_0_wrap_cnt_r_reg[3]\,
      I1 => \n_0_axlen_cnt_reg[3]\,
      I2 => \n_0_axaddr_wrap[11]_i_9__0\,
      O => \n_0_axaddr_wrap[11]_i_4__0\
    );
\axaddr_wrap[11]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[11]\,
      O => \n_0_axaddr_wrap[11]_i_5__0\
    );
\axaddr_wrap[11]_i_6__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[10]\,
      O => \n_0_axaddr_wrap[11]_i_6__0\
    );
\axaddr_wrap[11]_i_7__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[9]\,
      O => \n_0_axaddr_wrap[11]_i_7__0\
    );
\axaddr_wrap[11]_i_8__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[8]\,
      O => \n_0_axaddr_wrap[11]_i_8__0\
    );
\axaddr_wrap[11]_i_9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[1]\,
      I1 => \n_0_wrap_cnt_r_reg[1]\,
      I2 => \n_0_axlen_cnt_reg[2]\,
      I3 => \n_0_wrap_cnt_r_reg[2]\,
      I4 => \n_0_wrap_cnt_r_reg[0]\,
      I5 => \n_0_axlen_cnt_reg[0]\,
      O => \n_0_axaddr_wrap[11]_i_9__0\
    );
\axaddr_wrap[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(1),
      I1 => I11,
      I2 => \n_6_axaddr_wrap_reg[3]_i_2\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[1]\,
      O => \n_0_axaddr_wrap[1]_i_1__0\
    );
\axaddr_wrap[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(2),
      I1 => I11,
      I2 => \n_5_axaddr_wrap_reg[3]_i_2\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[2]\,
      O => \n_0_axaddr_wrap[2]_i_1__0\
    );
\axaddr_wrap[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(3),
      I1 => I11,
      I2 => \n_4_axaddr_wrap_reg[3]_i_2\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[3]\,
      O => \n_0_axaddr_wrap[3]_i_1__0\
    );
\axaddr_wrap[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[3]\,
      I1 => I6(12),
      I2 => I6(13),
      O => \n_0_axaddr_wrap[3]_i_3\
    );
\axaddr_wrap[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[2]\,
      I1 => I6(12),
      I2 => I6(13),
      O => \n_0_axaddr_wrap[3]_i_4\
    );
\axaddr_wrap[3]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[1]\,
      I1 => I6(13),
      I2 => I6(12),
      O => \n_0_axaddr_wrap[3]_i_5\
    );
\axaddr_wrap[3]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[0]\,
      I1 => I6(12),
      I2 => I6(13),
      O => \n_0_axaddr_wrap[3]_i_6\
    );
\axaddr_wrap[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(4),
      I1 => I11,
      I2 => \n_7_axaddr_wrap_reg[7]_i_2\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[4]\,
      O => \n_0_axaddr_wrap[4]_i_1__0\
    );
\axaddr_wrap[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(5),
      I1 => I11,
      I2 => \n_6_axaddr_wrap_reg[7]_i_2\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[5]\,
      O => \n_0_axaddr_wrap[5]_i_1__0\
    );
\axaddr_wrap[6]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(6),
      I1 => I11,
      I2 => \n_5_axaddr_wrap_reg[7]_i_2\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[6]\,
      O => \n_0_axaddr_wrap[6]_i_1__0\
    );
\axaddr_wrap[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(7),
      I1 => I11,
      I2 => \n_4_axaddr_wrap_reg[7]_i_2\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[7]\,
      O => \n_0_axaddr_wrap[7]_i_1__0\
    );
\axaddr_wrap[7]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[7]\,
      O => \n_0_axaddr_wrap[7]_i_3__0\
    );
\axaddr_wrap[7]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[6]\,
      O => \n_0_axaddr_wrap[7]_i_4__0\
    );
\axaddr_wrap[7]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[5]\,
      O => \n_0_axaddr_wrap[7]_i_5__0\
    );
\axaddr_wrap[7]_i_6__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_axaddr_wrap_reg[4]\,
      O => \n_0_axaddr_wrap[7]_i_6__0\
    );
\axaddr_wrap[8]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(8),
      I1 => I11,
      I2 => \n_7_axaddr_wrap_reg[11]_i_3\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[8]\,
      O => \n_0_axaddr_wrap[8]_i_1__0\
    );
\axaddr_wrap[9]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
    port map (
      I0 => I6(9),
      I1 => I11,
      I2 => \n_6_axaddr_wrap_reg[11]_i_3\,
      I3 => \n_0_axaddr_wrap[11]_i_4__0\,
      I4 => \n_0_wrap_boundary_axaddr_r_reg[9]\,
      O => \n_0_axaddr_wrap[9]_i_1__0\
    );
\axaddr_wrap_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[0]_i_1__0\,
      Q => \n_0_axaddr_wrap_reg[0]\,
      R => '0'
    );
\axaddr_wrap_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[10]_i_1__0\,
      Q => \n_0_axaddr_wrap_reg[10]\,
      R => '0'
    );
\axaddr_wrap_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[11]_i_2__0\,
      Q => \n_0_axaddr_wrap_reg[11]\,
      R => '0'
    );
\axaddr_wrap_reg[11]_i_3\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_wrap_reg[7]_i_2\,
      CO(3) => \NLW_axaddr_wrap_reg[11]_i_3_CO_UNCONNECTED\(3),
      CO(2) => \n_1_axaddr_wrap_reg[11]_i_3\,
      CO(1) => \n_2_axaddr_wrap_reg[11]_i_3\,
      CO(0) => \n_3_axaddr_wrap_reg[11]_i_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_axaddr_wrap_reg[11]_i_3\,
      O(2) => \n_5_axaddr_wrap_reg[11]_i_3\,
      O(1) => \n_6_axaddr_wrap_reg[11]_i_3\,
      O(0) => \n_7_axaddr_wrap_reg[11]_i_3\,
      S(3) => \n_0_axaddr_wrap[11]_i_5__0\,
      S(2) => \n_0_axaddr_wrap[11]_i_6__0\,
      S(1) => \n_0_axaddr_wrap[11]_i_7__0\,
      S(0) => \n_0_axaddr_wrap[11]_i_8__0\
    );
\axaddr_wrap_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[1]_i_1__0\,
      Q => \n_0_axaddr_wrap_reg[1]\,
      R => '0'
    );
\axaddr_wrap_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[2]_i_1__0\,
      Q => \n_0_axaddr_wrap_reg[2]\,
      R => '0'
    );
\axaddr_wrap_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[3]_i_1__0\,
      Q => \n_0_axaddr_wrap_reg[3]\,
      R => '0'
    );
\axaddr_wrap_reg[3]_i_2\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_axaddr_wrap_reg[3]_i_2\,
      CO(2) => \n_1_axaddr_wrap_reg[3]_i_2\,
      CO(1) => \n_2_axaddr_wrap_reg[3]_i_2\,
      CO(0) => \n_3_axaddr_wrap_reg[3]_i_2\,
      CYINIT => '0',
      DI(3) => \n_0_axaddr_wrap_reg[3]\,
      DI(2) => \n_0_axaddr_wrap_reg[2]\,
      DI(1) => \n_0_axaddr_wrap_reg[1]\,
      DI(0) => \n_0_axaddr_wrap_reg[0]\,
      O(3) => \n_4_axaddr_wrap_reg[3]_i_2\,
      O(2) => \n_5_axaddr_wrap_reg[3]_i_2\,
      O(1) => \n_6_axaddr_wrap_reg[3]_i_2\,
      O(0) => \n_7_axaddr_wrap_reg[3]_i_2\,
      S(3) => \n_0_axaddr_wrap[3]_i_3\,
      S(2) => \n_0_axaddr_wrap[3]_i_4\,
      S(1) => \n_0_axaddr_wrap[3]_i_5\,
      S(0) => \n_0_axaddr_wrap[3]_i_6\
    );
\axaddr_wrap_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[4]_i_1__0\,
      Q => \n_0_axaddr_wrap_reg[4]\,
      R => '0'
    );
\axaddr_wrap_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[5]_i_1__0\,
      Q => \n_0_axaddr_wrap_reg[5]\,
      R => '0'
    );
\axaddr_wrap_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[6]_i_1__0\,
      Q => \n_0_axaddr_wrap_reg[6]\,
      R => '0'
    );
\axaddr_wrap_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[7]_i_1__0\,
      Q => \n_0_axaddr_wrap_reg[7]\,
      R => '0'
    );
\axaddr_wrap_reg[7]_i_2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_axaddr_wrap_reg[3]_i_2\,
      CO(3) => \n_0_axaddr_wrap_reg[7]_i_2\,
      CO(2) => \n_1_axaddr_wrap_reg[7]_i_2\,
      CO(1) => \n_2_axaddr_wrap_reg[7]_i_2\,
      CO(0) => \n_3_axaddr_wrap_reg[7]_i_2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_axaddr_wrap_reg[7]_i_2\,
      O(2) => \n_5_axaddr_wrap_reg[7]_i_2\,
      O(1) => \n_6_axaddr_wrap_reg[7]_i_2\,
      O(0) => \n_7_axaddr_wrap_reg[7]_i_2\,
      S(3) => \n_0_axaddr_wrap[7]_i_3__0\,
      S(2) => \n_0_axaddr_wrap[7]_i_4__0\,
      S(1) => \n_0_axaddr_wrap[7]_i_5__0\,
      S(0) => \n_0_axaddr_wrap[7]_i_6__0\
    );
\axaddr_wrap_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[8]_i_1__0\,
      Q => \n_0_axaddr_wrap_reg[8]\,
      R => '0'
    );
\axaddr_wrap_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_axaddr_wrap[9]_i_1__0\,
      Q => \n_0_axaddr_wrap_reg[9]\,
      R => '0'
    );
\axlen_cnt[0]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF555400005554"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[0]\,
      I1 => \n_0_axlen_cnt_reg[1]\,
      I2 => \n_0_axlen_cnt_reg[2]\,
      I3 => \n_0_axlen_cnt_reg[3]\,
      I4 => E(0),
      I5 => I6(15),
      O => \n_0_axlen_cnt[0]_i_1__2\
    );
\axlen_cnt[1]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAC3AAC3AAC3AAC0"
    )
    port map (
      I0 => I6(16),
      I1 => \n_0_axlen_cnt_reg[0]\,
      I2 => \n_0_axlen_cnt_reg[1]\,
      I3 => E(0),
      I4 => \n_0_axlen_cnt_reg[2]\,
      I5 => \n_0_axlen_cnt_reg[3]\,
      O => \n_0_axlen_cnt[1]_i_1__2\
    );
\axlen_cnt[2]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAACCC3AAAACCC0"
    )
    port map (
      I0 => I6(17),
      I1 => \n_0_axlen_cnt_reg[2]\,
      I2 => \n_0_axlen_cnt_reg[1]\,
      I3 => \n_0_axlen_cnt_reg[0]\,
      I4 => E(0),
      I5 => \n_0_axlen_cnt_reg[3]\,
      O => \n_0_axlen_cnt[2]_i_1__2\
    );
\axlen_cnt[3]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAA80000AAA8"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[3]\,
      I1 => \n_0_axlen_cnt_reg[2]\,
      I2 => \n_0_axlen_cnt_reg[0]\,
      I3 => \n_0_axlen_cnt_reg[1]\,
      I4 => E(0),
      I5 => I6(18),
      O => \n_0_axlen_cnt[3]_i_2__2\
    );
\axlen_cnt_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I19(0),
      D => \n_0_axlen_cnt[0]_i_1__2\,
      Q => \n_0_axlen_cnt_reg[0]\,
      R => '0'
    );
\axlen_cnt_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I19(0),
      D => \n_0_axlen_cnt[1]_i_1__2\,
      Q => \n_0_axlen_cnt_reg[1]\,
      R => '0'
    );
\axlen_cnt_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I19(0),
      D => \n_0_axlen_cnt[2]_i_1__2\,
      Q => \n_0_axlen_cnt_reg[2]\,
      R => '0'
    );
\axlen_cnt_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I19(0),
      D => \n_0_axlen_cnt[3]_i_2__2\,
      Q => \n_0_axlen_cnt_reg[3]\,
      R => '0'
    );
\m_axi_araddr[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[0]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(0),
      I4 => I13,
      I5 => I6(0),
      O => m_axi_araddr(0)
    );
\m_axi_araddr[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[10]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(10),
      I4 => I13,
      I5 => I6(10),
      O => m_axi_araddr(10)
    );
\m_axi_araddr[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[11]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(11),
      I4 => I13,
      I5 => I6(11),
      O => m_axi_araddr(11)
    );
\m_axi_araddr[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[1]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(1),
      I4 => I13,
      I5 => I6(1),
      O => m_axi_araddr(1)
    );
\m_axi_araddr[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[2]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(2),
      I4 => I13,
      I5 => I6(2),
      O => m_axi_araddr(2)
    );
\m_axi_araddr[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[3]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(3),
      I4 => I13,
      I5 => I6(3),
      O => m_axi_araddr(3)
    );
\m_axi_araddr[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[4]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(4),
      I4 => I13,
      I5 => I6(4),
      O => m_axi_araddr(4)
    );
\m_axi_araddr[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[5]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(5),
      I4 => I13,
      I5 => I6(5),
      O => m_axi_araddr(5)
    );
\m_axi_araddr[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[6]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(6),
      I4 => I13,
      I5 => I6(6),
      O => m_axi_araddr(6)
    );
\m_axi_araddr[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[7]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(7),
      I4 => I13,
      I5 => I6(7),
      O => m_axi_araddr(7)
    );
\m_axi_araddr[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[8]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(8),
      I4 => I13,
      I5 => I6(8),
      O => m_axi_araddr(8)
    );
\m_axi_araddr[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEF4F404040"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => \n_0_axaddr_wrap_reg[9]\,
      I2 => I6(14),
      I3 => axaddr_incr_reg(9),
      I4 => I13,
      I5 => I6(9),
      O => m_axi_araddr(9)
    );
\next_pending_r_i_2__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \n_0_axlen_cnt_reg[3]\,
      I1 => \n_0_axlen_cnt_reg[2]\,
      I2 => \n_0_axlen_cnt_reg[1]\,
      O => O4
    );
next_pending_r_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => wrap_next_pending,
      Q => O1,
      R => '0'
    );
sel_first_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFA2A2AFAA"
    )
    port map (
      I0 => n_0_sel_first_reg,
      I1 => m_axi_arready,
      I2 => I14(1),
      I3 => si_rs_arvalid,
      I4 => I14(0),
      I5 => areset_d1,
      O => n_0_sel_first_i_1
    );
sel_first_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => n_0_sel_first_i_1,
      Q => n_0_sel_first_reg,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I21(0),
      Q => \n_0_wrap_boundary_axaddr_r_reg[0]\,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I6(10),
      Q => \n_0_wrap_boundary_axaddr_r_reg[10]\,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I6(11),
      Q => \n_0_wrap_boundary_axaddr_r_reg[11]\,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I21(1),
      Q => \n_0_wrap_boundary_axaddr_r_reg[1]\,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I21(2),
      Q => \n_0_wrap_boundary_axaddr_r_reg[2]\,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I21(3),
      Q => \n_0_wrap_boundary_axaddr_r_reg[3]\,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I21(4),
      Q => \n_0_wrap_boundary_axaddr_r_reg[4]\,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I21(5),
      Q => \n_0_wrap_boundary_axaddr_r_reg[5]\,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I21(6),
      Q => \n_0_wrap_boundary_axaddr_r_reg[6]\,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I6(7),
      Q => \n_0_wrap_boundary_axaddr_r_reg[7]\,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I6(8),
      Q => \n_0_wrap_boundary_axaddr_r_reg[8]\,
      R => '0'
    );
\wrap_boundary_axaddr_r_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => I6(9),
      Q => \n_0_wrap_boundary_axaddr_r_reg[9]\,
      R => '0'
    );
\wrap_cnt_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I20(0),
      Q => \n_0_wrap_cnt_r_reg[0]\,
      R => '0'
    );
\wrap_cnt_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I20(1),
      Q => \n_0_wrap_cnt_r_reg[1]\,
      R => '0'
    );
\wrap_cnt_r_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I20(2),
      Q => \n_0_wrap_cnt_r_reg[2]\,
      R => '0'
    );
\wrap_cnt_r_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I20(3),
      Q => \n_0_wrap_cnt_r_reg[3]\,
      R => '0'
    );
\wrap_second_len_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I18(0),
      Q => O8(0),
      R => '0'
    );
\wrap_second_len_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I18(1),
      Q => O8(1),
      R => '0'
    );
\wrap_second_len_r_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I18(2),
      Q => O8(2),
      R => '0'
    );
\wrap_second_len_r_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I18(3),
      Q => O8(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 42 downto 0 );
    I16 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    I17 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    I14 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O14 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O15 : out STD_LOGIC;
    O16 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O17 : out STD_LOGIC;
    O18 : out STD_LOGIC;
    O19 : out STD_LOGIC;
    O20 : out STD_LOGIC;
    O25 : out STD_LOGIC;
    I26 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O26 : out STD_LOGIC;
    O27 : out STD_LOGIC;
    O28 : out STD_LOGIC;
    O30 : out STD_LOGIC;
    O31 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    O33 : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    aclk : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    I10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I11 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    I13 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I15 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I18 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    sel_first_0 : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    aresetn : in STD_LOGIC;
    I22 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice : entity is "axi_register_slice_v2_1_axic_register_slice";
end axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice;

architecture STRUCTURE of axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice is
  signal \^o1\ : STD_LOGIC;
  signal \^o14\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^o15\ : STD_LOGIC;
  signal \^o16\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^o19\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 42 downto 0 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \n_0_aresetn_d_reg[0]\ : STD_LOGIC;
  signal \n_0_aresetn_d_reg[1]\ : STD_LOGIC;
  signal \n_0_axaddr_offset_r[0]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_offset_r[1]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_offset_r[1]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_offset_r[3]_i_2__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[0]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[10]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[11]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[12]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[13]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[14]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[15]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[16]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[17]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[18]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[19]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[1]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[20]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[21]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[22]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[23]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[24]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[25]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[26]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[27]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[28]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[29]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[2]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[30]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[31]_i_2__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[32]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[33]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[34]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[35]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[36]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[38]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[39]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[3]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[44]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[45]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[46]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[47]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[4]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[50]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[5]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[6]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[7]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[8]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[9]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i_reg[38]\ : STD_LOGIC;
  signal \n_0_m_valid_i_i_1__2\ : STD_LOGIC;
  signal \n_0_s_ready_i_i_1__2\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[0]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[10]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[11]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[12]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[13]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[14]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[15]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[16]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[17]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[18]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[19]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[1]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[20]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[21]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[22]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[23]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[24]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[25]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[26]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[27]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[28]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[29]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[2]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[30]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[31]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[32]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[33]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[34]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[35]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[36]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[38]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[39]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[3]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[44]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[45]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[46]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[47]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[4]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[50]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[5]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[6]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[7]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[8]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[9]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r[3]_i_2__0\ : STD_LOGIC;
  signal \n_0_wrap_cnt_r[3]_i_3__0\ : STD_LOGIC;
  signal \n_0_wrap_second_len_r[0]_i_4__0\ : STD_LOGIC;
  signal \n_0_wrap_second_len_r[3]_i_3\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axaddr_offset_r[1]_i_2__0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \axlen_cnt[3]_i_4__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \m_payload_i[0]_i_1__0\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \m_payload_i[10]_i_1__0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \m_payload_i[11]_i_1__0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \m_payload_i[12]_i_1__0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \m_payload_i[13]_i_1__0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \m_payload_i[14]_i_1__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \m_payload_i[15]_i_1__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \m_payload_i[16]_i_1__0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \m_payload_i[17]_i_1__0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \m_payload_i[18]_i_1__0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \m_payload_i[19]_i_1__0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \m_payload_i[1]_i_1__0\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \m_payload_i[20]_i_1__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \m_payload_i[21]_i_1__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \m_payload_i[22]_i_1__0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \m_payload_i[23]_i_1__0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \m_payload_i[24]_i_1__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \m_payload_i[25]_i_1__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \m_payload_i[26]_i_1__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \m_payload_i[27]_i_1__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \m_payload_i[28]_i_1__0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \m_payload_i[29]_i_1__0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \m_payload_i[2]_i_1__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \m_payload_i[30]_i_1__0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \m_payload_i[31]_i_2__0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \m_payload_i[32]_i_1__0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \m_payload_i[33]_i_1__0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \m_payload_i[34]_i_1__0\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \m_payload_i[35]_i_1__1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \m_payload_i[36]_i_1__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \m_payload_i[38]_i_1__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \m_payload_i[39]_i_1__0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \m_payload_i[3]_i_1__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \m_payload_i[44]_i_1__0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \m_payload_i[45]_i_1__0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \m_payload_i[46]_i_1__0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \m_payload_i[47]_i_1__0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \m_payload_i[4]_i_1__0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \m_payload_i[50]_i_1__0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \m_payload_i[5]_i_1__0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \m_payload_i[6]_i_1__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \m_payload_i[7]_i_1__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \m_payload_i[8]_i_1__0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \m_payload_i[9]_i_1__0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \wrap_boundary_axaddr_r[3]_i_2__0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \wrap_boundary_axaddr_r[5]_i_1__0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \wrap_second_len_r[0]_i_4__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \wrap_second_len_r[3]_i_3\ : label is "soft_lutpair26";
begin
  O1 <= \^o1\;
  O14(0) <= \^o14\(0);
  O15 <= \^o15\;
  O16(2 downto 0) <= \^o16\(2 downto 0);
  O19 <= \^o19\;
  O2 <= \^o2\;
  Q(42 downto 0) <= \^q\(42 downto 0);
  SR(0) <= \^sr\(0);
\aresetn_d[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => aresetn,
      O => \^sr\(0)
    );
\aresetn_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => aclk,
      CE => '1',
      D => '1',
      Q => \n_0_aresetn_d_reg[0]\,
      R => \^sr\(0)
    );
\aresetn_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_aresetn_d_reg[0]\,
      Q => \n_0_aresetn_d_reg[1]\,
      R => \^sr\(0)
    );
\axaddr_incr[0]_i_11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1010011010101010"
    )
    port map (
      I0 => \^q\(36),
      I1 => \^q\(35),
      I2 => \^q\(0),
      I3 => I2,
      I4 => I3,
      I5 => m_axi_arready,
      O => S(0)
    );
\axaddr_incr[0]_i_5__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => I26(2)
    );
\axaddr_incr[0]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(36),
      O => I26(1)
    );
\axaddr_incr[0]_i_7__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => I26(0)
    );
\axaddr_incr[1]_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \^q\(35),
      I1 => \^q\(36),
      I2 => sel_first_0,
      O => O25
    );
\axaddr_incr[2]_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => \^q\(36),
      I1 => \^q\(35),
      I2 => sel_first_0,
      O => O26
    );
\axaddr_incr[3]_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => \^q\(35),
      I1 => \^q\(36),
      I2 => sel_first_0,
      O => O27
    );
\axaddr_incr[4]_i_5__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => \^q\(35),
      I1 => \^q\(36),
      I2 => sel_first_0,
      O => O28
    );
\axaddr_incr[4]_i_6__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(7),
      O => I16(3)
    );
\axaddr_incr[4]_i_7__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(6),
      O => I16(2)
    );
\axaddr_incr[4]_i_8__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(5),
      O => I16(1)
    );
\axaddr_incr[4]_i_9__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(4),
      O => I16(0)
    );
\axaddr_incr[8]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(11),
      O => I17(3)
    );
\axaddr_incr[8]_i_6__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(10),
      O => I17(2)
    );
\axaddr_incr[8]_i_7__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(9),
      O => I17(1)
    );
\axaddr_incr[8]_i_8__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(8),
      O => I17(0)
    );
\axaddr_offset_r[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF8FF00000800"
    )
    port map (
      I0 => \^q\(38),
      I1 => \n_0_axaddr_offset_r[0]_i_2__0\,
      I2 => I3,
      I3 => \^o1\,
      I4 => I2,
      I5 => I15(0),
      O => \^o16\(0)
    );
\axaddr_offset_r[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(35),
      I3 => \^q\(2),
      I4 => \^q\(36),
      I5 => \^q\(0),
      O => \n_0_axaddr_offset_r[0]_i_2__0\
    );
\axaddr_offset_r[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AC00FFFFAC000000"
    )
    port map (
      I0 => \n_0_axaddr_offset_r[1]_i_2__0\,
      I1 => \n_0_axaddr_offset_r[1]_i_3\,
      I2 => \^q\(35),
      I3 => \^q\(39),
      I4 => I12,
      I5 => I15(1),
      O => \^o16\(1)
    );
\axaddr_offset_r[1]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \^q\(4),
      I1 => \^q\(36),
      I2 => \^q\(2),
      O => \n_0_axaddr_offset_r[1]_i_2__0\
    );
\axaddr_offset_r[1]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \^q\(3),
      I1 => \^q\(36),
      I2 => \^q\(1),
      O => \n_0_axaddr_offset_r[1]_i_3\
    );
\axaddr_offset_r[2]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(35),
      I3 => \^q\(4),
      I4 => \^q\(36),
      I5 => \^q\(2),
      O => O30
    );
\axaddr_offset_r[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF8FF00000800"
    )
    port map (
      I0 => \^q\(41),
      I1 => \n_0_axaddr_offset_r[3]_i_2__0\,
      I2 => I3,
      I3 => \^o1\,
      I4 => I2,
      I5 => I15(2),
      O => \^o16\(2)
    );
\axaddr_offset_r[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => \^q\(6),
      I1 => \^q\(4),
      I2 => \^q\(35),
      I3 => \^q\(5),
      I4 => \^q\(36),
      I5 => \^q\(3),
      O => \n_0_axaddr_offset_r[3]_i_2__0\
    );
\axlen_cnt[3]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
    port map (
      I0 => \^q\(41),
      I1 => I2,
      I2 => \^o1\,
      I3 => I3,
      O => \^o19\
    );
\m_axi_araddr[11]_INST_0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_m_payload_i_reg[38]\,
      I1 => sel_first_0,
      O => O33
    );
\m_payload_i[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[0]\,
      O => \n_0_m_payload_i[0]_i_1__0\
    );
\m_payload_i[10]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(10),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[10]\,
      O => \n_0_m_payload_i[10]_i_1__0\
    );
\m_payload_i[11]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(11),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[11]\,
      O => \n_0_m_payload_i[11]_i_1__0\
    );
\m_payload_i[12]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(12),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[12]\,
      O => \n_0_m_payload_i[12]_i_1__0\
    );
\m_payload_i[13]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(13),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[13]\,
      O => \n_0_m_payload_i[13]_i_1__0\
    );
\m_payload_i[14]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(14),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[14]\,
      O => \n_0_m_payload_i[14]_i_1__0\
    );
\m_payload_i[15]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(15),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[15]\,
      O => \n_0_m_payload_i[15]_i_1__0\
    );
\m_payload_i[16]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(16),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[16]\,
      O => \n_0_m_payload_i[16]_i_1__0\
    );
\m_payload_i[17]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(17),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[17]\,
      O => \n_0_m_payload_i[17]_i_1__0\
    );
\m_payload_i[18]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(18),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[18]\,
      O => \n_0_m_payload_i[18]_i_1__0\
    );
\m_payload_i[19]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(19),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[19]\,
      O => \n_0_m_payload_i[19]_i_1__0\
    );
\m_payload_i[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[1]\,
      O => \n_0_m_payload_i[1]_i_1__0\
    );
\m_payload_i[20]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(20),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[20]\,
      O => \n_0_m_payload_i[20]_i_1__0\
    );
\m_payload_i[21]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(21),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[21]\,
      O => \n_0_m_payload_i[21]_i_1__0\
    );
\m_payload_i[22]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(22),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[22]\,
      O => \n_0_m_payload_i[22]_i_1__0\
    );
\m_payload_i[23]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(23),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[23]\,
      O => \n_0_m_payload_i[23]_i_1__0\
    );
\m_payload_i[24]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(24),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[24]\,
      O => \n_0_m_payload_i[24]_i_1__0\
    );
\m_payload_i[25]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(25),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[25]\,
      O => \n_0_m_payload_i[25]_i_1__0\
    );
\m_payload_i[26]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(26),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[26]\,
      O => \n_0_m_payload_i[26]_i_1__0\
    );
\m_payload_i[27]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(27),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[27]\,
      O => \n_0_m_payload_i[27]_i_1__0\
    );
\m_payload_i[28]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(28),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[28]\,
      O => \n_0_m_payload_i[28]_i_1__0\
    );
\m_payload_i[29]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(29),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[29]\,
      O => \n_0_m_payload_i[29]_i_1__0\
    );
\m_payload_i[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(2),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[2]\,
      O => \n_0_m_payload_i[2]_i_1__0\
    );
\m_payload_i[30]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(30),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[30]\,
      O => \n_0_m_payload_i[30]_i_1__0\
    );
\m_payload_i[31]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(31),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[31]\,
      O => \n_0_m_payload_i[31]_i_2__0\
    );
\m_payload_i[32]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arprot(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[32]\,
      O => \n_0_m_payload_i[32]_i_1__0\
    );
\m_payload_i[33]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arprot(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[33]\,
      O => \n_0_m_payload_i[33]_i_1__0\
    );
\m_payload_i[34]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arprot(2),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[34]\,
      O => \n_0_m_payload_i[34]_i_1__0\
    );
\m_payload_i[35]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arsize(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[35]\,
      O => \n_0_m_payload_i[35]_i_1__1\
    );
\m_payload_i[36]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arsize(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[36]\,
      O => \n_0_m_payload_i[36]_i_1__0\
    );
\m_payload_i[38]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arburst(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[38]\,
      O => \n_0_m_payload_i[38]_i_1__0\
    );
\m_payload_i[39]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arburst(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[39]\,
      O => \n_0_m_payload_i[39]_i_1__0\
    );
\m_payload_i[3]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(3),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[3]\,
      O => \n_0_m_payload_i[3]_i_1__0\
    );
\m_payload_i[44]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arlen(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[44]\,
      O => \n_0_m_payload_i[44]_i_1__0\
    );
\m_payload_i[45]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arlen(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[45]\,
      O => \n_0_m_payload_i[45]_i_1__0\
    );
\m_payload_i[46]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arlen(2),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[46]\,
      O => \n_0_m_payload_i[46]_i_1__0\
    );
\m_payload_i[47]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arlen(3),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[47]\,
      O => \n_0_m_payload_i[47]_i_1__0\
    );
\m_payload_i[4]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(4),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[4]\,
      O => \n_0_m_payload_i[4]_i_1__0\
    );
\m_payload_i[50]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_arid(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[50]\,
      O => \n_0_m_payload_i[50]_i_1__0\
    );
\m_payload_i[5]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(5),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[5]\,
      O => \n_0_m_payload_i[5]_i_1__0\
    );
\m_payload_i[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(6),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[6]\,
      O => \n_0_m_payload_i[6]_i_1__0\
    );
\m_payload_i[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(7),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[7]\,
      O => \n_0_m_payload_i[7]_i_1__0\
    );
\m_payload_i[8]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(8),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[8]\,
      O => \n_0_m_payload_i[8]_i_1__0\
    );
\m_payload_i[9]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_araddr(9),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[9]\,
      O => \n_0_m_payload_i[9]_i_1__0\
    );
\m_payload_i_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[0]_i_1__0\,
      Q => \^q\(0),
      R => '0'
    );
\m_payload_i_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[10]_i_1__0\,
      Q => \^q\(10),
      R => '0'
    );
\m_payload_i_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[11]_i_1__0\,
      Q => \^q\(11),
      R => '0'
    );
\m_payload_i_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[12]_i_1__0\,
      Q => \^q\(12),
      R => '0'
    );
\m_payload_i_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[13]_i_1__0\,
      Q => \^q\(13),
      R => '0'
    );
\m_payload_i_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[14]_i_1__0\,
      Q => \^q\(14),
      R => '0'
    );
\m_payload_i_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[15]_i_1__0\,
      Q => \^q\(15),
      R => '0'
    );
\m_payload_i_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[16]_i_1__0\,
      Q => \^q\(16),
      R => '0'
    );
\m_payload_i_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[17]_i_1__0\,
      Q => \^q\(17),
      R => '0'
    );
\m_payload_i_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[18]_i_1__0\,
      Q => \^q\(18),
      R => '0'
    );
\m_payload_i_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[19]_i_1__0\,
      Q => \^q\(19),
      R => '0'
    );
\m_payload_i_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[1]_i_1__0\,
      Q => \^q\(1),
      R => '0'
    );
\m_payload_i_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[20]_i_1__0\,
      Q => \^q\(20),
      R => '0'
    );
\m_payload_i_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[21]_i_1__0\,
      Q => \^q\(21),
      R => '0'
    );
\m_payload_i_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[22]_i_1__0\,
      Q => \^q\(22),
      R => '0'
    );
\m_payload_i_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[23]_i_1__0\,
      Q => \^q\(23),
      R => '0'
    );
\m_payload_i_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[24]_i_1__0\,
      Q => \^q\(24),
      R => '0'
    );
\m_payload_i_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[25]_i_1__0\,
      Q => \^q\(25),
      R => '0'
    );
\m_payload_i_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[26]_i_1__0\,
      Q => \^q\(26),
      R => '0'
    );
\m_payload_i_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[27]_i_1__0\,
      Q => \^q\(27),
      R => '0'
    );
\m_payload_i_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[28]_i_1__0\,
      Q => \^q\(28),
      R => '0'
    );
\m_payload_i_reg[29]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[29]_i_1__0\,
      Q => \^q\(29),
      R => '0'
    );
\m_payload_i_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[2]_i_1__0\,
      Q => \^q\(2),
      R => '0'
    );
\m_payload_i_reg[30]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[30]_i_1__0\,
      Q => \^q\(30),
      R => '0'
    );
\m_payload_i_reg[31]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[31]_i_2__0\,
      Q => \^q\(31),
      R => '0'
    );
\m_payload_i_reg[32]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[32]_i_1__0\,
      Q => \^q\(32),
      R => '0'
    );
\m_payload_i_reg[33]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[33]_i_1__0\,
      Q => \^q\(33),
      R => '0'
    );
\m_payload_i_reg[34]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[34]_i_1__0\,
      Q => \^q\(34),
      R => '0'
    );
\m_payload_i_reg[35]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[35]_i_1__1\,
      Q => \^q\(35),
      R => '0'
    );
\m_payload_i_reg[36]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[36]_i_1__0\,
      Q => \^q\(36),
      R => '0'
    );
\m_payload_i_reg[38]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[38]_i_1__0\,
      Q => \n_0_m_payload_i_reg[38]\,
      R => '0'
    );
\m_payload_i_reg[39]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[39]_i_1__0\,
      Q => \^q\(37),
      R => '0'
    );
\m_payload_i_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[3]_i_1__0\,
      Q => \^q\(3),
      R => '0'
    );
\m_payload_i_reg[44]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[44]_i_1__0\,
      Q => \^q\(38),
      R => '0'
    );
\m_payload_i_reg[45]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[45]_i_1__0\,
      Q => \^q\(39),
      R => '0'
    );
\m_payload_i_reg[46]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[46]_i_1__0\,
      Q => \^q\(40),
      R => '0'
    );
\m_payload_i_reg[47]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[47]_i_1__0\,
      Q => \^q\(41),
      R => '0'
    );
\m_payload_i_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[4]_i_1__0\,
      Q => \^q\(4),
      R => '0'
    );
\m_payload_i_reg[50]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[50]_i_1__0\,
      Q => \^q\(42),
      R => '0'
    );
\m_payload_i_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[5]_i_1__0\,
      Q => \^q\(5),
      R => '0'
    );
\m_payload_i_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[6]_i_1__0\,
      Q => \^q\(6),
      R => '0'
    );
\m_payload_i_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[7]_i_1__0\,
      Q => \^q\(7),
      R => '0'
    );
\m_payload_i_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[8]_i_1__0\,
      Q => \^q\(8),
      R => '0'
    );
\m_payload_i_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => I22(0),
      D => \n_0_m_payload_i[9]_i_1__0\,
      Q => \^q\(9),
      R => '0'
    );
\m_valid_i_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF004C00FF00"
    )
    port map (
      I0 => I3,
      I1 => \^o1\,
      I2 => I2,
      I3 => \n_0_aresetn_d_reg[1]\,
      I4 => \^o2\,
      I5 => s_axi_arvalid,
      O => \n_0_m_valid_i_i_1__2\
    );
m_valid_i_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_m_valid_i_i_1__2\,
      Q => \^o1\,
      R => '0'
    );
\next_pending_r_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
    port map (
      I0 => I12,
      I1 => \^q\(38),
      I2 => \^q\(41),
      I3 => \^q\(39),
      I4 => \^q\(40),
      O => O17
    );
\s_ready_i_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B300B300FF00B300"
    )
    port map (
      I0 => I3,
      I1 => \^o1\,
      I2 => I2,
      I3 => \n_0_aresetn_d_reg[0]\,
      I4 => \^o2\,
      I5 => s_axi_arvalid,
      O => \n_0_s_ready_i_i_1__2\
    );
s_ready_i_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_s_ready_i_i_1__2\,
      Q => \^o2\,
      R => '0'
    );
\skid_buffer_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(0),
      Q => \n_0_skid_buffer_reg[0]\,
      R => '0'
    );
\skid_buffer_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(10),
      Q => \n_0_skid_buffer_reg[10]\,
      R => '0'
    );
\skid_buffer_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(11),
      Q => \n_0_skid_buffer_reg[11]\,
      R => '0'
    );
\skid_buffer_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(12),
      Q => \n_0_skid_buffer_reg[12]\,
      R => '0'
    );
\skid_buffer_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(13),
      Q => \n_0_skid_buffer_reg[13]\,
      R => '0'
    );
\skid_buffer_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(14),
      Q => \n_0_skid_buffer_reg[14]\,
      R => '0'
    );
\skid_buffer_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(15),
      Q => \n_0_skid_buffer_reg[15]\,
      R => '0'
    );
\skid_buffer_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(16),
      Q => \n_0_skid_buffer_reg[16]\,
      R => '0'
    );
\skid_buffer_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(17),
      Q => \n_0_skid_buffer_reg[17]\,
      R => '0'
    );
\skid_buffer_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(18),
      Q => \n_0_skid_buffer_reg[18]\,
      R => '0'
    );
\skid_buffer_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(19),
      Q => \n_0_skid_buffer_reg[19]\,
      R => '0'
    );
\skid_buffer_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(1),
      Q => \n_0_skid_buffer_reg[1]\,
      R => '0'
    );
\skid_buffer_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(20),
      Q => \n_0_skid_buffer_reg[20]\,
      R => '0'
    );
\skid_buffer_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(21),
      Q => \n_0_skid_buffer_reg[21]\,
      R => '0'
    );
\skid_buffer_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(22),
      Q => \n_0_skid_buffer_reg[22]\,
      R => '0'
    );
\skid_buffer_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(23),
      Q => \n_0_skid_buffer_reg[23]\,
      R => '0'
    );
\skid_buffer_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(24),
      Q => \n_0_skid_buffer_reg[24]\,
      R => '0'
    );
\skid_buffer_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(25),
      Q => \n_0_skid_buffer_reg[25]\,
      R => '0'
    );
\skid_buffer_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(26),
      Q => \n_0_skid_buffer_reg[26]\,
      R => '0'
    );
\skid_buffer_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(27),
      Q => \n_0_skid_buffer_reg[27]\,
      R => '0'
    );
\skid_buffer_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(28),
      Q => \n_0_skid_buffer_reg[28]\,
      R => '0'
    );
\skid_buffer_reg[29]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(29),
      Q => \n_0_skid_buffer_reg[29]\,
      R => '0'
    );
\skid_buffer_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(2),
      Q => \n_0_skid_buffer_reg[2]\,
      R => '0'
    );
\skid_buffer_reg[30]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(30),
      Q => \n_0_skid_buffer_reg[30]\,
      R => '0'
    );
\skid_buffer_reg[31]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(31),
      Q => \n_0_skid_buffer_reg[31]\,
      R => '0'
    );
\skid_buffer_reg[32]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arprot(0),
      Q => \n_0_skid_buffer_reg[32]\,
      R => '0'
    );
\skid_buffer_reg[33]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arprot(1),
      Q => \n_0_skid_buffer_reg[33]\,
      R => '0'
    );
\skid_buffer_reg[34]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arprot(2),
      Q => \n_0_skid_buffer_reg[34]\,
      R => '0'
    );
\skid_buffer_reg[35]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arsize(0),
      Q => \n_0_skid_buffer_reg[35]\,
      R => '0'
    );
\skid_buffer_reg[36]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arsize(1),
      Q => \n_0_skid_buffer_reg[36]\,
      R => '0'
    );
\skid_buffer_reg[38]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arburst(0),
      Q => \n_0_skid_buffer_reg[38]\,
      R => '0'
    );
\skid_buffer_reg[39]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arburst(1),
      Q => \n_0_skid_buffer_reg[39]\,
      R => '0'
    );
\skid_buffer_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(3),
      Q => \n_0_skid_buffer_reg[3]\,
      R => '0'
    );
\skid_buffer_reg[44]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arlen(0),
      Q => \n_0_skid_buffer_reg[44]\,
      R => '0'
    );
\skid_buffer_reg[45]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arlen(1),
      Q => \n_0_skid_buffer_reg[45]\,
      R => '0'
    );
\skid_buffer_reg[46]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arlen(2),
      Q => \n_0_skid_buffer_reg[46]\,
      R => '0'
    );
\skid_buffer_reg[47]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arlen(3),
      Q => \n_0_skid_buffer_reg[47]\,
      R => '0'
    );
\skid_buffer_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(4),
      Q => \n_0_skid_buffer_reg[4]\,
      R => '0'
    );
\skid_buffer_reg[50]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_arid(0),
      Q => \n_0_skid_buffer_reg[50]\,
      R => '0'
    );
\skid_buffer_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(5),
      Q => \n_0_skid_buffer_reg[5]\,
      R => '0'
    );
\skid_buffer_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(6),
      Q => \n_0_skid_buffer_reg[6]\,
      R => '0'
    );
\skid_buffer_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(7),
      Q => \n_0_skid_buffer_reg[7]\,
      R => '0'
    );
\skid_buffer_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(8),
      Q => \n_0_skid_buffer_reg[8]\,
      R => '0'
    );
\skid_buffer_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_araddr(9),
      Q => \n_0_skid_buffer_reg[9]\,
      R => '0'
    );
\wrap_boundary_axaddr_r[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(36),
      I2 => \^q\(38),
      I3 => \^q\(35),
      O => O31(0)
    );
\wrap_boundary_axaddr_r[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A888AAA"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(36),
      I2 => \^q\(38),
      I3 => \^q\(35),
      I4 => \^q\(39),
      O => O31(1)
    );
\wrap_boundary_axaddr_r[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0A002A2AAAA02A2"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(40),
      I2 => \^q\(35),
      I3 => \^q\(39),
      I4 => \^q\(36),
      I5 => \^q\(38),
      O => O31(2)
    );
\wrap_boundary_axaddr_r[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"020202A2A2A202A2"
    )
    port map (
      I0 => \^q\(3),
      I1 => \n_0_wrap_boundary_axaddr_r[3]_i_2__0\,
      I2 => \^q\(36),
      I3 => \^q\(39),
      I4 => \^q\(35),
      I5 => \^q\(38),
      O => O31(3)
    );
\wrap_boundary_axaddr_r[3]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \^q\(40),
      I1 => \^q\(35),
      I2 => \^q\(41),
      O => \n_0_wrap_boundary_axaddr_r[3]_i_2__0\
    );
\wrap_boundary_axaddr_r[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002A0A2AA02AAA2A"
    )
    port map (
      I0 => \^q\(4),
      I1 => \^q\(41),
      I2 => \^q\(35),
      I3 => \^q\(36),
      I4 => \^q\(40),
      I5 => \^q\(39),
      O => O31(4)
    );
\wrap_boundary_axaddr_r[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2A222AAA"
    )
    port map (
      I0 => \^q\(5),
      I1 => \^q\(36),
      I2 => \^q\(40),
      I3 => \^q\(35),
      I4 => \^q\(41),
      O => O31(5)
    );
\wrap_boundary_axaddr_r[6]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2AAA"
    )
    port map (
      I0 => \^q\(6),
      I1 => \^q\(36),
      I2 => \^q\(35),
      I3 => \^q\(41),
      O => O31(6)
    );
\wrap_cnt_r[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
    port map (
      I0 => \^o14\(0),
      I1 => \^o15\,
      I2 => I10(0),
      O => I14(0)
    );
\wrap_cnt_r[3]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAE"
    )
    port map (
      I0 => \n_0_wrap_cnt_r[3]_i_3__0\,
      I1 => I11,
      I2 => \^o16\(0),
      I3 => \^o16\(1),
      I4 => \^o16\(2),
      O => \^o15\
    );
\wrap_cnt_r[3]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000800FFFFF8FF"
    )
    port map (
      I0 => \n_0_axaddr_offset_r[0]_i_2__0\,
      I1 => \^q\(38),
      I2 => I18(1),
      I3 => \^o1\,
      I4 => I18(0),
      I5 => I13(0),
      O => \n_0_wrap_cnt_r[3]_i_3__0\
    );
\wrap_second_len_r[0]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(36),
      I2 => \^q\(2),
      I3 => \^q\(35),
      I4 => \n_0_axaddr_offset_r[1]_i_3\,
      I5 => \n_0_wrap_second_len_r[0]_i_4__0\,
      O => O20
    );
\wrap_second_len_r[0]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
    port map (
      I0 => \^q\(38),
      I1 => I2,
      I2 => \^o1\,
      I3 => I3,
      O => \n_0_wrap_second_len_r[0]_i_4__0\
    );
\wrap_second_len_r[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02FCFFFF02FC0000"
    )
    port map (
      I0 => \^o16\(2),
      I1 => \^o16\(1),
      I2 => \^o16\(0),
      I3 => I11,
      I4 => I12,
      I5 => I13(1),
      O => \^o14\(0)
    );
\wrap_second_len_r[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EEE222E2"
    )
    port map (
      I0 => \n_0_wrap_second_len_r[3]_i_3\,
      I1 => \^q\(35),
      I2 => \^q\(4),
      I3 => \^q\(36),
      I4 => \^q\(6),
      I5 => \^o19\,
      O => O18
    );
\wrap_second_len_r[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \^q\(5),
      I1 => \^q\(36),
      I2 => \^q\(3),
      O => \n_0_wrap_second_len_r[3]_i_3\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice_0 is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 42 downto 0 );
    O6 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O7 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O8 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC;
    O9 : out STD_LOGIC;
    O10 : out STD_LOGIC;
    O11 : out STD_LOGIC;
    O12 : out STD_LOGIC;
    O13 : out STD_LOGIC;
    O14 : out STD_LOGIC;
    O21 : out STD_LOGIC;
    axaddr_incr0 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O22 : out STD_LOGIC;
    O23 : out STD_LOGIC;
    O24 : out STD_LOGIC;
    O29 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    O32 : out STD_LOGIC;
    aclk : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    b_push : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    sel_first : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice_0 : entity is "axi_register_slice_v2_1_axic_register_slice";
end axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice_0;

architecture STRUCTURE of axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice_0 is
  signal \^o1\ : STD_LOGIC;
  signal \^o10\ : STD_LOGIC;
  signal \^o11\ : STD_LOGIC;
  signal \^o13\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal \^o3\ : STD_LOGIC;
  signal \^o4\ : STD_LOGIC;
  signal \^o5\ : STD_LOGIC;
  signal \^o8\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^o9\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 42 downto 0 );
  signal \n_0_aresetn_d_reg[0]\ : STD_LOGIC;
  signal \n_0_aresetn_d_reg[1]\ : STD_LOGIC;
  signal \n_0_axaddr_offset_r[0]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_offset_r[1]_i_2\ : STD_LOGIC;
  signal \n_0_axaddr_offset_r[2]_i_2__0\ : STD_LOGIC;
  signal \n_0_axaddr_offset_r[2]_i_3\ : STD_LOGIC;
  signal \n_0_axaddr_offset_r[3]_i_2\ : STD_LOGIC;
  signal \n_0_m_payload_i_reg[38]\ : STD_LOGIC;
  signal n_0_m_valid_i_i_1 : STD_LOGIC;
  signal n_0_s_ready_i_i_1 : STD_LOGIC;
  signal \n_0_skid_buffer_reg[0]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[10]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[11]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[12]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[13]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[14]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[15]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[16]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[17]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[18]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[19]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[1]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[20]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[21]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[22]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[23]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[24]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[25]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[26]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[27]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[28]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[29]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[2]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[30]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[31]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[32]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[33]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[34]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[35]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[36]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[38]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[39]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[3]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[44]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[45]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[46]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[47]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[4]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[50]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[5]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[6]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[7]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[8]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[9]\ : STD_LOGIC;
  signal \n_0_wrap_boundary_axaddr_r[3]_i_2\ : STD_LOGIC;
  signal \n_0_wrap_cnt_r[1]_i_2\ : STD_LOGIC;
  signal \n_0_wrap_cnt_r[3]_i_2\ : STD_LOGIC;
  signal \n_0_wrap_cnt_r[3]_i_4\ : STD_LOGIC;
  signal \n_0_wrap_second_len_r[0]_i_4\ : STD_LOGIC;
  signal skid_buffer : STD_LOGIC_VECTOR ( 50 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axaddr_offset_r[1]_i_2\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \axaddr_offset_r[2]_i_2__0\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \m_payload_i[0]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \m_payload_i[10]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \m_payload_i[11]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \m_payload_i[12]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \m_payload_i[13]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \m_payload_i[14]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \m_payload_i[15]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \m_payload_i[16]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \m_payload_i[17]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \m_payload_i[18]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \m_payload_i[19]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \m_payload_i[1]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \m_payload_i[20]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \m_payload_i[21]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \m_payload_i[22]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \m_payload_i[23]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \m_payload_i[24]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \m_payload_i[25]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \m_payload_i[26]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \m_payload_i[27]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \m_payload_i[28]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \m_payload_i[29]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \m_payload_i[2]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \m_payload_i[30]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \m_payload_i[31]_i_2\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \m_payload_i[32]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \m_payload_i[33]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \m_payload_i[34]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \m_payload_i[35]_i_1__0\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \m_payload_i[36]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \m_payload_i[38]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \m_payload_i[39]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \m_payload_i[3]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \m_payload_i[44]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \m_payload_i[45]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \m_payload_i[46]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \m_payload_i[47]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \m_payload_i[4]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \m_payload_i[50]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \m_payload_i[5]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \m_payload_i[6]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \m_payload_i[7]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \m_payload_i[8]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \m_payload_i[9]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \wrap_boundary_axaddr_r[3]_i_2\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \wrap_boundary_axaddr_r[5]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \wrap_cnt_r[2]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \wrap_cnt_r[3]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \wrap_cnt_r[3]_i_4\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \wrap_second_len_r[0]_i_4\ : label is "soft_lutpair49";
begin
  O1 <= \^o1\;
  O10 <= \^o10\;
  O11 <= \^o11\;
  O13 <= \^o13\;
  O2 <= \^o2\;
  O3 <= \^o3\;
  O4 <= \^o4\;
  O5 <= \^o5\;
  O8(2 downto 0) <= \^o8\(2 downto 0);
  O9 <= \^o9\;
  Q(42 downto 0) <= \^q\(42 downto 0);
\aresetn_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => aclk,
      CE => '1',
      D => '1',
      Q => \n_0_aresetn_d_reg[0]\,
      R => SR(0)
    );
\aresetn_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_aresetn_d_reg[0]\,
      Q => \n_0_aresetn_d_reg[1]\,
      R => SR(0)
    );
\axaddr_incr[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => axaddr_incr0(2)
    );
\axaddr_incr[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(36),
      O => axaddr_incr0(1)
    );
\axaddr_incr[0]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(35),
      I2 => \^q\(36),
      O => axaddr_incr0(0)
    );
\axaddr_incr[1]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \^q\(35),
      I1 => \^q\(36),
      I2 => sel_first,
      O => O21
    );
\axaddr_incr[2]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => \^q\(36),
      I1 => \^q\(35),
      I2 => sel_first,
      O => O22
    );
\axaddr_incr[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => \^q\(35),
      I1 => \^q\(36),
      I2 => sel_first,
      O => O23
    );
\axaddr_incr[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => \^q\(35),
      I1 => \^q\(36),
      I2 => sel_first,
      O => O24
    );
\axaddr_incr[4]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(7),
      O => O6(3)
    );
\axaddr_incr[4]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(6),
      O => O6(2)
    );
\axaddr_incr[4]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(5),
      O => O6(1)
    );
\axaddr_incr[4]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(4),
      O => O6(0)
    );
\axaddr_incr[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(11),
      O => O7(3)
    );
\axaddr_incr[8]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(10),
      O => O7(2)
    );
\axaddr_incr[8]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(9),
      O => O7(1)
    );
\axaddr_incr[8]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^q\(8),
      O => O7(0)
    );
\axaddr_offset_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF8FF00000800"
    )
    port map (
      I0 => \^q\(38),
      I1 => \n_0_axaddr_offset_r[0]_i_2\,
      I2 => I1(1),
      I3 => \^o1\,
      I4 => I1(0),
      I5 => I9(0),
      O => \^o3\
    );
\axaddr_offset_r[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(35),
      I3 => \^q\(2),
      I4 => \^q\(36),
      I5 => \^q\(0),
      O => \n_0_axaddr_offset_r[0]_i_2\
    );
\axaddr_offset_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AC00FFFFAC000000"
    )
    port map (
      I0 => \n_0_axaddr_offset_r[2]_i_3\,
      I1 => \n_0_axaddr_offset_r[1]_i_2\,
      I2 => \^q\(35),
      I3 => \^q\(39),
      I4 => I5,
      I5 => I9(1),
      O => \^o4\
    );
\axaddr_offset_r[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \^q\(3),
      I1 => \^q\(36),
      I2 => \^q\(1),
      O => \n_0_axaddr_offset_r[1]_i_2\
    );
\axaddr_offset_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AC00FFFFAC000000"
    )
    port map (
      I0 => \n_0_axaddr_offset_r[2]_i_2__0\,
      I1 => \n_0_axaddr_offset_r[2]_i_3\,
      I2 => \^q\(35),
      I3 => \^q\(40),
      I4 => I5,
      I5 => I9(2),
      O => \^o5\
    );
\axaddr_offset_r[2]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \^q\(5),
      I1 => \^q\(36),
      I2 => \^q\(3),
      O => \n_0_axaddr_offset_r[2]_i_2__0\
    );
\axaddr_offset_r[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \^q\(4),
      I1 => \^q\(36),
      I2 => \^q\(2),
      O => \n_0_axaddr_offset_r[2]_i_3\
    );
\axaddr_offset_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF8FF00000800"
    )
    port map (
      I0 => \^q\(41),
      I1 => \n_0_axaddr_offset_r[3]_i_2\,
      I2 => I1(1),
      I3 => \^o1\,
      I4 => I1(0),
      I5 => I9(3),
      O => \^o11\
    );
\axaddr_offset_r[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => \^q\(6),
      I1 => \^q\(4),
      I2 => \^q\(35),
      I3 => \^q\(5),
      I4 => \^q\(36),
      I5 => \^q\(3),
      O => \n_0_axaddr_offset_r[3]_i_2\
    );
\axlen_cnt[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
    port map (
      I0 => \^q\(41),
      I1 => I1(0),
      I2 => \^o1\,
      I3 => I1(1),
      O => \^o13\
    );
\m_axi_awaddr[11]_INST_0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_m_payload_i_reg[38]\,
      I1 => sel_first,
      O => O32
    );
\m_payload_i[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[0]\,
      O => skid_buffer(0)
    );
\m_payload_i[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(10),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[10]\,
      O => skid_buffer(10)
    );
\m_payload_i[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(11),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[11]\,
      O => skid_buffer(11)
    );
\m_payload_i[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(12),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[12]\,
      O => skid_buffer(12)
    );
\m_payload_i[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(13),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[13]\,
      O => skid_buffer(13)
    );
\m_payload_i[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(14),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[14]\,
      O => skid_buffer(14)
    );
\m_payload_i[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(15),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[15]\,
      O => skid_buffer(15)
    );
\m_payload_i[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(16),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[16]\,
      O => skid_buffer(16)
    );
\m_payload_i[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(17),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[17]\,
      O => skid_buffer(17)
    );
\m_payload_i[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(18),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[18]\,
      O => skid_buffer(18)
    );
\m_payload_i[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(19),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[19]\,
      O => skid_buffer(19)
    );
\m_payload_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[1]\,
      O => skid_buffer(1)
    );
\m_payload_i[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(20),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[20]\,
      O => skid_buffer(20)
    );
\m_payload_i[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(21),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[21]\,
      O => skid_buffer(21)
    );
\m_payload_i[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(22),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[22]\,
      O => skid_buffer(22)
    );
\m_payload_i[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(23),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[23]\,
      O => skid_buffer(23)
    );
\m_payload_i[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(24),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[24]\,
      O => skid_buffer(24)
    );
\m_payload_i[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(25),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[25]\,
      O => skid_buffer(25)
    );
\m_payload_i[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(26),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[26]\,
      O => skid_buffer(26)
    );
\m_payload_i[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(27),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[27]\,
      O => skid_buffer(27)
    );
\m_payload_i[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(28),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[28]\,
      O => skid_buffer(28)
    );
\m_payload_i[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(29),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[29]\,
      O => skid_buffer(29)
    );
\m_payload_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(2),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[2]\,
      O => skid_buffer(2)
    );
\m_payload_i[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(30),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[30]\,
      O => skid_buffer(30)
    );
\m_payload_i[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(31),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[31]\,
      O => skid_buffer(31)
    );
\m_payload_i[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awprot(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[32]\,
      O => skid_buffer(32)
    );
\m_payload_i[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awprot(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[33]\,
      O => skid_buffer(33)
    );
\m_payload_i[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awprot(2),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[34]\,
      O => skid_buffer(34)
    );
\m_payload_i[35]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awsize(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[35]\,
      O => skid_buffer(35)
    );
\m_payload_i[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awsize(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[36]\,
      O => skid_buffer(36)
    );
\m_payload_i[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awburst(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[38]\,
      O => skid_buffer(38)
    );
\m_payload_i[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awburst(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[39]\,
      O => skid_buffer(39)
    );
\m_payload_i[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(3),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[3]\,
      O => skid_buffer(3)
    );
\m_payload_i[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awlen(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[44]\,
      O => skid_buffer(44)
    );
\m_payload_i[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awlen(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[45]\,
      O => skid_buffer(45)
    );
\m_payload_i[46]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awlen(2),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[46]\,
      O => skid_buffer(46)
    );
\m_payload_i[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awlen(3),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[47]\,
      O => skid_buffer(47)
    );
\m_payload_i[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(4),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[4]\,
      O => skid_buffer(4)
    );
\m_payload_i[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awid(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[50]\,
      O => skid_buffer(50)
    );
\m_payload_i[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(5),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[5]\,
      O => skid_buffer(5)
    );
\m_payload_i[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(6),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[6]\,
      O => skid_buffer(6)
    );
\m_payload_i[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(7),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[7]\,
      O => skid_buffer(7)
    );
\m_payload_i[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(8),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[8]\,
      O => skid_buffer(8)
    );
\m_payload_i[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axi_awaddr(9),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[9]\,
      O => skid_buffer(9)
    );
\m_payload_i_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(0),
      Q => \^q\(0),
      R => '0'
    );
\m_payload_i_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(10),
      Q => \^q\(10),
      R => '0'
    );
\m_payload_i_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(11),
      Q => \^q\(11),
      R => '0'
    );
\m_payload_i_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(12),
      Q => \^q\(12),
      R => '0'
    );
\m_payload_i_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(13),
      Q => \^q\(13),
      R => '0'
    );
\m_payload_i_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(14),
      Q => \^q\(14),
      R => '0'
    );
\m_payload_i_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(15),
      Q => \^q\(15),
      R => '0'
    );
\m_payload_i_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(16),
      Q => \^q\(16),
      R => '0'
    );
\m_payload_i_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(17),
      Q => \^q\(17),
      R => '0'
    );
\m_payload_i_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(18),
      Q => \^q\(18),
      R => '0'
    );
\m_payload_i_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(19),
      Q => \^q\(19),
      R => '0'
    );
\m_payload_i_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(1),
      Q => \^q\(1),
      R => '0'
    );
\m_payload_i_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(20),
      Q => \^q\(20),
      R => '0'
    );
\m_payload_i_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(21),
      Q => \^q\(21),
      R => '0'
    );
\m_payload_i_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(22),
      Q => \^q\(22),
      R => '0'
    );
\m_payload_i_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(23),
      Q => \^q\(23),
      R => '0'
    );
\m_payload_i_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(24),
      Q => \^q\(24),
      R => '0'
    );
\m_payload_i_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(25),
      Q => \^q\(25),
      R => '0'
    );
\m_payload_i_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(26),
      Q => \^q\(26),
      R => '0'
    );
\m_payload_i_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(27),
      Q => \^q\(27),
      R => '0'
    );
\m_payload_i_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(28),
      Q => \^q\(28),
      R => '0'
    );
\m_payload_i_reg[29]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(29),
      Q => \^q\(29),
      R => '0'
    );
\m_payload_i_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(2),
      Q => \^q\(2),
      R => '0'
    );
\m_payload_i_reg[30]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(30),
      Q => \^q\(30),
      R => '0'
    );
\m_payload_i_reg[31]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(31),
      Q => \^q\(31),
      R => '0'
    );
\m_payload_i_reg[32]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(32),
      Q => \^q\(32),
      R => '0'
    );
\m_payload_i_reg[33]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(33),
      Q => \^q\(33),
      R => '0'
    );
\m_payload_i_reg[34]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(34),
      Q => \^q\(34),
      R => '0'
    );
\m_payload_i_reg[35]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(35),
      Q => \^q\(35),
      R => '0'
    );
\m_payload_i_reg[36]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(36),
      Q => \^q\(36),
      R => '0'
    );
\m_payload_i_reg[38]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(38),
      Q => \n_0_m_payload_i_reg[38]\,
      R => '0'
    );
\m_payload_i_reg[39]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(39),
      Q => \^q\(37),
      R => '0'
    );
\m_payload_i_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(3),
      Q => \^q\(3),
      R => '0'
    );
\m_payload_i_reg[44]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(44),
      Q => \^q\(38),
      R => '0'
    );
\m_payload_i_reg[45]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(45),
      Q => \^q\(39),
      R => '0'
    );
\m_payload_i_reg[46]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(46),
      Q => \^q\(40),
      R => '0'
    );
\m_payload_i_reg[47]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(47),
      Q => \^q\(41),
      R => '0'
    );
\m_payload_i_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(4),
      Q => \^q\(4),
      R => '0'
    );
\m_payload_i_reg[50]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(50),
      Q => \^q\(42),
      R => '0'
    );
\m_payload_i_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(5),
      Q => \^q\(5),
      R => '0'
    );
\m_payload_i_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(6),
      Q => \^q\(6),
      R => '0'
    );
\m_payload_i_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(7),
      Q => \^q\(7),
      R => '0'
    );
\m_payload_i_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(8),
      Q => \^q\(8),
      R => '0'
    );
\m_payload_i_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => E(0),
      D => skid_buffer(9),
      Q => \^q\(9),
      R => '0'
    );
m_valid_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2A2AAA2"
    )
    port map (
      I0 => \n_0_aresetn_d_reg[1]\,
      I1 => \^o2\,
      I2 => s_axi_awvalid,
      I3 => \^o1\,
      I4 => b_push,
      O => n_0_m_valid_i_i_1
    );
m_valid_i_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => n_0_m_valid_i_i_1,
      Q => \^o1\,
      R => '0'
    );
next_pending_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \^q\(40),
      I1 => \^q\(39),
      I2 => \^q\(41),
      I3 => \^q\(38),
      O => O14
    );
s_ready_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2A2AAA2"
    )
    port map (
      I0 => \n_0_aresetn_d_reg[0]\,
      I1 => \^o1\,
      I2 => b_push,
      I3 => \^o2\,
      I4 => s_axi_awvalid,
      O => n_0_s_ready_i_i_1
    );
s_ready_i_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => n_0_s_ready_i_i_1,
      Q => \^o2\,
      R => '0'
    );
\skid_buffer_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(0),
      Q => \n_0_skid_buffer_reg[0]\,
      R => '0'
    );
\skid_buffer_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(10),
      Q => \n_0_skid_buffer_reg[10]\,
      R => '0'
    );
\skid_buffer_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(11),
      Q => \n_0_skid_buffer_reg[11]\,
      R => '0'
    );
\skid_buffer_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(12),
      Q => \n_0_skid_buffer_reg[12]\,
      R => '0'
    );
\skid_buffer_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(13),
      Q => \n_0_skid_buffer_reg[13]\,
      R => '0'
    );
\skid_buffer_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(14),
      Q => \n_0_skid_buffer_reg[14]\,
      R => '0'
    );
\skid_buffer_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(15),
      Q => \n_0_skid_buffer_reg[15]\,
      R => '0'
    );
\skid_buffer_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(16),
      Q => \n_0_skid_buffer_reg[16]\,
      R => '0'
    );
\skid_buffer_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(17),
      Q => \n_0_skid_buffer_reg[17]\,
      R => '0'
    );
\skid_buffer_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(18),
      Q => \n_0_skid_buffer_reg[18]\,
      R => '0'
    );
\skid_buffer_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(19),
      Q => \n_0_skid_buffer_reg[19]\,
      R => '0'
    );
\skid_buffer_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(1),
      Q => \n_0_skid_buffer_reg[1]\,
      R => '0'
    );
\skid_buffer_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(20),
      Q => \n_0_skid_buffer_reg[20]\,
      R => '0'
    );
\skid_buffer_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(21),
      Q => \n_0_skid_buffer_reg[21]\,
      R => '0'
    );
\skid_buffer_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(22),
      Q => \n_0_skid_buffer_reg[22]\,
      R => '0'
    );
\skid_buffer_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(23),
      Q => \n_0_skid_buffer_reg[23]\,
      R => '0'
    );
\skid_buffer_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(24),
      Q => \n_0_skid_buffer_reg[24]\,
      R => '0'
    );
\skid_buffer_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(25),
      Q => \n_0_skid_buffer_reg[25]\,
      R => '0'
    );
\skid_buffer_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(26),
      Q => \n_0_skid_buffer_reg[26]\,
      R => '0'
    );
\skid_buffer_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(27),
      Q => \n_0_skid_buffer_reg[27]\,
      R => '0'
    );
\skid_buffer_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(28),
      Q => \n_0_skid_buffer_reg[28]\,
      R => '0'
    );
\skid_buffer_reg[29]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(29),
      Q => \n_0_skid_buffer_reg[29]\,
      R => '0'
    );
\skid_buffer_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(2),
      Q => \n_0_skid_buffer_reg[2]\,
      R => '0'
    );
\skid_buffer_reg[30]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(30),
      Q => \n_0_skid_buffer_reg[30]\,
      R => '0'
    );
\skid_buffer_reg[31]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(31),
      Q => \n_0_skid_buffer_reg[31]\,
      R => '0'
    );
\skid_buffer_reg[32]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awprot(0),
      Q => \n_0_skid_buffer_reg[32]\,
      R => '0'
    );
\skid_buffer_reg[33]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awprot(1),
      Q => \n_0_skid_buffer_reg[33]\,
      R => '0'
    );
\skid_buffer_reg[34]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awprot(2),
      Q => \n_0_skid_buffer_reg[34]\,
      R => '0'
    );
\skid_buffer_reg[35]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awsize(0),
      Q => \n_0_skid_buffer_reg[35]\,
      R => '0'
    );
\skid_buffer_reg[36]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awsize(1),
      Q => \n_0_skid_buffer_reg[36]\,
      R => '0'
    );
\skid_buffer_reg[38]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awburst(0),
      Q => \n_0_skid_buffer_reg[38]\,
      R => '0'
    );
\skid_buffer_reg[39]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awburst(1),
      Q => \n_0_skid_buffer_reg[39]\,
      R => '0'
    );
\skid_buffer_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(3),
      Q => \n_0_skid_buffer_reg[3]\,
      R => '0'
    );
\skid_buffer_reg[44]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awlen(0),
      Q => \n_0_skid_buffer_reg[44]\,
      R => '0'
    );
\skid_buffer_reg[45]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awlen(1),
      Q => \n_0_skid_buffer_reg[45]\,
      R => '0'
    );
\skid_buffer_reg[46]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awlen(2),
      Q => \n_0_skid_buffer_reg[46]\,
      R => '0'
    );
\skid_buffer_reg[47]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awlen(3),
      Q => \n_0_skid_buffer_reg[47]\,
      R => '0'
    );
\skid_buffer_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(4),
      Q => \n_0_skid_buffer_reg[4]\,
      R => '0'
    );
\skid_buffer_reg[50]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awid(0),
      Q => \n_0_skid_buffer_reg[50]\,
      R => '0'
    );
\skid_buffer_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(5),
      Q => \n_0_skid_buffer_reg[5]\,
      R => '0'
    );
\skid_buffer_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(6),
      Q => \n_0_skid_buffer_reg[6]\,
      R => '0'
    );
\skid_buffer_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(7),
      Q => \n_0_skid_buffer_reg[7]\,
      R => '0'
    );
\skid_buffer_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(8),
      Q => \n_0_skid_buffer_reg[8]\,
      R => '0'
    );
\skid_buffer_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => s_axi_awaddr(9),
      Q => \n_0_skid_buffer_reg[9]\,
      R => '0'
    );
\wrap_boundary_axaddr_r[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(36),
      I2 => \^q\(38),
      I3 => \^q\(35),
      O => O29(0)
    );
\wrap_boundary_axaddr_r[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A888AAA"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(36),
      I2 => \^q\(38),
      I3 => \^q\(35),
      I4 => \^q\(39),
      O => O29(1)
    );
\wrap_boundary_axaddr_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888082AAAAA082A"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(35),
      I2 => \^q\(39),
      I3 => \^q\(40),
      I4 => \^q\(36),
      I5 => \^q\(38),
      O => O29(2)
    );
\wrap_boundary_axaddr_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"020202A2A2A202A2"
    )
    port map (
      I0 => \^q\(3),
      I1 => \n_0_wrap_boundary_axaddr_r[3]_i_2\,
      I2 => \^q\(36),
      I3 => \^q\(39),
      I4 => \^q\(35),
      I5 => \^q\(38),
      O => O29(3)
    );
\wrap_boundary_axaddr_r[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \^q\(40),
      I1 => \^q\(35),
      I2 => \^q\(41),
      O => \n_0_wrap_boundary_axaddr_r[3]_i_2\
    );
\wrap_boundary_axaddr_r[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002AA02A0A2AAA2A"
    )
    port map (
      I0 => \^q\(4),
      I1 => \^q\(41),
      I2 => \^q\(35),
      I3 => \^q\(36),
      I4 => \^q\(39),
      I5 => \^q\(40),
      O => O29(4)
    );
\wrap_boundary_axaddr_r[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2A222AAA"
    )
    port map (
      I0 => \^q\(5),
      I1 => \^q\(36),
      I2 => \^q\(40),
      I3 => \^q\(35),
      I4 => \^q\(41),
      O => O29(5)
    );
\wrap_boundary_axaddr_r[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2AAA"
    )
    port map (
      I0 => \^q\(6),
      I1 => \^q\(36),
      I2 => \^q\(35),
      I3 => \^q\(41),
      O => O29(6)
    );
\wrap_cnt_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"99A955A599A9AAAA"
    )
    port map (
      I0 => \^o8\(0),
      I1 => \^o10\,
      I2 => \n_0_wrap_cnt_r[1]_i_2\,
      I3 => I7,
      I4 => I5,
      I5 => I6(0),
      O => D(0)
    );
\wrap_cnt_r[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \^o4\,
      I1 => \^o3\,
      O => \n_0_wrap_cnt_r[1]_i_2\
    );
\wrap_cnt_r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => \^o8\(1),
      I1 => \n_0_wrap_cnt_r[3]_i_2\,
      I2 => \^o8\(0),
      O => D(1)
    );
\wrap_cnt_r[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => \^o8\(2),
      I1 => \^o8\(0),
      I2 => \n_0_wrap_cnt_r[3]_i_2\,
      I3 => \^o8\(1),
      O => D(2)
    );
\wrap_cnt_r[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8FFFFFFFC"
    )
    port map (
      I0 => I8,
      I1 => \^o11\,
      I2 => \^o5\,
      I3 => \^o4\,
      I4 => \^o3\,
      I5 => \n_0_wrap_cnt_r[3]_i_4\,
      O => \n_0_wrap_cnt_r[3]_i_2\
    );
\wrap_cnt_r[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF8FF"
    )
    port map (
      I0 => \^q\(38),
      I1 => \n_0_axaddr_offset_r[0]_i_2\,
      I2 => I1(0),
      I3 => \^o1\,
      I4 => I1(1),
      O => \n_0_wrap_cnt_r[3]_i_4\
    );
\wrap_second_len_r[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000010001"
    )
    port map (
      I0 => \^o3\,
      I1 => \^o4\,
      I2 => \^o5\,
      I3 => \^o9\,
      I4 => I5,
      I5 => I9(3),
      O => O12
    );
\wrap_second_len_r[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(36),
      I2 => \^q\(2),
      I3 => \^q\(35),
      I4 => \n_0_axaddr_offset_r[1]_i_2\,
      I5 => \n_0_wrap_second_len_r[0]_i_4\,
      O => \^o10\
    );
\wrap_second_len_r[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
    port map (
      I0 => \^q\(38),
      I1 => I1(0),
      I2 => \^o1\,
      I3 => I1(1),
      O => \n_0_wrap_second_len_r[0]_i_4\
    );
\wrap_second_len_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F00EFFFFF00E0000"
    )
    port map (
      I0 => \^o11\,
      I1 => \^o5\,
      I2 => \^o3\,
      I3 => \^o4\,
      I4 => I5,
      I5 => I6(1),
      O => \^o8\(0)
    );
\wrap_second_len_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCC2FFFFCCC20000"
    )
    port map (
      I0 => \^o11\,
      I1 => \^o5\,
      I2 => \^o4\,
      I3 => \^o3\,
      I4 => I5,
      I5 => I6(2),
      O => \^o8\(1)
    );
\wrap_second_len_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE00FFFFFE00FE00"
    )
    port map (
      I0 => \^o3\,
      I1 => \^o4\,
      I2 => \^o5\,
      I3 => \^o9\,
      I4 => I5,
      I5 => I6(3),
      O => \^o8\(2)
    );
\wrap_second_len_r[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EEE222E2"
    )
    port map (
      I0 => \n_0_axaddr_offset_r[2]_i_2__0\,
      I1 => \^q\(35),
      I2 => \^q\(4),
      I3 => \^q\(36),
      I4 => \^q\(6),
      I5 => \^o13\,
      O => \^o9\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized1\ is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    shandshake : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    aclk : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    si_rs_bvalid : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    I19 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized1\ : entity is "axi_register_slice_v2_1_axic_register_slice";
end \axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized1\;

architecture STRUCTURE of \axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized1\ is
  signal \^o1\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal \n_0_aresetn_d_reg[0]\ : STD_LOGIC;
  signal \n_0_aresetn_d_reg[1]\ : STD_LOGIC;
  signal \n_0_m_payload_i[0]_i_1\ : STD_LOGIC;
  signal \n_0_m_payload_i[1]_i_1\ : STD_LOGIC;
  signal \n_0_m_payload_i[2]_i_1\ : STD_LOGIC;
  signal \n_0_m_valid_i_i_1__1\ : STD_LOGIC;
  signal \n_0_s_ready_i_i_1__1\ : STD_LOGIC;
  signal \n_0_skid_buffer[0]_i_1\ : STD_LOGIC;
  signal \n_0_skid_buffer[1]_i_1\ : STD_LOGIC;
  signal \n_0_skid_buffer[2]_i_1\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[0]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[1]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[2]\ : STD_LOGIC;
  signal \^s_axi_bid\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \m_valid_i_i_1__1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of shandshake_r_i_1 : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \skid_buffer[0]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \skid_buffer[2]_i_1\ : label is "soft_lutpair76";
begin
  O1 <= \^o1\;
  O2 <= \^o2\;
  s_axi_bid(0) <= \^s_axi_bid\(0);
  s_axi_bresp(1 downto 0) <= \^s_axi_bresp\(1 downto 0);
\aresetn_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => aclk,
      CE => '1',
      D => '1',
      Q => \n_0_aresetn_d_reg[0]\,
      R => SR(0)
    );
\aresetn_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_aresetn_d_reg[0]\,
      Q => \n_0_aresetn_d_reg[1]\,
      R => SR(0)
    );
\m_payload_i[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FFB8B8B800B8B8"
    )
    port map (
      I0 => I19(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[0]\,
      I3 => s_axi_bready,
      I4 => \^o1\,
      I5 => \^s_axi_bresp\(0),
      O => \n_0_m_payload_i[0]_i_1\
    );
\m_payload_i[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FFB8B8B800B8B8"
    )
    port map (
      I0 => I19(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[1]\,
      I3 => s_axi_bready,
      I4 => \^o1\,
      I5 => \^s_axi_bresp\(1),
      O => \n_0_m_payload_i[1]_i_1\
    );
\m_payload_i[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FFB8B8B800B8B8"
    )
    port map (
      I0 => \out\(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[2]\,
      I3 => s_axi_bready,
      I4 => \^o1\,
      I5 => \^s_axi_bid\(0),
      O => \n_0_m_payload_i[2]_i_1\
    );
\m_payload_i_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_m_payload_i[0]_i_1\,
      Q => \^s_axi_bresp\(0),
      R => '0'
    );
\m_payload_i_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_m_payload_i[1]_i_1\,
      Q => \^s_axi_bresp\(1),
      R => '0'
    );
\m_payload_i_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_m_payload_i[2]_i_1\,
      Q => \^s_axi_bid\(0),
      R => '0'
    );
\m_valid_i_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2A2AAA2"
    )
    port map (
      I0 => \n_0_aresetn_d_reg[1]\,
      I1 => \^o2\,
      I2 => si_rs_bvalid,
      I3 => \^o1\,
      I4 => s_axi_bready,
      O => \n_0_m_valid_i_i_1__1\
    );
m_valid_i_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_m_valid_i_i_1__1\,
      Q => \^o1\,
      R => '0'
    );
\s_ready_i_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2A2AAA2"
    )
    port map (
      I0 => \n_0_aresetn_d_reg[0]\,
      I1 => \^o1\,
      I2 => s_axi_bready,
      I3 => \^o2\,
      I4 => si_rs_bvalid,
      O => \n_0_s_ready_i_i_1__1\
    );
s_ready_i_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_s_ready_i_i_1__1\,
      Q => \^o2\,
      R => '0'
    );
shandshake_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => \^o2\,
      I1 => si_rs_bvalid,
      O => shandshake
    );
\skid_buffer[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I19(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[0]\,
      O => \n_0_skid_buffer[0]_i_1\
    );
\skid_buffer[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I19(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[1]\,
      O => \n_0_skid_buffer[1]_i_1\
    );
\skid_buffer[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => \out\(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[2]\,
      O => \n_0_skid_buffer[2]_i_1\
    );
\skid_buffer_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_skid_buffer[0]_i_1\,
      Q => \n_0_skid_buffer_reg[0]\,
      R => '0'
    );
\skid_buffer_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_skid_buffer[1]_i_1\,
      Q => \n_0_skid_buffer_reg[1]\,
      R => '0'
    );
\skid_buffer_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_skid_buffer[2]_i_1\,
      Q => \n_0_skid_buffer_reg[2]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized2\ is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O34 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    aclk : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I20 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I21 : in STD_LOGIC_VECTOR ( 33 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized2\ : entity is "axi_register_slice_v2_1_axic_register_slice";
end \axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized2\;

architecture STRUCTURE of \axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized2\ is
  signal \^o1\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal \n_0_aresetn_d_reg[0]\ : STD_LOGIC;
  signal \n_0_aresetn_d_reg[1]\ : STD_LOGIC;
  signal \n_0_m_payload_i[0]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[10]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[11]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[12]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[13]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[14]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[15]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[16]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[17]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[18]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[19]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[1]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[20]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[21]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[22]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[23]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[24]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[25]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[26]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[27]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[28]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[29]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[2]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[30]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[31]_i_1__0\ : STD_LOGIC;
  signal \n_0_m_payload_i[32]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[33]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[34]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[35]_i_2\ : STD_LOGIC;
  signal \n_0_m_payload_i[3]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[4]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[5]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[6]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[7]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[8]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_payload_i[9]_i_1__1\ : STD_LOGIC;
  signal \n_0_m_valid_i_i_1__0\ : STD_LOGIC;
  signal \n_0_s_ready_i_i_1__0\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[0]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[10]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[11]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[12]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[13]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[14]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[15]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[16]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[17]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[18]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[19]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[1]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[20]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[21]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[22]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[23]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[24]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[25]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[26]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[27]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[28]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[29]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[2]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[30]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[31]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[32]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[33]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[34]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[35]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[3]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[4]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[5]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[6]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[7]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[8]\ : STD_LOGIC;
  signal \n_0_skid_buffer_reg[9]\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \m_payload_i[0]_i_1__1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \m_payload_i[10]_i_1__1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \m_payload_i[11]_i_1__1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \m_payload_i[12]_i_1__1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \m_payload_i[13]_i_1__1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \m_payload_i[14]_i_1__1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \m_payload_i[15]_i_1__1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \m_payload_i[16]_i_1__1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \m_payload_i[17]_i_1__1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \m_payload_i[18]_i_1__1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \m_payload_i[19]_i_1__1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \m_payload_i[1]_i_1__1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \m_payload_i[20]_i_1__1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \m_payload_i[21]_i_1__1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \m_payload_i[22]_i_1__1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \m_payload_i[23]_i_1__1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \m_payload_i[24]_i_1__1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \m_payload_i[25]_i_1__1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \m_payload_i[26]_i_1__1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \m_payload_i[27]_i_1__1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \m_payload_i[28]_i_1__1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \m_payload_i[29]_i_1__1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \m_payload_i[2]_i_1__1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \m_payload_i[30]_i_1__1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \m_payload_i[31]_i_1__0\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \m_payload_i[32]_i_1__1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \m_payload_i[33]_i_1__1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \m_payload_i[34]_i_1__1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \m_payload_i[35]_i_2\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \m_payload_i[3]_i_1__1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \m_payload_i[4]_i_1__1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \m_payload_i[5]_i_1__1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \m_payload_i[6]_i_1__1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \m_payload_i[7]_i_1__1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \m_payload_i[8]_i_1__1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \m_payload_i[9]_i_1__1\ : label is "soft_lutpair90";
begin
  O1 <= \^o1\;
  O2 <= \^o2\;
\aresetn_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => aclk,
      CE => '1',
      D => '1',
      Q => \n_0_aresetn_d_reg[0]\,
      R => SR(0)
    );
\aresetn_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_aresetn_d_reg[0]\,
      Q => \n_0_aresetn_d_reg[1]\,
      R => SR(0)
    );
\m_payload_i[0]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[0]\,
      O => \n_0_m_payload_i[0]_i_1__1\
    );
\m_payload_i[10]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(10),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[10]\,
      O => \n_0_m_payload_i[10]_i_1__1\
    );
\m_payload_i[11]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(11),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[11]\,
      O => \n_0_m_payload_i[11]_i_1__1\
    );
\m_payload_i[12]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(12),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[12]\,
      O => \n_0_m_payload_i[12]_i_1__1\
    );
\m_payload_i[13]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(13),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[13]\,
      O => \n_0_m_payload_i[13]_i_1__1\
    );
\m_payload_i[14]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(14),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[14]\,
      O => \n_0_m_payload_i[14]_i_1__1\
    );
\m_payload_i[15]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(15),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[15]\,
      O => \n_0_m_payload_i[15]_i_1__1\
    );
\m_payload_i[16]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(16),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[16]\,
      O => \n_0_m_payload_i[16]_i_1__1\
    );
\m_payload_i[17]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(17),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[17]\,
      O => \n_0_m_payload_i[17]_i_1__1\
    );
\m_payload_i[18]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(18),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[18]\,
      O => \n_0_m_payload_i[18]_i_1__1\
    );
\m_payload_i[19]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(19),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[19]\,
      O => \n_0_m_payload_i[19]_i_1__1\
    );
\m_payload_i[1]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[1]\,
      O => \n_0_m_payload_i[1]_i_1__1\
    );
\m_payload_i[20]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(20),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[20]\,
      O => \n_0_m_payload_i[20]_i_1__1\
    );
\m_payload_i[21]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(21),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[21]\,
      O => \n_0_m_payload_i[21]_i_1__1\
    );
\m_payload_i[22]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(22),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[22]\,
      O => \n_0_m_payload_i[22]_i_1__1\
    );
\m_payload_i[23]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(23),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[23]\,
      O => \n_0_m_payload_i[23]_i_1__1\
    );
\m_payload_i[24]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(24),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[24]\,
      O => \n_0_m_payload_i[24]_i_1__1\
    );
\m_payload_i[25]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(25),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[25]\,
      O => \n_0_m_payload_i[25]_i_1__1\
    );
\m_payload_i[26]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(26),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[26]\,
      O => \n_0_m_payload_i[26]_i_1__1\
    );
\m_payload_i[27]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(27),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[27]\,
      O => \n_0_m_payload_i[27]_i_1__1\
    );
\m_payload_i[28]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(28),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[28]\,
      O => \n_0_m_payload_i[28]_i_1__1\
    );
\m_payload_i[29]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(29),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[29]\,
      O => \n_0_m_payload_i[29]_i_1__1\
    );
\m_payload_i[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(2),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[2]\,
      O => \n_0_m_payload_i[2]_i_1__1\
    );
\m_payload_i[30]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(30),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[30]\,
      O => \n_0_m_payload_i[30]_i_1__1\
    );
\m_payload_i[31]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(31),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[31]\,
      O => \n_0_m_payload_i[31]_i_1__0\
    );
\m_payload_i[32]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(32),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[32]\,
      O => \n_0_m_payload_i[32]_i_1__1\
    );
\m_payload_i[33]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(33),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[33]\,
      O => \n_0_m_payload_i[33]_i_1__1\
    );
\m_payload_i[34]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I20(0),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[34]\,
      O => \n_0_m_payload_i[34]_i_1__1\
    );
\m_payload_i[35]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => s_axi_rready,
      I1 => \^o1\,
      O => p_1_in
    );
\m_payload_i[35]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I20(1),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[35]\,
      O => \n_0_m_payload_i[35]_i_2\
    );
\m_payload_i[3]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(3),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[3]\,
      O => \n_0_m_payload_i[3]_i_1__1\
    );
\m_payload_i[4]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(4),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[4]\,
      O => \n_0_m_payload_i[4]_i_1__1\
    );
\m_payload_i[5]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(5),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[5]\,
      O => \n_0_m_payload_i[5]_i_1__1\
    );
\m_payload_i[6]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(6),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[6]\,
      O => \n_0_m_payload_i[6]_i_1__1\
    );
\m_payload_i[7]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(7),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[7]\,
      O => \n_0_m_payload_i[7]_i_1__1\
    );
\m_payload_i[8]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(8),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[8]\,
      O => \n_0_m_payload_i[8]_i_1__1\
    );
\m_payload_i[9]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => I21(9),
      I1 => \^o2\,
      I2 => \n_0_skid_buffer_reg[9]\,
      O => \n_0_m_payload_i[9]_i_1__1\
    );
\m_payload_i_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[0]_i_1__1\,
      Q => O34(0),
      R => '0'
    );
\m_payload_i_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[10]_i_1__1\,
      Q => O34(10),
      R => '0'
    );
\m_payload_i_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[11]_i_1__1\,
      Q => O34(11),
      R => '0'
    );
\m_payload_i_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[12]_i_1__1\,
      Q => O34(12),
      R => '0'
    );
\m_payload_i_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[13]_i_1__1\,
      Q => O34(13),
      R => '0'
    );
\m_payload_i_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[14]_i_1__1\,
      Q => O34(14),
      R => '0'
    );
\m_payload_i_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[15]_i_1__1\,
      Q => O34(15),
      R => '0'
    );
\m_payload_i_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[16]_i_1__1\,
      Q => O34(16),
      R => '0'
    );
\m_payload_i_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[17]_i_1__1\,
      Q => O34(17),
      R => '0'
    );
\m_payload_i_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[18]_i_1__1\,
      Q => O34(18),
      R => '0'
    );
\m_payload_i_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[19]_i_1__1\,
      Q => O34(19),
      R => '0'
    );
\m_payload_i_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[1]_i_1__1\,
      Q => O34(1),
      R => '0'
    );
\m_payload_i_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[20]_i_1__1\,
      Q => O34(20),
      R => '0'
    );
\m_payload_i_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[21]_i_1__1\,
      Q => O34(21),
      R => '0'
    );
\m_payload_i_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[22]_i_1__1\,
      Q => O34(22),
      R => '0'
    );
\m_payload_i_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[23]_i_1__1\,
      Q => O34(23),
      R => '0'
    );
\m_payload_i_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[24]_i_1__1\,
      Q => O34(24),
      R => '0'
    );
\m_payload_i_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[25]_i_1__1\,
      Q => O34(25),
      R => '0'
    );
\m_payload_i_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[26]_i_1__1\,
      Q => O34(26),
      R => '0'
    );
\m_payload_i_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[27]_i_1__1\,
      Q => O34(27),
      R => '0'
    );
\m_payload_i_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[28]_i_1__1\,
      Q => O34(28),
      R => '0'
    );
\m_payload_i_reg[29]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[29]_i_1__1\,
      Q => O34(29),
      R => '0'
    );
\m_payload_i_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[2]_i_1__1\,
      Q => O34(2),
      R => '0'
    );
\m_payload_i_reg[30]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[30]_i_1__1\,
      Q => O34(30),
      R => '0'
    );
\m_payload_i_reg[31]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[31]_i_1__0\,
      Q => O34(31),
      R => '0'
    );
\m_payload_i_reg[32]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[32]_i_1__1\,
      Q => O34(32),
      R => '0'
    );
\m_payload_i_reg[33]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[33]_i_1__1\,
      Q => O34(33),
      R => '0'
    );
\m_payload_i_reg[34]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[34]_i_1__1\,
      Q => O34(34),
      R => '0'
    );
\m_payload_i_reg[35]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[35]_i_2\,
      Q => O34(35),
      R => '0'
    );
\m_payload_i_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[3]_i_1__1\,
      Q => O34(3),
      R => '0'
    );
\m_payload_i_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[4]_i_1__1\,
      Q => O34(4),
      R => '0'
    );
\m_payload_i_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[5]_i_1__1\,
      Q => O34(5),
      R => '0'
    );
\m_payload_i_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[6]_i_1__1\,
      Q => O34(6),
      R => '0'
    );
\m_payload_i_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[7]_i_1__1\,
      Q => O34(7),
      R => '0'
    );
\m_payload_i_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[8]_i_1__1\,
      Q => O34(8),
      R => '0'
    );
\m_payload_i_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => p_1_in,
      D => \n_0_m_payload_i[9]_i_1__1\,
      Q => O34(9),
      R => '0'
    );
\m_valid_i_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2A2AAA2A"
    )
    port map (
      I0 => \n_0_aresetn_d_reg[1]\,
      I1 => I4,
      I2 => \^o2\,
      I3 => \^o1\,
      I4 => s_axi_rready,
      O => \n_0_m_valid_i_i_1__0\
    );
m_valid_i_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_m_valid_i_i_1__0\,
      Q => \^o1\,
      R => '0'
    );
\s_ready_i_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA2A2A2"
    )
    port map (
      I0 => \n_0_aresetn_d_reg[0]\,
      I1 => \^o1\,
      I2 => s_axi_rready,
      I3 => I4,
      I4 => \^o2\,
      O => \n_0_s_ready_i_i_1__0\
    );
s_ready_i_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_s_ready_i_i_1__0\,
      Q => \^o2\,
      R => '0'
    );
\skid_buffer_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(0),
      Q => \n_0_skid_buffer_reg[0]\,
      R => '0'
    );
\skid_buffer_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(10),
      Q => \n_0_skid_buffer_reg[10]\,
      R => '0'
    );
\skid_buffer_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(11),
      Q => \n_0_skid_buffer_reg[11]\,
      R => '0'
    );
\skid_buffer_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(12),
      Q => \n_0_skid_buffer_reg[12]\,
      R => '0'
    );
\skid_buffer_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(13),
      Q => \n_0_skid_buffer_reg[13]\,
      R => '0'
    );
\skid_buffer_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(14),
      Q => \n_0_skid_buffer_reg[14]\,
      R => '0'
    );
\skid_buffer_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(15),
      Q => \n_0_skid_buffer_reg[15]\,
      R => '0'
    );
\skid_buffer_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(16),
      Q => \n_0_skid_buffer_reg[16]\,
      R => '0'
    );
\skid_buffer_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(17),
      Q => \n_0_skid_buffer_reg[17]\,
      R => '0'
    );
\skid_buffer_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(18),
      Q => \n_0_skid_buffer_reg[18]\,
      R => '0'
    );
\skid_buffer_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(19),
      Q => \n_0_skid_buffer_reg[19]\,
      R => '0'
    );
\skid_buffer_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(1),
      Q => \n_0_skid_buffer_reg[1]\,
      R => '0'
    );
\skid_buffer_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(20),
      Q => \n_0_skid_buffer_reg[20]\,
      R => '0'
    );
\skid_buffer_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(21),
      Q => \n_0_skid_buffer_reg[21]\,
      R => '0'
    );
\skid_buffer_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(22),
      Q => \n_0_skid_buffer_reg[22]\,
      R => '0'
    );
\skid_buffer_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(23),
      Q => \n_0_skid_buffer_reg[23]\,
      R => '0'
    );
\skid_buffer_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(24),
      Q => \n_0_skid_buffer_reg[24]\,
      R => '0'
    );
\skid_buffer_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(25),
      Q => \n_0_skid_buffer_reg[25]\,
      R => '0'
    );
\skid_buffer_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(26),
      Q => \n_0_skid_buffer_reg[26]\,
      R => '0'
    );
\skid_buffer_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(27),
      Q => \n_0_skid_buffer_reg[27]\,
      R => '0'
    );
\skid_buffer_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(28),
      Q => \n_0_skid_buffer_reg[28]\,
      R => '0'
    );
\skid_buffer_reg[29]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(29),
      Q => \n_0_skid_buffer_reg[29]\,
      R => '0'
    );
\skid_buffer_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(2),
      Q => \n_0_skid_buffer_reg[2]\,
      R => '0'
    );
\skid_buffer_reg[30]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(30),
      Q => \n_0_skid_buffer_reg[30]\,
      R => '0'
    );
\skid_buffer_reg[31]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(31),
      Q => \n_0_skid_buffer_reg[31]\,
      R => '0'
    );
\skid_buffer_reg[32]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(32),
      Q => \n_0_skid_buffer_reg[32]\,
      R => '0'
    );
\skid_buffer_reg[33]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(33),
      Q => \n_0_skid_buffer_reg[33]\,
      R => '0'
    );
\skid_buffer_reg[34]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I20(0),
      Q => \n_0_skid_buffer_reg[34]\,
      R => '0'
    );
\skid_buffer_reg[35]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I20(1),
      Q => \n_0_skid_buffer_reg[35]\,
      R => '0'
    );
\skid_buffer_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(3),
      Q => \n_0_skid_buffer_reg[3]\,
      R => '0'
    );
\skid_buffer_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(4),
      Q => \n_0_skid_buffer_reg[4]\,
      R => '0'
    );
\skid_buffer_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(5),
      Q => \n_0_skid_buffer_reg[5]\,
      R => '0'
    );
\skid_buffer_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(6),
      Q => \n_0_skid_buffer_reg[6]\,
      R => '0'
    );
\skid_buffer_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(7),
      Q => \n_0_skid_buffer_reg[7]\,
      R => '0'
    );
\skid_buffer_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(8),
      Q => \n_0_skid_buffer_reg[8]\,
      R => '0'
    );
\skid_buffer_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \^o2\,
      D => I21(9),
      Q => \n_0_skid_buffer_reg[9]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_b_channel is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    O5 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_bvalid : out STD_LOGIC;
    shandshake : in STD_LOGIC;
    aclk : in STD_LOGIC;
    b_push : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    si_rs_bready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_b_channel : entity is "axi_protocol_converter_v2_1_b2s_b_channel";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_b_channel;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_b_channel is
  signal \^o1\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal \bresp_cnt_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal bresp_push : STD_LOGIC;
  signal mhandshake : STD_LOGIC;
  signal mhandshake_r : STD_LOGIC;
  signal \n_0_bresp_cnt[7]_i_3\ : STD_LOGIC;
  signal n_0_bresp_fifo_0 : STD_LOGIC;
  signal n_0_bvalid_i_i_1 : STD_LOGIC;
  signal \n_0_s_bresp_acc[0]_i_1\ : STD_LOGIC;
  signal \n_0_s_bresp_acc[1]_i_1\ : STD_LOGIC;
  signal \n_0_s_bresp_acc_reg[0]\ : STD_LOGIC;
  signal \n_0_s_bresp_acc_reg[1]\ : STD_LOGIC;
  signal n_1_bresp_fifo_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s_bresp_acc0 : STD_LOGIC;
  signal shandshake_r : STD_LOGIC;
  signal \^si_rs_bvalid\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bresp_cnt[1]_i_1\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \bresp_cnt[2]_i_1\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \bresp_cnt[3]_i_1\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \bresp_cnt[4]_i_1\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \bresp_cnt[6]_i_1\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \bresp_cnt[7]_i_2\ : label is "soft_lutpair111";
begin
  O1 <= \^o1\;
  O2 <= \^o2\;
  si_rs_bvalid <= \^si_rs_bvalid\;
bid_fifo_0: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo
    port map (
      O1 => \^o1\,
      O2 => \^o2\,
      O3 => O3,
      O4 => O4,
      Q(7 downto 0) => \bresp_cnt_reg__0\(7 downto 0),
      SR(0) => s_bresp_acc0,
      aclk => aclk,
      areset_d1 => areset_d1,
      b_push => b_push,
      bresp_push => bresp_push,
      \in\(4 downto 0) => \in\(4 downto 0),
      mhandshake_r => mhandshake_r,
      \out\(0) => \out\(0),
      shandshake_r => shandshake_r
    );
\bresp_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \bresp_cnt_reg__0\(0),
      O => p_0_in(0)
    );
\bresp_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \bresp_cnt_reg__0\(0),
      I1 => \bresp_cnt_reg__0\(1),
      O => p_0_in(1)
    );
\bresp_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => \bresp_cnt_reg__0\(2),
      I1 => \bresp_cnt_reg__0\(1),
      I2 => \bresp_cnt_reg__0\(0),
      O => p_0_in(2)
    );
\bresp_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => \bresp_cnt_reg__0\(3),
      I1 => \bresp_cnt_reg__0\(0),
      I2 => \bresp_cnt_reg__0\(1),
      I3 => \bresp_cnt_reg__0\(2),
      O => p_0_in(3)
    );
\bresp_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      I0 => \bresp_cnt_reg__0\(4),
      I1 => \bresp_cnt_reg__0\(2),
      I2 => \bresp_cnt_reg__0\(1),
      I3 => \bresp_cnt_reg__0\(0),
      I4 => \bresp_cnt_reg__0\(3),
      O => p_0_in(4)
    );
\bresp_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => \bresp_cnt_reg__0\(5),
      I1 => \bresp_cnt_reg__0\(3),
      I2 => \bresp_cnt_reg__0\(0),
      I3 => \bresp_cnt_reg__0\(1),
      I4 => \bresp_cnt_reg__0\(2),
      I5 => \bresp_cnt_reg__0\(4),
      O => p_0_in(5)
    );
\bresp_cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \bresp_cnt_reg__0\(6),
      I1 => \n_0_bresp_cnt[7]_i_3\,
      O => p_0_in(6)
    );
\bresp_cnt[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => \bresp_cnt_reg__0\(7),
      I1 => \n_0_bresp_cnt[7]_i_3\,
      I2 => \bresp_cnt_reg__0\(6),
      O => p_0_in(7)
    );
\bresp_cnt[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => \bresp_cnt_reg__0\(5),
      I1 => \bresp_cnt_reg__0\(3),
      I2 => \bresp_cnt_reg__0\(0),
      I3 => \bresp_cnt_reg__0\(1),
      I4 => \bresp_cnt_reg__0\(2),
      I5 => \bresp_cnt_reg__0\(4),
      O => \n_0_bresp_cnt[7]_i_3\
    );
\bresp_cnt_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(0),
      Q => \bresp_cnt_reg__0\(0),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(1),
      Q => \bresp_cnt_reg__0\(1),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(2),
      Q => \bresp_cnt_reg__0\(2),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(3),
      Q => \bresp_cnt_reg__0\(3),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(4),
      Q => \bresp_cnt_reg__0\(4),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(5),
      Q => \bresp_cnt_reg__0\(5),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(6),
      Q => \bresp_cnt_reg__0\(6),
      R => s_bresp_acc0
    );
\bresp_cnt_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => mhandshake_r,
      D => p_0_in(7),
      Q => \bresp_cnt_reg__0\(7),
      R => s_bresp_acc0
    );
bresp_fifo_0: entity work.\axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized0\
    port map (
      I1 => \^o1\,
      O1 => n_0_bresp_fifo_0,
      O2 => \^o2\,
      O3 => n_1_bresp_fifo_0,
      O5(1 downto 0) => O5(1 downto 0),
      aclk => aclk,
      areset_d1 => areset_d1,
      bresp_push => bresp_push,
      \in\(1) => \n_0_s_bresp_acc_reg[1]\,
      \in\(0) => \n_0_s_bresp_acc_reg[0]\,
      m_axi_bready => m_axi_bready,
      m_axi_bresp(1 downto 0) => m_axi_bresp(1 downto 0),
      m_axi_bvalid => m_axi_bvalid,
      mhandshake => mhandshake,
      mhandshake_r => mhandshake_r,
      shandshake_r => shandshake_r
    );
bvalid_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"003A"
    )
    port map (
      I0 => n_0_bresp_fifo_0,
      I1 => si_rs_bready,
      I2 => \^si_rs_bvalid\,
      I3 => areset_d1,
      O => n_0_bvalid_i_i_1
    );
bvalid_i_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => n_0_bvalid_i_i_1,
      Q => \^si_rs_bvalid\,
      R => '0'
    );
mhandshake_r_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => mhandshake,
      Q => mhandshake_r,
      R => '0'
    );
\s_bresp_acc[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000000E2"
    )
    port map (
      I0 => \n_0_s_bresp_acc_reg[0]\,
      I1 => n_1_bresp_fifo_0,
      I2 => m_axi_bresp(0),
      I3 => bresp_push,
      I4 => areset_d1,
      O => \n_0_s_bresp_acc[0]_i_1\
    );
\s_bresp_acc[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000000E2"
    )
    port map (
      I0 => \n_0_s_bresp_acc_reg[1]\,
      I1 => n_1_bresp_fifo_0,
      I2 => m_axi_bresp(1),
      I3 => bresp_push,
      I4 => areset_d1,
      O => \n_0_s_bresp_acc[1]_i_1\
    );
\s_bresp_acc_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_s_bresp_acc[0]_i_1\,
      Q => \n_0_s_bresp_acc_reg[0]\,
      R => '0'
    );
\s_bresp_acc_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => \n_0_s_bresp_acc[1]_i_1\,
      Q => \n_0_s_bresp_acc_reg[1]\,
      R => '0'
    );
shandshake_r_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => shandshake,
      Q => shandshake_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC;
    O6 : out STD_LOGIC;
    O7 : out STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    O8 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O9 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    incr_next_pending : in STD_LOGIC;
    aclk : in STD_LOGIC;
    wrap_next_pending : in STD_LOGIC;
    sel_first_i : in STD_LOGIC;
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    I6 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC;
    I11 : in STD_LOGIC;
    I15 : in STD_LOGIC;
    b_push : in STD_LOGIC;
    I12 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_awvalid : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    I13 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I14 : in STD_LOGIC;
    I16 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I17 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I18 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I19 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I20 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    I21 : in STD_LOGIC_VECTOR ( 0 to 0 );
    axaddr_incr0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I22 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I23 : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator : entity is "axi_protocol_converter_v2_1_b2s_cmd_translator";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator is
  signal axaddr_incr_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s_axburst_eq0 : STD_LOGIC;
  signal s_axburst_eq1 : STD_LOGIC;
begin
incr_cmd_0: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd
    port map (
      D(1 downto 0) => D(1 downto 0),
      E(0) => E(0),
      I10 => I10,
      I12(1 downto 0) => I12(1 downto 0),
      I13 => I13,
      I14 => I14,
      I22(3 downto 0) => I22(3 downto 0),
      I23(3 downto 0) => I23(3 downto 0),
      I3 => I3,
      I4 => I4,
      I5 => I5,
      I6(3) => I6(17),
      I6(2 downto 1) => I6(13 downto 12),
      I6(0) => I6(3),
      I7 => I7,
      I8 => I8,
      I9 => I9,
      O1 => O1,
      O2 => O7,
      O5 => O5,
      Q(1 downto 0) => Q(1 downto 0),
      S(3 downto 0) => S(3 downto 0),
      aclk => aclk,
      areset_d1 => areset_d1,
      axaddr_incr0(2 downto 0) => axaddr_incr0(2 downto 0),
      axaddr_incr_reg(11 downto 0) => axaddr_incr_reg(11 downto 0),
      b_push => b_push,
      incr_next_pending => incr_next_pending,
      si_rs_awvalid => si_rs_awvalid
    );
\memory_reg[3][0]_srl4_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => s_axburst_eq1,
      I1 => I6(14),
      I2 => s_axburst_eq0,
      O => O4
    );
s_axburst_eq0_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I1,
      Q => s_axburst_eq0,
      R => '0'
    );
s_axburst_eq1_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I2,
      Q => s_axburst_eq1,
      R => '0'
    );
sel_first_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => sel_first_i,
      Q => O3,
      R => '0'
    );
wrap_cmd_0: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd
    port map (
      E(0) => E(0),
      I11 => I11,
      I12(1 downto 0) => I12(1 downto 0),
      I15 => I15,
      I16(3 downto 0) => I16(3 downto 0),
      I17(3 downto 0) => I17(3 downto 0),
      I18(0) => I18(0),
      I19(3 downto 0) => I19(3 downto 0),
      I20(6 downto 0) => I20(6 downto 0),
      I21(0) => I21(0),
      I6(18 downto 0) => I6(18 downto 0),
      O2 => O2,
      O6 => O6,
      O8(3 downto 0) => O8(3 downto 0),
      O9(3 downto 0) => O9(3 downto 0),
      aclk => aclk,
      areset_d1 => areset_d1,
      axaddr_incr_reg(11 downto 0) => axaddr_incr_reg(11 downto 0),
      b_push => b_push,
      m_axi_awaddr(11 downto 0) => m_axi_awaddr(11 downto 0),
      si_rs_awvalid => si_rs_awvalid,
      wrap_next_pending => wrap_next_pending
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator_1 is
  port (
    incr_next_pending : out STD_LOGIC;
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC;
    r_rlast : out STD_LOGIC;
    O6 : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    O7 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O8 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    aclk : in STD_LOGIC;
    wrap_next_pending : in STD_LOGIC;
    sel_first_i : in STD_LOGIC;
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    I6 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC;
    I11 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    I13 : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    I14 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    si_rs_arvalid : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    I15 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I16 : in STD_LOGIC;
    I17 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I18 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I19 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I20 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I21 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    I22 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I26 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S : in STD_LOGIC_VECTOR ( 0 to 0 );
    I23 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I24 : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator_1 : entity is "axi_protocol_converter_v2_1_b2s_cmd_translator";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator_1;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator_1 is
  signal axaddr_incr_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s_axburst_eq0 : STD_LOGIC;
  signal s_axburst_eq1 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of r_rlast_r_i_1 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \state[1]_i_2\ : label is "soft_lutpair10";
begin
incr_cmd_0: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_incr_cmd_2
    port map (
      D(1 downto 0) => D(1 downto 0),
      E(0) => E(0),
      I10 => I10,
      I11 => I11,
      I12 => I12,
      I14(1 downto 0) => I14(1 downto 0),
      I15 => I15,
      I16 => I16,
      I23(3 downto 0) => I23(3 downto 0),
      I24(3 downto 0) => I24(3 downto 0),
      I26(2 downto 0) => I26(2 downto 0),
      I3 => I3,
      I4 => I4,
      I5 => I5,
      I6(5) => I6(17),
      I6(4 downto 3) => I6(13 downto 12),
      I6(2 downto 0) => I6(3 downto 1),
      I7 => I7,
      I8 => I8,
      I9 => I9,
      O1 => O5,
      O3 => O3,
      Q(1 downto 0) => Q(1 downto 0),
      S(0) => S(0),
      aclk => aclk,
      areset_d1 => areset_d1,
      axaddr_incr_reg(11 downto 0) => axaddr_incr_reg(11 downto 0),
      incr_next_pending => incr_next_pending,
      m_axi_arready => m_axi_arready,
      si_rs_arvalid => si_rs_arvalid
    );
r_rlast_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"27"
    )
    port map (
      I0 => I6(14),
      I1 => s_axburst_eq1,
      I2 => s_axburst_eq0,
      O => r_rlast
    );
s_axburst_eq0_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I1,
      Q => s_axburst_eq0,
      R => '0'
    );
s_axburst_eq1_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => I2,
      Q => s_axburst_eq1,
      R => '0'
    );
sel_first_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => sel_first_i,
      Q => O2,
      R => '0'
    );
\state[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => s_axburst_eq0,
      I1 => s_axburst_eq1,
      I2 => I6(14),
      O => O6
    );
wrap_cmd_0: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wrap_cmd_3
    port map (
      E(0) => E(0),
      I11 => I11,
      I13 => I13,
      I14(1 downto 0) => I14(1 downto 0),
      I17(3 downto 0) => I17(3 downto 0),
      I18(3 downto 0) => I18(3 downto 0),
      I19(0) => I19(0),
      I20(3 downto 0) => I20(3 downto 0),
      I21(6 downto 0) => I21(6 downto 0),
      I22(0) => I22(0),
      I6(18 downto 0) => I6(18 downto 0),
      O1 => O1,
      O4 => O4,
      O7(3 downto 0) => O7(3 downto 0),
      O8(3 downto 0) => O8(3 downto 0),
      aclk => aclk,
      areset_d1 => areset_d1,
      axaddr_incr_reg(11 downto 0) => axaddr_incr_reg(11 downto 0),
      m_axi_araddr(11 downto 0) => m_axi_araddr(11 downto 0),
      m_axi_arready => m_axi_arready,
      si_rs_arvalid => si_rs_arvalid,
      wrap_next_pending => wrap_next_pending
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_r_channel is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 33 downto 0 );
    O3 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    r_push : in STD_LOGIC;
    aclk : in STD_LOGIC;
    r_rlast : in STD_LOGIC;
    s_arid_r : in STD_LOGIC;
    si_rs_rready : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 33 downto 0 );
    areset_d1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_r_channel : entity is "axi_protocol_converter_v2_1_b2s_r_channel";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_r_channel;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_r_channel is
  signal \^o1\ : STD_LOGIC;
  signal n_0_rd_data_fifo_0 : STD_LOGIC;
  signal n_1_transaction_fifo_0 : STD_LOGIC;
  signal n_3_rd_data_fifo_0 : STD_LOGIC;
  signal r_push_r : STD_LOGIC;
  signal trans_in : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  O1 <= \^o1\;
\r_arid_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => s_arid_r,
      Q => trans_in(1),
      R => '0'
    );
r_push_r_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => r_push,
      Q => r_push_r,
      R => '0'
    );
r_rlast_r_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => r_rlast,
      Q => trans_in(0),
      R => '0'
    );
rd_data_fifo_0: entity work.\axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized1\
    port map (
      I1 => n_1_transaction_fifo_0,
      O1 => n_0_rd_data_fifo_0,
      O2 => \^o1\,
      O3 => n_3_rd_data_fifo_0,
      aclk => aclk,
      areset_d1 => areset_d1,
      \in\(33 downto 0) => \in\(33 downto 0),
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      \out\(33 downto 0) => \out\(33 downto 0),
      si_rs_rready => si_rs_rready
    );
transaction_fifo_0: entity work.\axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_simple_fifo__parameterized2\
    port map (
      I1 => n_0_rd_data_fifo_0,
      I2 => n_3_rd_data_fifo_0,
      O1 => \^o1\,
      O2 => O2,
      O3 => n_1_transaction_fifo_0,
      O4(1 downto 0) => O3(1 downto 0),
      aclk => aclk,
      areset_d1 => areset_d1,
      \in\(1 downto 0) => trans_in(1 downto 0),
      r_push_r => r_push_r,
      si_rs_rready => si_rs_rready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_register_slice_v2_1_axi_register_slice is
  port (
    si_rs_awvalid : out STD_LOGIC;
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    si_rs_bready : out STD_LOGIC;
    si_rs_arvalid : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    si_rs_rready : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 42 downto 0 );
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    O5 : out STD_LOGIC_VECTOR ( 42 downto 0 );
    O6 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O7 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    I16 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    I17 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O8 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    axaddr_offset : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O9 : out STD_LOGIC;
    O10 : out STD_LOGIC;
    O11 : out STD_LOGIC;
    O12 : out STD_LOGIC;
    O13 : out STD_LOGIC;
    shandshake : out STD_LOGIC;
    I14 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O14 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O15 : out STD_LOGIC;
    O16 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O17 : out STD_LOGIC;
    O18 : out STD_LOGIC;
    O19 : out STD_LOGIC;
    O20 : out STD_LOGIC;
    O21 : out STD_LOGIC;
    axaddr_incr0 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O22 : out STD_LOGIC;
    O23 : out STD_LOGIC;
    O24 : out STD_LOGIC;
    O25 : out STD_LOGIC;
    I26 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O26 : out STD_LOGIC;
    O27 : out STD_LOGIC;
    O28 : out STD_LOGIC;
    O29 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    O30 : out STD_LOGIC;
    O31 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    O32 : out STD_LOGIC;
    O33 : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O34 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    aclk : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    b_push : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    I4 : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    si_rs_bvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I11 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    I13 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I15 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I18 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    sel_first : in STD_LOGIC;
    sel_first_0 : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    I19 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I20 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I21 : in STD_LOGIC_VECTOR ( 33 downto 0 );
    aresetn : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    I22 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_register_slice_v2_1_axi_register_slice : entity is "axi_register_slice_v2_1_axi_register_slice";
end axi_protocol_converter_0_axi_register_slice_v2_1_axi_register_slice;

architecture STRUCTURE of axi_protocol_converter_0_axi_register_slice_v2_1_axi_register_slice is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  SR(0) <= \^sr\(0);
ar_pipe: entity work.axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice
    port map (
      I10(0) => I10(0),
      I11 => I11,
      I12 => I12,
      I13(1 downto 0) => I13(1 downto 0),
      I14(0) => I14(0),
      I15(2 downto 0) => I15(2 downto 0),
      I16(3 downto 0) => I16(3 downto 0),
      I17(3 downto 0) => I17(3 downto 0),
      I18(1 downto 0) => I18(1 downto 0),
      I2 => I2,
      I22(0) => I22(0),
      I26(2 downto 0) => I26(2 downto 0),
      I3 => I3,
      O1 => si_rs_arvalid,
      O14(0) => O14(0),
      O15 => O15,
      O16(2 downto 0) => O16(2 downto 0),
      O17 => O17,
      O18 => O18,
      O19 => O19,
      O2 => O3,
      O20 => O20,
      O25 => O25,
      O26 => O26,
      O27 => O27,
      O28 => O28,
      O30 => O30,
      O31(6 downto 0) => O31(6 downto 0),
      O33 => O33,
      Q(42 downto 0) => O5(42 downto 0),
      S(0) => S(0),
      SR(0) => \^sr\(0),
      aclk => aclk,
      aresetn => aresetn,
      m_axi_arready => m_axi_arready,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arid(0) => s_axi_arid(0),
      s_axi_arlen(3 downto 0) => s_axi_arlen(3 downto 0),
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arsize(1 downto 0) => s_axi_arsize(1 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      sel_first_0 => sel_first_0
    );
aw_pipe: entity work.axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice_0
    port map (
      D(2 downto 0) => D(2 downto 0),
      E(0) => E(0),
      I1(1 downto 0) => I1(1 downto 0),
      I5 => I5,
      I6(3 downto 0) => I6(3 downto 0),
      I7 => I7,
      I8 => I8,
      I9(3 downto 0) => I9(3 downto 0),
      O1 => si_rs_awvalid,
      O10 => O10,
      O11 => axaddr_offset(3),
      O12 => O11,
      O13 => O12,
      O14 => O13,
      O2 => O1,
      O21 => O21,
      O22 => O22,
      O23 => O23,
      O24 => O24,
      O29(6 downto 0) => O29(6 downto 0),
      O3 => axaddr_offset(0),
      O32 => O32,
      O4 => axaddr_offset(1),
      O5 => axaddr_offset(2),
      O6(3 downto 0) => O6(3 downto 0),
      O7(3 downto 0) => O7(3 downto 0),
      O8(2 downto 0) => O8(2 downto 0),
      O9 => O9,
      Q(42 downto 0) => Q(42 downto 0),
      SR(0) => \^sr\(0),
      aclk => aclk,
      axaddr_incr0(2 downto 0) => axaddr_incr0(2 downto 0),
      b_push => b_push,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awid(0) => s_axi_awid(0),
      s_axi_awlen(3 downto 0) => s_axi_awlen(3 downto 0),
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awsize(1 downto 0) => s_axi_awsize(1 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      sel_first => sel_first
    );
b_pipe: entity work.\axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized1\
    port map (
      I19(1 downto 0) => I19(1 downto 0),
      O1 => O2,
      O2 => si_rs_bready,
      SR(0) => \^sr\(0),
      aclk => aclk,
      \out\(0) => \out\(0),
      s_axi_bid(0) => s_axi_bid(0),
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      shandshake => shandshake,
      si_rs_bvalid => si_rs_bvalid
    );
r_pipe: entity work.\axi_protocol_converter_0_axi_register_slice_v2_1_axic_register_slice__parameterized2\
    port map (
      I20(1 downto 0) => I20(1 downto 0),
      I21(33 downto 0) => I21(33 downto 0),
      I4 => I4,
      O1 => O4,
      O2 => si_rs_rready,
      O34(35 downto 0) => O34(35 downto 0),
      SR(0) => \^sr\(0),
      aclk => aclk,
      s_axi_rready => s_axi_rready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_ar_channel is
  port (
    s_arid_r : out STD_LOGIC;
    O1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC;
    O6 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O7 : out STD_LOGIC;
    O8 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    sel_first : out STD_LOGIC;
    r_push : out STD_LOGIC;
    m_axi_arvalid : out STD_LOGIC;
    r_rlast : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 19 downto 0 );
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    si_rs_arvalid : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC;
    I7 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I10 : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    I11 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    I13 : in STD_LOGIC;
    I14 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I15 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    I26 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S : in STD_LOGIC_VECTOR ( 0 to 0 );
    I16 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I17 : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_ar_channel : entity is "axi_protocol_converter_v2_1_b2s_ar_channel";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_ar_channel;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_ar_channel is
  signal \^o1\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^o2\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^o3\ : STD_LOGIC;
  signal \^o6\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^o8\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal incr_next_pending : STD_LOGIC;
  signal n_0_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_11_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_12_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_17_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_1_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_1_cmd_translator_0 : STD_LOGIC;
  signal n_20_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_21_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_22_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_23_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_25_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_2_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_2_cmd_translator_0 : STD_LOGIC;
  signal n_3_cmd_translator_0 : STD_LOGIC;
  signal n_4_cmd_translator_0 : STD_LOGIC;
  signal n_5_cmd_translator_0 : STD_LOGIC;
  signal n_6_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_6_cmd_translator_0 : STD_LOGIC;
  signal n_7_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_8_ar_cmd_fsm_0 : STD_LOGIC;
  signal n_9_cmd_translator_0 : STD_LOGIC;
  signal \^sel_first\ : STD_LOGIC;
  signal sel_first_i : STD_LOGIC;
  signal \wrap_cmd_0/axaddr_offset\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \wrap_cmd_0/axaddr_offset_r\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \wrap_cmd_0/wrap_second_len\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \wrap_cmd_0/wrap_second_len_r\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal wrap_next_pending : STD_LOGIC;
begin
  O1(0) <= \^o1\(0);
  O2(1 downto 0) <= \^o2\(1 downto 0);
  O3 <= \^o3\;
  O6(1 downto 0) <= \^o6\(1 downto 0);
  O8(2 downto 0) <= \^o8\(2 downto 0);
  sel_first <= \^sel_first\;
ar_cmd_fsm_0: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_rd_cmd_fsm
    port map (
      D(2) => n_0_ar_cmd_fsm_0,
      D(1) => n_1_ar_cmd_fsm_0,
      D(0) => n_2_ar_cmd_fsm_0,
      E(0) => \^o3\,
      I1 => I1,
      I10(1) => \^o8\(2),
      I10(0) => \wrap_cmd_0/axaddr_offset_r\(2),
      I11 => I10,
      I12 => n_2_cmd_translator_0,
      I13 => n_1_cmd_translator_0,
      I14 => n_6_cmd_translator_0,
      I15 => I11,
      I16 => I12,
      I17 => \^sel_first\,
      I2(3 downto 0) => Q(17 downto 14),
      I3 => n_5_cmd_translator_0,
      I4 => n_9_cmd_translator_0,
      I5(0) => D(0),
      I6(2) => \wrap_cmd_0/wrap_second_len_r\(3),
      I6(1) => \wrap_cmd_0/wrap_second_len_r\(1),
      I6(0) => \^o6\(0),
      I7 => I7,
      I8 => I8,
      I9(2 downto 0) => I9(2 downto 0),
      O1(2) => \wrap_cmd_0/wrap_second_len\(3),
      O1(1) => \^o1\(0),
      O1(0) => \wrap_cmd_0/wrap_second_len\(0),
      O10 => n_17_ar_cmd_fsm_0,
      O11 => n_20_ar_cmd_fsm_0,
      O12 => n_21_ar_cmd_fsm_0,
      O13(0) => n_22_ar_cmd_fsm_0,
      O14(0) => n_23_ar_cmd_fsm_0,
      O15(0) => \wrap_cmd_0/axaddr_offset\(2),
      O16 => n_25_ar_cmd_fsm_0,
      O17(0) => E(0),
      O2(1) => n_6_ar_cmd_fsm_0,
      O2(0) => n_7_ar_cmd_fsm_0,
      O3 => n_8_ar_cmd_fsm_0,
      O4(1 downto 0) => \^o2\(1 downto 0),
      O5 => n_11_ar_cmd_fsm_0,
      O6 => n_12_ar_cmd_fsm_0,
      O7 => O4,
      O8 => O5,
      O9 => O7,
      Q(1) => n_3_cmd_translator_0,
      Q(0) => n_4_cmd_translator_0,
      aclk => aclk,
      areset_d1 => areset_d1,
      incr_next_pending => incr_next_pending,
      m_axi_arready => m_axi_arready,
      m_axi_arvalid => m_axi_arvalid,
      r_push => r_push,
      sel_first_i => sel_first_i,
      si_rs_arvalid => si_rs_arvalid,
      wrap_next_pending => wrap_next_pending
    );
cmd_translator_0: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator_1
    port map (
      D(1) => n_6_ar_cmd_fsm_0,
      D(0) => n_7_ar_cmd_fsm_0,
      E(0) => \^o3\,
      I1 => n_17_ar_cmd_fsm_0,
      I10 => I6,
      I11 => n_12_ar_cmd_fsm_0,
      I12 => I11,
      I13 => I13,
      I14(1 downto 0) => \^o2\(1 downto 0),
      I15 => n_21_ar_cmd_fsm_0,
      I16 => n_11_ar_cmd_fsm_0,
      I17(3) => I9(2),
      I17(2) => \wrap_cmd_0/axaddr_offset\(2),
      I17(1 downto 0) => I9(1 downto 0),
      I18(3) => \wrap_cmd_0/wrap_second_len\(3),
      I18(2) => D(0),
      I18(1) => \^o1\(0),
      I18(0) => \wrap_cmd_0/wrap_second_len\(0),
      I19(0) => n_23_ar_cmd_fsm_0,
      I2 => n_20_ar_cmd_fsm_0,
      I20(3) => n_0_ar_cmd_fsm_0,
      I20(2) => I14(0),
      I20(1) => n_1_ar_cmd_fsm_0,
      I20(0) => n_2_ar_cmd_fsm_0,
      I21(6 downto 0) => I15(6 downto 0),
      I22(0) => n_22_ar_cmd_fsm_0,
      I23(3 downto 0) => I16(3 downto 0),
      I24(3 downto 0) => I17(3 downto 0),
      I26(2 downto 0) => I26(2 downto 0),
      I3 => n_25_ar_cmd_fsm_0,
      I4 => n_8_ar_cmd_fsm_0,
      I5 => I2,
      I6(18 downto 0) => Q(18 downto 0),
      I7 => I3,
      I8 => I4,
      I9 => I5,
      O1 => n_1_cmd_translator_0,
      O2 => n_2_cmd_translator_0,
      O3 => n_5_cmd_translator_0,
      O4 => n_6_cmd_translator_0,
      O5 => \^sel_first\,
      O6 => n_9_cmd_translator_0,
      O7(3) => \^o8\(2),
      O7(2) => \wrap_cmd_0/axaddr_offset_r\(2),
      O7(1 downto 0) => \^o8\(1 downto 0),
      O8(3) => \wrap_cmd_0/wrap_second_len_r\(3),
      O8(2) => \^o6\(1),
      O8(1) => \wrap_cmd_0/wrap_second_len_r\(1),
      O8(0) => \^o6\(0),
      Q(1) => n_3_cmd_translator_0,
      Q(0) => n_4_cmd_translator_0,
      S(0) => S(0),
      aclk => aclk,
      areset_d1 => areset_d1,
      incr_next_pending => incr_next_pending,
      m_axi_araddr(11 downto 0) => m_axi_araddr(11 downto 0),
      m_axi_arready => m_axi_arready,
      r_rlast => r_rlast,
      sel_first_i => sel_first_i,
      si_rs_arvalid => si_rs_arvalid,
      wrap_next_pending => wrap_next_pending
    );
\s_arid_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => Q(19),
      Q => s_arid_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_aw_channel is
  port (
    \in\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    O1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    b_push : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O6 : out STD_LOGIC;
    sel_first : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 19 downto 0 );
    si_rs_awvalid : in STD_LOGIC;
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I6 : in STD_LOGIC;
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I11 : in STD_LOGIC;
    areset_d1 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    I13 : in STD_LOGIC;
    I14 : in STD_LOGIC;
    I15 : in STD_LOGIC;
    I16 : in STD_LOGIC;
    I17 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    axaddr_incr0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I18 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    O7 : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_aw_channel : entity is "axi_protocol_converter_v2_1_b2s_aw_channel";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_aw_channel;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_aw_channel is
  signal \^o1\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^o2\ : STD_LOGIC;
  signal \^o3\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^o5\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^b_push\ : STD_LOGIC;
  signal incr_next_pending : STD_LOGIC;
  signal n_0_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_0_cmd_translator_0 : STD_LOGIC;
  signal n_10_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_11_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_16_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_1_cmd_translator_0 : STD_LOGIC;
  signal n_20_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_21_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_22_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_23_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_24_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_25_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_2_cmd_translator_0 : STD_LOGIC;
  signal n_3_cmd_translator_0 : STD_LOGIC;
  signal n_4_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_4_cmd_translator_0 : STD_LOGIC;
  signal n_5_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_5_cmd_translator_0 : STD_LOGIC;
  signal n_6_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_6_cmd_translator_0 : STD_LOGIC;
  signal n_7_cmd_translator_0 : STD_LOGIC;
  signal n_8_aw_cmd_fsm_0 : STD_LOGIC;
  signal n_9_aw_cmd_fsm_0 : STD_LOGIC;
  signal \^sel_first\ : STD_LOGIC;
  signal sel_first_i : STD_LOGIC;
  signal \wrap_cmd_0/wrap_second_len\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal wrap_cnt : STD_LOGIC_VECTOR ( 0 to 0 );
  signal wrap_next_pending : STD_LOGIC;
begin
  O1(1 downto 0) <= \^o1\(1 downto 0);
  O2 <= \^o2\;
  O3(3 downto 0) <= \^o3\(3 downto 0);
  O5(3 downto 0) <= \^o5\(3 downto 0);
  b_push <= \^b_push\;
  sel_first <= \^sel_first\;
aw_cmd_fsm_0: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_wr_cmd_fsm
    port map (
      D(1) => n_5_aw_cmd_fsm_0,
      D(0) => n_6_aw_cmd_fsm_0,
      E(0) => \^o2\,
      I1(1) => n_3_cmd_translator_0,
      I1(0) => n_4_cmd_translator_0,
      I10(0) => I10(2),
      I11 => I11,
      I12 => n_1_cmd_translator_0,
      I13 => n_0_cmd_translator_0,
      I14 => n_2_cmd_translator_0,
      I15 => I12,
      I16 => n_5_cmd_translator_0,
      I17 => \^sel_first\,
      I18 => I13,
      I19 => I14,
      I2(8 downto 4) => Q(16 downto 12),
      I2(3 downto 0) => Q(3 downto 0),
      I20 => I16,
      I3(0) => \^o3\(0),
      I4(0) => \^o5\(3),
      I5 => n_6_cmd_translator_0,
      I6 => I6,
      I7 => I7,
      I8 => n_7_cmd_translator_0,
      I9 => I9,
      O1 => n_0_aw_cmd_fsm_0,
      O10 => n_21_aw_cmd_fsm_0,
      O11(0) => n_22_aw_cmd_fsm_0,
      O12(0) => n_23_aw_cmd_fsm_0,
      O13 => n_24_aw_cmd_fsm_0,
      O14 => n_25_aw_cmd_fsm_0,
      O15(0) => E(0),
      O2 => \^b_push\,
      O3 => n_4_aw_cmd_fsm_0,
      O4(0) => wrap_cnt(0),
      O5(0) => \wrap_cmd_0/wrap_second_len\(0),
      O6 => O4,
      O7 => O6,
      O8 => n_16_aw_cmd_fsm_0,
      O9 => n_20_aw_cmd_fsm_0,
      Q(1 downto 0) => \^o1\(1 downto 0),
      S(3) => n_8_aw_cmd_fsm_0,
      S(2) => n_9_aw_cmd_fsm_0,
      S(1) => n_10_aw_cmd_fsm_0,
      S(0) => n_11_aw_cmd_fsm_0,
      aclk => aclk,
      areset_d1 => areset_d1,
      incr_next_pending => incr_next_pending,
      m_axi_awready => m_axi_awready,
      m_axi_awvalid => m_axi_awvalid,
      sel_first_i => sel_first_i,
      si_rs_awvalid => si_rs_awvalid,
      wrap_next_pending => wrap_next_pending
    );
cmd_translator_0: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_cmd_translator
    port map (
      D(1) => n_5_aw_cmd_fsm_0,
      D(0) => n_6_aw_cmd_fsm_0,
      E(0) => \^o2\,
      I1 => n_16_aw_cmd_fsm_0,
      I10 => I5,
      I11 => n_21_aw_cmd_fsm_0,
      I12(1 downto 0) => \^o1\(1 downto 0),
      I13 => n_24_aw_cmd_fsm_0,
      I14 => n_0_aw_cmd_fsm_0,
      I15 => I15,
      I16(3 downto 0) => I10(3 downto 0),
      I17(3 downto 1) => I8(2 downto 0),
      I17(0) => \wrap_cmd_0/wrap_second_len\(0),
      I18(0) => n_22_aw_cmd_fsm_0,
      I19(3 downto 1) => D(2 downto 0),
      I19(0) => wrap_cnt(0),
      I2 => n_20_aw_cmd_fsm_0,
      I20(6 downto 0) => I17(6 downto 0),
      I21(0) => n_23_aw_cmd_fsm_0,
      I22(3 downto 0) => I18(3 downto 0),
      I23(3 downto 0) => O7(3 downto 0),
      I3 => n_25_aw_cmd_fsm_0,
      I4 => n_4_aw_cmd_fsm_0,
      I5 => I1,
      I6(18 downto 0) => Q(18 downto 0),
      I7 => I2,
      I8 => I3,
      I9 => I4,
      O1 => n_0_cmd_translator_0,
      O2 => n_1_cmd_translator_0,
      O3 => n_2_cmd_translator_0,
      O4 => n_5_cmd_translator_0,
      O5 => n_6_cmd_translator_0,
      O6 => n_7_cmd_translator_0,
      O7 => \^sel_first\,
      O8(3 downto 0) => \^o5\(3 downto 0),
      O9(3 downto 0) => \^o3\(3 downto 0),
      Q(1) => n_3_cmd_translator_0,
      Q(0) => n_4_cmd_translator_0,
      S(3) => n_8_aw_cmd_fsm_0,
      S(2) => n_9_aw_cmd_fsm_0,
      S(1) => n_10_aw_cmd_fsm_0,
      S(0) => n_11_aw_cmd_fsm_0,
      aclk => aclk,
      areset_d1 => areset_d1,
      axaddr_incr0(2 downto 0) => axaddr_incr0(2 downto 0),
      b_push => \^b_push\,
      incr_next_pending => incr_next_pending,
      m_axi_awaddr(11 downto 0) => m_axi_awaddr(11 downto 0),
      sel_first_i => sel_first_i,
      si_rs_awvalid => si_rs_awvalid,
      wrap_next_pending => wrap_next_pending
    );
\s_awid_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => Q(19),
      Q => \in\(4),
      R => '0'
    );
\s_awlen_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => Q(15),
      Q => \in\(0),
      R => '0'
    );
\s_awlen_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => Q(16),
      Q => \in\(1),
      R => '0'
    );
\s_awlen_r_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => Q(17),
      Q => \in\(2),
      R => '0'
    );
\s_awlen_r_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => Q(18),
      Q => \in\(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 22 downto 0 );
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O5 : out STD_LOGIC_VECTOR ( 22 downto 0 );
    O6 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arvalid : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    aclk : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 33 downto 0 );
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awready : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s : entity is "axi_protocol_converter_v2_1_b2s";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s is
  signal \ar_cmd_fsm_0/state\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \ar_pipe/p_1_in\ : STD_LOGIC;
  signal areset_d1 : STD_LOGIC;
  signal \aw_cmd_fsm_0/state\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \aw_pipe/p_1_in\ : STD_LOGIC;
  signal b_awid : STD_LOGIC;
  signal b_awlen : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal b_push : STD_LOGIC;
  signal \cmd_translator_0/incr_cmd_0/sel_first\ : STD_LOGIC;
  signal \cmd_translator_0/incr_cmd_0/sel_first_2\ : STD_LOGIC;
  signal \cmd_translator_0/wrap_cmd_0/axaddr_offset\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \cmd_translator_0/wrap_cmd_0/axaddr_offset_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \cmd_translator_0/wrap_cmd_0/axaddr_offset_r\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \cmd_translator_0/wrap_cmd_0/axaddr_offset_r_3\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \cmd_translator_0/wrap_cmd_0/wrap_second_len\ : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal \cmd_translator_0/wrap_cmd_0/wrap_second_len_1\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \cmd_translator_0/wrap_cmd_0/wrap_second_len_r\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \cmd_translator_0/wrap_cmd_0/wrap_second_len_r_4\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \n_0_RD.r_channel_0\ : STD_LOGIC;
  signal \n_0_WR.b_channel_0\ : STD_LOGIC;
  signal n_100_SI_REG : STD_LOGIC;
  signal n_101_SI_REG : STD_LOGIC;
  signal n_102_SI_REG : STD_LOGIC;
  signal n_103_SI_REG : STD_LOGIC;
  signal n_104_SI_REG : STD_LOGIC;
  signal n_105_SI_REG : STD_LOGIC;
  signal n_106_SI_REG : STD_LOGIC;
  signal n_107_SI_REG : STD_LOGIC;
  signal n_108_SI_REG : STD_LOGIC;
  signal n_109_SI_REG : STD_LOGIC;
  signal n_10_SI_REG : STD_LOGIC;
  signal n_110_SI_REG : STD_LOGIC;
  signal n_11_SI_REG : STD_LOGIC;
  signal n_121_SI_REG : STD_LOGIC;
  signal n_122_SI_REG : STD_LOGIC;
  signal n_123_SI_REG : STD_LOGIC;
  signal n_124_SI_REG : STD_LOGIC;
  signal n_125_SI_REG : STD_LOGIC;
  signal n_127_SI_REG : STD_LOGIC;
  signal n_129_SI_REG : STD_LOGIC;
  signal n_12_SI_REG : STD_LOGIC;
  signal n_133_SI_REG : STD_LOGIC;
  signal n_134_SI_REG : STD_LOGIC;
  signal n_135_SI_REG : STD_LOGIC;
  signal n_136_SI_REG : STD_LOGIC;
  signal n_137_SI_REG : STD_LOGIC;
  signal n_138_SI_REG : STD_LOGIC;
  signal n_139_SI_REG : STD_LOGIC;
  signal \n_13_WR.aw_channel_0\ : STD_LOGIC;
  signal n_140_SI_REG : STD_LOGIC;
  signal n_141_SI_REG : STD_LOGIC;
  signal n_142_SI_REG : STD_LOGIC;
  signal n_143_SI_REG : STD_LOGIC;
  signal n_144_SI_REG : STD_LOGIC;
  signal n_145_SI_REG : STD_LOGIC;
  signal n_146_SI_REG : STD_LOGIC;
  signal n_147_SI_REG : STD_LOGIC;
  signal n_148_SI_REG : STD_LOGIC;
  signal n_149_SI_REG : STD_LOGIC;
  signal n_150_SI_REG : STD_LOGIC;
  signal n_151_SI_REG : STD_LOGIC;
  signal n_152_SI_REG : STD_LOGIC;
  signal n_153_SI_REG : STD_LOGIC;
  signal n_154_SI_REG : STD_LOGIC;
  signal n_155_SI_REG : STD_LOGIC;
  signal n_156_SI_REG : STD_LOGIC;
  signal n_157_SI_REG : STD_LOGIC;
  signal n_158_SI_REG : STD_LOGIC;
  signal n_159_SI_REG : STD_LOGIC;
  signal n_160_SI_REG : STD_LOGIC;
  signal n_161_SI_REG : STD_LOGIC;
  signal n_162_SI_REG : STD_LOGIC;
  signal n_163_SI_REG : STD_LOGIC;
  signal n_164_SI_REG : STD_LOGIC;
  signal n_165_SI_REG : STD_LOGIC;
  signal n_166_SI_REG : STD_LOGIC;
  signal n_167_SI_REG : STD_LOGIC;
  signal n_168_SI_REG : STD_LOGIC;
  signal \n_18_WR.aw_channel_0\ : STD_LOGIC;
  signal \n_1_RD.r_channel_0\ : STD_LOGIC;
  signal \n_1_WR.b_channel_0\ : STD_LOGIC;
  signal \n_2_WR.b_channel_0\ : STD_LOGIC;
  signal \n_3_WR.b_channel_0\ : STD_LOGIC;
  signal \n_4_RD.ar_channel_0\ : STD_LOGIC;
  signal n_51_SI_REG : STD_LOGIC;
  signal n_53_SI_REG : STD_LOGIC;
  signal n_54_SI_REG : STD_LOGIC;
  signal n_55_SI_REG : STD_LOGIC;
  signal n_56_SI_REG : STD_LOGIC;
  signal \n_5_RD.ar_channel_0\ : STD_LOGIC;
  signal \n_6_RD.ar_channel_0\ : STD_LOGIC;
  signal \n_8_WR.aw_channel_0\ : STD_LOGIC;
  signal n_95_SI_REG : STD_LOGIC;
  signal n_96_SI_REG : STD_LOGIC;
  signal n_97_SI_REG : STD_LOGIC;
  signal n_98_SI_REG : STD_LOGIC;
  signal n_99_SI_REG : STD_LOGIC;
  signal \n_9_RD.ar_channel_0\ : STD_LOGIC;
  signal n_9_SI_REG : STD_LOGIC;
  signal r_push : STD_LOGIC;
  signal r_rlast : STD_LOGIC;
  signal s_arid : STD_LOGIC;
  signal s_arid_r : STD_LOGIC;
  signal s_awid : STD_LOGIC;
  signal shandshake : STD_LOGIC;
  signal si_rs_araddr : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal si_rs_arburst : STD_LOGIC_VECTOR ( 1 to 1 );
  signal si_rs_arsize : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal si_rs_arvalid : STD_LOGIC;
  signal si_rs_awaddr : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal si_rs_awburst : STD_LOGIC_VECTOR ( 1 to 1 );
  signal si_rs_awsize : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal si_rs_awvalid : STD_LOGIC;
  signal si_rs_bid : STD_LOGIC;
  signal si_rs_bready : STD_LOGIC;
  signal si_rs_bresp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal si_rs_bvalid : STD_LOGIC;
  signal si_rs_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal si_rs_rid : STD_LOGIC;
  signal si_rs_rlast : STD_LOGIC;
  signal si_rs_rready : STD_LOGIC;
  signal si_rs_rresp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal wrap_cnt : STD_LOGIC_VECTOR ( 3 downto 1 );
begin
\RD.ar_channel_0\: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_ar_channel
    port map (
      D(0) => \cmd_translator_0/wrap_cmd_0/wrap_second_len\(2),
      E(0) => \ar_pipe/p_1_in\,
      I1 => n_129_SI_REG,
      I10 => n_134_SI_REG,
      I11 => n_133_SI_REG,
      I12 => n_158_SI_REG,
      I13 => n_167_SI_REG,
      I14(0) => n_127_SI_REG,
      I15(6) => n_159_SI_REG,
      I15(5) => n_160_SI_REG,
      I15(4) => n_161_SI_REG,
      I15(3) => n_162_SI_REG,
      I15(2) => n_163_SI_REG,
      I15(1) => n_164_SI_REG,
      I15(0) => n_165_SI_REG,
      I16(3) => n_103_SI_REG,
      I16(2) => n_104_SI_REG,
      I16(1) => n_105_SI_REG,
      I16(0) => n_106_SI_REG,
      I17(3) => n_107_SI_REG,
      I17(2) => n_108_SI_REG,
      I17(1) => n_109_SI_REG,
      I17(0) => n_110_SI_REG,
      I2 => n_135_SI_REG,
      I26(2) => n_145_SI_REG,
      I26(1) => n_146_SI_REG,
      I26(0) => n_147_SI_REG,
      I3 => n_144_SI_REG,
      I4 => n_148_SI_REG,
      I5 => n_149_SI_REG,
      I6 => n_150_SI_REG,
      I7 => \n_1_RD.r_channel_0\,
      I8 => n_136_SI_REG,
      I9(2) => \cmd_translator_0/wrap_cmd_0/axaddr_offset\(3),
      I9(1 downto 0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset\(1 downto 0),
      O1(0) => \cmd_translator_0/wrap_cmd_0/wrap_second_len\(1),
      O2(1 downto 0) => \ar_cmd_fsm_0/state\(1 downto 0),
      O3 => \n_4_RD.ar_channel_0\,
      O4 => \n_5_RD.ar_channel_0\,
      O5 => \n_6_RD.ar_channel_0\,
      O6(1) => \cmd_translator_0/wrap_cmd_0/wrap_second_len_r\(2),
      O6(0) => \cmd_translator_0/wrap_cmd_0/wrap_second_len_r\(0),
      O7 => \n_9_RD.ar_channel_0\,
      O8(2) => \cmd_translator_0/wrap_cmd_0/axaddr_offset_r\(3),
      O8(1 downto 0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset_r\(1 downto 0),
      Q(19) => s_arid,
      Q(18) => n_53_SI_REG,
      Q(17) => n_54_SI_REG,
      Q(16) => n_55_SI_REG,
      Q(15) => n_56_SI_REG,
      Q(14) => si_rs_arburst(1),
      Q(13 downto 12) => si_rs_arsize(1 downto 0),
      Q(11 downto 0) => si_rs_araddr(11 downto 0),
      S(0) => n_51_SI_REG,
      aclk => aclk,
      areset_d1 => areset_d1,
      m_axi_araddr(11 downto 0) => m_axi_araddr(11 downto 0),
      m_axi_arready => m_axi_arready,
      m_axi_arvalid => m_axi_arvalid,
      r_push => r_push,
      r_rlast => r_rlast,
      s_arid_r => s_arid_r,
      sel_first => \cmd_translator_0/incr_cmd_0/sel_first\,
      si_rs_arvalid => si_rs_arvalid
    );
\RD.r_channel_0\: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_r_channel
    port map (
      O1 => \n_0_RD.r_channel_0\,
      O2 => \n_1_RD.r_channel_0\,
      O3(1) => si_rs_rid,
      O3(0) => si_rs_rlast,
      aclk => aclk,
      areset_d1 => areset_d1,
      \in\(33 downto 0) => \in\(33 downto 0),
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      \out\(33 downto 32) => si_rs_rresp(1 downto 0),
      \out\(31 downto 0) => si_rs_rdata(31 downto 0),
      r_push => r_push,
      r_rlast => r_rlast,
      s_arid_r => s_arid_r,
      si_rs_rready => si_rs_rready
    );
SI_REG: entity work.axi_protocol_converter_0_axi_register_slice_v2_1_axi_register_slice
    port map (
      D(2 downto 0) => wrap_cnt(3 downto 1),
      E(0) => \aw_pipe/p_1_in\,
      I1(1 downto 0) => \aw_cmd_fsm_0/state\(1 downto 0),
      I10(0) => \cmd_translator_0/wrap_cmd_0/wrap_second_len\(1),
      I11 => \n_9_RD.ar_channel_0\,
      I12 => \n_4_RD.ar_channel_0\,
      I13(1) => \cmd_translator_0/wrap_cmd_0/wrap_second_len_r\(2),
      I13(0) => \cmd_translator_0/wrap_cmd_0/wrap_second_len_r\(0),
      I14(0) => n_127_SI_REG,
      I15(2) => \cmd_translator_0/wrap_cmd_0/axaddr_offset_r\(3),
      I15(1 downto 0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset_r\(1 downto 0),
      I16(3) => n_103_SI_REG,
      I16(2) => n_104_SI_REG,
      I16(1) => n_105_SI_REG,
      I16(0) => n_106_SI_REG,
      I17(3) => n_107_SI_REG,
      I17(2) => n_108_SI_REG,
      I17(1) => n_109_SI_REG,
      I17(0) => n_110_SI_REG,
      I18(1 downto 0) => \ar_cmd_fsm_0/state\(1 downto 0),
      I19(1 downto 0) => si_rs_bresp(1 downto 0),
      I2 => \n_5_RD.ar_channel_0\,
      I20(1) => si_rs_rid,
      I20(0) => si_rs_rlast,
      I21(33 downto 32) => si_rs_rresp(1 downto 0),
      I21(31 downto 0) => si_rs_rdata(31 downto 0),
      I22(0) => \ar_pipe/p_1_in\,
      I26(2) => n_145_SI_REG,
      I26(1) => n_146_SI_REG,
      I26(0) => n_147_SI_REG,
      I3 => \n_6_RD.ar_channel_0\,
      I4 => \n_0_RD.r_channel_0\,
      I5 => \n_8_WR.aw_channel_0\,
      I6(3 downto 0) => \cmd_translator_0/wrap_cmd_0/wrap_second_len_r_4\(3 downto 0),
      I7 => \n_13_WR.aw_channel_0\,
      I8 => \n_18_WR.aw_channel_0\,
      I9(3 downto 0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset_r_3\(3 downto 0),
      O1 => O1,
      O10 => n_122_SI_REG,
      O11 => n_123_SI_REG,
      O12 => n_124_SI_REG,
      O13 => n_125_SI_REG,
      O14(0) => \cmd_translator_0/wrap_cmd_0/wrap_second_len\(2),
      O15 => n_129_SI_REG,
      O16(2) => \cmd_translator_0/wrap_cmd_0/axaddr_offset\(3),
      O16(1 downto 0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset\(1 downto 0),
      O17 => n_133_SI_REG,
      O18 => n_134_SI_REG,
      O19 => n_135_SI_REG,
      O2 => O3,
      O20 => n_136_SI_REG,
      O21 => n_137_SI_REG,
      O22 => n_141_SI_REG,
      O23 => n_142_SI_REG,
      O24 => n_143_SI_REG,
      O25 => n_144_SI_REG,
      O26 => n_148_SI_REG,
      O27 => n_149_SI_REG,
      O28 => n_150_SI_REG,
      O29(6) => n_151_SI_REG,
      O29(5) => n_152_SI_REG,
      O29(4) => n_153_SI_REG,
      O29(3) => n_154_SI_REG,
      O29(2) => n_155_SI_REG,
      O29(1) => n_156_SI_REG,
      O29(0) => n_157_SI_REG,
      O3 => O4,
      O30 => n_158_SI_REG,
      O31(6) => n_159_SI_REG,
      O31(5) => n_160_SI_REG,
      O31(4) => n_161_SI_REG,
      O31(3) => n_162_SI_REG,
      O31(2) => n_163_SI_REG,
      O31(1) => n_164_SI_REG,
      O31(0) => n_165_SI_REG,
      O32 => n_166_SI_REG,
      O33 => n_167_SI_REG,
      O34(35 downto 0) => O6(35 downto 0),
      O4 => O2,
      O5(42) => s_arid,
      O5(41) => n_53_SI_REG,
      O5(40) => n_54_SI_REG,
      O5(39) => n_55_SI_REG,
      O5(38) => n_56_SI_REG,
      O5(37) => si_rs_arburst(1),
      O5(36 downto 35) => si_rs_arsize(1 downto 0),
      O5(34 downto 12) => O5(22 downto 0),
      O5(11 downto 0) => si_rs_araddr(11 downto 0),
      O6(3) => n_95_SI_REG,
      O6(2) => n_96_SI_REG,
      O6(1) => n_97_SI_REG,
      O6(0) => n_98_SI_REG,
      O7(3) => n_99_SI_REG,
      O7(2) => n_100_SI_REG,
      O7(1) => n_101_SI_REG,
      O7(0) => n_102_SI_REG,
      O8(2 downto 0) => \cmd_translator_0/wrap_cmd_0/wrap_second_len_1\(3 downto 1),
      O9 => n_121_SI_REG,
      Q(42) => s_awid,
      Q(41) => n_9_SI_REG,
      Q(40) => n_10_SI_REG,
      Q(39) => n_11_SI_REG,
      Q(38) => n_12_SI_REG,
      Q(37) => si_rs_awburst(1),
      Q(36 downto 35) => si_rs_awsize(1 downto 0),
      Q(34 downto 12) => Q(22 downto 0),
      Q(11 downto 0) => si_rs_awaddr(11 downto 0),
      S(0) => n_51_SI_REG,
      SR(0) => n_168_SI_REG,
      aclk => aclk,
      aresetn => aresetn,
      axaddr_incr0(2) => n_138_SI_REG,
      axaddr_incr0(1) => n_139_SI_REG,
      axaddr_incr0(0) => n_140_SI_REG,
      axaddr_offset(3 downto 0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset_0\(3 downto 0),
      b_push => b_push,
      m_axi_arready => m_axi_arready,
      \out\(0) => si_rs_bid,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arid(0) => s_axi_arid(0),
      s_axi_arlen(3 downto 0) => s_axi_arlen(3 downto 0),
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arsize(1 downto 0) => s_axi_arsize(1 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awid(0) => s_axi_awid(0),
      s_axi_awlen(3 downto 0) => s_axi_awlen(3 downto 0),
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awsize(1 downto 0) => s_axi_awsize(1 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bid(0) => s_axi_bid(0),
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_rready => s_axi_rready,
      sel_first => \cmd_translator_0/incr_cmd_0/sel_first_2\,
      sel_first_0 => \cmd_translator_0/incr_cmd_0/sel_first\,
      shandshake => shandshake,
      si_rs_arvalid => si_rs_arvalid,
      si_rs_awvalid => si_rs_awvalid,
      si_rs_bready => si_rs_bready,
      si_rs_bvalid => si_rs_bvalid,
      si_rs_rready => si_rs_rready
    );
\WR.aw_channel_0\: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_aw_channel
    port map (
      D(2 downto 0) => wrap_cnt(3 downto 1),
      E(0) => \aw_pipe/p_1_in\,
      I1 => n_124_SI_REG,
      I10(3 downto 0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset_0\(3 downto 0),
      I11 => n_125_SI_REG,
      I12 => \n_3_WR.b_channel_0\,
      I13 => \n_2_WR.b_channel_0\,
      I14 => \n_1_WR.b_channel_0\,
      I15 => n_166_SI_REG,
      I16 => \n_0_WR.b_channel_0\,
      I17(6) => n_151_SI_REG,
      I17(5) => n_152_SI_REG,
      I17(4) => n_153_SI_REG,
      I17(3) => n_154_SI_REG,
      I17(2) => n_155_SI_REG,
      I17(1) => n_156_SI_REG,
      I17(0) => n_157_SI_REG,
      I18(3) => n_95_SI_REG,
      I18(2) => n_96_SI_REG,
      I18(1) => n_97_SI_REG,
      I18(0) => n_98_SI_REG,
      I2 => n_137_SI_REG,
      I3 => n_141_SI_REG,
      I4 => n_142_SI_REG,
      I5 => n_143_SI_REG,
      I6 => n_123_SI_REG,
      I7 => n_122_SI_REG,
      I8(2 downto 0) => \cmd_translator_0/wrap_cmd_0/wrap_second_len_1\(3 downto 1),
      I9 => n_121_SI_REG,
      O1(1 downto 0) => \aw_cmd_fsm_0/state\(1 downto 0),
      O2 => \n_8_WR.aw_channel_0\,
      O3(3 downto 0) => \cmd_translator_0/wrap_cmd_0/wrap_second_len_r_4\(3 downto 0),
      O4 => \n_13_WR.aw_channel_0\,
      O5(3 downto 0) => \cmd_translator_0/wrap_cmd_0/axaddr_offset_r_3\(3 downto 0),
      O6 => \n_18_WR.aw_channel_0\,
      O7(3) => n_99_SI_REG,
      O7(2) => n_100_SI_REG,
      O7(1) => n_101_SI_REG,
      O7(0) => n_102_SI_REG,
      Q(19) => s_awid,
      Q(18) => n_9_SI_REG,
      Q(17) => n_10_SI_REG,
      Q(16) => n_11_SI_REG,
      Q(15) => n_12_SI_REG,
      Q(14) => si_rs_awburst(1),
      Q(13 downto 12) => si_rs_awsize(1 downto 0),
      Q(11 downto 0) => si_rs_awaddr(11 downto 0),
      aclk => aclk,
      areset_d1 => areset_d1,
      axaddr_incr0(2) => n_138_SI_REG,
      axaddr_incr0(1) => n_139_SI_REG,
      axaddr_incr0(0) => n_140_SI_REG,
      b_push => b_push,
      \in\(4) => b_awid,
      \in\(3 downto 0) => b_awlen(3 downto 0),
      m_axi_awaddr(11 downto 0) => m_axi_awaddr(11 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awvalid => m_axi_awvalid,
      sel_first => \cmd_translator_0/incr_cmd_0/sel_first_2\,
      si_rs_awvalid => si_rs_awvalid
    );
\WR.b_channel_0\: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s_b_channel
    port map (
      O1 => \n_0_WR.b_channel_0\,
      O2 => \n_1_WR.b_channel_0\,
      O3 => \n_2_WR.b_channel_0\,
      O4 => \n_3_WR.b_channel_0\,
      O5(1 downto 0) => si_rs_bresp(1 downto 0),
      aclk => aclk,
      areset_d1 => areset_d1,
      b_push => b_push,
      \in\(4) => b_awid,
      \in\(3 downto 0) => b_awlen(3 downto 0),
      m_axi_bready => m_axi_bready,
      m_axi_bresp(1 downto 0) => m_axi_bresp(1 downto 0),
      m_axi_bvalid => m_axi_bvalid,
      \out\(0) => si_rs_bid,
      shandshake => shandshake,
      si_rs_bready => si_rs_bready,
      si_rs_bvalid => si_rs_bvalid
    );
areset_d1_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => '1',
      D => n_168_SI_REG,
      Q => areset_d1,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is "yes";
  attribute C_FAMILY : string;
  attribute C_FAMILY of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is "zynq";
  attribute C_M_AXI_PROTOCOL : integer;
  attribute C_M_AXI_PROTOCOL of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 2;
  attribute C_S_AXI_PROTOCOL : integer;
  attribute C_S_AXI_PROTOCOL of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute C_IGNORE_ID : integer;
  attribute C_IGNORE_ID of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 32;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 32;
  attribute C_AXI_SUPPORTS_WRITE : integer;
  attribute C_AXI_SUPPORTS_WRITE of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute C_AXI_SUPPORTS_READ : integer;
  attribute C_AXI_SUPPORTS_READ of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute C_AXI_SUPPORTS_USER_SIGNALS : integer;
  attribute C_AXI_SUPPORTS_USER_SIGNALS of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 0;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute C_TRANSLATION_MODE : integer;
  attribute C_TRANSLATION_MODE of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 2;
  attribute P_AXI4 : integer;
  attribute P_AXI4 of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 0;
  attribute P_AXI3 : integer;
  attribute P_AXI3 of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute P_AXILITE : integer;
  attribute P_AXILITE of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 2;
  attribute P_AXILITE_SIZE : string;
  attribute P_AXILITE_SIZE of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is "3'b010";
  attribute P_INCR : string;
  attribute P_INCR of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is "2'b01";
  attribute P_DECERR : string;
  attribute P_DECERR of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is "2'b11";
  attribute P_SLVERR : string;
  attribute P_SLVERR of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is "2'b10";
  attribute P_PROTECTION : integer;
  attribute P_PROTECTION of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 1;
  attribute P_CONVERSION : integer;
  attribute P_CONVERSION of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is 2;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter : entity is "axi_protocol_converter_v2_1_axi_protocol_converter";
end axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter;

architecture STRUCTURE of axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^m_axi_wready\ : STD_LOGIC;
  signal \^s_axi_wdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s_axi_wstrb\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^s_axi_wvalid\ : STD_LOGIC;
begin
  \^m_axi_wready\ <= m_axi_wready;
  \^s_axi_wdata\(31 downto 0) <= s_axi_wdata(31 downto 0);
  \^s_axi_wstrb\(3 downto 0) <= s_axi_wstrb(3 downto 0);
  \^s_axi_wvalid\ <= s_axi_wvalid;
  m_axi_arburst(1) <= \<const0>\;
  m_axi_arburst(0) <= \<const1>\;
  m_axi_arcache(3) <= \<const0>\;
  m_axi_arcache(2) <= \<const0>\;
  m_axi_arcache(1) <= \<const0>\;
  m_axi_arcache(0) <= \<const0>\;
  m_axi_arid(0) <= \<const0>\;
  m_axi_arlen(7) <= \<const0>\;
  m_axi_arlen(6) <= \<const0>\;
  m_axi_arlen(5) <= \<const0>\;
  m_axi_arlen(4) <= \<const0>\;
  m_axi_arlen(3) <= \<const0>\;
  m_axi_arlen(2) <= \<const0>\;
  m_axi_arlen(1) <= \<const0>\;
  m_axi_arlen(0) <= \<const0>\;
  m_axi_arlock(0) <= \<const0>\;
  m_axi_arqos(3) <= \<const0>\;
  m_axi_arqos(2) <= \<const0>\;
  m_axi_arqos(1) <= \<const0>\;
  m_axi_arqos(0) <= \<const0>\;
  m_axi_arregion(3) <= \<const0>\;
  m_axi_arregion(2) <= \<const0>\;
  m_axi_arregion(1) <= \<const0>\;
  m_axi_arregion(0) <= \<const0>\;
  m_axi_arsize(2) <= \<const0>\;
  m_axi_arsize(1) <= \<const1>\;
  m_axi_arsize(0) <= \<const0>\;
  m_axi_aruser(0) <= \<const0>\;
  m_axi_awburst(1) <= \<const0>\;
  m_axi_awburst(0) <= \<const1>\;
  m_axi_awcache(3) <= \<const0>\;
  m_axi_awcache(2) <= \<const0>\;
  m_axi_awcache(1) <= \<const0>\;
  m_axi_awcache(0) <= \<const0>\;
  m_axi_awid(0) <= \<const0>\;
  m_axi_awlen(7) <= \<const0>\;
  m_axi_awlen(6) <= \<const0>\;
  m_axi_awlen(5) <= \<const0>\;
  m_axi_awlen(4) <= \<const0>\;
  m_axi_awlen(3) <= \<const0>\;
  m_axi_awlen(2) <= \<const0>\;
  m_axi_awlen(1) <= \<const0>\;
  m_axi_awlen(0) <= \<const0>\;
  m_axi_awlock(0) <= \<const0>\;
  m_axi_awqos(3) <= \<const0>\;
  m_axi_awqos(2) <= \<const0>\;
  m_axi_awqos(1) <= \<const0>\;
  m_axi_awqos(0) <= \<const0>\;
  m_axi_awregion(3) <= \<const0>\;
  m_axi_awregion(2) <= \<const0>\;
  m_axi_awregion(1) <= \<const0>\;
  m_axi_awregion(0) <= \<const0>\;
  m_axi_awsize(2) <= \<const0>\;
  m_axi_awsize(1) <= \<const1>\;
  m_axi_awsize(0) <= \<const0>\;
  m_axi_awuser(0) <= \<const0>\;
  m_axi_wdata(31 downto 0) <= \^s_axi_wdata\(31 downto 0);
  m_axi_wid(0) <= \<const0>\;
  m_axi_wlast <= \<const1>\;
  m_axi_wstrb(3 downto 0) <= \^s_axi_wstrb\(3 downto 0);
  m_axi_wuser(0) <= \<const0>\;
  m_axi_wvalid <= \^s_axi_wvalid\;
  s_axi_buser(0) <= \<const0>\;
  s_axi_ruser(0) <= \<const0>\;
  s_axi_wready <= \^m_axi_wready\;
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gen_axilite.gen_b2s_conv.axilite_b2s\: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_b2s
    port map (
      O1 => s_axi_awready,
      O2 => s_axi_rvalid,
      O3 => s_axi_bvalid,
      O4 => s_axi_arready,
      O5(22 downto 20) => m_axi_arprot(2 downto 0),
      O5(19 downto 0) => m_axi_araddr(31 downto 12),
      O6(35) => s_axi_rid(0),
      O6(34) => s_axi_rlast,
      O6(33 downto 32) => s_axi_rresp(1 downto 0),
      O6(31 downto 0) => s_axi_rdata(31 downto 0),
      Q(22 downto 20) => m_axi_awprot(2 downto 0),
      Q(19 downto 0) => m_axi_awaddr(31 downto 12),
      aclk => aclk,
      aresetn => aresetn,
      \in\(33 downto 32) => m_axi_rresp(1 downto 0),
      \in\(31 downto 0) => m_axi_rdata(31 downto 0),
      m_axi_araddr(11 downto 0) => m_axi_araddr(11 downto 0),
      m_axi_arready => m_axi_arready,
      m_axi_arvalid => m_axi_arvalid,
      m_axi_awaddr(11 downto 0) => m_axi_awaddr(11 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awvalid => m_axi_awvalid,
      m_axi_bready => m_axi_bready,
      m_axi_bresp(1 downto 0) => m_axi_bresp(1 downto 0),
      m_axi_bvalid => m_axi_bvalid,
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arid(0) => s_axi_arid(0),
      s_axi_arlen(3 downto 0) => s_axi_arlen(3 downto 0),
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arsize(1 downto 0) => s_axi_arsize(1 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awid(0) => s_axi_awid(0),
      s_axi_awlen(3 downto 0) => s_axi_awlen(3 downto 0),
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awsize(1 downto 0) => s_axi_awsize(1 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bid(0) => s_axi_bid(0),
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_rready => s_axi_rready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_protocol_converter_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of axi_protocol_converter_0 : entity is true;
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axi_protocol_converter_0 : entity is "axi_protocol_converter_v2_1_axi_protocol_converter,Vivado 2014.3";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axi_protocol_converter_0 : entity is "axi_protocol_converter_0,axi_protocol_converter_v2_1_axi_protocol_converter,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of axi_protocol_converter_0 : entity is "axi_protocol_converter_0,axi_protocol_converter_v2_1_axi_protocol_converter,{x_ipProduct=Vivado 2014.3,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axi_protocol_converter,x_ipVersion=2.1,x_ipCoreRevision=3,x_ipLanguage=VERILOG,C_FAMILY=zynq,C_M_AXI_PROTOCOL=2,C_S_AXI_PROTOCOL=1,C_IGNORE_ID=1,C_AXI_ID_WIDTH=1,C_AXI_ADDR_WIDTH=32,C_AXI_DATA_WIDTH=32,C_AXI_SUPPORTS_WRITE=1,C_AXI_SUPPORTS_READ=1,C_AXI_SUPPORTS_USER_SIGNALS=0,C_AXI_AWUSER_WIDTH=1,C_AXI_ARUSER_WIDTH=1,C_AXI_WUSER_WIDTH=1,C_AXI_RUSER_WIDTH=1,C_AXI_BUSER_WIDTH=1,C_TRANSLATION_MODE=2}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axi_protocol_converter_0 : entity is "yes";
end axi_protocol_converter_0;

architecture STRUCTURE of axi_protocol_converter_0 is
  signal NLW_inst_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of inst : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of inst : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of inst : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of inst : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of inst : label is 32;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of inst : label is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of inst : label is 1;
  attribute C_AXI_SUPPORTS_READ : integer;
  attribute C_AXI_SUPPORTS_READ of inst : label is 1;
  attribute C_AXI_SUPPORTS_USER_SIGNALS : integer;
  attribute C_AXI_SUPPORTS_USER_SIGNALS of inst : label is 0;
  attribute C_AXI_SUPPORTS_WRITE : integer;
  attribute C_AXI_SUPPORTS_WRITE of inst : label is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of inst : label is 1;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "zynq";
  attribute C_IGNORE_ID : integer;
  attribute C_IGNORE_ID of inst : label is 1;
  attribute C_M_AXI_PROTOCOL : integer;
  attribute C_M_AXI_PROTOCOL of inst : label is 2;
  attribute C_S_AXI_PROTOCOL : integer;
  attribute C_S_AXI_PROTOCOL of inst : label is 1;
  attribute C_TRANSLATION_MODE : integer;
  attribute C_TRANSLATION_MODE of inst : label is 2;
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of inst : label is std.standard.true;
  attribute DowngradeIPIdentifiedWarnings of inst : label is "yes";
  attribute P_AXI3 : integer;
  attribute P_AXI3 of inst : label is 1;
  attribute P_AXI4 : integer;
  attribute P_AXI4 of inst : label is 0;
  attribute P_AXILITE : integer;
  attribute P_AXILITE of inst : label is 2;
  attribute P_AXILITE_SIZE : string;
  attribute P_AXILITE_SIZE of inst : label is "3'b010";
  attribute P_CONVERSION : integer;
  attribute P_CONVERSION of inst : label is 2;
  attribute P_DECERR : string;
  attribute P_DECERR of inst : label is "2'b11";
  attribute P_INCR : string;
  attribute P_INCR of inst : label is "2'b01";
  attribute P_PROTECTION : integer;
  attribute P_PROTECTION of inst : label is 1;
  attribute P_SLVERR : string;
  attribute P_SLVERR of inst : label is "2'b10";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of inst : label is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
begin
inst: entity work.axi_protocol_converter_0_axi_protocol_converter_v2_1_axi_protocol_converter
    port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axi_araddr(31 downto 0) => m_axi_araddr(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_inst_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_inst_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(0) => NLW_inst_m_axi_arid_UNCONNECTED(0),
      m_axi_arlen(7 downto 0) => NLW_inst_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(0) => NLW_inst_m_axi_arlock_UNCONNECTED(0),
      m_axi_arprot(2 downto 0) => m_axi_arprot(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_inst_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => m_axi_arready,
      m_axi_arregion(3 downto 0) => NLW_inst_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_inst_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_inst_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => m_axi_arvalid,
      m_axi_awaddr(31 downto 0) => m_axi_awaddr(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_inst_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_inst_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(0) => NLW_inst_m_axi_awid_UNCONNECTED(0),
      m_axi_awlen(7 downto 0) => NLW_inst_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(0) => NLW_inst_m_axi_awlock_UNCONNECTED(0),
      m_axi_awprot(2 downto 0) => m_axi_awprot(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_inst_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awregion(3 downto 0) => NLW_inst_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_inst_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_inst_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => m_axi_awvalid,
      m_axi_bid(0) => '0',
      m_axi_bready => m_axi_bready,
      m_axi_bresp(1 downto 0) => m_axi_bresp(1 downto 0),
      m_axi_buser(0) => '0',
      m_axi_bvalid => m_axi_bvalid,
      m_axi_rdata(31 downto 0) => m_axi_rdata(31 downto 0),
      m_axi_rid(0) => '0',
      m_axi_rlast => '1',
      m_axi_rready => m_axi_rready,
      m_axi_rresp(1 downto 0) => m_axi_rresp(1 downto 0),
      m_axi_ruser(0) => '0',
      m_axi_rvalid => m_axi_rvalid,
      m_axi_wdata(31 downto 0) => m_axi_wdata(31 downto 0),
      m_axi_wid(0) => NLW_inst_m_axi_wid_UNCONNECTED(0),
      m_axi_wlast => NLW_inst_m_axi_wlast_UNCONNECTED,
      m_axi_wready => m_axi_wready,
      m_axi_wstrb(3 downto 0) => m_axi_wstrb(3 downto 0),
      m_axi_wuser(0) => NLW_inst_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => m_axi_wvalid,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arcache(3 downto 0) => s_axi_arcache(3 downto 0),
      s_axi_arid(0) => '0',
      s_axi_arlen(3 downto 0) => s_axi_arlen(3 downto 0),
      s_axi_arlock(1 downto 0) => s_axi_arlock(1 downto 0),
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arqos(3 downto 0) => s_axi_arqos(3 downto 0),
      s_axi_arready => s_axi_arready,
      s_axi_arregion(3) => '0',
      s_axi_arregion(2) => '0',
      s_axi_arregion(1) => '0',
      s_axi_arregion(0) => '0',
      s_axi_arsize(2 downto 0) => s_axi_arsize(2 downto 0),
      s_axi_aruser(0) => '0',
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awcache(3 downto 0) => s_axi_awcache(3 downto 0),
      s_axi_awid(0) => '0',
      s_axi_awlen(3 downto 0) => s_axi_awlen(3 downto 0),
      s_axi_awlock(1 downto 0) => s_axi_awlock(1 downto 0),
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awqos(3 downto 0) => s_axi_awqos(3 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awregion(3) => '0',
      s_axi_awregion(2) => '0',
      s_axi_awregion(1) => '0',
      s_axi_awregion(0) => '0',
      s_axi_awsize(2 downto 0) => s_axi_awsize(2 downto 0),
      s_axi_awuser(0) => '0',
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bid(0) => NLW_inst_s_axi_bid_UNCONNECTED(0),
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_buser(0) => NLW_inst_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rid(0) => NLW_inst_s_axi_rid_UNCONNECTED(0),
      s_axi_rlast => s_axi_rlast,
      s_axi_rready => s_axi_rready,
      s_axi_rresp(1 downto 0) => s_axi_rresp(1 downto 0),
      s_axi_ruser(0) => NLW_inst_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wid(0) => '0',
      s_axi_wlast => s_axi_wlast,
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wuser(0) => '0',
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
