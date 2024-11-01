library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LeftShifter_tb is
end LeftShifter_tb;

architecture Behavioral of LeftShifter_tb is

    component LeftShifter
        Port ( InSig : in STD_LOGIC_VECTOR(31 downto 0);
               OutSig : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    signal InSig : STD_LOGIC_VECTOR(31 downto 0);
    signal OutSig : STD_LOGIC_VECTOR(31 downto 0);

begin

    uut: LeftShifter Port map (
        InSig => InSig,
        OutSig => OutSig
    );

    stim_proc: process
    begin
        -- Είσοδος 0x0FFFFFFF
        InSig <= x"0FFFFFFF";
        wait for 10 ns;
        -- Έλεγχος της εξόδου OutSig (πρέπει να είναι 0x3FFFFFFC)
        assert (OutSig = x"3FFFFFFC")
        report "Test case failed" severity error;
        wait;
    end process;

end Behavioral;

