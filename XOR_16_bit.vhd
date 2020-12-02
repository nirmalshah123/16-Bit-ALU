library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity XOR16 is
port (a 	: in 	std_logic_vector(15 downto 0);			--a,b input
		b	: in 	std_logic_vector(15 downto 0);			-- o ouput
		o	: out std_logic_vector(15 downto 0));
end XOR16;

architecture arc of XOR16 is
begin																	-- Bitwise XOR

o(15)   <=  a(15)   XOR    b(15);
o(14)   <=  a(14)   XOR    b(14);
o(13)   <=  a(13)   XOR    b(13);
o(12)   <=  a(12)   XOR    b(12);
o(11)   <=  a(11)   XOR    b(11);
o(10)   <=  a(10)   XOR    b(10);
o(9)    <=  a(9)    XOR    b(9);
o(8)    <=  a(8)    XOR    b(8);
o(7)    <=  a(7)    XOR    b(7);
o(6)    <=  a(6)    XOR    b(6);
o(5)    <=  a(5)    XOR    b(5);
o(4)    <=  a(4)    XOR    b(4);
o(3)    <=  a(3)    XOR    b(3);
o(2)    <=  a(2)    XOR    b(2);
o(1)    <=  a(1)    XOR    b(1);
o(0)    <=  a(0)    XOR    b(0);

end arc;
