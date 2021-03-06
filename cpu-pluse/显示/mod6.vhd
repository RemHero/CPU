library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mod6 is
port(clk:in std_logic;
	 aout:out std_logic_vector(2 downto 0));
end entity;

architecture exam of mod6 is
signal ex:std_logic_vector(2 downto 0):="000";
begin
	process(clk,ex)
	begin
		if(clk='1' and clk'event) then ex<=ex+"001";
		end if;
		if ex="110" then ex<="000";
		end if;
	end process;
aout<=ex;
end exam;