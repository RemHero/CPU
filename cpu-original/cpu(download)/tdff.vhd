library ieee;
use ieee.std_logic_1164.all;

entity tDFF is
port(D,clock:in std_logic;
     NQ,Q:out std_logic);
end entity tDFF;

architecture ST of tDFF is
begin 
    process(clock,D)
    begin
    if(clock'event and clock='1')then
        Q<=D;
        NQ<=not D;
    end if;
    end process;
end ST; 
