library ieee;
use ieee.std_logic_1164.all,ieee.std_logic_unsigned.all;

entity gen is
generic (n:integer:=8);
port(i:in std_logic_vector(n-1 downto 0);
s:in std_logic_vector(2 downto 0);
y:out std_logic);
end gen;

architecture lyh1 of gen is
begin
y<=i(0) when s="000" else
	i(1) WHEN s="001" ELSE
	i(2) WHEN s="010" ELSE
	i(3) WHEN s="011" ELSE
	i(4) WHEN s="100" ELSE
	i(5) WHEN s="101" ELSE
	i(6) WHEN s="110" ELSE
	i(7) WHEN s="111" else
	'X';
end lyh1;
---------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity eight_to_one is
port(a:in std_logic_vector(7 downto 0);
b:in std_logic_vector(2 downto 0);
c:out std_logic);
end eight_to_one;

architecture lyh2 of eight_to_one is

component gen is
generic (n:integer:=8);
port(i:in std_logic_vector(n-1 downto 0);
s:in std_logic_vector(2 downto 0);
y:out std_logic);
end component;

begin
g0:gen generic map(n=>8)port map(i=>a,s=>b,y=>c);
end lyh2;