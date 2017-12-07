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
		clear_flag: in std_logic;
		wr_uart: in std_logic;
		rx : in std_logic;
		w_data : in std_logic_vector(7 downto 0);
		r_data : out std_logic_vector(7 downto 0);
		r_flag : out std_logic;
		tx_done_tick : out std_logic;
		tx : out std_logic
		);
end uart;

architecture Behavioral of uart is
signal tick : std_logic;
signal rx_done_tick: std_logic;
signal tx_out: std_logic_vector(7 downto 0);
signal rx_data_out: std_logic_vector(7 downto 0);
signal flag : std_logic;
begin
baud_rate_gen : entity work.baud_rate(Behavioral)
	port map (clk=>clk, reset=>reset, tick => tick);

uart_rx_unit : entity work.uart_rx(Behavioral)
	port map (clk=>clk, reset=>reset, rx=>rx, s_tick=> tick,
				rx_done_tick=>rx_done_tick, dout => rx_data_out);
				
FlagBuffer_rx : entity work.interface_FlagBuffer(Behavioral)
	port map (clk=>clk, reset=>reset, clr_flag=>clear_flag,
				set_flag=> rx_done_tick, din=>rx_data_out, dout=>r_data,
				flag => r_flag);

FlagBuffer_tx : entity work.interface_FlagBuffer(Behavioral)
	port map (clk=>clk, reset=>reset, clr_flag=>clear_flag,
				set_flag=> wr_uart, din=>w_data, dout=>tx_out,
				flag => flag);
uart_tx_unit : entity work.uart_tx(Behavioral)
	port map (clk=>clk,reset=>reset,tx_start=> flag,
		s_tick => tick, din=>tx_out,tx_done_tick => tx_done_tick,
		tx => tx);
		

end Behavioral;

