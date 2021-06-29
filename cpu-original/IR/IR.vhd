library ieee;
use ieee.std_logic_1164.all;
--下降沿触发的八位数据寄存器
entity IR is
port(a:in std_logic_vector(7 downto 0);--input
	 reset,clk,ld:in std_logic;--clock pulse, enable(1 is effective)
	 x:out std_logic_vector(7 downto 0));--output
end IR;

architecture lyh of IR is
signal temp:std_logic_vector(7 downto 0):="00000000";
begin
	process(a,clk,ld,reset)
	begin
	if(reset='0')then
	temp<="00000000";
	else
		if (ld='1') then
			if(clk'event and clk='0') then 
			temp<=a;
			end if;
		end if;
	end if;
	end process;
	x<=temp;
end lyh;