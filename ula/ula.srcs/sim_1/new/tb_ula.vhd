library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_ula_vhdl3 is
end tb_ula_vhdl3;

architecture behavioral of tb_ula_vhdl3 is

    component ula_vhdl3
        Port ( 
            A : in  STD_LOGIC_VECTOR (3 downto 0);
            B : in  STD_LOGIC_VECTOR (3 downto 0);
            S : in  STD_LOGIC_VECTOR (1 downto 0);
            F : out STD_LOGIC_VECTOR (3 downto 0);
            over  : out STD_LOGIC;
            c_out : out STD_LOGIC 
        );
    end component;

    signal s_A : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal s_B : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal s_S : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
    
    signal s_F : STD_LOGIC_VECTOR (3 downto 0);
    signal s_over  : STD_LOGIC;
    signal s_c_out : STD_LOGIC;

begin

    UUT : ula_vhdl3
        Port map (
            A => s_A,
            B => s_B,
            S => s_S,
            F => s_F,
            over => s_over,
            c_out => s_c_out
        );

    stim_proc: process
    begin
        report "Iniciando simulação do Testbench da ULA...";

        s_S <= "00";
        s_A <= "0001";
        s_B <= "0111";
        wait for 100 ns; 
        
        assert (s_F = "1000" and s_over = '1' and s_c_out = '0')
            report "FALHA: Teste SOMA (1+7)" severity error;


        s_S <= "01";
        s_A <= "0001";
        s_B <= "0001";
        wait for 100 ns;
        
        assert (s_F = "0000" and s_over = '0' and s_c_out = '1')
            report "FALHA: Teste SUBTRACAO (1-1)" severity error;

        s_S <= "10";
        s_A <= "0101";
        s_B <= "0110";
        wait for 100 ns;
        
        assert (s_F = "0100")
            report "FALHA: Teste AND (5 & 6)" severity error;


        s_S <= "11";
        s_A <= "0101";
        s_B <= "0110";
        wait for 100 ns;

        assert (s_F = "0111")
            report "FALHA: Teste OR (5 | 6)" severity error;

        report "Simulação concluída com sucesso (se nenhuma falha foi reportada).";
        wait; 
        
    end process;

end behavioral;