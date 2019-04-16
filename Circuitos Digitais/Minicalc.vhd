LIBRARY IEEE ;
USE IEEE.std_logic_1164.all ;

entity Minicalc is 

	port(
		
	  x1,x2	:   in std_logic_vector (3 downto 0);
	   liga 	:	 in std_logic;   		
	    sel  :	 in std_logic_vector (2 downto 0);   -- seleçao de operaçao
  cin,cout	:	 in std_logic;	 	 
		 led	:  out std_logic;  								-- tratamento de erro
	   disp	:  out std_logic_vector (6 downto 0)
		
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
				
				x1   :  in std_logic_vector(3 downto 0);
				y1	  : out std_logic_vector(3 downto 0)
			
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
		signal A									:	std_logic_vector (6 downto 0);
		signal B									:	std_logic_vector (6 downto 0);
		signal C									:	std_logic_vector (6 downto 0);
		
	begin
		
		q1:soma4b 	  port map	(x1,x2,cin,ssoma,coutsoma);
		q2:sub4b  	  port map	(x1,x2,ssub);
		q3:maior4b 	  port map	(x1,x2,ag);
		q4:menor4b	  port map	(x1,x2,bg);
		q5:inversor1b port map	(x1,sinversor);
		
		r1:display 	  port map	(ssoma,A);
		r2:display 	  port map	(ssub,B);
		r3:display 	  port map	(sinversor,C);
		
		
			with sel select
						
					disp		<= ssoma 	 			when  ("001"), -- saidas do portmap
									ssub					when 	("011"),
									sinversor			when	("010"),
									"0000000" 			when others;
			
			with sel select	
			
					led		<=  coutsoma			when  ("001"),
									 e						when	("011"),
									 ag					when	("110"),
									 bg					when	("111"),
									 "0000000" 			when others;
									
	end archMinicalc;
	