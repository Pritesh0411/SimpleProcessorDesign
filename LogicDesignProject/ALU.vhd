----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:06:32 05/24/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
	port ( a : in std_logic_vector(7 downto 0);
				b : in std_logic_vector(7 downto 0);
				o : out std_logic_vector(8 downto 0);
				en : in std_logic;
				s : in std_logic_vector(2 downto 0);
				bin : in std_logic);    
end ALU;

architecture Behavioral of ALU is

signal cin : std_logic;
signal c0,c1,c2,c3,c4,c5,c6,c7 : std_logic;
component  ALUsub is
	Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR(2 downto 0);
			  bin : in STD_LOGIC;
			  cin : in STD_LOGIC;
           o : out  STD_LOGIC;
			  co : out STD_LOGIC;
			  en : in std_logic);
end component;


begin
	cin <= bin;
	AL1 : ALUsub 
		port map (a(0),b(0),s,bin,cin,o(0),c0,en);
	AL2 : ALUsub
		port map (a(1),b(1),s,bin,c0,o(1),c1,en) ;
	AL3 : ALUsub 
		port map (a(2),b(2),s,bin,c1,o(2),c2,en) ;
	AL4 : ALUsub
		port map (a(3),b(3),s,bin,c2,o(3),c3,en) ;
	AL5 :ALUsub
		port map (a(4),b(4),s,bin,c3,o(4),c4,en) ;
	AL6 : ALUsub
		port map (a(5),b(5),s,bin,c4,o(5),c5,en) ;
	AL7 : ALUsub
		port map (a(6),b(6),s,bin,c5,o(6),c6,en) ;
	AL8 : ALUsub
		port map (a(7),b(7),s,bin,c6,o(7),c7,en) ;
		
	o(8) <= c7 when s="100" else
			'1' when s="111" else
			'0';
	

end Behavioral;

