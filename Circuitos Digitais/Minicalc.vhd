LIBRARY IEEE ;
USE IEEE.std_logic_1164.all ;

entity Minicalc is 

	port(
		
	x1,x2		:   in std_logic_vector (3 downto 0);
	 liga 	:	 in std_logic;   		
	  sel  	:	 in std_logic_vector (2 downto 0);   -- seleçao de operaçao
cin,cout		:	 in std_logic;	 	 
		c0	  	:  out std_logic;  								-- tratamento de erro
	  led  	:  out std_logic;
		bg		:	out std_logic; 								-- menor que
		ag		:	out std_logic;
coutsoma		: 	out std_logic;
	display	:  out std_logic_vector (6 downto 0);
ssoma,ssub	:	out std_logic_vector (3 downto 0);
 sinversor	:	out std_logic_vector (3 downto 0)
	
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
	
	component maior4b
		
			port(
			
				a, b 		  : in  std_logic_vector(3 downto 0);       
				ag			  : out std_logic  
			
			);
	end component;
	
	component menor4b
	 
		 port (
		 a,b			: in  std_logic_vector(3 downto 0);    
		 bg			: out std_logic);  

	end component;
	
	component inversor1b
		
			port(
				
				x1   :  in std_logic_vector(3 downto 0);
				y1	  : out std_logic_vector(3 downto 0)
			
			);
	end component;
	
	component display
	
			port
			(
			-- Sinais de entrada
			DADO : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
			
			-- Sinais de saida
			A, B, C, D, E, F, G : out STD_LOGIC
			);
			
	end component;
		
	begin
	
		a1:soma4b 	  port map	(x1,x2,cin,ssoma,coutsoma);
		a2:sub4b  	  port map	(x1,x2,ssub);
		a3:maior4b 	  port map	(x1,x2,ag);
		a4:menor4b	  port map	(x1,x2,bg);
		a5:inversor1b port map	(x1,sinversor);
		
			with sel select
					display	<=  ssoma 		when  ("001"); -- saidas do portmap
					led		<=  coutsoma	when  ("001");
					display	<=  ssub 		when 	("011");
					led 		<=	 e				when	("011");
					display	<=  ag			when	("010");
					display	<=  bg 			when	("110");
					display	<=  sinversao 	when  ("111");
									
	end archMinicalc;