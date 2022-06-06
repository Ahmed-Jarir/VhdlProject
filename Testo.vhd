
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:19:53 06/02/2022
-- Design Name:   
-- Module Name:   /home/ahmed/CullenNumberCalculator/Testo.vhd
-- Project Name:  CullenNumberCalculator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MainF
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Testo IS
END Testo;
 
ARCHITECTURE behavior OF Testo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MainF
    PORT(
		  N0 : in STD_Logic_vector(5 downto 0);
		  binary : inout  STD_LOGIC_VECTOR (31 downto 0);
		  Led : out STD_LOGIC_VECTOR (55 downto 0));
    END COMPONENT;
    

   --Inputs
	signal N0 : std_logic_vector( 5 downto 0);


   signal binary : std_logic_vector(31 downto 0);

	--BiDirs

	signal Led : STD_LOGIC_VECTOR (55 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MainF PORT MAP (
			 N0 => N0,
          binary => binary,

			 Led => Led
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

		N0 <= "000010";
      wait for 10 ns;		
		N0 <= "000011";
		wait for 50 ns;

      -- insert stimulus here 

      wait;
   end process;

END;