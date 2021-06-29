library ieee;
use ieee.std_logic_1164.all;

entity ebnot is
	port(a: in std_logic_vector(7 downto 0);
	c: out std_logic_vector(7 downto 0));
end ebnot;

architecture re of ebnot is
	begin
	c(0)<=not a(0);
	c(1)<=not a(1);
	c(2)<=not a(2);
	c(3)<=not a(3);
	c(4)<=not a(4);
	c(5)<=not a(5);
	c(6)<=not a(6);
	c(7)<=not a(7);
end;
	