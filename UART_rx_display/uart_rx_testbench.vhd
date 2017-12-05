--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:18:32 11/26/2017
-- Design Name:   
-- Module Name:   /home/agarciat/Documentos/Est/MaquinasSecuenciales/Xilinx/UartReceiverSub/uart_rx_testbench.vhd
-- Project Name:  UartReceiverSub
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: uart_rx_top
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
 
ENTITY uart_rx_testbench IS
END uart_rx_testbench;
 
ARCHITECTURE behavior OF uart_rx_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart_rx_top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         rx : IN  std_logic;
         clr_flag : IN  std_logic;
         r_data : OUT  std_logic_vector(7 downto 0);
         flag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal rx : std_logic := '0';
   signal clr_flag : std_logic := '0';
	signal i_Data_In: std_logic_vector(7 downto 0);

 	--Outputs
   signal r_data : std_logic_vector(7 downto 0);
   signal flag : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant c_BIT_PERIOD : time :=  104167 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart_rx_top PORT MAP (
          clk => clk,
          reset => reset,
          rx => rx,
          clr_flag => clr_flag,
          r_data => r_data,
          flag => flag
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
	i_Data_In <= "01010101";
	reset <= '1';
	rx <= '1';
    wait for 1 us;
	reset <= '0';
    -- Send Start Bit
		rx <= '0';
		wait for c_BIT_PERIOD;

		 -- Send Data Byte
		 for ii in 0 to 7 loop
			rx <= i_Data_In(ii);
			wait for c_BIT_PERIOD;
		 end loop;  -- ii

		 -- Send Stop Bit
		 rx <= '1';
		 wait for c_BIT_PERIOD;

      -- insert stimulus here 

      wait;
   end process;

END;
