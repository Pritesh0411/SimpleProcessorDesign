----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:13:10 06/08/2020 
-- Design Name: 
-- Module Name:    Register - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rgstr is
	port( clk : in std_logic;
			D : in std_logic_vector(7 downto 0);
			Q : out std_logic_vector(7 downto 0)
			);
end Rgstr;

architecture Behavioral of Rgstr is

begin
	process(clk)
		begin
			if rising_edge(clk) then 
				Q <= D;
			end if;
		end process;
end Behavioral;

