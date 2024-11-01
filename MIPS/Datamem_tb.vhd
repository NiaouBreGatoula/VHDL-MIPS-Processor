library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DataMemory_tb is
end DataMemory_tb;

architecture Behavioral of DataMemory_tb is

    component DataMemory
        Port ( Clk : in STD_LOGIC;
               MemWrite : in STD_LOGIC;
               MemRead : in STD_LOGIC;
               Address : in STD_LOGIC_VECTOR (31 downto 0);
               WriteData : in STD_LOGIC_VECTOR (31 downto 0);
               ReadData : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

    signal Clk : STD_LOGIC := '0';
    signal MemWrite : STD_LOGIC := '0';
    signal MemRead : STD_LOGIC := '0';
    signal Address : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal WriteData : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal ReadData : STD_LOGIC_VECTOR (31 downto 0);
    constant clk_period : time := 10 ns;
begin

    uut: DataMemory Port map (
        Clk => Clk,
        MemWrite => MemWrite,
        MemRead => MemRead,
        Address => Address,
        WriteData => WriteData,
        ReadData => ReadData
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
        -- Εγγραφή του 5 στη θέση μνήμης 0
        MemWrite <= '1';
        MemRead <= '0';
        Address <= x"00000000"; --Θέση μνήμης που θα αποθηκευτεί το 5
        WriteData <= x"00000005"; -- ο αριθμός 5
        wait for clk_period;

        -- Εγγραφή του 7 στη θέση μνήμης 1
        Address <= x"00000001"; --Θέση μνήμης που θα αποθηκευτεί το 7
        WriteData <= x"00000007"; -- ο αριθμός 7
        wait for clk_period;

        -- Ανάγνωση από τη θέση μνήμης 0
        MemWrite <= '0';
        MemRead <= '1'; --διαβασε!
        Address <= x"00000000"; --Θέση μνήμης 0
        wait for clk_period;
        wait;
    end process;

end Behavioral;

