library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALUControlUnit is
    Port ( Funct : in STD_LOGIC_VECTOR(5 downto 0);
           ALUop : in STD_LOGIC_VECTOR(1 downto 0);
           ALUControl : out STD_LOGIC_VECTOR(2 downto 0));
end ALUControlUnit;

architecture Behavioral of ALUControlUnit is
begin
    process(Funct, ALUop)
    begin
        case ALUop is
            when "00" =>  -- Loads
                ALUControl <= "010";  --Add operation
            when "01" =>  -- Branch
                ALUControl <= "110";  -- Subtract operation
            when "10" =>
                case Funct is
                    when "100000" =>  -- ADD
                        ALUControl <= "010";  --Add operation
                    when "100010" =>  -- SUB
                        ALUControl <= "110";  -- Subtract operation
                    when others =>
                        ALUControl <= "000";  -- Default (AND operation)
                end case;
            when others =>
                ALUControl <= "000";  -- Defauislt
        end case;
    end process;
end Behavioral;

