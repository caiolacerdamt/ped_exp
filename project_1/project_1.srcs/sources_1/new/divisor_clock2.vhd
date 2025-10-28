library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

ENTITY divisor_clock2 IS
    PORT (
        CLK_100MHZ : in  STD_LOGIC;  -- Clock de entrada (100 MHz)
        CLK_1HZ    : out STD_LOGIC   -- Clock de saída (1 Hz)
    );
END divisor_clock2;

ARCHITECTURE Behavioral OF divisor_clock2 IS

    CONSTANT MAX_COUNT : integer := 50000000;

    signal s_contador : integer range 0 to MAX_COUNT - 1 := 0;

    signal s_clk_out  : std_logic := '0';
    
BEGIN

    PROCESS (CLK_100MHZ)
    BEGIN
        IF rising_edge(CLK_100MHZ) THEN
            IF s_contador = MAX_COUNT - 1 THEN
                s_contador <= 0;              
                s_clk_out  <= NOT s_clk_out;  
            ELSE
                s_contador <= s_contador + 1; 
            END IF;
        END IF;
    END PROCESS;

    CLK_1HZ <= s_clk_out;

END Behavioral;