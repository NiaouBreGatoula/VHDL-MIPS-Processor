library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder32_tb is
end Adder32_tb;

architecture Behavioral of Adder32_tb is

    component Adder32
    Port (
        A : in  STD_LOGIC_VECTOR(31 downto 0); -- 32bit
        B : in  STD_LOGIC_VECTOR(31 downto 0); --32bit
        Sum : out  STD_LOGIC_VECTOR(31 downto 0) --32bit
    );
    end component;

    signal A : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal Sum : STD_LOGIC_VECTOR(31 downto 0);

begin

    uut: Adder32 Port Map (
        A => A,
        B => B,
        Sum => Sum
    );

    stim_proc: process
    begin
        A <= X"AAAAAAAA"; --example 1 	binary format: 10101010101010101010101010101010
        B <= X"BBBBBBBB";             --binary format: 10111011101110111011101110111011
        wait for 100 ns;

        A <= X"AAAAAAAA"; --example 2   binary format: 10101010101010101010101010101010
        B <= X"55555556"; -- τωρα εδώ η τυπογραφικό έχει γίνει η επίτιδες,   binary format:  01010101010101010101010101010110
        wait for 100 ns; -- οπως και να έχει θα το μεταφέρω στην περιγραφή (>32bit) 

        wait;
    end process;

end Behavioral;
