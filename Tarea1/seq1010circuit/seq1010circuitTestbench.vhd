--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:23:50 10/01/2017
-- Design Name:   
-- Module Name:   /home/agarciat/Documentos/Est/MaquinasSecuenciales/MaquinasSecuenciales/Tarea1/seq1010circuit/seq1010circuitTestbench.vhd
-- Project Name:  seq1010circuit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seq1010circuit
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
 
ENTITY seq1010circuitTestbench IS
END seq1010circuitTestbench;
 
ARCHITECTURE behavior OF seq1010circuitTestbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seq1010circuit
    PORT(
         x : IN  std_logic;
         clk : IN  std_logic;
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal z : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seq1010circuit PORT MAP (
          x => x,
          clk => clk,
          z => z
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

      wait for 10 ns;
		x <= '0';
		-- Start 1010
      wait for 10 ns;
		x <= '1';

      wait for 10 ns;
		x <= '0';

      wait for 10 ns;
		x <= '1';

      wait for 10 ns;
		x <= '0';
		-- fin 1010 z = 1
      wait for 10 ns;
		x <= '0';
		
		-- Start 1010
      wait for 10 ns;
		x <= '1';

      wait for 10 ns;
		x <= '0';

      wait for 10 ns;
		x <= '1';

      wait for 10 ns;
		x <= '0';
		-- fin 1010 z = 1	

      wait for 10 ns;
		x <= '1';

      wait for 10 ns;
		x <= '0';
		-- fin 1010 (usando el 10 anterior)  z = 1	
      wait;
		
   end process;

END;
