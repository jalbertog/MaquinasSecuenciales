----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:52:12 10/07/2017 
-- Design Name: 
-- Module Name:    edge_detect_mealy - Behavioral 
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

entity edge_detect_mealy is
	Port (
			clk : in std_logic;
			reset: in std_logic;
			level: in std_logic;
			tick: out std_logic );
end edge_detect_mealy;

architecture Behavioral of edge_detect_mealy is
type state_type is (zero,one);
signal state_reg, state_next : state_type;
begin

	process(clk,reset)
	begin
		if (reset='1') then
			state_reg <= zero;
		elsif (clk'event and clk='1') then
			state_reg <= state_next;
		end if;
	end process;
	
	process(state_reg,level)
	begin
		state_next <= state_reg;
		tick <= '0';
		case state_reg is
			when zero=>
				if level='1' then
					state_next <= one;
					tick <= '1';
				end if;
			when one=>
				if level='0' then
					state_next <= zero;
				end if;
		end case;
	end process;

end Behavioral;

