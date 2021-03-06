library ieee;
use ieee.std_logic_1164.all;
entity gpr is
port(
	reset,we,clk: in std_logic;
	ra,wa: in std_logic_vector(1 downto 0);
	i: in std_logic_vector(7 downto 0);
	a0,b0,aa,bb,cc: out std_logic_vector(7 downto 0));
end gpr;

architecture lyh of gpr is
	signal a: std_logic_vector(7 downto 0):="10000001";
	signal b: std_logic_vector(7 downto 0):="10000001";
	signal c: std_logic_vector(7 downto 0):="00000000";
begin
	process(clk,we,reset,ra,wa)
	begin
	if(reset='0')then
	a<="10000001";
	b<="10000001";
	c<="00000000";
	else
			if(we='0')then
					if(clk'event and clk='0')then
						if(wa="00")then a<=i;
						elsif(wa="01")then b<=i;
						elsif(wa="10")then c<=i;
						else a<=a;b<=b;c<=c;
						end if;
					end if;
				end if;
				
				if(ra="00")then a0<=a;
					elsif(ra="01")then a0<=b;
					elsif(ra="10")then a0<=c;
					else a0<=c;
				end if;
				if(wa="00")then b0<=a;
					elsif(wa="01")then b0<=b;
					elsif(wa="10")then b0<=c;
					else b0<=c;
				end if;
				
				aa<=a;
				bb<=b;
				cc<=c;
	end if;
	end process;
end lyh;