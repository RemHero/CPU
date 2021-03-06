library ieee;
use ieee.std_logic_1164.all;
entity decoder1_2 is
port(a: in std_logic;
d : out std_logic_vector(1 downto 0));
end decoder1_2;

library ieee;
use ieee.std_logic_1164.all;
entity decoder2_4 is
port(a: in std_logic_vector(1 downto 0);
d : out std_logic_vector(3 downto 0));
end decoder2_4;

library ieee;
use ieee.std_logic_1164.all;
entity decoder3_8 is
port(a: in std_logic_vector(2 downto 0);
d : out std_logic_vector(7 downto 0));
end decoder3_8;

architecture lyh1 of decoder1_2 is
begin
d(0) <= not a;
d(1) <= a;
end lyh1;

architecture lyh2 of decoder2_4 is
component decoder1_2 is
port(a: in std_logic;
d : out std_logic_vector(1 downto 0));
end component;
signal ou : std_logic_vector(3 downto 0);
begin
g0:decoder1_2 port map (a(0),ou(1 downto 0));
g1:decoder1_2 port map (a(1),ou(3 downto 2));
d(0) <= ou(2) and ou(0);
d(1) <= ou(2) and ou(1);
d(2) <= ou(3) and ou(0);
d(3) <= ou(3) and ou(1);
end lyh2;

architecture lyh3 of decoder3_8 is
component decoder1_2 is
port(a: in std_logic;
d : out std_logic_vector(1 downto 0));
end component;
component decoder2_4 is
port(a: in std_logic_vector(1 downto 0);
d : out std_logic_vector(3 downto 0));
end component;
signal ou : std_logic_vector(5 downto 0);
begin
g0: decoder2_4 port map (a(1 downto 0),ou(3 downto 0));
g1: decoder1_2 port map (a(2),ou(5 downto 4));
d(0) <= ou(4) and ou(0);
d(1) <= ou(4) and ou(1);
d(2) <= ou(4) and ou(2);
d(3) <= ou(4) and ou(3);
d(4) <= ou(5) and ou(0);
d(5) <= ou(5) and ou(1);
d(6) <= ou(5) and ou(2);
d(7) <= ou(5) and ou(3);
end lyh3;