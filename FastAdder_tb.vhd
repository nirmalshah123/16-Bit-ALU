library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FastAdder_tb is
end FastAdder_tb;

architecture tb of FastAdder_tb is

	signal x, y : std_logic_vector(15 downto 0); -- inputs
	signal o: std_logic_vector(15 downto 0); -- outputs
	
	
	component FastAdder  is
	port(A, B: in std_logic_vector(15 downto 0);
	Z: out std_logic_vector(15 downto 0));
	end component;
	begin


dut_instance: FastAdder

	port map (A => x, B => y, Z => o);
	
	process-- inputs
	
	begin
	x <= "0000000000001111";
	y <= "0000000000001111";
	
	wait for 10 ns;
	
	
	
	end process;
	
	end tb ;