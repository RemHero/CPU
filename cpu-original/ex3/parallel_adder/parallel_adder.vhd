library ieee;
use ieee.std_logic_1164.all;
entity adder is
port(
a,b,c:in std_logic;
g,h:out std_logic);
end adder;

architecture lyh1 of adder is
begin
g <= a xor c xor b;
h <= (a and b) or (c and ( a xor b));
end lyh1;

library ieee;
use ieee.std_logic_1164.all;
entity parallel_adder is
--generic (addwidth: integer:= 4)
port(
x,y:in std_logic_vector(3 downto 0);
s:out std_logic_vector(3 downto 0);
c:out std_logic);
end parallel_adder;

architecture lyh2 of parallel_adder is
component adder
port(
a,b,c:in std_logic;
g,h:out std_logic);
end component;
signal l1,l2,l3 :std_logic;
begin
h0:adder port map(x(0),y(0),'0',s(0),l1);
h1:adder port map(x(1),y(1),l1,s(1),l2);
h2:adder port map(x(2),y(2),l2,s(2),l3);
h3:adder port map(x(3),y(3),l3,s(3),c);
end lyh2;