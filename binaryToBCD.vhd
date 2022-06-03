----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:09:17 06/02/2022 
-- Design Name: 
-- Module Name:    binaryToBCD - Behavioral 
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

entity binaryToBCD is
    Port ( N0 : in STD_Logic_vector(5 downto 0);
			  binary : inout  STD_LOGIC_VECTOR (63 downto 0);
			  BCD0 : inout  STD_LOGIC_VECTOR (3 downto 0);
			  BCD1 : inout  STD_LOGIC_VECTOR (3 downto 0);
			  BCD2 : inout  STD_LOGIC_VECTOR (3 downto 0);
			  BCD3 : inout  STD_LOGIC_VECTOR (3 downto 0);
           BCD4 : inout  STD_LOGIC_VECTOR (3 downto 0);
			  BCD5 : inout  STD_LOGIC_VECTOR (3 downto 0);
			  BCD6 : inout  STD_LOGIC_VECTOR (3 downto 0);
			  BCD7 : inout  STD_LOGIC_VECTOR (3 downto 0);
			  Led0 : out STD_LOGIC_VECTOR (6 downto 0);
			  Led1 : out STD_LOGIC_VECTOR (6 downto 0);
			  Led2 : out STD_LOGIC_VECTOR (6 downto 0);
			  Led3 : out STD_LOGIC_VECTOR (6 downto 0);
			  Led4 : out STD_LOGIC_VECTOR (6 downto 0);
			  Led5 : out STD_LOGIC_VECTOR (6 downto 0);
			  Led6 : out STD_LOGIC_VECTOR (6 downto 0);
			  Led7 : out STD_LOGIC_VECTOR (6 downto 0));
end binaryToBCD;

architecture Behavioral of binaryToBCD is
	component NthNumberCalculator is
		 Port ( N : in  STD_LOGIC_VECTOR (5 downto 0);
				  NthTerm : inout  STD_LOGIC_VECTOR (63 downto 0));
	end component;
	component bcdToLed is
		 Port ( BCD : in  STD_LOGIC_VECTOR (3 downto 0);
				  Led : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;
	
	signal ten : std_logic_vector(3 downto 0) := "1010";
	signal divide0 : std_logic_vector(63 downto 0);
	signal divide1 : std_logic_vector(63 downto 0);
	signal divide2 : std_logic_vector(63 downto 0);
	signal divide3 : std_logic_vector(63 downto 0);
	signal divide4 : std_logic_vector(63 downto 0);
	signal divide5 : std_logic_vector(63 downto 0);
	signal divide6 : std_logic_vector(63 downto 0);
	signal divide7 : std_logic_vector(63 downto 0);
begin
	NthTerm : NthNumberCalculator port map (N0, binary);
	BCD0 <= std_logic_vector(to_unsigned(to_integer(unsigned(binary)) mod to_integer(unsigned(ten)),4));
	divide0 <= std_logic_vector(to_unsigned(to_integer(unsigned(binary)/unsigned(ten)),64));
	BCD1 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide0)) mod to_integer(unsigned(ten)),4));
	divide1 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide0)/unsigned(ten)),64));
	BCD2 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide1)) mod to_integer(unsigned(ten)),4));
	divide2 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide1)/unsigned(ten)),64));
	BCD3 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide2)) mod to_integer(unsigned(ten)),4));
	divide3 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide2)/unsigned(ten)),64));
	BCD4 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide3)) mod to_integer(unsigned(ten)),4));
	divide4 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide3)/unsigned(ten)),64));
	BCD5 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide4)) mod to_integer(unsigned(ten)),4));
	divide5 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide4)/unsigned(ten)),64));
	BCD6 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide5)) mod to_integer(unsigned(ten)),4));
	divide6 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide5)/unsigned(ten)),64));
	BCD7 <= std_logic_vector(to_unsigned(to_integer(unsigned(divide6)) mod to_integer(unsigned(ten)),4));
	L0 : bcdToLed port map (BCD0,Led0);
	L1 : bcdToLed port map (BCD1,Led1);
	L2 : bcdToLed port map (BCD2,Led2);
	L3 : bcdToLed port map (BCD3,Led3);
	L4 : bcdToLed port map (BCD4,Led4);
	L5 : bcdToLed port map (BCD5,Led5);
	L6 : bcdToLed port map (BCD6,Led6);
	L7 : bcdToLed port map (BCD7,Led7);

end Behavioral;

