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

entity Decoder_H is
port (
			count : in std_logic_vector(2 downto 0);
			s : out std_logic_vector(2 downto 0);
			bin: out std_logic
			);
end Decoder_H;

architecture Behavioral of Decoder_H is

begin
	bin <= '0';
	with count select
		s <= "010" when "000",
				"000"when "001",
				"000" when "010",
				"000" when "011",
				"000" when "100",
				"000" when "101",
				"000" when "110",
				"000" when "111",
				"010" when others;


end Behavioral;

