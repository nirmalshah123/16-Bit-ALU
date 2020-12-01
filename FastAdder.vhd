library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FastAdder is

port(
	A		:in std_logic_vector(15 downto 0);				--Input A
	B		:in std_logic_vector(15 downto 0);				--Input B
	Carry	:out std_logic_vector(15 downto 0);				--Final carry
	op		:out std_logic_vector(15 downto 0)				--Output		
	
);

end FastAdder;

architecture Behavioural of FastAdder is


	
	signal 	G,P			:	std_logic_vector(15 downto 0);		--G is carry generation P is propagation
	signal	CGA,CGB		:	std_logic_vector(15 downto 0);		--Level A defined It's G and P are defined
	signal	CGC,CGD		:	std_logic_vector(15 downto 0);		--Level B defined It's G and P are defined
	signal	CPA,CPB		:	std_logic_vector(15 downto 0);		--Level C defined It's G and P are defined
	signal	CPC,CPD		:	std_logic_vector(15 downto 0);		--Level D defined It's G and P are defined
	signal	Cout			:	std_logic_vector(15 downto 0);		--Final Carry generated
	signal   xor_op		:	std_logic_vector(15 downto 0);
	
	component XOR16 is
	port (a 	: in 	std_logic_vector(15 downto 0);
		b	: in 	std_logic_vector(15 downto 0);
		o	: out std_logic_vector(15 downto 0));
	end component;
	
	
	begin
	xor_instance : XOR16 port map(a =>P, b=>Cout, o=>xor_op);
		
		process(G,P,CGA,CGB,CGC,CGD,CPA,CPB,CPC,CPD,A,B,Cout,xor_op)
		
		begin
		
		
			precompute:for i in 0 to 15 loop							-- P is A XOR B
				P(i)<=A(i) xor B(i);										-- G is A and B
				G(i)<=A(i) and B(i);
				
			end loop precompute ;
			
			CGA(0)<=G(0);
			CPA(0)<=P(0);
				
			levelA:for i in 1 to 15 loop								-- start of level A
				CPA(i)<=P(i) and P(i-1);
				CGA(i)<=G(i) or (P(i) and G(i-1));
				
			end loop levelA ;
			
			
			CPB<=CPA;
			CGB<=CGA;
			levelB:for i in 2 to 15 loop								-- start of level B
				CPB(i)<=CPA(i) and CPA(i-2);
				CGB(i)<=CGA(i) or (CPA(i) and CGA(i-2));
				
			end loop levelB ;
			
			CPC<=CPB;
			CGC<=CGB;
			levelC:for i in 4 to 15 loop								-- start of level C
				CPC(i)<=CPB(i) and CPB(i-4);
				CGC(i)<=CGB(i) or (CPB(i) and CGB(i-4));
				
			end loop levelC ;
			
			
			CPD<=CPC;
			CGD<=CGC;
			levelD:for i in 8 to 15 loop								-- start of level D
				CPD(i)<=CPC(i) and CPC(i-8);
				CGD(i)<=CGC(i) or (CPC(i) and CGC(i-8));
				
			end loop levelD ;
			
			
			Cout(0)<='0';
			
			levelE:for i in 0 to 14 loop								-- Calculation of Cout = Gi + Pi.Ci
				Cout(i+1)<=(Cout(0) and CPD(i)) or CGD(i);
			end loop levelE ;
			
			op<=xor_op;												--final ans is P XOR Cout
			Carry<=Cout;
			
			
		end process;
	
end Behavioural;
 
