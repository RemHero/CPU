library ieee;
use ieee.std_logic_1164.all;

entity instruction_decoder is
port(en : in bit; 
a: in std_logic_vector(7 downto 0);
mova,movb,movc,add,sub,ora,nota,shr,shl,jmp,jz,jc,ina,outa,nop,halt: out bit);
end instruction_decoder;

architecture lyh of instruction_decoder is
begin
process(a,en)
begin
mova<='0';movb<='0';movc<='0';add<='0';sub<='0';ora<='0';nota<='0';shr<='0';shl<='0';jmp<='0';jz<='0';jc<='0';ina<='0';outa<='0';nop<='0';halt<='0';
if (en='1') then
	if(a(7 downto 2)="111111") then movb<= '1';
	elsif (a(7 downto 4)="1111" and a(1 downto 0)="11") then movc<= '1';
	elsif (a(7 downto 4)="1111") then mova<= '1';
	elsif (a(7 downto 4)="1001") then add<= '1';
	elsif (a(7 downto 4)="0110") then sub<= '1';
	elsif (a(7 downto 4)="1011") then ora<= '1';
	elsif (a(7 downto 4)="0101") then nota<= '1';
	elsif (a(7 downto 4)="1010" and a(1 downto 0)="00") then shr<= '1';
	elsif (a(7 downto 4)="1010" and a(1 downto 0)="11") then shl<= '1';
	elsif (a(7 downto 0)="00010000") then jmp<= '1';
	elsif (a(7 downto 0)="00010001") then jz<= '1';
	elsif (a(7 downto 0)="00010010") then jc<= '1';
	elsif (a(7 downto 4)="0010") then ina<= '1';
	elsif (a(7 downto 4)="0100") then outa<= '1';
	elsif (a(7 downto 0)="01110000") then nop<= '1';
	elsif (a(7 downto 0)="10000000") then halt<= '1';
	end if;
end if;
end process;
end lyh;