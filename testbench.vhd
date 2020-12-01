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
port (A,B 	: in std_logic_vector(15 downto 0);						-- A,B are inputs
		sel	: in std_logic_vector(1 downto 0);						-- control pins for MUX
		Carry_final : out std_logic := '0';								-- Carry
		op 	: buffer std_logic_vector(15 downto 0);				-- 16 bit output
		z 		: out std_logic := '0');									-- set to 1 if output=0
end component;

begin

dut_instance : ALU_16_bit
port map(A =>A,B=>B,sel=>sel,Carry_final => c,op=>op,z=>z);
process
begin
A <="1111111111111111";
B <="1111111111111111";
sel<="01";
wait for 5ns;

end process;
end tb;
