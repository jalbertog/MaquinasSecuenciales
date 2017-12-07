----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:17:37 12/05/2017 
-- Design Name: 
-- Module Name:    uart - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart is
	port (
		clk : in std_logic;
		reset: in std_logic;
		rd_uart: in std_logic;
		wr_uart: in std_logic;
		rx : in std_logic;
		w_data : in std_logic_vector(7 downto 0);
		tx_full, rx_empty : out std_logic;
		r_data : out std_logic_vector(7 downto 0);
		tx : out std_logic
		);
end uart;

architecture Behavioral of uart is
signal tick : std_logic;
signal rx_done_tick: std_logic;
signal tx_fifo_out: std_logic_vector(7 downto 0);
signal rx_data_out: std_logic_vector(7 downto 0);
signal tx_empty , tx_fifo_not_empty : std_logic;
signal tx_done_tick: std_logic;
begin
baud_rate_gen : entity work.baud_rate(Behavioral)
	port map (clk=>clk, reset=>reset, tick => tick);

uart_rx_unit : entity work.uart_rx(Behavioral)
	port map (clk=>clk, reset=>reset, rx=>rx, s_tick=> tick,
				rx_done_tick=>rx_done_tick, dout => rx_data_out);
Fifo_rx_unit : entity work.STD_FIFO(Behavioral)
	port map (CLK=>clk, RST=>reset, WriteEn=>rx_done_tick,
				DataIn=> rx_data_out, ReadEn=> rd_uart, DataOut=>r_data,
				Empty=> rx_empty, Full=>open);

Fifo_tx_unit : entity work.STD_FIFO(Behavioral)
	port map (CLK=>clk, RST=>reset, WriteEn=>wr_uart,
				DataIn=> w_data, ReadEn=> tx_done_tick, DataOut=>tx_fifo_out,
				Empty=> tx_empty, Full=>tx_full);
uart_tx_unit : entity work.uart_tx(Behavioral)
	port map (clk=>clk,reset=>reset,tx_start=> tx_fifo_not_empty,
		s_tick => tick, din=>tx_fifo_out,tx_done_tick => tx_done_tick,
		tx => tx);
		
tx_fifo_not_empty <= not tx_empty;
end Behavioral;

