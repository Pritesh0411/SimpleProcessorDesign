----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:17:55 06/06/2020 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder_A is
port (
			count : in std_logic_vector(2 downto 0);
			s : out std_logic_vector(2 downto 0);
			bin: out std_logic
			);
end Decoder_A;

architecture Behavioral of Decoder_A is

begin
	s <= "100";
	with count select
		bin <= '1' when "000",
				'1' when "001",
				'1' when "010",
				'1' when "011",
				'0' when "100",
				'0' when "101",
				'0' when "110",
				'0' when "111",
				'0' when others;

end Behavioral;

