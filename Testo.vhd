
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
		  jikan : in STD_LOGIC;
		  button_clicked : in STD_LOGIC;
		  sevSeg : out STD_LOGIC_VECTOR (6 downto 0));
    END COMPONENT;
    
	 CONSTANT clock_frequency : INTEGER := 100e6; -- 100 MHz
    CONSTANT clock_period    : TIME    := 1000 ms / clock_frequency;

   --Inputs
	signal N0 : std_logic_vector( 5 downto 0);


   signal button_clicked : std_logic;

	--BiDirs

	signal jikan : STD_LOGIC := '0';
	
	signal sevSeg : STD_LOGIC_VECTOR (6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MainF PORT MAP (
			 N0 => N0,
			 jikan => jikan ,
			 button_clicked => button_clicked,
			 sevSeg => sevSeg
        );

   -- Clock process definitions
	jikan <= NOT jikan AFTER clock_period / 2;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		--jikan <= NOT jikan AFTER clock_period / 2;
		
		N0 <= "010000";
		wait for 50 ns;
		button_clicked <= '1';
		wait for 10 ns;
		button_clicked <= '0';
      wait for 50 ns;		
		N0 <= "000011";
		wait for 50 ns;

      -- insert stimulus here 

      wait;
   end process;

END;