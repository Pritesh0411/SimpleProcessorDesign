----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:25 06/06/2020 
-- Design Name: 
-- Module Name:    Overall - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Overall_A is
port (
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		clk : in std_logic;
		rst : in std_logic;
		en : in std_logic;
		o : out std_logic_vector(8 downto 0)
		);	
end Overall_A;

architecture Behavioral of Overall_A is
	signal areg : std_logic_vector(7 downto 0);
	signal breg : std_logic_vector(7 downto 0);
	signal count : std_logic_vector(2 downto 0);
	signal s : std_logic_vector (2 downto 0);
	signal bin : std_logic;
	component Decoder_A is
	port (
			count : in std_logic_vector(2 downto 0);
			s : out std_logic_vector(2 downto 0);
			bin: out std_logic
			);
	end component;
	component  ALU is
	port ( a : in std_logic_vector(7 downto 0);
				b : in std_logic_vector(7 downto 0);
				o : out std_logic_vector(8 downto 0);
				en : in std_logic;
				s : in std_logic_vector(2 downto 0);
				bin : in std_logic
			);    
	end component;
	component Rgstr is
	port( clk : in std_logic;
			D : in std_logic_vector(7 downto 0);
			Q : out std_logic_vector(7 downto 0)
			);
	end component;

		

begin
		
	process(clk,rst)
		begin
			if rst='1' then 
				count <= "000";
			elsif rising_edge(clk) then 
				if count="111" then 
					count <= "000";
				else
					count <= count +'1';
				end if;
			end if;
		end process;
		R1 : Rgstr
				port map (clk,a,areg);
		R2 : Rgstr
				port map (clk,b,breg);
		D1 : Decoder_A
				port map (count,s,bin);
		ALU1 : ALU
				port map (areg,breg,o,en,s,bin);
		
end Behavioral;

