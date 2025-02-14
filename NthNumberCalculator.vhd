----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:01:05 06/02/2022 
-- Design Name: 
-- Module Name:    NthNumberCalculator - Behavioral 
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
--use ieee.numeric_std_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NthNumberCalculator is
    Port ( N : in  STD_LOGIC_VECTOR (4 downto 0);
           NthTerm : inout  STD_LOGIC_VECTOR (31 downto 0));
end NthNumberCalculator;

architecture Behavioral of NthNumberCalculator is
	signal temp : STD_LOGIC_VECTOR (23 downto 0);
	signal temp2 : unsigned (23 downto 0) := to_unsigned(1,24);
	signal one : STD_LOGIC_VECTOR (4 downto 0):= "00001";
	--signal sub : STD_LOGIC_VECTOR (5 downto 0);
	constant error : STD_LOGIC_VECTOR (4 downto 0) := "10111";
begin
	--sub <= std_logic_vector(unsigned(N) - unsigned(one));
	process(N)
	begin
	if (n >= error) then
		NthTerm <= "11111111111111111111111111111111";
	else
		temp <= std_logic_vector(shift_left(temp2, to_integer(unsigned(N))));

		NthTerm <= std_logic_vector(resize((unsigned(temp) * unsigned(N)+unsigned(one)), 32));
	end if;


	end process;
end Behavioral;