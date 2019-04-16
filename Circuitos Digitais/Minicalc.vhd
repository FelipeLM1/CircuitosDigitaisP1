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
	 disp		:  out std_logic_vector (6 downto 0);
ssoma,ssub	:	out std_logic_vector (3 downto 0);
 sinversor	:	out std_logic_vector (3 downto 0);
		-- display
	A,B,C,D,E,F,G			:	out std_logic;
	A1,B1,C1,D1,E1,F1,G1	:	out std_logic;
	A2,B2,C2,D2,E2,F2,G2	:	out std_logic;
	A3,B3,C3,D3,E3,F3,G3	:	out std_logic;
	A4,B4,C4,D4,E4,F4,G4	:	out std_logic
	
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
	
		q1:soma4b 	  port map	(x1,x2,cin,ssoma,coutsoma);
		q2:sub4b  	  port map	(x1,x2,ssub);
		q3:maior4b 	  port map	(x1,x2,ag);
		q4:menor4b	  port map	(x1,x2,bg);
		q5:inversor1b port map	(x1,sinversor);
		
		r1:display 	  port map	(ssoma,A,B,C,D,E,F,G);
		r2:display 	  port map	(ssub,A1,B1,C1,D1,E1,F1,G1);
		r3:display 	  port map	(ag,A2,B2,C2,D2,E2,F2,G2);
		r4:display 	  port map	(bg,A3,B3,C3,D3,E3,F3,G3);
		r5:display 	  port map	(sinversor,A4,B4,C4,D4,E4,F4,G4);
		
			with sel select
						
					disp		<=  A,B,C,D,E,F,G 					when  ("001"), -- saidas do portmap
					led		<=  coutsoma							when  ("001"),
					disp		<=  A1,B1,C1,D1,E1,F1,G1			when 	("011"),
					led 		<=	 e										when	("011"),
					disp		<=  A2,B2,C2,D2,E2,F2,G2			when	("010"),
					disp		<=  A3,B3,C3,D3,E3,F3,G3			when	("110"),
					disp		<=  A4,B4,C4,D4,E4,F4,G4			when  ("111");
									
	end archMinicalc;