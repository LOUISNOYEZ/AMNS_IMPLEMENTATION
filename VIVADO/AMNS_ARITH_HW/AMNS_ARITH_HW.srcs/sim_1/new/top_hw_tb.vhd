----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2021 22:02:37
-- Design Name: 
-- Module Name: top_hw_tb - top_hw_tb_arch
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

entity top_hw_tb is
end top_hw_tb;

architecture top_hw_tb_arch of top_hw_tb is

    component top_hw is
        port(clock_i : in STD_LOGIC;
             reset_i : in STD_LOGIC;
             start_i : in STD_LOGIC;
             sel_i : in STD_LOGIC_VECTOR(7 downto 0);
             data_o : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    
    constant PERIOD : time := 30 ns;
    constant HALF_PERIOD : time := PERIOD/2;
    
    signal clock_s : STD_LOGIC := '0';
    signal reset_s : STD_LOGIC := '0';
    signal start_s : STD_LOGIC := '0';
    signal sel_s : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal data_s : STD_LOGIC_VECTOR(7 downto 0); 

begin

    DUT : top_hw
    port map(clock_i => clock_s,
             reset_i => reset_s,
             start_i => start_s,
             sel_i => sel_s,
             data_o => data_s);
             
    clock_s <= not(clock_s) after HALF_PERIOD;
    
    P0 : process
    variable count : natural := 0;
    begin
        wait for PERIOD;
        reset_s <= '1';
        wait for PERIOD;
        start_s <= '1';
        wait for 50*PERIOD;
        L0 : for I in 0 to 2**8-1 loop
            sel_s <= STD_LOGIC_VECTOR(To_Unsigned(count,8));
            count := count+1;
            wait for PERIOD;
        end loop L0;
        wait for 50*PERIOD;
    end process;

end top_hw_tb_arch;
