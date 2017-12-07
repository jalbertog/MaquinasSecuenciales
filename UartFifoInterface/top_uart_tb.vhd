--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:06:17 12/06/2017
-- Design Name:   
-- Module Name:   /home/agarciat/Documentos/Est/MaquinasSecuenciales/Xilinx/UartComplete/top_uart_tb.vhd
-- Project Name:  UartComplete
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_uart
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
 
ENTITY top_uart_tb IS
END top_uart_tb;
 
ARCHITECTURE behavior OF top_uart_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_uart
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         rx : IN  std_logic;
         tx_full : OUT  std_logic;
         rx_s_empty : OUT  std_logic;
         tx_s_empty : OUT  std_logic;
         tx : OUT  std_logic;
         salida : OUT  std_logic_vector(7 downto 0);
         MUX : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal rx : std_logic := '0';

 	--Outputs
   signal tx_full : std_logic;
   signal rx_s_empty : std_logic;
   signal tx_s_empty : std_logic;
   signal tx : std_logic;
   signal salida : std_logic_vector(7 downto 0);
   signal MUX : std_logic_vector(3 downto 0);
	
	signal i_Data_In: std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant c_BIT_PERIOD : time :=  51200 ns;--104167 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_uart PORT MAP (
          clk => clk,
          reset => reset,
          rx => rx,
          tx_full => tx_full,
          rx_s_empty => rx_s_empty,
          tx_s_empty => tx_s_empty,
          tx => tx,
          salida => salida,
          MUX => MUX
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
   i_Data_In <= "11110101";
    wait for 1 us;
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
