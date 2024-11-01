
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LeftShifter is
    Port ( InSig : in STD_LOGIC_VECTOR(31 downto 0);
           OutSig : out STD_LOGIC_VECTOR(31 downto 0));
end LeftShifter;

architecture Behavioral of LeftShifter is
begin
    process(InSig)
    begin
        OutSig <= std_logic_vector(shift_left(unsigned(InSig), 2));
    end process;
end Behavioral;
