library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUControl : in  STD_LOGIC_VECTOR (2 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
    signal Result_int : STD_LOGIC_VECTOR(31 downto 0);
begin
    process(A, B, ALUControl)
        variable A_int, B_int : signed(31 downto 0);
        variable Tmp_Result : signed(31 downto 0);
    begin
        A_int := signed(A);
        B_int := signed(B);
        
        case ALUControl is
            when "000" => -- ADD(prosthesi)
                Tmp_Result := A_int + B_int;
                Result_int <= std_logic_vector(Tmp_Result);
            when "001" => -- SUB(aferesi)
                Tmp_Result := A_int - B_int;
                Result_int <= std_logic_vector(Tmp_Result);
            when "010" => -- AND
                Result_int <= A and B;
            when "011" => -- OR
                Result_int <= A or B;
            when "100" => -- SLT
                if A_int < B_int then
                    Result_int <= (others => '0');
                    Result_int(0) <= '1';
                else
                    Result_int <= (others => '0');
                end if;
            when others =>
                Result_int <= (others => '0');
        end case;
        --i mean why not?
        if Result_int = "00000000000000000000000000000000" then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
        
        Result <= Result_int;
    end process;
end Behavioral;
