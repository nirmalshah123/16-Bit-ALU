library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_16_bit is

port(
	A:in std_logic_vector(15 downto 0);
	B:in std_logic_vector(15 downto 0);
	sel:in std_logic_vector(1 downto 0);
	
	Z:out std_logic_vector(15 downto 0)
);

end ALU_16_bit;

architecture Behavioural of ALU_16_bit is

begin
	
	process(A,B,sel)
	begin
	
		case sel is
			
			when "00" =>
				Z<=A nand B;
			
			when "01" =>
				Z<=A nand B;
				
			when "10" =>
				Z<=A nand B;
				
			when "11" =>
				Z<=A xor B;
				
		end case;
		
	end process;
	
end Behavioural;

