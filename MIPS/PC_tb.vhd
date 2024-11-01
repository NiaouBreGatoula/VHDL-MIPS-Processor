
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ProgramCounter_tb is
end ProgramCounter_tb;

architecture Behavioral of ProgramCounter_tb is

    component ProgramCounter
        Port ( Clk : in STD_LOGIC;
               Reset : in STD_LOGIC;
               PCIn : in STD_LOGIC_VECTOR(31 downto 0);
               PCOut : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    signal Clk : STD_LOGIC := '0';
    signal Reset : STD_LOGIC := '0';
    signal PCIn : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal PCOut : STD_LOGIC_VECTOR(31 downto 0);

    constant clk_period : time := 10 ns;

begin

    uut: ProgramCounter Port map (
        Clk => Clk,
        Reset => Reset,
        PCIn => PCIn,
        PCOut => PCOut
    );

    clk_process :process
    begin
        Clk <= '0';
        wait for clk_period/2;
        Clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin
        -- Επαναφορά του PC
        Reset <= '1';
        wait for clk_period;
        Reset <= '0';
        wait for clk_period;

        PCIn <= x"AAAA_BBBB";
        wait for clk_period;


        -- Ανάγνωση του PCOut (0xAAAA_BBBB)
        wait for clk_period;


        PCIn <= x"FFFF_CCCC";
        wait for clk_period;


        -- Ανάγνωση του PCOut (0xFFFF_CCCC)
        wait for clk_period;
        wait;
    end process;

end Behavioral;

