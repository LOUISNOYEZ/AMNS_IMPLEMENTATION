----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2021 23:52:55
-- Design Name: 
-- Module Name: FSM - FSM_arch
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

entity FSM is
    generic(NB_COEFF : natural := 4);
    Port (clock_i : in STD_LOGIC;
          reset_i : in STD_LOGIC;
          start_i : in STD_LOGIC;
          count_i : in STD_LOGIC_VECTOR(ceil_log2(NB_COEFF+1)-1 downto 0);
          fonction_i : in FONCTION;
          poly_mem_reset_o : out STD_LOGIC;
          poly_mem_en_o : out STD_LOGIC;
          POLY_ACCU_reset_o : out STD_LOGIC;
          POLY_ACCU_en_o : out STD_LOGIC;
          counter_reset_o : out STD_LOGIC;
          counter_en_o : out STD_LOGIC;
          control_o : out CONTROL;
          busy_o : out STD_LOGIC );
end FSM;

architecture FSM_arch of FSM is

    type state_t is (RESET, IDLE, LOAD, POLY_MUL, POLY_MUL_FINAL, POLY_MUL_MOD, POLY_MUL_MOD_FINAL, ACCUMULATION);
    
    signal current_state_s, future_state_s : state_t;

begin

    P0 : process(clock_i)
    begin
        if clock_i'event and clock_i = '1' then
            if reset_i = '0' then
                current_state_s <= RESET;
            else
                current_state_s <= future_state_s;
            end if;
        end if;
    end process;
    
    P1 : process(current_state_s, clock_i, reset_i, start_i, count_i, fonction_i)
    begin
        case current_state_s is
            when RESET =>
                future_state_s <= IDLE;
            when IDLE =>
                if start_i = '1' then
                    if fonction_i = POLY_MUL then
                        future_state_s <= POLY_MUL;
                    elsif fonction_i = POLY_MUL_MOD then
                        future_state_s <= POLY_MUL_MOD;
                    elsif fonction_i = REDCOEFF then
                        future_state_s <= POLY_MUL_MOD;
                    elsif fonction_i = LOAD then
                        future_state_s <= LOAD;
                    elsif fonction_i = IDLE then
                        future_state_s <= IDLE;
                    else
                        future_state_s <= IDLE;
                    end if;
                else
                    future_state_s <= IDLE;
                end if;
            when LOAD =>
                future_state_s <= IDLE;
            when POLY_MUL =>
                if To_Integer(Unsigned(count_i)) = NB_COEFF-1 then
                    future_state_s <= POLY_MUL_FINAL;
                else
                    future_state_s <= POLY_MUL;
                end if;
            when POLY_MUL_FINAL =>
                if fonction_i = REDCOEFF then
                    future_state_s <= ACCUMULATION;
                else
                    future_state_s <= IDLE;
                end if;
            when POLY_MUL_MOD =>
                if To_Integer(Unsigned(count_i)) = NB_COEFF-1 then
                    future_state_s <= POLY_MUL_MOD_FINAL;
                else
                    future_state_s <= POLY_MUL_MOD;
                end if;
            when POLY_MUL_MOD_FINAL =>
                if fonction_i = REDCOEFF then
                    future_state_s <= POLY_MUL;
                else
                    future_state_s <= IDLE;
                end if;
            when ACCUMULATION =>
                future_state_s <= IDLE;
            when others =>
                future_state_s <= IDLE;
        end case;
    end process;
    
    P2 : process(current_state_s)
    begin
        case current_state_s is
            when RESET =>
                poly_mem_reset_o <= '0';
                poly_mem_en_o <= '0';
                POLY_ACCU_reset_o <= '0';
                POLY_ACCU_en_o <= '0';
                counter_reset_o <= '0';
                counter_en_o <= '0';
                control_o <= IDLE;
                busy_o <= '0';
            when IDLE =>
                poly_mem_reset_o <= '1';
                poly_mem_en_o <= '0';
                POLY_ACCU_reset_o <= '0';
                POLY_ACCU_en_o <= '0';
                counter_reset_o <= '1';
                counter_en_o <= '0';
                control_o <= IDLE;
                busy_o <= '0';
            when LOAD =>
                poly_mem_reset_o <= '1';
                poly_mem_en_o <= '1';
                POLY_ACCU_reset_o <= '1';
                POLY_ACCU_en_o <= '0';
                counter_reset_o <= '1';
                counter_en_o <= '0';
                control_o <= LOAD;
                busy_o <= '1';
            when POLY_MUL =>
                poly_mem_reset_o <= '1';
                poly_mem_en_o <= '0';
                POLY_ACCU_reset_o <= '1';
                POLY_ACCU_en_o <= '1';
                counter_reset_o <= '1';
                counter_en_o <= '1';
                control_o <= ALU_POLY_MUL;
                busy_o <= '1';
            when POLY_MUL_FINAL =>
                poly_mem_reset_o <= '1';
                poly_mem_en_o <= '1';
                POLY_ACCU_reset_o <= '1';
                POLY_ACCU_en_o <= '1';
                counter_reset_o <= '0';
                counter_en_o <= '0';
                control_o <= ALU_POLY_MUL;
                busy_o <= '1';
            when POLY_MUL_MOD =>
                poly_mem_reset_o <= '1';
                poly_mem_en_o <= '0';
                POLY_ACCU_reset_o <= '1';
                POLY_ACCU_en_o <= '1';
                counter_reset_o <= '1';
                counter_en_o <= '1';
                control_o <= ALU_POLY_MUL_MOD;
                busy_o <= '1';
            when POLY_MUL_MOD_FINAL =>
                poly_mem_reset_o <= '1';
                poly_mem_en_o <= '1';
                POLY_ACCU_reset_o <= '0';
                POLY_ACCU_en_o <= '0';
                counter_reset_o <= '0';
                counter_en_o <= '0';
                control_o <= ALU_POLY_MUL_MOD;
                busy_o <= '1';
            when ACCUMULATION =>
                poly_mem_reset_o <= '1';
                poly_mem_en_o <= '1';
                POLY_ACCU_reset_o <= '0';
                POLY_ACCU_en_o <= '0';
                counter_reset_o <= '0';
                counter_en_o <= '0';
                control_o <= ALU_ACCUMULATION;
                busy_o <= '1';
            when others =>
                poly_mem_reset_o <= '1';
                poly_mem_en_o <= '0';
                POLY_ACCU_reset_o <= '1';
                POLY_ACCU_en_o <= '0';
                counter_reset_o <= '1';
                counter_en_o <= '0';
                control_o <= IDLE;
                busy_o <= '0';
        end case;
    end process;
    
end FSM_arch;
