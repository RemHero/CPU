library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity cunchuqi is
	port(clk,pcclr,pcld,pcen:in std_logic;
--pcclr(1)(clear)--pcld(2)(load)--pcen(3)--(111--+1||101--putin||100--keep)
		 sw_bus,pc_bus,ldar:in std_logic;
		 inputd:in std_logic_vector(7 downto 0);
		 arout:out std_logic_vector(7 downto 0);
		 d:inout std_logic_vector(7 downto 0)
		 );
end entity;
architecture rtl of cunchuqi is
signal pc,ar,bus_reg:std_logic_vector(7 downto 0);
begin 
first:process(clk,ldar,bus_reg)
	begin
		if(clk'event and clk='1')then
			if(ldar='1')then
				ar<=bus_reg;
			end if;
		end if;
end process;
second:process(clk,pcclr,pcld,pcen,bus_reg)
	begin
		if(pcclr='0')then
			pc<="00000000";
		elsif(clk'event and clk='1')then
			if(pcld='0'and pcen='1')then
				pc<=bus_reg;
			elsif(pcld='1'and pcen='1')then
				pc<=pc+1;
			end if;
		end if;
end process;
bus_reg<=inputd when(sw_bus='0' and pc_bus='1')else
		 pc     when(sw_bus='1'and pc_bus='0')else
		 d;
d<=bus_reg when(sw_bus='0' or pc_bus='0')else
   "ZZZZZZZZ";
arout<=ar;
end rtl;