library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder32 is
    Port (
        A : in  STD_LOGIC_VECTOR(31 downto 0);
        B : in  STD_LOGIC_VECTOR(31 downto 0);
        Sum : out  STD_LOGIC_VECTOR(31 downto 0)
    );
end Adder32;

architecture Behavioral of Adder32 is
begin
    Sum <= A + B; -- simple sum
end Behavioral;
