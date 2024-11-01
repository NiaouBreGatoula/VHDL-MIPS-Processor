library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MIPS_tb is
end MIPS_tb;

architecture behavior of MIPS_tb is
    component MIPS
    port(
        clk : in std_logic;
        reset : in std_logic;
        PC_out : out std_logic_vector(31 downto 0);
        ALU_result : out std_logic_vector(31 downto 0);
        instruction : out std_logic_vector(31 downto 0)
    );
    end component;
--signals
    signal clk : std_logic := '0';
    signal reset : std_logic := '1';
    signal imem_addr : std_logic_vector(3 downto 0) := (others => '0');
    signal imem_data_out : std_logic_vector(31 downto 0);
--memory
    signal PC_out : std_logic_vector(31 downto 0);
    signal ALU_result : std_logic_vector(31 downto 0);
    signal instruction : std_logic_vector(31 downto 0);
--instruction fields-gia kalhterh anagnwsh
    signal opcode : STD_LOGIC_VECTOR(5 downto 0);
    signal rs : STD_LOGIC_VECTOR(4 downto 0);
    signal rt : STD_LOGIC_VECTOR(4 downto 0);
    signal rd : STD_LOGIC_VECTOR(4 downto 0);
    signal shamt : STD_LOGIC_VECTOR(4 downto 0);
    signal funct : STD_LOGIC_VECTOR(5 downto 0);
    signal immediate : STD_LOGIC_VECTOR(15 downto 0);
    signal address : STD_LOGIC_VECTOR(25 downto 0);

    -- 5ns gia 200MHz
    constant clk_period : time := 5 ns;

begin

    uut: MIPS
        port map (
            clk => clk,
            reset => reset,
            PC_out => PC_out,
            ALU_result => ALU_result,
            instruction => instruction
        );
--moirasma bits
    opcode <= instruction(31 downto 26);
    rs <= instruction(25 downto 21);
    rt <= instruction(20 downto 16);
    rd <= instruction(15 downto 11);
    shamt <= instruction(10 downto 6);
    funct <= instruction(5 downto 0);
    immediate <= instruction(15 downto 0);
    address <= instruction(25 downto 0);
  --clock process
    clk_process :process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    --reset clock & gemisma tou mmips me entoles
    stim_proc: process
    begin
	--gia kati ligotero apo <5ns 
        reset <= '1';
        wait for clk_period - 1 ns;
        reset <= '0';
 ---entoles kwdika 1 
        wait for 10 ns;
        imem_addr <= "0000"; wait for 10 ns; imem_data_out <= x"20020000"; -- addi $2, $0, 0
        imem_addr <= "0001"; wait for 10 ns; imem_data_out <= x"20040000"; -- addi $4, $0, 0
        imem_addr <= "0010"; wait for 10 ns; imem_data_out <= x"20030001"; -- addi $3, $0, 1
        imem_addr <= "0011"; wait for 10 ns; imem_data_out <= x"20050003"; -- addi $5, $0, 3
        imem_addr <= "0100"; wait for 10 ns; imem_data_out <= x"00632020"; -- add $6, $3, $0
        imem_addr <= "0101"; wait for 10 ns; imem_data_out <= x"AC860000"; -- sw $6, 0($4)
        imem_addr <= "0110"; wait for 10 ns; imem_data_out <= x"20630001"; -- addi $3, $3, 1
        imem_addr <= "0111"; wait for 10 ns; imem_data_out <= x"20840001"; -- addi $4, $4, 1
        imem_addr <= "1000"; wait for 10 ns; imem_data_out <= x"20A5FFFF"; -- addi $5, $5, -1
        imem_addr <= "1001"; wait for 10 ns; imem_data_out <= x"14A0FFFB"; -- bne $5, $0, L1
        wait for 100 ns;
        wait;
    end process;

end behavior;
