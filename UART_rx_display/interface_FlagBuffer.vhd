----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:03 11/27/2017 
-- Design Name: 
-- Module Name:    interface_FlagBuffer - Behavioral 
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

entity interface_FlagBuffer is
	Generic(W : integer := 8);
	Port( clk 		: in STD_LOGIC;
			reset 	: in STD_LOGIC;
			clr_flag : in STD_LOGIC;
			set_flag : in STD_LOGIC;
			din 		: in STD_LOGIC_VECTOR(W-1 downto 0);
			dout 		: out STD_LOGIC_VECTOR(W-1 downto 0);			
			flag 		: out STD_LOGIC);
end interface_FlagBuffer;

architecture Behavioral of interface_FlagBuffer is

-- declaration signals
signal flag_reg, flag_next : STD_LOGIC;
signal buf_reg, buf_next	: STD_LOGIC_VECTOR(W-1 downto 0);

begin


-- flag and buffer update
process(clk, reset)
begin
	if reset = '1' then
		flag_reg <= '0';
		buf_reg <= (others => '0');
	elsif (clk 'event and clk = '1') then
		flag_reg <= flag_next;
		buf_reg <= buf_next;
	end if;
end process;

-- flag and buffer next state
process(buf_reg, flag_reg, clr_flag, set_flag, din)
begin
	flag_next <= flag_reg;
	buf_next <= buf_reg;
	if(set_flag = '1') then
		flag_next <= '1';
		buf_next <= din;
	elsif(clr_flag = '1') then
		flag_next <= '0';
	end if;
end process;

flag <= flag_reg;
dout <= buf_reg;
end Behavioral;