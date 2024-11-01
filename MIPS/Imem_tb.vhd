library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Imem_tb is
end Imem_tb;

architecture Behavioral of Imem_tb is
    signal addr : STD_LOGIC_VECTOR (3 downto 0);
    signal data_out : STD_LOGIC_VECTOR (31 downto 0);

    component Imem
        Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
               data_out : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

begin
    uut: Imem PORT MAP (
          addr => addr,
          data_out => data_out
    );

    stim_proc: process
    begin
        -- tb
        addr <= "0000"; wait for 10 ns;-- mnhmh 0 4bit-its-right!
        addr <= "0001"; wait for 10 ns;-- mnhmh 1
        addr <= "0010"; wait for 10 ns;-- mnhmh 2
        addr <= "0011"; wait for 10 ns;-- mnhmh 3
        addr <= "0100"; wait for 10 ns;-- mnhmh 4
        wait;
    end process;

end Behavioral;
