library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DataMemory is
    Port (
        Clk : in STD_LOGIC;
        MemWrite : in STD_LOGIC;
        MemRead : in STD_LOGIC;
        Address : in STD_LOGIC_VECTOR(31 downto 0); -- 4-bit address
        WriteData : in STD_LOGIC_VECTOR (31 downto 0);
        ReadData : out STD_LOGIC_VECTOR (31 downto 0)
    );
end DataMemory;

architecture Behavioral of DataMemory is
    type memory_type is array (0 to 15) of STD_LOGIC_VECTOR(31 downto 0); -- 16 locations
    signal memory : memory_type := (others => (others => '0'));
begin

    process(Clk)
    begin
        if rising_edge(Clk) then
            if MemWrite = '1' then
                memory(to_integer(unsigned(Address))) <= WriteData;
            end if;
        end if;
    end process;

    process(Address, MemRead)
    begin
        if MemRead = '1' then
            ReadData <= memory(to_integer(unsigned(Address)));
        else
            ReadData <= (others => '0');
        end if;
    end process;

end Behavioral;
