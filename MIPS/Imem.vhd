library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Imem is
    Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
           data_out : out STD_LOGIC_VECTOR (31 downto 0));
end Imem;

architecture Behavioral of Imem is
    type memory_array is array (0 to 15) of STD_LOGIC_VECTOR (31 downto 0);
    signal memory : memory_array := (
        0 => x"20000000", -- addi $0, $0, 0
        1 => x"20020000", -- addi $2, $2, 0
        2 => x"20040000", -- addi $4, $0, 0 (fixed comment)
        3 => x"20030001", -- addi $3, $0, 1
        4 => x"20050003", -- addi $5, $0, 3
        5 => x"00603020", -- add $6, $3, $0
        6 => x"AC860000", -- sw $6, 0($4)
        7 => x"20630001", -- addi $3, $3, 1
        8 => x"20840001", -- addi $4, $4, 1
        9 => x"20A5FFFF", -- addi $5, $5, -1
        10 => x"14A0FFFA", -- bne $5, $0, L1
        others => x"00000000" -- NOP for the remaining addresses
    );
begin
    process(addr)
    begin
        data_out <= memory(to_integer(unsigned(addr)));
    end process;
end Behavioral;
