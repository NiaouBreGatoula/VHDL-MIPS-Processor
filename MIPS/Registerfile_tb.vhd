library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterFile_tb is
end RegisterFile_tb;

architecture Behavioral of RegisterFile_tb is

    component RegisterFile
        Port ( Clk : in STD_LOGIC;
               RegWrite : in STD_LOGIC;
               ReadReg1 : in STD_LOGIC_VECTOR (4 downto 0);
               ReadReg2 : in STD_LOGIC_VECTOR (4 downto 0);
               WriteReg : in STD_LOGIC_VECTOR (4 downto 0);
               WriteData : in STD_LOGIC_VECTOR (31 downto 0);
               ReadData1 : out STD_LOGIC_VECTOR (31 downto 0);
               ReadData2 : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

    signal Clk : STD_LOGIC := '0';
    signal RegWrite : STD_LOGIC := '0';
    signal ReadReg1 : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal ReadReg2 : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal WriteReg : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal WriteData : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal ReadData1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ReadData2 : STD_LOGIC_VECTOR (31 downto 0);

    constant clk_period : time := 10 ns;

begin

    uut: RegisterFile Port map (
        Clk => Clk,
        RegWrite => RegWrite,
        ReadReg1 => ReadReg1,
        ReadReg2 => ReadReg2,
        WriteReg => WriteReg,
        WriteData => WriteData,
        ReadData1 => ReadData1,
        ReadData2 => ReadData2
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
	    -- Με σηγκεκριμένη σειρά όπως ζητήτε απο την εκφώνηση
        -- 1/Εγγραφή του 5 στον καταχωρητή $3
        RegWrite <= '1';
        WriteReg <= "00011";
        WriteData <= "00000000000000000000000000000101";
        wait for clk_period;

        -- 2/Εγγραφή του 7 στον καταχωρητή $4
        WriteReg <= "00100";
        WriteData <= "00000000000000000000000000000111";
        wait for clk_period;

        -- 3/Εγγραφή του 9 στον καταχωρητή $5
        WriteReg <= "00101";
        WriteData <= "00000000000000000000000000001001";
        wait for clk_period;

        -- 4/Ανάγνωση των καταχωρητών $3 και $4
        RegWrite <= '0';
        ReadReg1 <= "00011";
        ReadReg2 <= "00100";
        wait for clk_period;

        wait;
    end process;

end Behavioral;
