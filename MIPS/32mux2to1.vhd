library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1_32bit is
    Port ( input0 : in STD_LOGIC_VECTOR (31 downto 0);
           input1 : in STD_LOGIC_VECTOR (31 downto 0);
           sel : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (31 downto 0));
end mux2to1_32bit;

architecture Behavioral of mux2to1_32bit is
begin
    process(input0, input1, sel)
    begin
        if (sel = '0') then --ez
            output <= input0;
        else
            output <= input1;
        end if;
    end process;
end Behavioral;