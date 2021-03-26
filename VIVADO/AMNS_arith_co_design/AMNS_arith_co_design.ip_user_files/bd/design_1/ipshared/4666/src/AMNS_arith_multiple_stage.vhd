----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2021 23:45:02
-- Design Name: 
-- Module Name: AMNS_arith_multiple_stage - AMNS_arith_multiple_stage_arch
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

entity AMNS_arith_multiple_stage is
    generic(NB_COEFF : natural := 4;
            WORD_WIDTH : natural := 64);
    Port (clock_i : in STD_LOGIC;
          reset_i : in STD_LOGIC;
          start_i : in STD_LOGIC;
          fonction_i : in FONCTION;
          POLY_A_i : in POLYNOME;
          POLY_B_i : in POLYNOME;
          POLY_OUT_o : out BIG_POLYNOME;
          busy_o : out STD_LOGIC );
end AMNS_arith_multiple_stage;

architecture AMNS_arith_multiple_stage_arch of AMNS_arith_multiple_stage is

    component FSM is
        generic(NB_COEFF : natural := 4);
        port(clock_i : in STD_LOGIC;
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
             busy_o : out STD_LOGIC);
    end component;
    
    component counter is
        generic(WIDTH : natural := 3);
        port(clock_i : in STD_LOGIC;
             reset_i : in STD_LOGIC;
             en_i : in STD_LOGIC;
             data_o : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
    end component;
    
    component poly_mem is
        generic(NB_COEFF : natural := 4;
                WORD_WIDTH : natural := 64);
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
    
    component ALU_multiple_stage is
        generic(NB_COEFF : natural := 4;
                WORD_WIDTH : natural := 64);
        port(clock_i : in STD_LOGIC;
             POLY_ACCU_reset_i : in STD_LOGIC;
             POLY_ACCU_en_i : in STD_LOGIC;
             fonction_i : in FONCTION;
             control_i : in CONTROL;
             count_i : in STD_LOGIC_VECTOR(ceil_log2(NB_COEFF+1)-1 downto 0);
             OP_A_i : in POLYNOME;
             OP_B_i : in POLYNOME;
             data_o : out BIG_POLYNOME);
    end component;

    -- poly_mem signals
    signal poly_mem_reset_s : STD_LOGIC;
    signal poly_mem_en_s : STD_LOGIC;
    signal w_address_low_s : STD_LOGIC_VECTOR(3 downto 0);
    signal w_address_high_s : STD_LOGIC_VECTOR(3 downto 0);
    signal r_address_0_s : STD_LOGIC_VECTOR(3 downto 0);
    signal r_address_1_s : STD_LOGIC_VECTOR(3 downto 0);
    signal poly_mem_in_s : BIG_POLYNOME;
    signal poly_mem_out_0_s : POLYNOME;
    signal poly_mem_out_1_s : POLYNOME;

    -- counter signals
    signal counter_reset_s : STD_LOGIC;
    signal counter_en_s : STD_LOGIC;
    signal counter_data_s : STD_LOGIC_VECTOR(ceil_log2(NB_COEFF+1)-1 downto 0);
    
    -- ALU signals
    signal POLY_ACCU_reset_s : STD_LOGIC;
    signal POLY_ACCU_en_s : STD_LOGIC;
    signal OP_A_s : POLYNOME;
    signal OP_B_s : POLYNOME;
    signal ALU_data_output_s : BIG_POLYNOME;
    
    -- FSM signals
    signal busy_s : STD_LOGIC;
    signal control_s : CONTROL;

begin

    FSM_INST : FSM
    generic map(NB_COEFF => NB_COEFF)
    port map(clock_i => clock_i,
             reset_i => reset_i,
             start_i => start_i,
             count_i => counter_data_s,
             fonction_i => fonction_i,
             poly_mem_reset_o => poly_mem_reset_s,
             poly_mem_en_o => poly_mem_en_s,
             POLY_ACCU_reset_o => POLY_ACCU_reset_s,
             POLY_ACCU_en_o => POLY_ACCU_en_s,
             counter_reset_o => counter_reset_s,
             counter_en_o => counter_en_s,
             control_o => control_s,
             busy_o => busy_s);
             
    POLY_MEM_INST : poly_mem
    generic map(NB_COEFF => NB_COEFF,
                WORD_WIDTH => WORD_WIDTH)
    port map(clock_i => clock_i,
             reset_i => poly_mem_reset_s,
             w_en_i => poly_mem_en_s,
             w_address_low_i => w_address_low_s,
             w_address_high_i => w_address_high_s,
             r_address_0_i => r_address_0_s,
             r_address_1_i => r_address_1_s,
             data_i => poly_mem_in_s,
             data_0_o => poly_mem_out_0_s,
             data_1_o => poly_mem_out_1_s);
             
    COUNTER_INST : counter
    generic map(WIDTH => ceil_log2(NB_COEFF+1))
    port map(clock_i => clock_i,
             reset_i => counter_reset_s,
             en_i => counter_en_s,
             data_o => counter_data_s);
             
    ALU_INST : ALU_multiple_stage
    generic map(NB_COEFF => NB_COEFF,
                WORD_WIDTH => WORD_WIDTH)
    port map(clock_i => clock_i,
             POLY_ACCU_reset_i => POLY_ACCU_reset_s,
             POLY_ACCU_en_i => POLY_ACCU_en_s,
             fonction_i => fonction_i,
             count_i => counter_data_s,
             control_i => control_s,
             OP_A_i => OP_A_s,
             OP_B_i => OP_B_s,
             data_o => ALU_data_output_s);    

    -- ALU and poly_mem input routing
    
    G0 : for I in 0 to NB_COEFF-1 generate
    
        poly_mem_in_s(I) <=
            POLY_B_i(I) & POLY_A_i(I) when control_s = LOAD else
            STD_LOGIC_VECTOR(To_Unsigned(0,WORD_WIDTH)) & ALU_data_output_s(I)(2*WORD_WIDTH-1 downto WORD_WIDTH) when control_s = ALU_ACCUMULATION and fonction_i = REDCOEFF else
            ALU_data_output_s(I);
            
        
        OP_A_s(I) <= 
            poly_mem_out_0_s(NB_COEFF-1-To_Integer(Unsigned(counter_data_s))) when To_Integer(Unsigned(counter_data_s)) < NB_COEFF-1-I and (control_s = ALU_POLY_MUL or control_s = ALU_POLY_MUL_MOD) else
            LAMBDA when To_Integer(Unsigned(counter_data_s)) = NB_COEFF-1-I and (control_s = ALU_POLY_MUL or control_s = ALU_POLY_MUL_MOD) else
            poly_mem_out_0_s(NB_COEFF-To_Integer(Unsigned(counter_data_s))) when To_Integer(Unsigned(counter_data_s)) > NB_COEFF-1-I and (control_s = ALU_POLY_MUL or control_s = ALU_POLY_MUL_MOD) else
            poly_mem_out_0_s(I);

        OP_B_s(I) <= 
            poly_mem_out_1_s(I+To_Integer(Unsigned(counter_data_s))+1) when To_Integer(Unsigned(counter_data_s)) < NB_COEFF-1-I and (control_s = ALU_POLY_MUL or control_s = ALU_POLY_MUL_MOD) else
            (others => '0') when To_Integer(Unsigned(counter_data_s)) = NB_COEFF-1-I and (control_s = ALU_POLY_MUL or control_s = ALU_POLY_MUL_MOD) else
            poly_mem_out_1_s(To_Integer(Unsigned(counter_data_s))-NB_COEFF+I) when To_Integer(Unsigned(counter_data_s)) > NB_COEFF-1-I and (control_s = ALU_POLY_MUL or control_s = ALU_POLY_MUL_MOD) else
            poly_mem_out_1_s(I);

        POLY_OUT_o(I) <=
            poly_mem_out_0_s(I) & poly_mem_out_1_s(I) when busy_s = '0' else
            (others => '0');            

    end generate;
    
    -- poly_mem operand selection for function execution
    
    w_address_low_s <=
        GP_INPUT_REG_0_ADDR when control_s = LOAD else
        GP_OUTPUT_REG_1_LOW_ADDR when control_s = ALU_POLY_MUL_MOD and fonction_i = REDCOEFF else
        ZERO_ADDR when control_s = ALU_POLY_MUL and fonction_i = REDCOEFF else
        GP_OUTPUT_REG_1_LOW_ADDR when control_s = ALU_ACCUMULATION and fonction_i = REDCOEFF else
        GP_OUTPUT_REG_0_LOW_ADDR;
        
    w_address_high_s <=
        GP_INPUT_REG_1_ADDR when control_s = LOAD else
        GP_OUTPUT_REG_1_HIGH_ADDR when control_s = ALU_POLY_MUL_MOD and fonction_i = REDCOEFF else
        ZERO_ADDR when control_s = ALU_POLY_MUL and fonction_i = REDCOEFF else
        GP_OUTPUT_REG_1_HIGH_ADDR when control_s = ALU_ACCUMULATION and fonction_i = REDCOEFF else
        GP_OUTPUT_REG_0_HIGH_ADDR;
        
    r_address_0_s <=
        GP_OUTPUT_REG_0_LOW_ADDR when control_s = ALU_POLY_MUL_MOD and fonction_i = REDCOEFF else
        GP_OUTPUT_REG_1_LOW_ADDR when control_s = ALU_POLY_MUL and fonction_i = REDCOEFF else
        GP_OUTPUT_REG_0_HIGH_ADDR when control_s = ALU_ACCUMULATION and fonction_i = REDCOEFF else
        GP_OUTPUT_REG_1_HIGH_ADDR when control_s = IDLE and fonction_i = REDCOEFF else
        GP_OUTPUT_REG_0_HIGH_ADDR when control_s = IDLE else
        GP_INPUT_REG_0_ADDR;

    r_address_1_s <=
        M_PRIME_ADDR when control_s = ALU_POLY_MUL_MOD and fonction_i = REDCOEFF else
        M_ADDR when control_s = ALU_POLY_MUL and fonction_i = REDCOEFF else
        GP_OUTPUT_REG_0_LOW_ADDR when control_s = ALU_ACCUMULATION and fonction_i = REDCOEFF else
        GP_OUTPUT_REG_1_LOW_ADDR when control_s = IDLE and fonction_i = REDCOEFF else
        GP_OUTPUT_REG_0_LOW_ADDR when control_s = IDLE else
        GP_INPUT_REG_1_ADDR;
        
    -- other assignments
    
    busy_o <= busy_s;

end AMNS_arith_multiple_stage_arch;
