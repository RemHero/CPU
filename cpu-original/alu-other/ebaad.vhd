library ieee;
use ieee.std_logic_1164.all;

entity ebaad is
	port(a,b: in std_logic_vector(7 downto 0);
	c: out std_logic_vector(7 downto 0);
	jcc: out std_logic);
end ebaad;

architecture re of ebaad is
	component fulladd
		port(x,y,z: in std_logic;
		S,C: out std_logic);
	end component;
	
	signal s1,s2,s3,s4,s5,s6,s7: std_logic;
	begin
			g0:fulladd port map(a(0),b(0),'0',c(0),s1);
			g1:fulladd port map(a(1),b(1),s1,c(1),s2);
			g2:fulladd port map(a(2),b(2),s2,c(2),s3);
			g3:fulladd port map(a(3),b(3),s3,c(3),s4);
			g4:fulladd port map(a(4),b(4),s4,c(4),s5);
			g5:fulladd port map(a(5),b(5),s5,c(5),s6);
			g6:fulladd port map(a(6),b(6),s6,c(6),s7);
			g7:fulladd port map(a(7),b(7),s7,c(7),jcc);
end;
	