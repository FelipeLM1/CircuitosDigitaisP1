LIBRARY IEEE ;
USE IEEE.std_logic_1164.all ;

entity Minicalc is 

	port(
		
	  x1,x2	:   in std_logic_vector (3 downto 0);
	   	
	    sel  :	 in std_logic_vector (2 downto 0);   -- seleçao de operaçao
 cin,e	:	 in std_logic ;
		disp	:  out std_logic_vector (6 downto 0) ;
		led	: 	out std_logic
															
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
			
				a,b 		  : in  std_logic_vector(3 downto 0);       
				ag			  : out std_logic  
			
				 );
	end component;
	
	component menor4b
	 
		 port (
				a,b			: in  std_logic_vector(3 downto 0);    
				bg				: out std_logic
				
				);  

	end component;
	
	component inversor1b
		
			port(
				
				x1   			  :  in std_logic_vector(3 downto 0);
				sinversor	  : out std_logic_vector(3 downto 0)
			
			);
	end component;
	
	component display
	
			port(
				
				-- Sinais de entrada
				DADO : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				
				-- Sinais de saida
				A: out  STD_LOGIC_VECTOR(6 DOWNTO 0)
			);
			
	end component;
		
		signal coutsoma,ag,bg				: 	std_logic;
		signal ssoma,ssub,sinversor		: 	std_logic_vector (3 downto 0);
		signal saidahex						:	std_logic_vector (6 downto 0);
		signal saida4b							:  std_logic_vector (3 downto 0);
		 	
	begin
		
		soma:			soma4b 	  	port map	(x1,x2,cin,ssoma,coutsoma);
		sub:			sub4b  	  	port map	(x1,x2,ssub);
		maior:		maior4b 	  	port map	(x1,x2,ag);
		menor:		menor4b	  	port map	(x1,x2,bg);
		inverte:		inversor1b 	port map	(x1,sinversor);
			
			with sel select
						
					saida4b		<= ssoma 	 		when  ("001"), -- saidas do portmap
										ssub				when 	("011"),
										sinversor		when	("010"),
										"0000" 			when others;
			
			with sel select	
			
					led		<=  coutsoma			when  ("001"),
									 e						when	("011"),
									 ag					when	("110"),
									 bg					when	("111"),
									 '0' 					when others;
									 
		D:display port map(saida4b,saidahex);
		
		disp <= saidahex;
					 
					
									
	end archMinicalc;
	