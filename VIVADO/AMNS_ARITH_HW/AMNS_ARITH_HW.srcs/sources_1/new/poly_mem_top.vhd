----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2021 00:30:17
-- Design Name: 
-- Module Name: poly_mem_top - poly_mem_top_arch
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

entity poly_mem_top is
    Port (clock_i : in STD_LOGIC;
          reset_i : in STD_LOGIC;
          start_i : in STD_LOGIC;
          sel_i : in STD_LOGIC_VECTOR(7 downto 0);
          data_o : out STD_LOGIC_VECTOR(7 downto 0) );
end poly_mem_top;

architecture poly_mem_top_arch of poly_mem_top is

    component poly_mem is
        port(clock_i : in STD_LOGIC;
             reset_i : in STD_LOGIC;
             w_en_i : in STD_LOGIC;
             w_address_low_i : in STD_LOGIC_VECTOR(3 downto 0);
             w_address_high_i : in STD_LOGIC_VECTOR(3 downto 0);
             r_address_0_i : in STD_LOGIC_VECTOR(3 downto 0);
             r_address_1_i : in STD_LOGIC_VECTOR(3 downto 0);
             data_i : in BIG_POLYNOME;
             data_0_o : out POLYNOME;
             data_1_o : out POLYNOME);
    end component;
    
    signal w_address_low_s : STD_LOGIC_VECTOR(3 downto 0);
    signal w_address_high_s : STD_LOGIC_VECTOR(3 downto 0);
    signal r_address_0_s : STD_LOGIC_VECTOR(3 downto 0);
    signal r_address_1_s : STD_LOGIC_VECTOR(3 downto 0);
    signal data_input_s : BIG_POLYNOME;
    signal data_0_output_s : POLYNOME;
    signal data_1_output_s : POLYNOME;
    
begin

    POLY_MEM_INST : poly_mem
    port map(clock_i => clock_i,
             reset_i => reset_i,
             w_en_i => start_i,
             w_address_low_i => w_address_low_s,
             w_address_high_i => w_address_high_s,
             r_address_0_i => r_address_0_s,
             r_address_1_i => r_address_1_s,
             data_i => data_input_s,
             data_0_o => data_0_output_s,
             data_1_o => data_1_output_s);
             
    w_address_low_s <= STD_LOGIC_VECTOR(To_Unsigned(5,4));
    w_address_high_s <= STD_LOGIC_VECTOR(To_Unsigned(6,4));
    r_address_0_s <= STD_LOGIC_VECTOR(To_Unsigned(4,4));
    r_address_1_s <= STD_LOGIC_VECTOR(To_Unsigned(6,4));
    
    data_input_s <= (others => (others => '1'));
    
    data_o <= data_1_output_s(To_Integer(Unsigned(sel_i(7 downto 6))))((To_Integer(Unsigned(sel_i(5 downto 0)))+1)*8-1 downto To_Integer(Unsigned(sel_i(5 downto 0)))*8);

end poly_mem_top_arch;
