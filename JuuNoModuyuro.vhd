----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:39 06/05/2022 
-- Design Name: 
-- Module Name:    JuuNoModuyuro - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity JuuNoModuyuro is
    Port ( number : in  std_logic_vector(31 downto 0);
           modo : out  std_logic_vector(3 downto 0));
end JuuNoModuyuro;

architecture Behavioral of JuuNoModuyuro is

	constant ten : integer := 10;
	constant shifta : integer := 15;
	constant tenDivide : unsigned(31 downto 0) := to_unsigned(3276,32);
	signal divido : std_logic_vector(31 downto 0);

begin
	--process (number)
	--begin
	divido <= std_logic_vector(shift_right(resize((unsigned(number) * tenDivide), 32),shifta));
	modo <= std_logic_vector(resize(unsigned(number) - resize((unsigned(divido) * ten), 32),4));
	--end process;
end Behavioral;

