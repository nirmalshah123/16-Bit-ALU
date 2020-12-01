library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
entity FastAdder_tb is
end FastAdder_tb;

architecture tb of FastAdder_tb is

	signal x, y : std_logic_vector(15 downto 0); -- inputs
	signal o: std_logic_vector(15 downto 0);
	signal oCout: std_logic_vector(15 downto 0);	-- outputs
	
	
	component FastAdder  is
	port(A, B: in std_logic_vector(15 downto 0);
	Z,ZCout: out std_logic_vector(15 downto 0));
	end component;
	begin


dut_instance: FastAdder

	port map (A => x, B => y, Z => o, ZCout=> oCout);
	
	process-- inputs
	
	begin

	for m in 0 to 255 loop 
		
		
		x <= std_logic_vector(to_SIGNED(m,16)); 
		
			for n in 0 to 255 loop 
			
				y <= std_logic_vector(to_SIGNED(n,16)); 
				
				wait for 1 ns; 
				
				assert (to_integer(SIGNED(o)) = (m + n)) 
				report "Incorrect sum" severity failure;
				
				
			end loop; 
		end loop; 
	
	end process;
	end tb ;