library ieee;
use ieee.std_logic_1164.all;

entity ebsub is
	port(a,b: in std_logic_vector(7 downto 0);
	c: out std_logic_vector(7 downto 0);
	jzz: out std_logic);
end ebsub;

architecture re of ebsub is
	component fulladd
		port(x,y,z: in std_logic;
		S,C: out std_logic);
	end component;
	
	signal s1,s2,s3,s4,s5,s6,s7,s8: std_logic;
	signal tc:std_logic_vector(7 downto 0);
	begin
			g0:fulladd port map(not a(0),b(0),'1',tc(0),s1);
			g1:fulladd port map(not a(1),b(1),s1,tc(1),s2);
			g2:fulladd port map(not a(2),b(2),s2,tc(2),s3);
			g3:fulladd port map(not a(3),b(3),s3,tc(3),s4);
			g4:fulladd port map(not a(4),b(4),s4,tc(4),s5);
			g5:fulladd port map(not a(5),b(5),s5,tc(5),s6);
			g6:fulladd port map(not a(6),b(6),s6,tc(6),s7);
			g7:fulladd port map(not a(7),b(7),s7,tc(7),s8);
		c<=tc;
		jzz<=not(tc(0) or tc(1) or tc(2) or tc(3) or tc(4) or tc(5) or tc(6) or tc(7)); 
end;
	