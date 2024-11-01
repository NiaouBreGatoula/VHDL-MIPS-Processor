library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1_32bit_tb is
end mux2to1_32bit_tb;

architecture Behavioral of mux2to1_32bit_tb is
    component mux2to1_32bit
        Port ( input0 : in STD_LOGIC_VECTOR (31 downto 0);
               input1 : in STD_LOGIC_VECTOR (31 downto 0);
               sel : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

    signal input0 : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal input1 : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sel : STD_LOGIC := '0';
    signal output : STD_LOGIC_VECTOR (31 downto 0);

begin
    uut: mux2to1_32bit
        Port map (
            input0 => input0,
            input1 => input1,
            sel => sel,
            output => output
        );

    stim_proc: process
    begin
        input0 <= X"AAAAAAAA"; input1 <= X"BBBBBBBB"; sel <= '1'; wait for 10 ns; -- then select first 'AAAAAAAA'
        input0 <= X"AAAAAAAA"; input1 <= X"BBBBBBBB"; sel <= '0'; wait for 10 ns; -- ok then select second 'BBBBBBBB'
        wait;
    end process;
end Behavioral;