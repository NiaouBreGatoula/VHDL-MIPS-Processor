library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mux2to1 is
    Port ( A : in STD_LOGIC_VECTOR(4 downto 0);
           B : in STD_LOGIC_VECTOR(4 downto 0);
           Sel : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(4 downto 0));
end Mux2to1;

architecture Behavioral of Mux2to1 is
begin
    process(A, B, Sel)
    begin
        if Sel = '1' then -- an 1 tote ekxwrhse b
            Y <= B;
        else
            Y <= A; --diaforetika a
        end if;
    end process;
end Behavioral;
