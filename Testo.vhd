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
		  N0 : IN  std_logic_vector(5 downto 0);
		  binary : INOUT  std_logic_vector(31 downto 0);
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
		  Led7 : out STD_LOGIC_VECTOR (6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
	signal N0 : std_logic_vector( 5 downto 0);


   signal binary : std_logic_vector(31 downto 0);

	--BiDirs
	signal BCD0 : STD_LOGIC_VECTOR (3 downto 0);
	signal BCD1 : STD_LOGIC_VECTOR (3 downto 0);
	signal BCD2 : STD_LOGIC_VECTOR (3 downto 0);
	signal BCD3 : STD_LOGIC_VECTOR (3 downto 0);
	signal BCD4 : STD_LOGIC_VECTOR (3 downto 0);
	signal BCD5 : STD_LOGIC_VECTOR (3 downto 0);
	signal BCD6 : STD_LOGIC_VECTOR (3 downto 0);
	signal BCD7 : STD_LOGIC_VECTOR (3 downto 0);
	
	signal Led0 : STD_LOGIC_VECTOR (6 downto 0);
	signal Led1 : STD_LOGIC_VECTOR (6 downto 0);
	signal Led2 : STD_LOGIC_VECTOR (6 downto 0);
	signal Led3 : STD_LOGIC_VECTOR (6 downto 0);
	signal Led4 : STD_LOGIC_VECTOR (6 downto 0);
	signal Led5 : STD_LOGIC_VECTOR (6 downto 0);
	signal Led6 : STD_LOGIC_VECTOR (6 downto 0);
	signal Led7 : STD_LOGIC_VECTOR (6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MainF PORT MAP (
			 N0 => N0,
          binary => binary,
          BCD0 => BCD0,
			 BCD1 => BCD1,
			 BCD2 => BCD2,
			 BCD3 => BCD3,
			 BCD4 => BCD4,
			 BCD5 => BCD5,
			 BCD6 => BCD6,
			 BCD7 => BCD7,
			 Led0 => Led0,
			 Led1 => Led1,
			 Led2 => Led2,
			 Led3 => Led3,
			 Led4 => Led4,
			 Led5 => Led5,
			 Led6 => Led6,
			 Led7 => Led7
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
