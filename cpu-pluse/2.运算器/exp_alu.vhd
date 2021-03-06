library ieee;

use ieee.std_logic_1164.all;

use ieee.std_logic_unsigned.all;



entity exp_alu is 

port( 

t2									:in STD_LOGIC;

t3									:in STD_LOGIC;

SW_bus,R4_bus,R5_bus,ALU_bus		:in STD_LOGIC;

lddr1,lddr2,ldr4,ldr5				:in STD_LOGIC;

m,cn								:in STD_LOGIC;				

s									:in std_logic_vector(3 downto 0);

K									:in std_logic_vector(7 downto 0);

d									:inout STD_LOGIC_VECTOR(7 downto 0) );

end exp_alu;



architecture rtl of exp_alu is 

signal dr1, dr2, r4, r5, aluout, bus_Reg:STD_LOGIC_VECTOR(7 downto 0);

signal sel:STD_LOGIC_VECTOR(5 downto 0);

begin 

ldreg: process(t2,t3,lddr1,lddr2,ldr4,ldr5,bus_Reg) 

	begin

	if t2'event and t2='1'then

		if lddr1='1' 	then dr1 <=bus_Reg;

		elsif lddr2='1' then dr2<= bus_Reg;
		
		end if;
		
	end if;
	
	if t3'event and t3='1'then
	
		if lDR4 = '1' then R4 <=Bus_Reg;

		elsif ldr5 = '1' then R5 <=bus_Reg; 

		End If;

	end if;

end process;





ALU: process(m, cn, s, dr1, dr2, sel, aluout) 

	begin

		sel<=m & cn & s;

		case sel is

			when "000000" =>aluout <= dr1+1;

			when "010000" => aluout <= dr1;

			when "100000" => aluout <=not dr1;

			when "000001" => aluout <= (dr1 or dr2) +1;

			when "010001" =>aluout<=dr1 or dr2;

			when "100001" => aluout <=not(dr1 or dr2);

			when "000010" => aluout<=(dr1 or (not dr2)) +1;

			when "010010" => aluout<=dr1 or (not dr2);

			When "100010" => Aluout <= (not dr1) and DR2;

			when "000011" =>aluout <=x"00";

			when "010011" =>aluout<=aluout-1;

			when "100011" =>aluout<=x"00";

			when "000100" => aluout<=dr1 + (dr1 and (not dr2)) +1;

			when "010100" => aluout <=dr1 + (dr1 and (not dr2));

			when "100100" => aluout <= not (dr1 and dr2);

			when "000101" => aluout<=(dr1 or dr2) or (dr1 and dr2) or x"01";

			when "010101" => aluout<=(dr1 or dr2) + (dr1 and(not dr2) );

			when "100101" =>aluout <=not dr2;

			when "000110" => aluout <= dr1-dr2;

			When "010110" => Aluout <= DR1-DR2-1;

			When "100110" => Aluout <= Dr1 xor dr2;

			When "000111" => Aluout <= DR1 and (not DR2);

			when "010111" =>aluout <=(dr1 and (not dr2))-1;

			when "100111" => aluout <=dr1 and ( not dr2);

			when "001000" => aluout <=dr1 + (dr1 and dr2) +1;

			When "011000" => Aluout <= DR1 + (DR1 and DR2);

			When "101000"=> aluout <= (not dr1)or dr2;

			when "001001"=> aluout <= dr1+ dr2 + 1;

			when "011001"=> aluout <= dr1 + dr2;

			when "101001"=> Aluout <= (dr1 xnor DR2);

			When "001010"=> aluout <= (dr1 or(not dr2)) + (dr1 and dr2) +1;

			When "011010"=> aluout <= (dr1 or(not dr2)) +(dr1 and dr2);

			When "101010"=> aluout <= dr2;

			when "001011" => aluout <= dr1 and dr2;

			when "011011"=> aluout <=(dr1 and dr2)-1;

			when "101011" => aluout <= dr1 and dr2;

			When "001100" => Aluout <= dr1 + dr1 + 1;

			when "011100" => aluout <= dr1 or dr1;

			When "101100" => Aluout <= x"01";

			when "001101" => aluout <= (dr1 or dr2) + dr1 +1;

			when "011101" => aluout <= (dr1 or dr2) + dr1;

			When "101101" => Aluout <= DR1 or (not DR2);

			when "001110" => aluout <= (dr1 or (not dr2)) + dr1 + 1;

			when "011110" => aluout <=(dr1 or (not dr2)) + dr1;

			When "101110" => Aluout <= DR1 or DR2;

			when "001111" =>aluout <=dr1;

			when "011111" => aluout <= dr1-1;

			when "101111" =>aluout <=dr1;

			when others =>aluout<=x"ff";

		end case;

	end process;

bus_Reg<=k 	when (sw_bus= '0' and r4_bus = '1'and r5_bus= '1'and ALU_bus='1') else

		 r4	when (sw_bus='1' and r4_bus= '0'and r5_bus='1'and ALU_bus='1') else 

		 r5 when (sw_bus = '1' and r4_bus= '1'and r5_bus= '0' and ALU_bus= '1') else 

		 aluout when (sw_bus='1' and r4_bus ='1'and r5_bus='1'and ALU_bus ='0') else 

		 d;

d<= bus_Reg when (sw_bus= '0'or r4_bus = '0'or r5_bus = '0' or ALU_bus= '0') else (others=>'Z');

End RTL;