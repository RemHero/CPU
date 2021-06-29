library ieee;
use ieee.std_logic_1164.all;

entity fulladd is
	port(x,y,z: in std_logic;
	S,C: out std_logic);
end fulladd;

architecture re of fulladd is
	signal t: std_logic;
	begin
	t<=(x xor y);
	s<=t xor z;
	c<=(x and y) or (t and z);
end re;