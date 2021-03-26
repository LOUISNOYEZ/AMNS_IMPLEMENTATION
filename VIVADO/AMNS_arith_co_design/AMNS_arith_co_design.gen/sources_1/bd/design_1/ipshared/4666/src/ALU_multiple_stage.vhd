----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2021 19:39:48
-- Design Name: 
-- Module Name: ALU_multiple_stage - ALU_multiple_stage_arch
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

entity ALU_multiple_stage is
    generic(NB_COEFF : natural := 4;
            WORD_WIDTH : natural := 64);
    Port (clock_i : in STD_LOGIC;
          POLY_ACCU_reset_i : in STD_LOGIC;
          POLY_ACCU_en_i : in STD_LOGIC;
          fonction_i : in FONCTION;
          control_i : in CONTROL;
          count_i : in STD_LOGIC_VECTOR(ceil_log2(NB_COEFF+1)-1 downto 0);
          OP_A_i : in POLYNOME;
          OP_B_i : in POLYNOME;
          data_o : out BIG_POLYNOME );
end ALU_multiple_stage;

architecture ALU_multiple_stage_arch of ALU_multiple_stage is

    type signed_mul_input_0_t is array(0 to NB_COEFF-1) of STD_LOGIC_VECTOR(WORD_WIDTH downto 0);
    type signed_mul_output_t is array(0 to NB_COEFF-1) of STD_LOGIC_VECTOR(3*WORD_WIDTH downto 0);
    
    signal mul_input_0_s : signed_mul_input_0_t;
    signal mul_input_1_s : BIG_POLYNOME;
    signal mul_output_s : signed_mul_output_t;
    
    signal adder_input_0_s : BIG_POLYNOME;
    signal adder_input_1_s : BIG_POLYNOME;
    signal adder_output_s : BIG_POLYNOME;
    
    signal POLY_ACCU_input_s : BIG_POLYNOME;
    signal POLY_ACCU_output_s : BIG_POLYNOME;

begin

    G0 : for I in 0 to NB_COEFF-1 generate
    
        mul_input_0_s(I) <= 
            STD_LOGIC_VECTOR(resize(unsigned(OP_A_i(I)),mul_input_0_s(I)'length)) when control_i = ALU_POLY_MUL and fonction_i = REDCOEFF else
            STD_LOGIC_VECTOR(resize(signed(OP_A_i(I)),mul_input_0_s(I)'length)) when control_i = ALU_POLY_MUL else
            STD_LOGIC_VECTOR(resize(unsigned(OP_A_i(I)),mul_input_0_s(I)'length))when control_i = ALU_POLY_MUL_MOD else
            (others => '0');
            
        mul_input_1_s(I) <=
            POLY_ACCU_output_s(I) when count_i = STD_LOGIC_VECTOR(To_Unsigned(NB_COEFF-1-I,count_i'length)) and (control_i = ALU_POLY_MUL or control_i = ALU_POLY_MUL_MOD) else
            STD_LOGIC_VECTOR(resize(signed(OP_B_i(I)),2*WORD_WIDTH)) when control_i = ALU_POLY_MUL else
            STD_LOGIC_VECTOR(resize(unsigned(OP_B_i(I)),2*WORD_WIDTH)) when control_i = ALU_POLY_MUL_MOD else
            (others => '0');
            
        mul_output_s(I) <= STD_LOGIC_VECTOR(signed(mul_input_0_s(I))*signed(mul_input_1_s(I)));
    
        adder_input_0_s(I) <= 
            (others => '0') when count_i = STD_LOGIC_VECTOR(To_Unsigned(NB_COEFF-1-I,count_i'length)) and (control_i = ALU_POLY_MUL or control_i = ALU_POLY_MUL_MOD) else
            POLY_ACCU_output_s(I) when (control_i = ALU_POLY_MUL or control_i = ALU_POLY_MUL_MOD or control_i = ALU_ACCUMULATION) else
            (others => '0');
            
        adder_input_1_s(I) <=
            mul_output_s(I)(2*WORD_WIDTH-1 downto 0) when control_i = ALU_POLY_MUL else
            STD_LOGIC_VECTOR(resize(unsigned(mul_output_s(I)(WORD_WIDTH-1 downto 0)),2*WORD_WIDTH)) when control_i = ALU_POLY_MUL_MOD else
            OP_A_i(I) & OP_B_i(I) when control_i = ALU_ACCUMULATION else
            (others => '0');
            
        adder_output_s(I) <= STD_LOGIC_VECTOR(signed(adder_input_0_s(I))+signed(adder_input_1_s(I)));

        POLY_ACCU_input_s(I) <= 
            STD_LOGIC_VECTOR(resize(unsigned(adder_output_s(I)(WORD_WIDTH-1 downto 0)),2*WORD_WIDTH)) when control_i = ALU_POLY_MUL_MOD else
            adder_output_s(I);
            
    end generate;

    
    P0 : process(clock_i)
    begin
        if clock_i'event and clock_i = '1' then
            if POLY_ACCU_reset_i = '0' then
                POLY_ACCU_output_s <= (others => (others => '0'));
            elsif POLY_ACCU_en_i = '1' then
                POLY_ACCU_output_s <= POLY_ACCU_input_s;
            else
                POLY_ACCU_output_s <= POLY_ACCU_output_s;
            end if;
        end if;
    end process;

    data_o <= 
        POLY_ACCU_input_s when count_i = STD_LOGIC_VECTOR(To_Unsigned(NB_COEFF, count_i'length)) else
        POLY_ACCU_output_s;

end ALU_multiple_stage_arch;
