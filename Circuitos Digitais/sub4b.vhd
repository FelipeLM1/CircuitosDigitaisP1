-- SUBTRATOR
-- 
--	
--
LIBRARY IEEE ;
USE IEEE.std_logic_1164.all ;

entity sub4b is
	port(
	
		x,y		:	in std_logic_vector(3 downto 0);
		s			: out std_logic_vector(3 downto 0)
		
	);	

end sub4b;

			

	architecture subtrator4b of sub4b is
	
		signal v  			: std_logic_vector(3 downto 1); -- vai um
		signal cout,ag 	: std_logic;
		signal sinversor 	: std_logic_vector (3 downto 0);
	
			component soma4b
				
				port(
				
					x,y	:	in std_logic_vector(3 downto 0);
					cin 	:  in std_logic;
					s		: out std_logic_vector(3 downto 0);
					cout	: out	std_logic
							
				);
				
			end component;
			
			
			
			
			component inversor1b
				port(
				
					x1				:	 in std_logic_vector(3 downto 0);
					sinversor	:	out std_logic_vector(3 downto 0)
					
				);
			
			end component;	
				
			component maior4b
			
				port (
					
					a, b 		: in  std_logic_vector(3 downto 0);       -- inputs
					ag			: out std_logic);     	
					
			end component;
				
		begin
		
			p: maior4b port map (x,y,ag); -- A Signal  -- separar o maior que e menor que
			-- verificar se x1 > x2 para poder subtrair
			w: inversor1b port map (y,sinversor);
			-- inverter o segundo numero
			a:	soma4b 	  port map (x,y,'1', s, cout);	
	
	end subtrator4b;
	