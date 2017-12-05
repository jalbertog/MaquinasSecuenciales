----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:51:29 11/26/2017 
-- Design Name: 
-- Module Name:    uart_rx_top - Behavioral 
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

entity uart_rx_top is
	Port(
		clk : in std_logic;
		reset : in std_logic;
		rx : in std_logic;
		clr_flag : in std_logic;
		--r_data : out std_logic_vector(7 downto 0);
		flag : out std_logic;
		salida: OUT STD_LOGIC_VECTOR(7 downto 0);
      MUX   : OUT STD_LOGIC_VECTOR(3 downto 0));
end uart_rx_top;

architecture Behavioral of uart_rx_top is
signal tick : std_logic;
signal dataIn : std_logic_vector(7 downto 0);
--signal dataOut : std_logic_vector(7 downto 0);
signal rx_done_tick : std_logic;
signal r_data :std_logic_vector(7 downto 0); 
begin
baud_rate_gen : entity work.baud_rate(Behavioral)
	port map (clk=>clk, reset=>reset, tick => tick);

uart_rx_unit : entity work.uart_rx(Behavioral)
	port map (clk=>clk, reset=>reset, rx=>rx, s_tick=> tick,
				rx_done_tick=>rx_done_tick, dout => dataIn);
FlagBuffer : entity work.interface_FlagBuffer(Behavioral)
	port map (clk=>clk, reset=>reset, clr_flag=>clr_flag,
				set_flag=> rx_done_tick, din=>dataIn, dout=>r_data,
				flag => flag);

sieteSeg : entity work.siete_segmentos_completo(Behavioral)
	port map (clk => clk, mostrar => reset, D0=>r_data, D1=>r_data,
				D2=>r_data, D3=>r_data, salida=>salida, MUX=>MUX);

end Behavioral;

