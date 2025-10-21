----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.10.2025 20:01:59
-- Design Name: 
-- Module Name: tb_priority_encoder - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_priority_encoder is

end tb_priority_encoder;

architecture Behavioral of tb_priority_encoder is
    
    component priority_encoder is
        Port ( 
            p0  : in  STD_LOGIC;
            p1  : in  STD_LOGIC;
            p2  : in  STD_LOGIC;
            p3  : in  STD_LOGIC;
            x1  : out STD_LOGIC;
            x0  : out STD_LOGIC;
            int : out STD_LOGIC
        );
    end component;

    signal s_p0, s_p1, s_p2, s_p3 : STD_LOGIC := '0';
    signal s_x1, s_x0, s_int      : STD_LOGIC;
    
begin

    uut: priority_encoder
        port map (
            p0  => s_p0,
            p1  => s_p1,
            p2  => s_p2,
            p3  => s_p3,
            x1  => s_x1,
            x0  => s_x0,
            int => s_int
        );
        

stimulus_process: process
    variable temp_vector : STD_LOGIC_VECTOR(3 downto 0);
begin
    for i in 0 to 15 loop
        temp_vector := std_logic_vector(to_unsigned(i, 4));
        
        s_p3 <= temp_vector(3);
        s_p2 <= temp_vector(2);
        s_p1 <= temp_vector(1);
        s_p0 <= temp_vector(0);
        
        wait for 10 ns;
    end loop;
    
    wait;
end process;

end Behavioral;
