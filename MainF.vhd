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
-- arithmetic functions with Signed or to_to_to_unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MainF is
    Port ( N0 : in STD_Logic_vector(4 downto 0);
			  jikan : in STD_LOGIC;
			  button_clicked : in STD_LOGIC;
			  sevSeg : out STD_LOGIC_VECTOR (6 downto 0);
			  positionOut : out STD_LOGIC_VECTOR (7 downto 0);
			  N1 : out STD_LOGIC_VECTOR (4 downto 0));
end MainF;

architecture Behavioral of MainF is
	component NthNumberCalculator is
		 Port ( N : in  STD_LOGIC_VECTOR (4 downto 0);
				  NthTerm : inout  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	signal binary : STD_LOGIC_VECTOR (31 downto 0);
	signal Led : STD_LOGIC_VECTOR (55 downto 0):= "11111101111110111111011111101111110111111011111101111110";
	signal position : STD_LOGIC_VECTOR (7 downto 0);
	signal dclock : STD_LOGIC;
	
begin
	
	clock_thing : entity work.clockDiv(Behavioral)
	port map (  clock => jikan,
					clock_div => dclock);
					
	NthTerm : NthNumberCalculator port map (N0, binary);
	N1 <=N0;

	
	
	process(dclock)
	begin
		--if rising_edge(button_clicked) then
				--Led <= "11111101111110111111011111101111110111111011111101111110";
		if rising_edge(dclock) then
			if (button_clicked = '1') then
				case binary is
						when "00000000000000000000000000000001" => Led <= "11111111111111111111111111111111111111111111111111001111";
						when "00000000000000000000000000000011" => Led <= "11111111111111111111111111111111111111111111111110000110";
						when "00000000000000000000000000001001" => Led <= "11111111111111111111111111111111111111111111111110000100";
						when "00000000000000000000000000011001" => Led <= "11111111111111111111111111111111111111111100100100100100";
						when "00000000000000000000000001000001" => Led <= "11111111111111111111111111111111111111111101000000100100";
						when "00000000000000000000000010100001" => Led <= "11111111111111111111111111111111111100111101000001001111";
						when "00000000000000000000000110000001" => Led <= "11111111111111111111111111111111111000011000000000100100";
						when "00000000000000000000001110000001" => Led <= "11111111111111111111111111111111111000000000001000001111";
						when "00000000000000000000100000000001" => Led <= "11111111111111111111111111110010010000000110011000000100";
						when "00000000000000000001001000000001" => Led <= "11111111111111111111111111111001100010000000000010000100";
						when "00000000000000000010100000000001" => Led <= "11111111111111111111110011110000001001001010011001001111";
						when "00000000000000000101100000000001" => Led <= "11111111111111111111100100100010010010010000100100000100";
						when "00000000000000001100000000000001" => Led <= "11111111111111111111110011000000100100111101001000000110";
						when "00000000000000011010000000000001" => Led <= "11111111111111100111100000010100000100110000001000001111";
						when "00000000000000111000000000000001" => Led <= "11111111111111001001000100100000100000011000011110001111";
						when "00000000000001111000000000000001" => Led <= "11111111111111100110000001001001111010010000100101001111";
						
						when "00000000000100000000000000000001" => Led <= "11111111001111000000110011000000000010010000011110001111";
						when "00000000001000100000000000000001" => Led <= "11111110010010001001000100100000000001001000100100100100";
						when "00000000010010000000000000000001" => Led <= "11111111001100000111110011110000000010010000001000000110";
						when "00000000100110000000000000000001" => Led <= "11111110000100000010001000001001111100110000011110000110";
						when "00000001010000000000000000000001" => Led <= "00100100000001000010000011111001111010010000100101001111";
						when "00000010101000000000000000000001" => Led <= "10011001001100000000110011000000001100111100001000000110";
						when "00000101100000000000000000000001" => Led <= "00001000010010001001000011111001100010000000000000000100";
						
						when "11111111111111111111111111111111" => Led <= "11111111111111111111111111111111111011000011110101111010";--error
												
						when others => 									 Led <= "11111101111110111111011111101111110111111011111101111110";
					end case;
					
			end if;
			case position is
				when "11111110" => position <= "11111101";
				positionOut <= "11111101";
				when "11111101" => position <= "11111011";
				positionOut <= "11111011";
				when "11111011" => position <= "11110111";
				positionOut <= "11110111";
				when "11110111" => position <= "11101111";
				positionOut <= "11101111";
				when "11101111" => position <= "11011111";
				positionOut <= "11011111";
				when "11011111" => position <= "10111111";
				positionOut <= "10111111";
				when "10111111" => position <= "01111111";
				positionOut <= "01111111";
				
				when "01111111" => position <= "11111110";
				positionOut <= "11111110";
				
				when others => position <= "11111110";
				positionOut <= "11111110";
			END CASE;
			case position is
				when "11111110" => sevSeg <= led(6  downto  0);
				when "11111101" => sevSeg <= led(13 downto  7);
				when "11111011" => sevSeg <= led(20 downto 14);
				when "11110111" => sevSeg <= led(27 downto 21);
				when "11101111" => sevSeg <= led(34 downto 28);
				when "11011111" => sevSeg <= led(41 downto 35);
				when "10111111" => sevSeg <= led(48 downto 42);
				when "01111111" => sevSeg <= led(55 downto 49);
				when others => sevSeg <= "1111111";
			end case;
		end if;
		
		
	end process;

end Behavioral;