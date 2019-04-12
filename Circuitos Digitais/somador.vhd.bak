LIBRARY IEEE ;
USE IEEE.std_logic_1164.all ;

entity somador is 
	port(
	
		a,b,cin :  in std_logic;
		s, cout : out std_logic);

end somador;
	
architecture soma of somador is 
		begin
			
			s 	  <= a xor b xor cin;
			cout <= (a and b) or (a and cin) or (b and cin);
			
		end soma;
	
	
	