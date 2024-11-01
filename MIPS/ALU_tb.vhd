library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is
    component ALU
        Port ( 
            A : in  STD_LOGIC_VECTOR (31 downto 0);
            B : in  STD_LOGIC_VECTOR (31 downto 0);
            ALUControl : in  STD_LOGIC_VECTOR (2 downto 0);
            Result : out  STD_LOGIC_VECTOR (31 downto 0);
            Zero : out  STD_LOGIC
        );
    end component;

    signal A : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal ALUControl : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal Result : STD_LOGIC_VECTOR (31 downto 0);
    signal Zero : STD_LOGIC;

begin
    uut: ALU Port map (
        A => A,
        B => B,
        ALUControl => ALUControl,
        Result => Result,
        Zero => Zero
    );

    process
    begin
        --5+(-4) working good
        A <= "00000000000000000000000000000101"; -- 5
        B <= "11111111111111111111111111111100"; -- -4
        ALUControl <= "000"; -- ADD
        wait for 10 ns;

--mydebug
        report "A: " & integer'image(to_integer(signed(A))) & 
               ", B: " & integer'image(to_integer(signed(B))) severity note;
        
        --5+(-5) working good
        A <= "00000000000000000000000000000101"; -- 5
        B <= "11111111111111111111111111111011"; -- -5
        ALUControl <= "000"; -- ADD
        wait for 10 ns;
--mydebug
        report "A: " & integer'image(to_integer(signed(A))) & 
               ", B: " & integer'image(to_integer(signed(B))) severity note;

        --7-8 meh den exw idea alla empistevomai to modelsim i think?
        A <= "00000000000000000000000000000111"; -- 7
        B <= "00000000000000000000000000001000"; -- 8
        ALUControl <= "001"; -- SUB
        wait for 10 ns;
--mydebug		
        report "A: " & integer'image(to_integer(signed(A))) & 
               ", B: " & integer'image(to_integer(signed(B))) severity note;

        wait;
    end process;
end Behavioral;
