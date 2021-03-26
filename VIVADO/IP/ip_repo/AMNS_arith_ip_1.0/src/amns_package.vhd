library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

package amns_package is

    -- user defined parameters --

    constant WORD_WIDTH : natural := 64;

    constant NB_COEFF : natural := 4;
    
    constant LAMBDA : STD_LOGIC_VECTOR(WORD_WIDTH-1 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(5,WORD_WIDTH));
    
    -----------------------------
    
    type POLYNOME is array(0 to NB_COEFF-1) of STD_LOGIC_VECTOR(WORD_WIDTH-1 downto 0); -- Un Polynome est représenté par un tableau de coefficients en représentation binaire --
    type BIG_POLYNOME is array(0 to NB_COEFF-1) of STD_LOGIC_VECTOR(2*WORD_WIDTH-1 downto 0); -- Le résultat d'un calcul polynomiale peut présenter des coefficients de tailles 2* WORD_WIDTH avant réduction interne
    
    -- Représentation des polynomes de rédution interne M et M_PRIME
    
    constant M_POLY : POLYNOME := (x"00007503DFF3CC33", x"00005AF1628EB89D", x"000056F2166CDD41", x"000056D601BA42C6");
    constant M_PRIME_POLY : POLYNOME := (x"C7E7E2C031E70C69", x"60647A1F957F7AB4", x"4B0F0E072442C7C7", x"2D9D9AC6957178C9");
    
    --
    
    function ceil_log2 (input : natural) return natural; -- Permet de calculer la taille d'un entier en nombre de bits --
    
    -- Un signal ALU_CONTROL_s de type énuméré contrôlé par la FSM permet de modifier le chemin de donnée dans l'unité arithmétique du système.
    
    type CONTROL is (ALU_POLY_MUL, ALU_POLY_MUL_MOD, ALU_ACCUMULATION, LOAD, IDLE);
    type FONCTION is (POLY_MUL, POLY_MUL_MOD, REDCOEFF, LOAD, IDLE);
    
    -- table des addresses mémoire des données --
    
    constant GP_INPUT_REG_0_ADDR : STD_LOGIC_VECTOR(3 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(0,4));
    constant GP_INPUT_REG_1_ADDR : STD_LOGIC_VECTOR(3 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(1,4));
    constant GP_OUTPUT_REG_0_LOW_ADDR : STD_LOGIC_VECTOR(3 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(2, 4));
    constant GP_OUTPUT_REG_0_HIGH_ADDR : STD_LOGIC_VECTOR(3 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(3,4));
    constant GP_OUTPUT_REG_1_LOW_ADDR : STD_LOGIC_VECTOR(3 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(4,4));
    constant GP_OUTPUT_REG_1_HIGH_ADDR : STD_LOGIC_VECTOR(3 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(5,4));
    constant M_ADDR : STD_LOGIC_VECTOR(3 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(13,4));
    constant M_PRIME_ADDR : STD_LOGIC_VECTOR(3 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(14,4));
    constant ZERO_ADDR : STD_LOGIC_VECTOR(3 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(15,4));
        
end package;

package body amns_package is
    
    function ceil_log2 (input : natural) return natural is
    begin
        return natural(ceil(log2(real(input))));
    end function;
    
end package body;