--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:50:15 10/28/2017
-- Design Name:   
-- Module Name:   /home/agarciat/Documentos/Est/MaquinasSecuenciales/Xilinx/DivisionCircuit/divTestBench.vhd
-- Project Name:  DivisionCircuit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: divCircuit
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
 
ENTITY divTestBench IS
END divTestBench;
 
ARCHITECTURE behavior OF divTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divCircuit
    PORT(
         clk : IN  std_logic;
			reset : IN std_logic;
         start : IN  std_logic;
         dvsr : IN  std_logic_vector(7 downto 0);
         dvnd : IN  std_logic_vector(7 downto 0);
         ready : OUT  std_logic;
         done_tick : OUT  std_logic;
         quo : OUT  std_logic_vector(7 downto 0);
         rmd : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
	signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal dvsr : std_logic_vector(7 downto 0) := (others => '0');
   signal dvnd : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal ready : std_logic;
   signal done_tick : std_logic;
   signal quo : std_logic_vector(7 downto 0);
   signal rmd : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divCircuit PORT MAP (
          clk => clk,
			 reset => reset,
          start => start,
          dvsr => dvsr,
          dvnd => dvnd,
          ready => ready,
          done_tick => done_tick,
          quo => quo,
          rmd => rmd
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
		start <= '1';
		dvnd <= "00001000";
		dvsr <= "00000010";
      wait for 100 ns;
		start <= '1';
		dvnd <= "00001101"; -- 13/2
		dvsr <= "00000010";
      wait for 100 ns;
		
		start <= '1';  --?
		dvnd <= "01001001";
		dvsr <= "00000110";
      wait for 100 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
