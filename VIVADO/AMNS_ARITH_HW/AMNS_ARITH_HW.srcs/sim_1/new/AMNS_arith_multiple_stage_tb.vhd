----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2021 19:02:44
-- Design Name: 
-- Module Name: AMNS_arith_multiple_stage_tb - AMNS_arith_multiple_stage_tb_arch
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
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.amns_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AMNS_arith_multiple_stage_tb is
end AMNS_arith_multiple_stage_tb;

architecture AMNS_arith_multiple_stage_tb_arch of AMNS_arith_multiple_stage_tb is

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
    
    constant HALF_PERIOD : time := 15 ns;
    constant PERIOD : time := 30 ns;
    
    signal clock_s : STD_LOGIC := '0';
    signal reset_s : STD_LOGIC := '0';
    signal start_s : STD_LOGIC := '0';
    signal fonction_s : FONCTION := LOAD;
    signal POLY_A_s : POLYNOME := (x"000007E9B3B43236", x"00000131DA92C3F1", x"000006816A4D482E", x"000001907B809982");
    signal POLY_B_s : POLYNOME := (x"000007C819473440", x"000000565E062404", x"0000003F43C62E91", x"000004AF05145D7D");
    signal POLY_OUT_s : BIG_POLYNOME;
    signal busy_s : STD_LOGIC;
    
begin

    DUT : AMNS_arith_multiple_stage
    generic map(NB_COEFF => NB_COEFF,
                WORD_WIDTH => WORD_WIDTH)
    port map(clock_i => clock_s,
             reset_i => reset_s,
             start_i => start_s,
             fonction_i => fonction_s,
             POLY_A_i => POLY_A_s,
             POLY_B_i => POLY_B_s,
             POLY_OUT_o => POLY_OUT_s,
             busy_o => busy_s);
    
    clock_s <= not(clock_s) after HALF_PERIOD;
             
    P0 : process
    begin
        wait for 3*PERIOD;
        wait for PERIOD;
        reset_s <= '1';
        wait for PERIOD;
        start_s <= '1';
        wait for PERIOD;
        wait until busy_s = '0';
        fonction_s <= POLY_MUL;
        wait for PERIOD;
        wait until busy_s = '0';
        fonction_s <= REDCOEFF;
        wait for 100*PERIOD;
    end process;

end AMNS_arith_multiple_stage_tb_arch;
