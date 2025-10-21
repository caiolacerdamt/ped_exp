----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.10.2025 22:05:15
-- Design Name: 
-- Module Name: ula_vhdl - Behavioral
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

-- Entidade da ULA, baseada na Figura 1 e descrição do projeto
entity ula_vhdl3 is
    Port ( 
        -- 4bits
        A : in  STD_LOGIC_VECTOR (3 downto 0);
        B : in  STD_LOGIC_VECTOR (3 downto 0);
        
        -- 2bits
        S : in  STD_LOGIC_VECTOR (1 downto 0);
        
        -- out 4bits
        F : out STD_LOGIC_VECTOR (3 downto 0);
        
        -- status
        over  : out STD_LOGIC;
        c_out : out STD_LOGIC 
    );
end ula_vhdl3;

architecture concurrent_rtl of ula_vhdl3 is

    signal B_mod      : STD_LOGIC_VECTOR(3 downto 0); 
    signal C          : STD_LOGIC_VECTOR(4 downto 0); 
    signal arith_F    : STD_LOGIC_VECTOR(3 downto 0); 
    signal arith_over : STD_LOGIC; 
    
    signal and_F : STD_LOGIC_VECTOR(3 downto 0); 
    signal or_F  : STD_LOGIC_VECTOR(3 downto 0); 

begin
    
    and_F <= A and B; 

    or_F <= A or B; 

    B_mod(0) <= B(0) xor S(0);
    B_mod(1) <= B(1) xor S(0);
    B_mod(2) <= B(2) xor S(0);
    B_mod(3) <= B(3) xor S(0);

    C(0) <= S(0); 

    arith_F(0) <= A(0) xor B_mod(0) xor C(0);
    C(1)       <= (A(0) and B_mod(0)) or (A(0) and C(0)) or (B_mod(0) and C(0));

    arith_F(1) <= A(1) xor B_mod(1) xor C(1);
    C(2)       <= (A(1) and B_mod(1)) or (A(1) and C(1)) or (B_mod(1) and C(1));

    arith_F(2) <= A(2) xor B_mod(2) xor C(2);
    C(3)       <= (A(2) and B_mod(2)) or (A(2) and C(2)) or (B_mod(2) and C(2));

    arith_F(3) <= A(3) xor B_mod(3) xor C(3);
    C(4)       <= (A(3) and B_mod(3)) or (A(3) and C(3)) or (B_mod(3) and C(3));


    c_out <= C(4); 
    
    arith_over <= C(3) xor C(4); 


    with S select
        F <= arith_F when "00",  -- SOMA 
             arith_F when "01",  -- SUBTRAÇÃO 
             and_F   when "10",  -- AND 
             or_F    when "11",  -- OR 
             (others => 'X') when others; 
    over <= arith_over when S(1) = '0' else '0';

end concurrent_rtl;