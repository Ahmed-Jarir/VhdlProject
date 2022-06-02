--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:07:49 06/02/2022
-- Design Name:   
-- Module Name:   /home/ahmed/CullenNumberCalculator/Simulator.vhd
-- Project Name:  CullenNumberCalculator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NthNumberCalculator
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Simulator IS
END Simulator;
 
ARCHITECTURE behavior OF Simulator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NthNumberCalculator
    PORT(
         N : IN  std_logic_vector(5 downto 0);
			--Nsquare : IN STD_LOGIC_VECTOR (15 downto 0);
         NthTerm : INOUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal N : std_logic_vector(5 downto 0) := (others => '0');
	--signal Nsquare : STD_LOGIC_VECTOR (15 downto 0);

 	--Outputs
   signal NthTerm : std_logic_vector(63 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NthNumberCalculator PORT MAP (
          N => N,
			 --Nsquare => Nsquare,
          NthTerm => NthTerm
        );

   -- Clock process definitions
   --begin
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      -- wait for 100 ns;	
		N <="000010";
		--Nsquare <= shift_left((shift), 2);
      --Nsquare <= std_logic_vector(shift_left(unsigned(Nsquare), 2));


		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
