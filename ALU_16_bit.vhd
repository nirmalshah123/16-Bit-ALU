library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_16_bit is
port (A,B 	: in signed(15 downto 0);						-- A,B are inputs
		sel	: in std_logic_vector(1 downto 0);			-- control pins for MUX
		op 	: buffer signed(15 downto 0);					-- 16 bit output
		c		: out std_logic;									-- carry
		z 		: out std_logic);									-- set to 1 if output=0
end ALU_16_bit;

architecture ALU of ALU_16_bit is
begin

	process(A,B,sel)
		begin
			case sel is 
			when "00" 	=> null;
			when "01" 	=> null;
			when "10" 	=> op <= A NAND B;
			when "11" 	=> op <= A XOR  B;
			when others => null;
			end case;
		
		if (op = 0) then											-- setting z flag to 1 if output is 0
		z <= '1';
		else
		z <='0';
		end if;
		end process;

end ALU;
