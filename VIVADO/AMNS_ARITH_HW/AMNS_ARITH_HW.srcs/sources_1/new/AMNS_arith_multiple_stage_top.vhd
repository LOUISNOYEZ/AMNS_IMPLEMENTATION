----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2021 05:42:45
-- Design Name: 
-- Module Name: AMNS_arith_multiple_stage_top - AMNS_arith_multiple_stage_top_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library xil_defaultlib;
use xil_defaultlib.amns_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AMNS_arith_multiple_stage_top is
    Port (clock_i : in STD_LOGIC;
          reset_i : in STD_LOGIC;
          start_i : in STD_LOGIC;
          sel_i : in STD_LOGIC_VECTOR(7 downto 0);
          data_o : out STD_LOGIC_VECTOR(7 downto 0));
end AMNS_arith_multiple_stage_top;

architecture AMNS_arith_multiple_stage_top_arch of AMNS_arith_multiple_stage_top is

    component AMNS_arith_multiple_stage is
        generic(NB_COEFF : natural := 4;
                WORD_WIDTH : natural := 64);
        port(clock_i : in STD_LOGIC;
             reset_i : in STD_LOGIC;
             start_i : in STD_LOGIC;
             fonction_i : in FONCTION;
             POLY_A_i : in POLYNOME;
             POLY_B_i : in POLYNOME;
             POLY_OUT_o : out BIG_POLYNOME;
             busy_o : out STD_LOGIC);
    end component;

    constant POLY_A_c : POLYNOME := (x"000007E9B3B43236", x"00000131DA92C3F1", x"000006816A4D482E", x"000001907B809982");
    constant POLY_B_c : POLYNOME := (x"000007C819473440", x"000000565E062404", x"0000003F43C62E91", x"000004AF05145D7D");

    signal fonction_s : FONCTION;
    signal POLY_OUT_s : BIG_POLYNOME;
    signal busy_s : STD_LOGIC;

begin

    with sel_i select fonction_s <=
        LOAD when x"00",
        POLY_MUL when x"01",
        REDCOEFF when x"02",
        IDLE when others;
        
    AMNS_ARITH_INST : AMNS_arith_multiple_stage
    generic map(NB_COEFF => NB_COEFF,
                WORD_WIDTH => WORD_WIDTH)
    port map(clock_i => clock_i,
             reset_i => reset_i,
             start_i => start_i,
             fonction_i => fonction_s,
             POLY_A_i => POLY_A_c,
             POLY_B_i => POLY_B_c,
             POLY_OUT_o => POLY_OUT_s,
             busy_o => busy_s);

    data_o <= POLY_OUT_s(0)(7 downto 0);

end AMNS_arith_multiple_stage_top_arch;
