----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2021 00:43:47
-- Design Name: 
-- Module Name: poly_mem_top_tb - poly_mem_top_tb_arch
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
use xil_defaultlib.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity poly_mem_top_tb is
end poly_mem_top_tb;

architecture poly_mem_top_tb_arch of poly_mem_top_tb is

    component poly_mem_top is
        port(clock_i : in STD_LOGIC;
             reset_i : in STD_LOGIC;
             start_i : in STD_LOGIC;
             sel_i : in STD_LOGIC_VECTOR(7 downto 0);
             data_o : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    
    signal clock_s : STD_LOGIC := '0';
    signal reset_s : STD_LOGIC := '0';
    signal start_s : STD_LOGIC := '0';
    signal sel_s : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal data_s : STD_LOGIC_VECTOR(7 downto 0);

begin

    DUT : poly_mem_top
    port map(clock_i => clock_s,
             reset_i => reset_s,
             start_i => start_s,
             sel_i => sel_s,
             data_o => data_s);
             
    clock_s <= not(clock_s) after 15 ns;

    P0 : process
    begin
        wait for 90 ns;
        wait for 30 ns;
        reset_s <= '1';
        wait for 30 ns;
        start_s <= '1';
        wait for 5000 ns;
    end process;

end poly_mem_top_tb_arch;
