LIBRARY IEEE ;
USE IEEE.std_logic_1164.all ;

entity inversor4b is
	port(
	
		x1	:	in std_logic_vector(3 downto 0);
		y1	: out std_logic_vector(3 downto 0)
		
		
	);	

end inversor4b;

	architecture i4b of inversor4b is
	
		component inversor1b
			
			port(
			
				a,b	:	in std_logic;
				s		: out	std_logic
				
			);
			
		end component;
		
begin
	
	a:	inversor1b port map(	x1(3), x1(2),	x1(1),	x1(0), y1(3), y1(2),	y1(1),	y1(0));	

end i4b;
	