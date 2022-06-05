----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:09:17 06/02/2022 
-- Design Name: 
-- Module Name:    MainF - Behavioral 
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

entity MainF is
    Port ( N0 : in STD_Logic_vector(5 downto 0);
			  binary : inout  STD_LOGIC_VECTOR (31 downto 0);
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
end MainF;

architecture Behavioral of MainF is
	component NthNumberCalculator is
		 Port ( N : in  STD_LOGIC_VECTOR (5 downto 0);
				  NthTerm : inout  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	component bcdToLed is
		 Port ( BCD : in  STD_LOGIC_VECTOR (3 downto 0);
				  Led : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;
	component JuuNoModuyuro is
		Port ( number : in  std_logic_vector(31 downto 0);
				 modo : out  std_logic_vector(3 downto 0));
	end component;
	
	constant ten : integer := 10;
	constant shifter : integer := 15;
	constant tenDivide : unsigned(31 downto 0) := to_unsigned(3276,32);
	signal divide0 : std_logic_vector(31 downto 0);
	signal divide1 : std_logic_vector(31 downto 0);
	signal divide2 : std_logic_vector(31 downto 0);
	signal divide3 : std_logic_vector(31 downto 0);
	signal divide4 : std_logic_vector(31 downto 0);
	signal divide5 : std_logic_vector(31 downto 0);
	signal divide6 : std_logic_vector(31 downto 0);

	

begin
	
	NthTerm : NthNumberCalculator port map (N0, binary);

	--process (binary,divide0, BCD0,BCD1,BCD2,BCD3,BCD4,BCD5,BCD6,BCD7)
	--begin
	
	m0 : JuuNoModuyuro port map (binary, BCD0);
	
	divide0 <= std_logic_vector(shift_right(resize((unsigned(binary) * tenDivide), 32),shifter));
	
	m1 : JuuNoModuyuro port map (divide0, BCD1);
	divide1 <= std_logic_vector(shift_right(resize((unsigned(divide0) * tenDivide), 32),shifter));
	
	m2 : JuuNoModuyuro port map (divide1, BCD2);
	divide2 <= std_logic_vector(shift_right(resize((unsigned(divide1) * tenDivide), 32),shifter));
	
	m3 : JuuNoModuyuro port map (divide2, BCD3);
	divide3 <= std_logic_vector(shift_right(resize((unsigned(divide2) * tenDivide), 32),shifter));
	
	m4 : JuuNoModuyuro port map (divide3, BCD4);
	divide4 <= std_logic_vector(shift_right(resize((unsigned(divide3) * tenDivide), 32),shifter));
	
	m5 : JuuNoModuyuro port map (divide4, BCD5);
	divide5 <= std_logic_vector(shift_right(resize((unsigned(divide4) * tenDivide), 32),shifter));
	
	m6 : JuuNoModuyuro port map (divide5, BCD6);
	divide6 <= std_logic_vector(shift_right(resize((unsigned(divide5) * tenDivide), 32),shifter));
	
	m7 : JuuNoModuyuro port map (divide6, BCD7);
	--end process;
	L0 : bcdToLed port map (BCD0,Led0);
	L1 : bcdToLed port map (BCD1,Led1);
	L2 : bcdToLed port map (BCD2,Led2);
	L3 : bcdToLed port map (BCD3,Led3);
	L4 : bcdToLed port map (BCD4,Led4);
	L5 : bcdToLed port map (BCD5,Led5);
	L6 : bcdToLed port map (BCD6,Led6);
	L7 : bcdToLed port map (BCD7,Led7);
	

end Behavioral;