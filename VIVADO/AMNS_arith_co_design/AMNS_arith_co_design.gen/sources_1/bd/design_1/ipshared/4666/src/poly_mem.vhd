----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2021 00:13:14
-- Design Name: 
-- Module Name: poly_mem - poly_mem_arch
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

entity poly_mem is
    generic(NB_COEFF : natural := 4;
            WORD_WIDTH : natural := 64);
    Port (clock_i : in STD_LOGIC;
          reset_i : in STD_LOGIC;
          w_en_i : in STD_LOGIC;
          w_address_low_i : in STD_LOGIC_VECTOR(3 downto 0);
          w_address_high_i : in STD_LOGIC_VECTOR(3 downto 0);
          r_address_0_i : in STD_LOGIC_VECTOR(3 downto 0);
          r_address_1_i : in STD_LOGIC_VECTOR(3 downto 0);
          data_i : in BIG_POLYNOME;
          data_0_o : out POLYNOME;
          data_1_o : out POLYNOME);
end poly_mem;

architecture poly_mem_arch of poly_mem is

    type mem_t is array(0 to 12) of POLYNOME;
    
    signal mem_array_s : mem_t;
    signal data_input_low_s, data_input_high_s : POLYNOME;

begin

    G0 : for I in 0 to NB_COEFF-1 generate
    
        data_input_low_s(I) <= data_i(I)(WORD_WIDTH-1 downto 0);
        data_input_high_s(I) <= data_i(I)(2*WORD_WIDTH-1 downto WORD_WIDTH);
        
    end generate;

    P0 : process(clock_i)
    begin
        if clock_i'event and clock_i = '1' then
            if reset_i = '0' then
                mem_array_s <= (others => (others => (others => '0')));
            elsif w_en_i = '1' then
                if not(w_address_low_i = M_ADDR or w_address_low_i = M_PRIME_ADDR or w_address_low_i = ZERO_ADDR) then
                    mem_array_s(To_Integer(Unsigned(w_address_low_i))) <= data_input_low_s;
                end if;
                if not(w_address_high_i = M_ADDR or w_address_high_i = M_PRIME_ADDR or w_address_high_i = ZERO_ADDR) then
                    mem_array_s(To_Integer(Unsigned(w_address_high_i))) <= data_input_high_s;
                end if;
            else
                mem_array_s <= mem_array_s;
            end if;
        end if;
    end process;
    
    with r_address_0_i select data_0_o <=
        M_POLY when M_ADDR,
        M_PRIME_POLY when M_PRIME_ADDR,
        (others => (others => '0')) when ZERO_ADDR,
        mem_array_s(To_Integer(Unsigned(r_address_0_i))) when others;

    with r_address_1_i select data_1_o <=
        M_POLY when M_ADDR,
        M_PRIME_POLY when M_PRIME_ADDR,
        (others => (others => '0')) when ZERO_ADDR,
        mem_array_s(To_Integer(Unsigned(r_address_1_i))) when others;
                    
end poly_mem_arch;
