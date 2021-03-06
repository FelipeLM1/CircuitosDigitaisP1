library ieee;
use ieee.std_logic_1164.all;

entity maior4b is

  port (
    a, b 		: in  std_logic_vector(3 downto 0);       -- inputs
    ag			: out std_logic);     				  			-- ag se a > b, eq se a=b

end maior4b;

architecture maior of maior4b is

signal s : std_logic_vector(3 downto 0);        			 

begin 

s(0)<= a(0) xnor b(0); 												-- verifica igualdade dos bits
s(1)<= a(1) xnor b(1);
s(2)<= a(2) xnor b(2);
s(3)<= a(3) xnor b(3);


ag<=(a(3) and (not b(3))) or
    (s(3) and a(2) and (not b(2))) or
    (s(3) and s(2) and a(1)and (not b(1))) or
    (s(3) and s(2) and s(1) and a(0) and (not b(0)));



end maior;
