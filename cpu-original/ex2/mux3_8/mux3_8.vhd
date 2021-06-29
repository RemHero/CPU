library ieee;
use ieee.std_logic_1164.all;

entity mux3_8 is
port (a,b,c:in std_logic_vector(7 downto 0);
d:out std_logic_vector(7 downto 0);
s:in std_logic_vector(1 downto 0));
end mux3_8;

architecture lyh of mux3_8 is
begin
with s(1 downto 0) select
	d<= a(7 downto 0) when "00",
		b(7 downto 0) when "01",
		c(7 downto 0) when "10",
		"XXXXXXXX" when others;
end lyh;