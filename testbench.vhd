library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end testbench;

architecture tb of testbench is

signal A,B 	: std_logic_vector(15 downto 0);
signal sel	: std_logic_vector(1 downto 0);
signal c		: std_logic;
signal op 	: std_logic_vector(15 downto 0);
signal z 	: std_logic;

component ALU_16_bit is 
port (A,B 			: in std_logic_vector(15 downto 0);						-- A,B are inputs
		sel			: in std_logic_vector(1 downto 0);						-- control pins for MUX
		Carry_final : out std_logic := '0';										-- Carry
		op 			: buffer std_logic_vector(15 downto 0);				-- 16 bit output
		z 				: out std_logic := '0');									-- set to 1 if output=0
end component;

begin

dut_instance : ALU_16_bit
port map(A =>A,B=>B,sel=>sel,Carry_final => c,op=>op,z=>z);
process
begin
----------------------||	Test cases for Addition		||--------------------------------------------------------------
sel<="00";
A <="1111111111111111";		--A = -1
B <="1111111111111101";		--B = -3
wait for 1ns;
sel<="00";
A <="0111111111111111";		--A = 65535
B <="1111111111111111";		--B = -1
wait for 1ns;
sel<="00";
A <="1111111111111111";		--A = -1
B <="1111111111111111";		--B = -1
wait for 1ns;
sel<="00";
A <="0111111111111111";		--A = 65535	
B <="0111111111111111";		--B = 65535
wait for 1ns;
----------------------||	Test cases for Subtraction	||----------------------------------------------------------------
sel<="01";
A <="1111111111111111";		--A = -1
B <="1111111111111101";		--B = -3
wait for 1ns;
sel<="01";
A <="0111111111111111";		--A = 65535
B <="1111111111111111";		--B = -1
wait for 1ns;
sel<="01";
A <="1111111111111111";		--A = -1
B <="1111111111111111";		--B = -1
wait for 1ns;
sel<="01";
A <="0111111111111111";		--A = 65535	
B <="0111111111111111";		--B = 65535
wait for 1ns;
----------------------||	Test cases for A nand B		||-----------------------------------------------------------------
sel<="10";
A <="1111111111111111";		--A = -1
B <="1111111111111101";		--B = -3
wait for 1ns;
sel<="10";
A <="0111111111111111";		--A = 65535
B <="1111111111111111";		--B = -1
wait for 1ns;
sel<="10";
A <="1111111111111111";		--A = -1
B <="1111111111111111";		--B = -1
wait for 1ns;
sel<="10";
A <="0111111111111111";		--A = 65535	
B <="0111111111111111";		--B = 65535
wait for 1ns;
----------------------||	Test cases for A xor B		||------------------------------------------------------------------
sel<="11";
A <="1111111111111111";		--A = -1
B <="1111111111111101";		--B = -3
wait for 1ns;
sel<="11";
A <="0111111111111111";		--A = 65535
B <="1111111111111111";		--B = -1
wait for 1ns;
sel<="11";
A <="1111111111111111";		--A = -1
B <="1111111111111111";		--B = -1
wait for 1ns;
sel<="11";
A <="0111111111111111";		--A = 65535	
B <="0111111111111111";		--B = 65535
wait for 1ns;
end process;
end tb;
