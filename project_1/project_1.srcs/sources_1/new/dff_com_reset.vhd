library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY dff_com_reset IS
    PORT (
        D_in   : in  STD_LOGIC;                      -- Entrada de dados (D)
        CLK_in : in  STD_LOGIC;                      -- Entrada de Clock (C)
        CLR_in : in  STD_LOGIC;                      -- Entrada de Reset (R, ativo baixo)
        Q_out  : out STD_LOGIC                       -- Saída de dados (Q)
    );
END dff_com_reset;

ARCHITECTURE Behavioral OF dff_com_reset IS
BEGIN
    
    PROCESS (CLK_in, CLR_in)
    BEGIN
      
        IF CLR_in = '0' THEN
            Q_out <= '0';
  
        ELSIF rising_edge(CLK_in) THEN
            Q_out <= D_in;
        END IF;
    END PROCESS;

END Behavioral;