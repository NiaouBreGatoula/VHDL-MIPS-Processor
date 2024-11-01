library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile is
    Port ( Clk : in STD_LOGIC;
           RegWrite : in STD_LOGIC;
           ReadReg1 : in STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in STD_LOGIC_VECTOR (31 downto 0);
           ReadData1 : out STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
    type reg_file is array (0 to 15) of STD_LOGIC_VECTOR(31 downto 0);
    signal registers : reg_file := (others => (others => '0'));
begin

    process(Clk)
    begin
        if rising_edge(Clk) then
            if RegWrite = '1' then
                registers(to_integer(unsigned(WriteReg))) <= WriteData;
            end if;
        end if;
    end process;

    ReadData1 <= registers(to_integer(unsigned(ReadReg1)));
    ReadData2 <= registers(to_integer(unsigned(ReadReg2)));

end Behavioral;
