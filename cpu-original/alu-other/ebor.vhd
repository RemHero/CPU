library ieee;
use ieee.std_logic_1164.all;

entity ebor is
	port(a,b: in std_logic_vector(7 downto 0);
	c: out std_logic_vector(7 downto 0));
end ebor;

architecture re of ebor is
	begin
	c(0)<=a(0) or b(0);
	c(1)<=a(1) or b(1);
	c(2)<=a(2) or b(2);
	c(3)<=a(3) or b(3);
	c(4)<=a(4) or b(4);
	c(5)<=a(5) or b(5);
	c(6)<=a(6) or b(6);
	c(7)<=a(7) or b(7);
end;
	