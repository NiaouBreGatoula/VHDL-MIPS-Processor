library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mux2to1_tb is
end Mux2to1_tb;

architecture Behavioral of Mux2to1_tb is

    component Mux2to1
        Port ( A : in STD_LOGIC_VECTOR(4 downto 0);
               B : in STD_LOGIC_VECTOR(4 downto 0);
               Sel : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR(4 downto 0));
    end component;

    signal A : STD_LOGIC_VECTOR(4 downto 0);
    signal B : STD_LOGIC_VECTOR(4 downto 0);
    signal Sel : STD_LOGIC;
    signal Y : STD_LOGIC_VECTOR(4 downto 0);

begin

    uut: Mux2to1 Port map (
        A => A,
        B => B,
        Sel => Sel,
        Y => Y
    );

    stim_proc: process
    begin
        -- ΕΙΣΟΔΟΣ0 = 0x1A, ΕΙΣΟΔΟΣ1 = 0x0B, ΕΠΙΛΟΓΗ = 1
        A <= "11010";  -- 0x1A
        B <= "01011";  -- 0x0B
        Sel <= '1';
        wait for 10 ns;
        assert (Y = "01011") --einai swsth?
        report "Test case 1 failed" severity error; --gia debug 

        -- ΕΙΣΟΔΟΣ0 = 0x1A, ΕΙΣΟΔΟΣ1 = 0x0B, ΕΠΙΛΟΓΗ = 0
        Sel <= '0';
        wait for 10 ns;

        assert (Y = "11010") --eina toso?
        report "Test case 2 failed" severity error; --gia debug 
        wait;
    end process;

end Behavioral;



