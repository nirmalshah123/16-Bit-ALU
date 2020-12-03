--======================================================================================================================
--------------------- Owners :-|| **Nirmal Shah**	||------------------------------------------------------------------------
-------------------------------|| **Puranjay Datta*||------------------------------------------------------------------------
--======================================================================================================================
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_16_bit is
port (A,B 				: in std_logic_vector(15 downto 0);						-- A,B are inputs
		sel				: in std_logic_vector(1 downto 0);						-- control pins for MUX
		Carry_final 	: out std_logic := '0';										-- Carry
		op 				: buffer std_logic_vector(15 downto 0);				-- 16 bit output
		z 					: out std_logic := '0');									-- set to 1 if output=0
end ALU_16_bit;

architecture ALU of ALU_16_bit is
signal nand_op,xor_op,add_op,sub_op		: std_logic_vector(15 downto 0);
signal carry_add_op,carry_sub_op 		: std_logic;

signal B_2_compliment,B_1_compliment 	: std_logic_vector(15 downto 0);

	component FastAdder is
	port(
	A		:in std_logic_vector(15 downto 0);										--Input A
	B		:in std_logic_vector(15 downto 0);										--Input B
	Carry	:out std_logic;																--Final carry
	op		:out std_logic_vector(15 downto 0));									--Output		
	end component;
	

	component NAND16 is																	-- Defining component of NAND Gate
		port(	a 	: in 	std_logic_vector(15 downto 0);
				b	: in 	std_logic_vector(15 downto 0);
				o	: out std_logic_vector(15 downto 0));
	end component;

	component XOR16 is																	-- Defining Component of XOR Gate
		port(	a 	: in 	std_logic_vector(15 downto 0);
				b	: in 	std_logic_vector(15 downto 0);
				o	: out std_logic_vector(15 downto 0));
	end component;

begin

B_1_compliment <= NOT(B);
B_2_compliment <= std_logic_vector(signed(B_1_compliment) + 1);			-- Taking 2s compliment of B for subtraction
nand_instance : NAND16 port map(a => A, b =>B, o =>nand_op);				-- Instance is created for Nand Gate
xor_instance  : XOR16  port map(a => A, b =>B, o =>xor_op);					-- Instance is created for XOR Gate
FastAdder_instance : FastAdder port map(A =>A,B=>B,Carry =>carry_add_op, op=>add_op);
Subtract_instance	 : FastAdder port map(A =>A,B=>B_2_compliment,Carry =>carry_sub_op, op=>sub_op);

	process(A,B,sel,op,add_op,sub_op,carry_add_op,carry_sub_op,nand_op,xor_op)
		begin
																								-- -------------------------------
			if sel="00" then																-- |Selection line|| Operation	|
				op<= add_op;																--	|		00			||		A + B		|
				Carry_final<=carry_add_op;												--	|		01			||		A - B		|
			elsif sel="01" then															--	|		10			||		(A.B)'	|
				op<=sub_op;																	--	|		11			||		(A^B)		|
				Carry_final<=carry_sub_op;												-- -------------------------------
			elsif sel="10" then
				op <= nand_op;
				Carry_final<='0';
			else
			op <= xor_op;
			Carry_final<='0';

			end if;
		
		if (op = "0000000000000000") then			  		-- setting z flag to 1 if output is 0
		z <= '1';
		else
		z <='0';
		end if;
		end process;

end ALU;
