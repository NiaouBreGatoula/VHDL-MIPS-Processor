library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ControlUnit_tb is
end ControlUnit_tb;

architecture Behavioral of ControlUnit_tb is
    component ControlUnit
        Port ( Opcode : in STD_LOGIC_VECTOR(5 downto 0);
               RegDst : out STD_LOGIC;
               ALUSrc : out STD_LOGIC;
               MemtoReg : out STD_LOGIC;
               RegWrite : out STD_LOGIC;
               MemRead : out STD_LOGIC;
               MemWrite : out STD_LOGIC;
               Branch : out STD_LOGIC;
               ALUOp : out STD_LOGIC_VECTOR(1 downto 0));
    end component;

    signal Opcode : STD_LOGIC_VECTOR(5 downto 0);
    signal RegDst : STD_LOGIC;
    signal ALUSrc : STD_LOGIC;
    signal MemtoReg : STD_LOGIC;
    signal RegWrite : STD_LOGIC;
    signal MemRead : STD_LOGIC;
    signal MemWrite : STD_LOGIC;
    signal Branch : STD_LOGIC;
    signal ALUOp : STD_LOGIC_VECTOR(1 downto 0);

begin
    uut: ControlUnit Port map (
        Opcode => Opcode,
        RegDst => RegDst,
        ALUSrc => ALUSrc,
        MemtoReg => MemtoReg,
        RegWrite => RegWrite,
        MemRead => MemRead,
        MemWrite => MemWrite,
        Branch => Branch,
        ALUOp => ALUOp
    );

    stim_proc: process
    begin
        -- εντολή  addi $0, $0, 0
        Opcode <= "001000";
        wait for 10 ns;
        
        -- εντολή sw $6, 0($4)
        Opcode <= "101011";
        wait for 10 ns;
        
        -- εντολη bne $5,$0,L1
        Opcode <= "000101";
        wait for 10 ns;
        wait;
    end process;

end Behavioral;

