library ieee;
use ieee.std_logic_1164.all;
entity shift is
	port(fbus,flbus,frbus: in std_logic;
	a: in std_logic_vector(0 to 7);
	w: out std_logic_vector(0 to 7);
	cf: out std_logic);
end shift;

architecture lyh of shift is
begin
process(flbus,frbus,fbus)
begin
	if(fbus='1')then
			cf<='0';
			w<=a;
	elsif(frbus='1')then
		cf<=a(0);
		FOR n in 6 downto 0 LOOP
			w(n)<= a(n+1);
		END LOOP;
		w(7)<=a(0);
	elsif(flbus='1')then
		cf<=a(7);
		FOR n IN 1 TO 7 LOOP
			w(n)<= a(n-1);
		END LOOP;
		w(0)<=a(7);
	else w<="ZZZZZZZZ";
	end if;
	end process;		
end;		