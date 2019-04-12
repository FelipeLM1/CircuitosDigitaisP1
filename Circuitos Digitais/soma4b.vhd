LIBRARY IEEE ;
USE IEEE.std_logic_1164.all ;

entity soma4b is
	port(
	
		x,y		:	in std_logic_vector(3 downto 0);
		cin		:  in	std_logic;
		s			: out std_logic_vector(3 downto 0);
		cout		: out std_logic
		
	);	

end soma4b;

	architecture s4b of soma4b is
	
		component somador
			
			port(
			
				a,b,cin	:	in std_logic;
				s,cout	: out	std_logic
				
			);
			
		end component;
		
		signal v : std_logic_vector(3 downto 1); -- vai um
		
		
begin
	
	x0:	somador port map(	x(0)	,	y(0),	cin,	s(0),	v(1));	
	x1:	somador port map(	x(1)	,	y(1),	v(1),	s(1),	v(2));
	x2:	somador port map(	x(2)	,	y(2),	v(2),	s(2),	v(3));
	x3:	somador port map(	x(3)	,	y(3),	v(3),	s(3),	cout);

end s4b;
	