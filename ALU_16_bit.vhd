library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_16_bit is
port (A,B 	: in std_logic_vector(15 downto 0);						-- A,B are inputs
		sel	: in std_logic_vector(1 downto 0);						-- control pins for MUX
		Carry_final : out std_logic := '0';								-- Carry
		op 	: buffer std_logic_vector(15 downto 0);				-- 16 bit output
		z 		: out std_logic := '0');									-- set to 1 if output=0
end ALU_16_bit;

architecture ALU of ALU_16_bit is
signal nand_op,xor_op,add_op,sub_op				: std_logic_vector(15 downto 0);
signal carry_add_op,carry_sub_op 								: std_logic;

signal B_2_compliment,B_1_compliment 	: std_logic_vector(15 downto 0);

	component FastAdder is
	port(
	A		:in std_logic_vector(15 downto 0);				--Input A
	B		:in std_logic_vector(15 downto 0);				--Input B
	Carry	:out std_logic;										--Final carry
	op		:out std_logic_vector(15 downto 0));			--Output		
	end component;
	

	component NAND16 is
		port(	a 	: in 	std_logic_vector(15 downto 0);
				b	: in 	std_logic_vector(15 downto 0);
				o	: out std_logic_vector(15 downto 0));
	end component;

	component XOR16 is
		port(	a 	: in 	std_logic_vector(15 downto 0);
				b	: in 	std_logic_vector(15 downto 0);
				o	: out std_logic_vector(15 downto 0));
	end component;

begin

B_1_compliment <= NOT(B);
B_2_compliment <= std_logic_vector(signed(B_1_compliment) + 1);
nand_instance : NAND16 port map(a => A, b =>B, o =>nand_op);
xor_instance  : XOR16  port map(a => A, b =>B, o =>xor_op);
FastAdder_instance : FastAdder port map(A =>A,B=>B,Carry =>carry_add_op, op=>add_op);
Subtract_instance	 : FastAdder port map(A =>A,B=>B_2_compliment,Carry =>carry_sub_op, op=>sub_op);

	process(A,B,sel,op,add_op,sub_op,carry_add_op,carry_sub_op,nand_op,xor_op)
		begin

			if sel="00" then
				op<= add_op;
				Carry_final<=carry_add_op;
			elsif sel="01" then
				op<=sub_op;
				Carry_final<=carry_sub_op;
			elsif sel="10" then
				op <= nand_op;
			else
			op <= xor_op;

			end if;
		
		if (op = "0000000000000000") then			  		-- setting z flag to 1 if output is 0
		z <= '1';
		else
		z <='0';
		end if;
		end process;

end ALU;
