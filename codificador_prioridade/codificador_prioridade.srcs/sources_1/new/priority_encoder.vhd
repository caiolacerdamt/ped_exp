----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.10.2025 19:59:48
-- Design Name: 
-- Module Name: priority_encoder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity priority_encoder is
    Port ( 
        p0  : in  STD_LOGIC;
        p1  : in  STD_LOGIC;
        p2  : in  STD_LOGIC;
        p3  : in  STD_LOGIC;
        x1  : out STD_LOGIC;
        x0  : out STD_LOGIC;
        int : out STD_LOGIC
    );
end priority_encoder;

-- Arquitetura 
architecture Behavioral of priority_encoder is

    signal x_combined : STD_LOGIC_VECTOR(1 downto 0); 
begin

    x_combined <= "00" when p0 = '1' else
                  "01" when p1 = '1' else
                  "10" when p2 = '1' else
                  "11" when p3 = '1' else
                  "11"; 

    x1 <= x_combined(1);
    x0 <= x_combined(0);
    
    int <= p0 or p1 or p2 or p3;

end Behavioral;
