library ieee;
use ieee.std_logic_1164.all;
entity sm is
port(
	en,clk,reset: in std_logic;
	zout: buffer std_logic);
end sm;

architecture lyh of sm is
begin
	process(clk,reset,en)
	begin
		if(reset='0')then
		zout<='0';
		elsif(clk' event and clk='0')and(en='1') then
		zout<= not zout;
		end if;
	end process;
end lyh;