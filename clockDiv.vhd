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
	signal count : natural range 0 to (10**3);
begin
	
	process(clock)
	begin

		if rising_edge(clock) then
			count <= count +1;
			if (counter = (10**3)) then
				count <= 0;
				clock_div <= not clock_div;
			end if;
		end if;
	end process;

end Behavioral;

