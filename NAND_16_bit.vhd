library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity NAND16 is
port (a 	: in 	std_logic_vector(15 downto 0);		-- a,b inputs
		b	: in 	std_logic_vector(15 downto 0);
		o	: out std_logic_vector(15 downto 0));		-- o Output
end NAND16;

architecture arc of NAND16 is			
begin													-- Bitwise Nand 
o(15)   <=  a(15)   NAND    b(15);
o(14)   <=  a(14)   NAND    b(14);
o(13)   <=  a(13)   NAND    b(13);
o(12)   <=  a(12)   NAND    b(12);
o(11)   <=  a(11)   NAND    b(11);
o(10)   <=  a(10)   NAND    b(10);
o(9)    <=  a(9)    NAND    b(9);
o(8)    <=  a(8)    NAND    b(8);
o(7)    <=  a(7)    NAND    b(7);
o(6)    <=  a(6)    NAND    b(6);
o(5)    <=  a(5)    NAND    b(5);
o(4)    <=  a(4)    NAND    b(4);
o(3)    <=  a(3)    NAND    b(3);
o(2)    <=  a(2)    NAND    b(2);
o(1)    <=  a(1)    NAND    b(1);
o(0)    <=  a(0)    NAND    b(0);
end arc;
