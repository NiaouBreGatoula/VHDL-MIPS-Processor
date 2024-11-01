library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ProgramCounter is
    Port ( 
	       Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           PCIn : in STD_LOGIC_VECTOR(31 downto 0);
           PCOut : out STD_LOGIC_VECTOR(31 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is
    signal PC : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin

    process(Clk, Reset)
    begin
        if Reset = '1' then
            PC <= (others => '0');
        elsif rising_edge(Clk) then
                PC <= PCIn;
        end if;
    end process;

    PCOut <= PC;

end Behavioral;

