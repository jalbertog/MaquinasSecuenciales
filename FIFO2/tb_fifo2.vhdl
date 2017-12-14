--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:13:01 12/02/2017
-- Design Name:   
-- Module Name:   C:/VHDL/Fifo/tb_fifo.vhd
-- Project Name:  Fifo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fifo
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
 
ENTITY tb_fifo IS
END tb_fifo;
 
ARCHITECTURE behavior OF tb_fifo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fifo
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         rd : IN  std_logic;
         wr : IN  std_logic;
         w_data : IN  std_logic_vector(7 downto 0);
         empty : OUT  std_logic;
         full : OUT  std_logic;
         r_data : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal rd : std_logic := '0';
   signal wr : std_logic := '0';
   signal w_data : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal empty : std_logic;
   signal full : std_logic;
   signal r_data : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fifo PORT MAP (
          clk => clk,
          reset => reset,
          rd => rd,
          wr => wr,
          w_data => w_data,
          empty => empty,
          full => full,
          r_data => r_data
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		
		
		
   end process;
 
 	-- Reset process
	rst_proc : process
	begin
	wait for clk_period * 5;
		
		reset <= '1';
		
		wait for clk_period * 5;
		
		reset <= '0';
		
		wait;
	end process;

   -- Stimulus process
   stim_proc: process
   variable counter : unsigned (7 downto 0) := (others => '0');
   
   begin		

      wait for clk_period*10;

      -- insert stimulus here 
		

		for i in 1 to 20 loop
			counter := counter + 1;
			
			w_data <= std_logic_vector(counter);
			
			wait for clk_period * 1;
			
			wr <= '1';
			
			wait for clk_period * 1;
		
			wr <= '0';
		end loop;
		
		wait for clk_period * 5;
		
		for i in 1 to 20 loop
		
			counter := counter + 1;
			
			w_data <= std_logic_vector(counter);
			
			wait for clk_period * 1;
			
			wr <= '1';
			
			wait for clk_period * 1;
			
			wr <= '0';
		end loop;
		
		wait;
	end process;
	
	-- Read process
	rd_proc : process
	begin
		wait for clk_period * 20;
			
		rd <= '1';
		
		wait for clk_period * 10;
		
		rd <= '0';
		
		wait for clk_period * 20;
		
		rd <= '1';
		
		
		

      wait;
   end process;

END;
