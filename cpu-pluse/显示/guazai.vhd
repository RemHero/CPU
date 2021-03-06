library ieee;
use ieee.std_logic_1164.all;
entity guazai is
	port(
		 count:in std_logic_vector(2 downto 0);
		 d:in std_logic_vector(7 downto 0);
		 ar:in std_logic_vector(7 downto 0);
		 Q:in std_logic_vector(7 downto 0);
		 weixuan:out std_logic_vector(5 downto 0);
		 duanxuan:out std_logic_vector(6 downto 0)
		 );
end entity;
architecture guazais of guazai is
signal weixuans:std_logic_vector(5 downto 0);
signal min:std_logic_vector(3 downto 0);
signal half:std_logic_vector(6 downto 0);
begin
	 process(count)
		begin
			 if(count="000")then			--d
				weixuans<="011111";
				min<=d(7)&d(6)&d(5)&d(4);
			 elsif(count="001")then
				weixuans<="101111";
				min<=d(3)&d(2)&d(1)&d(0);
			 elsif(count="010")then			--ar
				weixuans<="110111";
				min<=ar(7)&ar(6)&ar(5)&ar(4);
			 elsif(count="011")then
				weixuans<="111011";
				min<=ar(3)&ar(2)&ar(1)&ar(0);
			elsif(count="100")then				--Q
				weixuans<="111101";
				min<=Q(7)&Q(6)&Q(5)&Q(4);
			elsif(count="101")then
				weixuans<="111110";
				min<=Q(3)&Q(2)&Q(1)&Q(0);
			 end if;
			 case min is
				when "0000" =>half<="1111110";--0
				when "0001" =>half<="0110000";--1
				when "0010" =>half<="1101101";--2
				when "0011" =>half<="1111001";--3
				when "0100" =>half<="0110011";--4
				when "0101" =>half<="1011011";--5
				when "0110" =>half<="1011111";--6
				when "0111" =>half<="1110000";--7
				when "1000" =>half<="1111111";--8
				when "1001" =>half<="1111011";--9
				when "1010" =>half<="1110111";--A
				when "1011" =>half<="0011111";--b
				when "1100" =>half<="0001101";--c
				when "1101" =>half<="0111101";--d
				when "1110" =>half<="1001111";--E
				when "1111" =>half<="1000111";--F
				end case;
				end process;
weixuan<=weixuans;
duanxuan<=half;
end architecture;