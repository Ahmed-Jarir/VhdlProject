
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:06:39 06/03/2022 
-- Design Name: 
-- Module Name:    bcdToLed - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcdToLed is
    Port ( BCD : in  STD_LOGIC_VECTOR (3 downto 0);
           Led : out  STD_LOGIC_VECTOR (6 downto 0));
end bcdToLed;

architecture Behavioral of bcdToLed is

begin
	process(BCD)
	begin
		case BCD is
			when "0000" => Led <= "0000001";
			when "0001" => Led <= "1001111";
			when "0010" => Led <= "0010010";
			when "0011" => Led <= "0000110";
			when "0100" => Led <= "1001100";
			when "0101" => Led <= "0100100";
			when "0110" => Led <= "0100000";
			when "0111" => Led <= "0001111";
			when "1000" => Led <= "0000000";
			when "1001" => Led <= "0000100";
			when others => Led <= "1111110";
		end case;
	end process;
end Behavioral;