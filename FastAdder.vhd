library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FastAdder is

port(
	A:in std_logic_vector(15 downto 0);
	B:in std_logic_vector(15 downto 0);
	
	
	Z:out std_logic_vector(15 downto 0)
	
);

end FastAdder;

architecture Behavioural of FastAdder is


	
	signal G,P,CGA,CGB,CGC,CGD,CPA,CPB,CPC,CPD,Cout:std_logic_vector(15 downto 0);
	
	begin

		
		process(G,P,CGA,CGB,CGC,CGD,CPA,CPB,CPC,CPD,A,B,Cout)
		
		begin
		
		
			precompute:for i in 0 to 15 loop
				P(i)<=A(i) xor B(i);
				G(i)<=A(i) and B(i);
				
			end loop precompute ;
			
			CGA(0)<=G(0);
			CPA(0)<=P(0);
			
			levelA:for i in 1 to 15 loop
				CPA(i)<=P(i) and P(i-1);
				CGA(i)<=G(i) or (P(i) and G(i-1));
				
			end loop levelA ;
			
			
			CPB<=CPA;
			CGB<=CGA;
			levelB:for i in 2 to 15 loop
				CPB(i)<=CPA(i) and CPA(i-2);
				CGB(i)<=CGA(i) or (CPA(i) and CGA(i-2));
				
			end loop levelB ;
			
			CPC<=CPB;
			CGC<=CGB;
			levelC:for i in 4 to 15 loop
				CPC(i)<=CPB(i) and CPB(i-4);
				CGC(i)<=CGB(i) or (CPB(i) and CGB(i-4));
				
			end loop levelC ;
			
			
			CPD<=CPC;
			CGD<=CGC;
			levelD:for i in 8 to 15 loop
				CPD(i)<=CPC(i) and CPC(i-8);
				CGD(i)<=CGC(i) or (CPC(i) and CGC(i-8));
				
			end loop levelD ;
			
			
			Cout(0)<='0';
			
			levelE:for i in 0 to 14 loop
				Cout(i+1)<=(Cout(0) and CPD(i)) or CGD(i);
			end loop levelE ;
			
			
			Z<=P xor Cout;
			
			
		end process;
		
	
		
	
	
	
	
end Behavioural;

