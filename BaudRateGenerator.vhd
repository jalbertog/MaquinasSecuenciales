----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:28 12/01/2017 
-- Design Name: 
-- Module Name:    BaudRateGenerator - Behavioral 
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity BaudRateGenerator is 
	generic(
		N: integer:= 8; --number of bits
		M: integer:= 163 --mod M
		);
		
		port(
			clk, reset: in std_logic;
			max_tick: out std_logic;
			q: out std_logic_vector (N-1 downto 0)
			);
		end BaudRateGenerator;
		
		architecture Behavioral of BaudRateGenerator is
			signal r_reg: unsigned (N-1 downto 0);
			signal r_next: unsigned(N-1 downto 0);
		begin
			--State Memory
			process(clk, reset)
			begin
				if (reset = '1') then
					r_reg <= (others => '0');
				elsif (clk'event and clk = '1') then
					r_reg <= r_next;
				end if;
			end process;
			--next-state logic
			r_next <= (others => '0') when r_reg=(M-1) else
						r_reg + 1;
			--output logic
			q <= std_logic_vector(r_reg);
			max_tick <= '1' when r_reg = (M-1) else '0';
			end Behavioral;
			