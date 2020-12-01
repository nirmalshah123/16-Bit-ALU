library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FastAdder_tb is
end FastAdder_tb;

architecture tb of FastAdder_tb is

	signal x, y : std_logic_vector(15 downto 0);			 -- inputs
	signal o: std_logic_vector(15 downto 0);				 -- output
	signal oC: std_logic_vector(15 downto 0);										 -- Output carry
	
	
	component FastAdder  is
	port(
	A		:in std_logic_vector(15 downto 0);				--Input A
	B		:in std_logic_vector(15 downto 0);				--Input B
	Carry	:out std_logic_vector(15 downto 0);										--Final carry
	op		:out std_logic_vector(15 downto 0));			--Output		
	end component;
	begin


dut_instance: FastAdder

	port map (A => x, B => y, Carry => oC, op=> o);		--mapping
	
	process-- inputs
	
	begin
	x <= "0111111111111111";
	y <= "0111111111111111";
	
	wait for 10 ns;
	
	
	
	end process;
	
	end tb ;
