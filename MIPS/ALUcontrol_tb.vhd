library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALUControlUnit_tb is
end ALUControlUnit_tb;

architecture Behavioral of ALUControlUnit_tb is

    component ALUControlUnit
        Port ( Funct : in STD_LOGIC_VECTOR(5 downto 0);
               ALUop : in STD_LOGIC_VECTOR(1 downto 0);
               ALUControl : out STD_LOGIC_VECTOR(2 downto 0));
    end component;

    signal Funct : STD_LOGIC_VECTOR(5 downto 0);
    signal ALUop : STD_LOGIC_VECTOR(1 downto 0);
    signal ALUControl : STD_LOGIC_VECTOR(2 downto 0);

begin

    uut: ALUControlUnit Port map (
        Funct => Funct,
        ALUop => ALUop,
        ALUControl => ALUControl
    );

    stim_proc: process
    begin
        -- Syndiasmos Funct = 100000, ALUop = 10
        Funct <= "100000";
        ALUop <= "10";
        wait for 10 ns;

        -- Syndiasmos Funct = 100010, ALUop = 10
        Funct <= "100010";
        ALUop <= "10";
        wait for 10 ns;

        -- Syndiasmos Funct = 111111, ALUop = 00
        Funct <= "111111";
        ALUop <= "00";
        wait for 10 ns;

        -- Syndiasmos Funct = 111111, ALUop = 01
        Funct <= "111111";
        ALUop <= "01";
        wait for 10 ns;
        wait;
    end process;

end Behavioral;




