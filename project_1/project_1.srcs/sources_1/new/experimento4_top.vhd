library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY experimento4_top IS
    PORT (
        CLK100MHZ : in  STD_LOGIC;                         -- Clock da placa
        SW        : in  STD_LOGIC_VECTOR(3 downto 0);    -- 4 chaves (D3, D2, D1, D0)
        BTN_CLR   : in  STD_LOGIC;                         -- Botão de Reset (CLR)
        LED       : out STD_LOGIC_VECTOR(3 downto 0)     -- 4 LEDs (Q3, Q2, Q1, Q0)
    );
END experimento4_top;

ARCHITECTURE Structural OF experimento4_top IS

    COMPONENT dff_com_reset IS
        PORT (
            D_in   : in  STD_LOGIC;
            CLK_in : in  STD_LOGIC;
            CLR_in : in  STD_LOGIC;
            Q_out  : out STD_LOGIC
        );
    END COMPONENT;

    COMPONENT divisor_clock2 IS
        PORT (
            CLK_100MHZ : in  STD_LOGIC;
            CLK_1HZ    : out STD_LOGIC
        );
    END COMPONENT;

    signal s_clk_1hz : std_logic;

BEGIN

    Inst_Divisor: divisor_clock2
        PORT MAP (
            CLK_100MHZ => CLK100MHZ,
            CLK_1HZ    => s_clk_1hz    
        );

    DFF0: dff_com_reset
        PORT MAP (
            D_in   => SW(0),        -- Chave 0 na entrada D
            CLK_in => s_clk_1hz,    -- Clock lento na entrada CLK
            CLR_in => BTN_CLR,      -- Botão de reset na entrada CLR
            Q_out  => LED(0)        -- LED 0 na saída Q
        );

    DFF1: dff_com_reset
        PORT MAP (
            D_in   => SW(1),
            CLK_in => s_clk_1hz,
            CLR_in => BTN_CLR,
            Q_out  => LED(1)
        );

    DFF2: dff_com_reset
        PORT MAP (
            D_in   => SW(2),
            CLK_in => s_clk_1hz,
            CLR_in => BTN_CLR,
            Q_out  => LED(2)
        );

    DFF3: dff_com_reset
        PORT MAP (
            D_in   => SW(3),
            CLK_in => s_clk_1hz,
            CLR_in => BTN_CLR,
            Q_out  => LED(3)
        );

END Structural;