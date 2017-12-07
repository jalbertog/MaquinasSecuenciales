----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:40:08 12/05/2017 
-- Design Name: 
-- Module Name:    top_uart - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_uart is
	port (
		clk : in std_logic;
		reset: in std_logic;
		rx : in std_logic;
		btn : in std_logic;
		tx_full: out std_logic;
		rx_s_empty: out std_logic;
		tx : out std_logic;
		salida: out STD_LOGIC_VECTOR(7 downto 0);
      MUX   : out STD_LOGIC_VECTOR(3 downto 0)
		);
end top_uart;

architecture Behavioral of top_uart is
signal rx_empty: std_logic;
signal data_to_loop, looped_data : std_logic_vector(7 downto 0); 
signal btn_tick : std_logic;
begin
uart_unit : entity work.uart(Behavioral)
	port map (clk=>clk, reset=>reset, rx=>rx, rd_uart=>btn_tick,
		wr_uart=>btn_tick, w_data => looped_data,
		tx_full=> tx_full, rx_empty => rx_empty,
		r_data => data_to_loop, tx => tx);
		
sieteSeg : entity work.siete_segmentos_completo(Behavioral)
	port map (clk => clk, mostrar => reset, D0=>data_to_loop, D1=>data_to_loop,
				D2=>data_to_loop, D3=>data_to_loop, salida=>salida, MUX=>MUX);
				
btn_db_btn : entity work.debounce(logic)
	port map (clk=>clk, button => btn ,result => btn_tick);
looped_data <= data_to_loop;
rx_s_empty <= rx_empty;
end Behavioral;

