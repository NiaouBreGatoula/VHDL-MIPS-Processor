library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Signextension_tb is
end Signextension_tb;

architecture Behavioral of Signextension_tb is
    component Signextension
        Port (
            input  : in  STD_LOGIC_VECTOR (15 downto 0);
            output : out STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;

    signal input  : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); -- 16-bit input
    signal output : STD_LOGIC_VECTOR (31 downto 0); -- 32-bit output

begin
    uut: Signextension
        Port map (
            input  => input,
            output => output
        );

    stim_proc: process
    begin
        input <= x"FFFF"; wait for 100 ns; -- 1o paradeigma
        input <= x"AAAA"; wait for 100 ns; -- 2o paradeigma
        input <= x"5555"; wait for 100 ns; -- 3o paradeigma
        wait;
    end process;
end Behavioral;
