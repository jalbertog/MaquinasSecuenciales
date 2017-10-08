--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:03:35 10/07/2017
-- Design Name:   
-- Module Name:   /home/agarciat/Documentos/Est/MaquinasSecuenciales/MaquinasSecuenciales/Tarea2/edgeDetectMealy/edgeDetectTestbench.vhd
-- Project Name:  edgeDetectMealy
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: edge_detect_mealy
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
 
ENTITY edgeDetectTestbench IS
END edgeDetectTestbench;
 
ARCHITECTURE behavior OF edgeDetectTestbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT edge_detect_mealy
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         level : IN  std_logic;
         tick : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal level : std_logic := '0';

 	--Outputs
   signal tick : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: edge_detect_mealy PORT MAP (
          clk => clk,
          reset => reset,
          level => level,
          tick => tick
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      wait for 4 ns;
		level <= '1';
		
		wait for 15 ns;
		level <= '0';

		wait for 8 ns;
		level <= '1';
		
		wait for 10 ns;
		level <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
