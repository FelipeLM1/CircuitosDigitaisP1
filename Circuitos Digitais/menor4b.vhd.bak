library ieee;
use ieee.std_logic_1164.all;

entity menor4b is

  port (
    a,b			: in  std_logic_vector(3 downto 0);       -- inputs
    bg			: out std_logic);     				  			--  bg se a < b, eq se a=b

end menor4b;

architecture menor of menor4b is

signal s : std_logic_vector(3 downto 0);        			 

begin 

s(0)<= a(0) xnor b(0); 												-- verifica igualdade dos bits
s(1)<= a(1) xnor b(1);
s(2)<= a(2) xnor b(2);
s(3)<= a(3) xnor b(3);

bg<=(b(3) and (not a(3))) or
    (s(3) and b(2) and (not a(2)))or
    (s(3) and s(2) and b(1)and (not a(1))) or
    (s(3) and s(2) and s(1) and b(0) and (not a(0)));

end menor;
