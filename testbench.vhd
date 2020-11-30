library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end testbench;

architecture tb of testbench is

signal A,B 	: signed(15 downto 0);
signal sel	: std_logic_vector(1 downto 0);
signal op 	: signed(15 downto 0);
signal c		: std_logic;
signal z 	: std_logic;

component ALU_16_bit is 
port (A,B 	: in signed(15 downto 0);						-- A,B are inputs
		sel	: in std_logic_vector(1 downto 0);			-- control pins for MUX
		op 	: buffer signed(15 downto 0);					-- 16 bit output
		c		: out std_logic;									-- carry
		z 		: out std_logic);									-- set to 1 if output=0
end component;

begin

dut_instance : ALU_16_bit
port map(A =>A,B=>B,sel=>sel,op=>op,c=>c,z=>z);
process
begin
A <="1010101011111111";
B <="1010101110011111";
sel<="10";
wait for 5ns;
end process;
end tb;
