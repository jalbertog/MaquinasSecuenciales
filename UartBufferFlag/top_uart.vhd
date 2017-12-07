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
		--clear_falg: in std_logic;
		rx : in std_logic;
		tx : out std_logic;
		tx_done_tick: out std_logic;
		salida: out STD_LOGIC_VECTOR(7 downto 0);
      MUX   : out STD_LOGIC_VECTOR(3 downto 0)
		);
end top_uart;

architecture Behavioral of top_uart is
signal data_to_loop, looped_data : std_logic_vector(7 downto 0); 
signal flag : std_logic;
signal count : std_logic;
signal clear_flag : std_logic;
begin
uart_unit : entity work.uart(Behavioral)
	port map (clk=>clk, reset=>reset, rx=>rx,
		clear_flag => clear_flag,
		wr_uart=>flag, w_data => looped_data,
		r_data => data_to_loop, r_flag=> flag,
		tx_done_tick=> tx_done_tick, tx => tx);
		
sieteSeg : entity work.siete_segmentos_completo(Behavioral)
	port map (clk => clk, mostrar => reset, D0=>data_to_loop, D1=>data_to_loop,
				D2=>data_to_loop, D3=>data_to_loop, salida=>salida, MUX=>MUX);
				
looped_data <= data_to_loop;

	process(clk)
	begin
		if rising_edge(clk) then
			if flag = '1' then
				if count = '0' then
					clear_flag <= '1';
					count <= '1';
				end if;
			elsif count = '1' then
					clear_flag <= '0';
					count <= '0';
			end if;
		end if;
	end process;
end Behavioral;

