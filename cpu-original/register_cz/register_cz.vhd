library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
--Ò»Î»¼Ä´æÆ÷
entity Register_Cz is
port(reset,C_IN,clk,C_en,z_IN,z_en: in std_logic;
     C_OUT,z_out:out std_logic);
end Register_Cz;
 
architecture behavior of Register_Cz is
begin
	process(clk,reset)
	begin
	if(reset='0')then
		C_OUT<='0';
		z_OUT<='0';
	else
		if(c_en='1')then
			C_OUT<=C_IN;
		end if;
		if(z_en='1')then
			z_OUT<=z_IN;
		end if;
	end if;
	end process;
end behavior;
