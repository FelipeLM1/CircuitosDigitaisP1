LIBRARY IEEE ;
USE IEEE.std_logic_1164.all ;

entity Minicalc is 

	port(
		
		x1,x2: 	in std_logic_vector (3 downto 0);
		liga :	in std_logic;   		
		sel  :	in std_logic_vector (2 downto 0);   -- seleçao de operaçao
  subtracao:	in std_logic;
		maior:	in std_logic;
		menor:	in std_logic;
	inversao:	in std_logic; 	
	 display:  out std_logic_vector (6 downto 0);
		led  :  out std_logic
	
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
		
	begin
		
			with sel select
			display	<=  soma4b 		when  "001";   -- soma
							
									
	end archMinicalc;