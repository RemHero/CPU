library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port(m: in std_logic;
	s: in std_logic_vector(3 downto 0);
	a,b: in std_logic_vector(7 downto 0);
	cf,zf: out std_logic;
	t: out std_logic_vector(7 downto 0));
end ALU;

architecture re of ALU is
	
	component ebaad is
		port(a,b: in std_logic_vector(7 downto 0);
		c: out std_logic_vector(7 downto 0);
		jcc: out std_logic);
	end component;
	
	component ebsub is
		port(a,b: in std_logic_vector(7 downto 0);
		c: out std_logic_vector(7 downto 0);
		jzz: out std_logic);
	end component;
	
	component ebor is
		port(a,b: in std_logic_vector(7 downto 0);
		c: out std_logic_vector(7 downto 0));
	end component;
	
	component ebnot is
		port(a: in std_logic_vector(7 downto 0);
		c: out std_logic_vector(7 downto 0));
	end component;
		
	signal t1,t2,t3,t4: std_logic_vector(7 downto 0);
	signal tcf,tzf: std_logic;
	begin
	g0:ebaad port map(a,b,t1,tcf);
	g1:ebsub port map(a,b,t2,tzf);
	g2:ebor port map(a,b,t3);
	g3:ebnot port map(b,t4);
	process(m,s,a,b)
		begin
			if(m='0')then
				if(s="1111")then t<=a;
				elsif(s="1010" or s="0100")then t<=b;
				end if;
			elsif(s="1001")then
				t<=t1;cf<=tcf;zf<='0';
			elsif(s="0110")then
				t<=t2;cf<='0';zf<=tzf;
			elsif(s="1011")then
				t<=t3;cf<='0';zf<='0';
			elsif(s="0101")then
				t<=t4;cf<='0';zf<='0';
			else t<="ZZZZZZZZ";
			end if;	
	end process;
	
end;