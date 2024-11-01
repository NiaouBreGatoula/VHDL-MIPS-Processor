library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Signextension is 
    port(
	    input  :in  std_logic_vector(15 downto 0);
		output :out std_logic_vector(31 downto 0)
    );
end entity;

architecture behavior of Signextension is 

	begin
        process(input) begin 
		    if( input(15)='1') then
			    output(15 downto 0)  <= input(15 downto 0);
				output(31 downto 16) <= "1111111111111111";-- [-] msb 
			else 
			    output(15 downto 0)  <= input(15 downto 0);
				output(31 downto 16) <= "0000000000000000";-- [+] msb
			end if;
		end process;
end architecture;