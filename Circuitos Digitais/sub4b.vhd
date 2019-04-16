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
	
		component soma4b
			
			port(
			
				x1,x2	:	in std_logic_vector(3 downto 0);
				cin 	:  in std_logic;
				cout	: out	std_logic;
				s		: out std_logic_vector(3 downto 0)
				
			);
			
		end component;
		
		signal v : std_logic_vector(3 down to 1); -- vai um
		signal a : std_logic;
		
		component inversor1b
			port(
			
				a	:	 in std_logic_vector(3 downto 0);
				b	:	out std_logic_vector(3 downto 0)
				
			);
		component maior
		
			port (
				
				a, b 		: in  std_logic_vector(3 downto 0);       -- inputs
				ag			: out std_logic);     	
				
		end component;
			
	begin
	
		p: maior port map (x1,x2,a); -- A Signal  -- separar o maior que e menor que
		-- verificar se x1 < x2 para poder subtrair
		w: inversor1b port map (x2,y2);
		-- inverter o segundo numero
		a:	soma4b 	  port map (x1,y2,'1', cout, s);	

	end
end subtrator4b;
	