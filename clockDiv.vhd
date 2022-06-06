----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:18:27 06/06/2022 
-- Design Name: 
-- Module Name:    clockDiv - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clockDiv is
    Port ( clock : in  STD_LOGIC;
           clock_div : out  STD_LOGIC);
end clockDiv;

architecture Behavioral of clockDiv is
	--constant refresh : natural := 10**3;
	constant refresh : natural := 3;
	signal val : STD_LOGIC := '1';
begin
	
	process(clock)
		variable count : natural range 0 to refresh;
	begin

		if rising_edge(clock) then
			count := count +1;
			if (count = refresh/1 - 1) then
				count := 0;
				val <= not val;
			end if;
		end if;
	end process;
	clock_div <= val;

end Behavioral;

