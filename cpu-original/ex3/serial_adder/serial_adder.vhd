library ieee;
use ieee.std_logic_1164.all;
entity dff is
port(
d,c:in std_logic;
q,nq:out std_logic);
end dff;

architecture lyh1 of dff is
signal sig: std_logic;
begin
process(c)
begin
if(c='1') then sig<=d;
end if;
q<=sig;
nq<=not sig;
end process;
end lyh1;
-----------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity shift_register is
port(
si,c:in std_logic;
so:out std_logic);
end shift_register;

architecture lyh2 of shift_register is
component dff
port(
d,clk:in std_logic;
q:out std_logic);
end component;
signal sig1,sig2,sig3: std_logic;
begin
h1:dff port map(si,c,sig1);
h2:dff port map(sig1,c,sig2);
h3:dff port map(sig2,c,sig3);
h4:dff port map(sig3,c,so);
end lyh2;
---------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity adder is
port(
x,y,z:in std_logic;
s,c:out std_logic);
end adder;

architecture lyh3 of adder is
begin
s<=x xor y xor z;
c<=(x and y)or(z and(x xor y));
end lyh3;
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity serial_adder is
port(
shift,clock,si,nreset:in std_logic;
checks,checkc:out std_logic);
end serial_adder;

architecture lyh4 of serial_adder is
component dff
port(
d,clk:in std_logic;
q:out std_logic);
end component;
component shift_register
port(
si,c:in std_logic;
so:out std_logic);
end component;
component adder
port(
x,y,z:in std_logic;
s,c:out std_logic);
end component;
signal sig1,sig2,sig3,sig4,sig5,sig6: std_logic;
begin
h0:shift_register port map(si=>sig4,c=>(clock or (not shift)),so=>sig1);
h1:shift_register port map(si=>si,c=>(clock or (not shift)),so=>sig2);
h2:dff port map(d=>sig5,clk=>(clock or (not shift)),q=>sig3);
h3:adder port map(sig1,sig2,sig3,sig4,sig5);
checks<=sig4;
checkc<=sig5;
end lyh4;