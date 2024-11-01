library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ControlUnit is
    Port (
        Opcode : in STD_LOGIC_VECTOR(5 downto 0);
        RegDst : out STD_LOGIC;
        ALUSrc : out STD_LOGIC;
        MemtoReg : out STD_LOGIC;
        RegWrite : out STD_LOGIC;
        MemRead : out STD_LOGIC;
        MemWrite : out STD_LOGIC;
        Branch : out STD_LOGIC;
        ALUOp : out STD_LOGIC_VECTOR(1 downto 0)
    );
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
    process(Opcode)
    begin
        -- Default values
        RegDst <= '0';
        ALUSrc <= '0';
        MemtoReg <= '0';
        RegWrite <= '0';
        MemRead <= '0';
        MemWrite <= '0';
        Branch <= '0';
        ALUOp <= "00";
        
        case Opcode is
            when "001000" => -- addi
                RegDst <= '0';
                ALUSrc <= '1';
                MemtoReg <= '0';
                RegWrite <= '1';
                MemRead <= '0';
                MemWrite <= '0';
                Branch <= '0';
                ALUOp <= "00"; -- ADD operation
            when "101011" => -- sw
                RegDst <= '0';
                ALUSrc <= '1';
                MemtoReg <= '0';
                RegWrite <= '0';
                MemRead <= '0';
                MemWrite <= '1';
                Branch <= '0';
                ALUOp <= "00"; -- ADD operation (for address calculation)
            when "000101" => -- bne
                RegDst <= '0';
                ALUSrc <= '0';
                MemtoReg <= '0';
                RegWrite <= '0';
                MemRead <= '0';
                MemWrite <= '0';
                Branch <= '1';
                ALUOp <= "01"; -- SUBTRACT operation (for comparison)
            when others =>
                RegDst <= '0';
                ALUSrc <= '0';
                MemtoReg <= '0';
                RegWrite <= '0';
                MemRead <= '0';
                MemWrite <= '0';
                Branch <= '0';
                ALUOp <= "00"; -- Default to ADD operation
        end case;
    end process;
end Behavioral;
