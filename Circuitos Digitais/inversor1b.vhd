LIBRARY IEEE ;
USE IEEE.std_logic_1164.all ;

entity inversor1b is 
	port(
	
		x1   			  :  in std_logic_vector(3 downto 0);
		sinversor	  : out std_logic_vector(3 downto 0)
		
	);
end inversor1b;
	
architecture inverte of inversor1b is 
	begin
			
		sinversor <= not x1 ;
			
	end inverte;
	
	
	