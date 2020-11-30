library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FastAdder is

port(
	A:in std_logic_vector(15 downto 0);
	B:in std_logic_vector(15 downto 0);
	
	ZP:out std_logic_vector(15 downto 0);
	ZG:out std_logic_vector(15 downto 0);
	ZCP:out std_logic_vector(15 downto 0);
	ZCG:out std_logic_vector(15 downto 0);
	Z:out std_logic_vector(15 downto 0)
	
);

end FastAdder;

architecture Behavioural of FastAdder is


	
	signal G,P,CG,CP,Cout:std_logic_vector(15 downto 0);
	
	begin

		
		process(G,P,CG,CP,A,B,Cout)
		
		begin
		
		
			precompute:for i in 0 to 15 loop
				P(i)<=A(i) xor B(i);
				G(i)<=A(i) and B(i);
				
			end loop precompute ;
			
			CG(0)<=G(0);
			CP(0)<=P(0);
			
			levelA:for i in 1 to 15 loop
				CP(i)<=P(i) and P(i-1);
				CG(i)<=G(i) or (P(i) and G(i-1));
				
			end loop levelA ;
			
			
			levelB:for i in 2 to 15 loop
				CP(i)<=CP(i) and CP(i-2);
				CG(i)<=CG(i) or (CP(i) and CG(i-2));
				
			end loop levelB ;
			
			levelC:for i in 4 to 15 loop
				CP(i)<=CP(i) and CP(i-4);
				CG(i)<=CG(i) or (CP(i) and CG(i-4));
				
			end loop levelC ;
		
			levelD:for i in 8 to 15 loop
				CP(i)<=CP(i) and CP(i-8);
				CG(i)<=CG(i) or (CP(i) and CG(i-8));
				
			end loop levelD ;
			
			
			Cout(0)<='0';
			
			levelE:for i in 0 to 14 loop
				Cout(i+1)<=(Cout(0) and CP(i)) or CG(i);
			end loop levelE ;
			
			
			Z<=CP xor Cout;
			ZCP<=CP;
			ZCG<=CG;
			ZP<=P;
			ZG<=G;
			
		end process;
		
	
		
	
	
	
	
end Behavioural;

