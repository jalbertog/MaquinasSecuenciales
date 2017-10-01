--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:29:01 09/30/2017
-- Design Name:   
-- Module Name:   /home/ghost/Repo_Sistemas_L/MaquinaEstadoTareaUno/seq1100diagram_tb.vhd
-- Project Name:  MaquinaEstadoTareaUno
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seq1100diagram
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
 
ENTITY seq1100diagram_tb IS
END seq1100diagram_tb;
 
ARCHITECTURE behavior OF seq1100diagram_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seq1100diagram
    PORT(
         x : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal z : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seq1100diagram PORT MAP (
          x => x,
          clk => clk,
          reset => reset,
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
       wait for 20 ns;	
      -- insert stimulus here 
		
		
		x <= '1';
		wait for 20 ns;

		x <= '0';
		wait for 20 ns;
		
		x <= '1';
		wait for 20 ns;

		x <= '1';
		wait for 20 ns;

		x <= '0';
		wait for 20 ns;

		x <= '0';
		wait for 20 ns;
		
		x <= '1';
		wait for 20 ns;
		
		x <= '0';
		wait for 20 ns;
		
		x <= '1';
		wait for 20 ns;
		
		x <= '1';
		wait for 20 ns;

		x <= '1';
		wait for 20 ns;

		x <= '0';
		wait for 20 ns;

		x <= '0';
		wait for 20 ns;

		x <= '0';
		wait for 20 ns;
		
		x <= '1';
		wait for 20 ns;

		x <= '0';
		wait for 20 ns;

		x <= '0';
		wait for 20 ns;

		x <= '1';
		wait for 20 ns;

		x <= '1';
		wait for 20 ns;

		x <= '0';
		wait for 20 ns;

		x <= '0';
		wait for 20 ns;

		x <= '1';
		wait for 20 ns;
		

      wait;
   end process;

END;