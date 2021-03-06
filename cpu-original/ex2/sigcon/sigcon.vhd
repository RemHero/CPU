library ieee;
use ieee.std_logic_1164.all;

entity sigcon is
	port(mova,movb,movc,add,sub,ora,nota,shr,shl,jmp,jz,jc,ina,outa,nop,halt,sm,z,c: in std_logic;
	ir: in std_logic_vector(7 downto 0);
	ra,wa,madd : out std_logic_vector(1 downto 0);
	s: out std_logic_vector(3 downto 0);
	ldpc,inpc,we,xl,dl,m,f,fr,fl,ldir,cen,zen,smen: out std_logic);
end sigcon;

architecture lyh of sigcon is
begin
process(IR,MOVA,MOVB,MOVC,add,sub,ora,nota,NOTa,shR,shL,JMP,JZ,Z,JC,C,NOP,SM,ina,outa)
begin

	we<=not(sm and(MOVA or MOVC or shR or shl or add or sub or ora or nota or ina) );
	
	
	wa<=IR(3 downto 2);
	RA<=IR(1 downto 0);
	
	
	INPC<=not sm;
	
	LDPC<=(sm and (jmp or (jc and c) or (jz and z)));
	
	LDIR<=not SM;
	
	DL<=(not sm) or (jmp or (jc and c) or (jz and z) or movc);
	
	XL<=sm and movb;
		
	M<=add or sub or ora or nota;
	
	F<=(add or sub or ora or nota or MOVA or MOVB or outa);
	
	fl<=shR and SM;
	
	fr<=shL and SM;
	
	CEN<=add or sub or ora or nota;
	
	ZEN<=add or sub or ora or nota;
	
	S<=IR(7 DOWNTO 4);
	
	if(sm='0')then madd<="00";
		elsif(movb='1')then madd<="10";
		elsif(movc='1')then madd<="01";
		elsif(jmp='1' or (jc='1' and c='1') or (jz='1' and z='1'))then madd<="00";
		else madd<="XX";
		end if;
	
	smen<=not halt;
	end process;
end lyh;