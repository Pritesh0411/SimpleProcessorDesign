----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:16:38 06/06/2020 
-- Design Name: 
-- Module Name:    ALUsub - Behavioral 
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

entity ALUsub is
	Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR(2 downto 0);
			  bin : in STD_LOGIC;
			  cin : in STD_LOGIC;
           o : out  STD_LOGIC;
			  co : out STD_LOGIC;
			  en : in std_logic);
end ALUsub;

architecture Behavioral of ALUsub is

signal bi : std_logic;
begin
	
	
	process(a,bi,s,cin,en,bin,b)
		begin
			if bin = '0' then 
				bi <= b;
			else 
				bi <= not b;
			end if;
			if en='0' then 
				o <= '0';
				co <= '0';
			else
				case s is
					when "000" => o <= a and bi;
					when "001" => o <= a nand bi;
					when "010" => o <= a or bi;
					when "011" => o <= a xor bi;
					when "100" => o <= a xor bi xor cin; 
					when "101" => o <= not a;
					when "110" => o <= not bi;
					when "111" => o <= '1';
					when others => o <= '0';
				end case;
				if s="100" then
					co <= (a and bi) or (a and cin) or (bi and cin);
				else 
					co <= '0';
				end if;
			end if;
		end process;

end Behavioral;

