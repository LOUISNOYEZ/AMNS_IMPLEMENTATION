-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Sun Mar 21 22:22:48 2021
-- Host        : LAPTOP-6Q7QM5AJ running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/louis/Desktop/AMNS_IMPLEMENTATION/VIVADO/AMNS_ARITH_HW/AMNS_ARITH_HW.sim/sim_1/synth/func/xsim/poly_mem_top_tb_func_synth.vhd
-- Design      : poly_mem_top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity poly_mem is
  port (
    data_o_OBUF : out STD_LOGIC_VECTOR ( 0 to 0 );
    clock_i_IBUF_BUFG : in STD_LOGIC;
    sel_i_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset_i_IBUF : in STD_LOGIC;
    start_i_IBUF : in STD_LOGIC
  );
end poly_mem;

architecture STRUCTURE of poly_mem is
  signal \data_1_o[3]\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \mem_array_s[5][3][7]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_o_OBUF[7]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \mem_array_s[5][3][7]_i_1\ : label is "soft_lutpair0";
begin
\data_o_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \data_1_o[3]\(7),
      I1 => sel_i_IBUF(0),
      O => data_o_OBUF(0)
    );
\mem_array_s[5][3][7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => reset_i_IBUF,
      I1 => \data_1_o[3]\(7),
      I2 => start_i_IBUF,
      O => \mem_array_s[5][3][7]_i_1_n_0\
    );
\mem_array_s_reg[5][3][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock_i_IBUF_BUFG,
      CE => '1',
      D => \mem_array_s[5][3][7]_i_1_n_0\,
      Q => \data_1_o[3]\(7),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity poly_mem_top is
  port (
    clock_i : in STD_LOGIC;
    reset_i : in STD_LOGIC;
    start_i : in STD_LOGIC;
    sel_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    data_o : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of poly_mem_top : entity is true;
end poly_mem_top;

architecture STRUCTURE of poly_mem_top is
  signal clock_i_IBUF : STD_LOGIC;
  signal clock_i_IBUF_BUFG : STD_LOGIC;
  signal data_o_OBUF : STD_LOGIC_VECTOR ( 0 to 0 );
  signal reset_i_IBUF : STD_LOGIC;
  signal sel_i_IBUF : STD_LOGIC_VECTOR ( 3 to 3 );
  signal start_i_IBUF : STD_LOGIC;
begin
POLY_MEM_INST: entity work.poly_mem
     port map (
      clock_i_IBUF_BUFG => clock_i_IBUF_BUFG,
      data_o_OBUF(0) => data_o_OBUF(0),
      reset_i_IBUF => reset_i_IBUF,
      sel_i_IBUF(0) => sel_i_IBUF(3),
      start_i_IBUF => start_i_IBUF
    );
clock_i_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clock_i_IBUF,
      O => clock_i_IBUF_BUFG
    );
clock_i_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clock_i,
      O => clock_i_IBUF
    );
\data_o_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_o_OBUF(0),
      O => data_o(0)
    );
\data_o_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_o_OBUF(0),
      O => data_o(1)
    );
\data_o_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_o_OBUF(0),
      O => data_o(2)
    );
\data_o_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_o_OBUF(0),
      O => data_o(3)
    );
\data_o_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_o_OBUF(0),
      O => data_o(4)
    );
\data_o_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_o_OBUF(0),
      O => data_o(5)
    );
\data_o_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_o_OBUF(0),
      O => data_o(6)
    );
\data_o_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_o_OBUF(0),
      O => data_o(7)
    );
reset_i_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset_i,
      O => reset_i_IBUF
    );
\sel_i_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sel_i(3),
      O => sel_i_IBUF(3)
    );
start_i_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => start_i,
      O => start_i_IBUF
    );
end STRUCTURE;
