library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_16_bit is
port (A,B 	: in std_logic_vector(15 downto 0);						-- A,B are inputs
		sel	: in std_logic_vector(1 downto 0);			-- control pins for MUX
		op 	: buffer std_logic_vector(15 downto 0);					-- 16 bit output
		z 		: out std_logic);									-- set to 1 if output=0
end ALU_16_bit;

architecture ALU of ALU_16_bit is
signal nand_op,xor_op : std_logic_vector(15 downto 0);

	component NAND16
		port(	a 	: in 	std_logic_vector(15 downto 0);
				b	: in 	std_logic_vector(15 downto 0);
				o	: out std_logic_vector(15 downto 0));
	end component;

	component XOR16
		port(	a 	: in 	std_logic_vector(15 downto 0);
				b	: in 	std_logic_vector(15 downto 0);
				o	: out std_logic_vector(15 downto 0));
	end component;

begin
nand_instance : NAND16 port map(a => A, b =>B, o =>nand_op);
xor_instance  : XOR16  port map(a => A, b =>B, o =>xor_op);
	process(A,B,sel,op)
		begin

			case sel is 
			when "00" 	=> null;
			when "01" 	=> null;
			when "10" 	=> op <= nand_op;
			when "11" 	=> op <= xor_op;
			when others => null;
			end case;
		
		if (op = "0000000000000000") then			  		-- setting z flag to 1 if output is 0
		z <= '1';
		else
		z <='0';
		end if;
		end process;

end ALU;
