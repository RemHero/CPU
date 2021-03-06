library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity pc is
port(
	inpc,ldpc,clk,reset: in std_logic;
	a: in std_logic_vector(7 downto 0);
	c: out std_logic_vector(7 downto 0));
end pc;

architecture lyh of pc is
signal t,s: std_logic_vector(7 downto 0);
begin
	process(clk,reset)
	begin
		if(reset='0')then
		s<="00000000";
		elsif(clk' event and clk='0')and(inpc='1')and(ldpc='0') then
		s<=s+"00000001";
		elsif(clk' event and clk='0')and(inpc='0')and(ldpc='1') then
		s(7 downto 0)<=a(7 downto 0);
		end if;
		c<=s;
	end process;
end lyh;