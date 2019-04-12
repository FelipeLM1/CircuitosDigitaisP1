LIBRARY IEEE ;
USE IEEE.std_logic_1164.all ;

entity Minicalc is 

	port(
		
		x1,x2	: 	in std_logic_vector (3 downto 0);
		liga 	:	in std_logic;   		
		sel  	:	in std_logic_vector (2 downto 0);   -- seleçao de operaçao
      sub  	:	in std_logic;
		maior	:	in std_logic;
		menor	:	in std_logic;
	inversao	:	in std_logic; 	
	 display	:  out std_logic_vector (6 downto 0);
		c0	  	:  out std_logic;  							-- tratamento de erro
		led  	:  out std_logic
	
	);

end Minicalc;

architecture archMinicalc of Minicalc is

	component soma4b
		
			port(
	
				x,y		:	in std_logic_vector(3 downto 0);
				cin		:  in	std_logic;
				s			: out std_logic_vector(3 downto 0);
				cout		: out std_logic
		
			);
	end component;
	
	component sub4b
		
			port(
			
				x,y		:	in std_logic_vector(3 downto 0);
				s			: out std_logic_vector(3 downto 0)
			
			);
	end component;
	
	component comparador
		
			port(
			
				a, b 		  : in  std_logic_vector(3 downto 0);       
				ag, bg, eq : out std_logic  
			
			);
	end component;
	
	component inversor1b
		
			port(
				
				x1   :  in std_logic_vector(3 downto 0);
				y1	  : out std_logic_vector(3 downto 0)
			
			);
	end component;
	
	soma4b 	  port map(x1,x2,cin,ssoma,coutsoma);
	sub4b  	  port map(x1,x2,ssub);
	maior 	  port map()
	menor		  port map()
	inversor1b port map(x1,sinversor);
		
	begin
		
			with sel select
			display	<=  soma when  ("001" and liga); -- saidas do portmap
							  sub when 	("011" and liga);
							maior when	("010" and liga);
							menor when	("110" and liga);
						inversao when  ("111" and liga);
									
	end archMinicalc;