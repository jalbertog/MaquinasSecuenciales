----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:41 11/26/2017 
-- Design Name: 
-- Module Name:    baud_rate - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity baud_rate is
  generic (
		M: integer := 326);
  Port (
		clk, reset : in  STD_LOGIC;
		tick : out  STD_LOGIC);  
end baud_rate;

architecture Behavioral of baud_rate is
constant N: integer := 9;
signal q_reg : unsigned(N-1 downto 0) := (others => '0');
signal q_next : unsigned(N-1 downto 0); 
begin

process(clk,reset)
begin
  if reset ='1' then
		q_reg <= (others=>'0');
  elsif clk'event and clk='1' then--rising_edge(clk) then 
		q_reg <= q_next;
  end if;
end process;
q_next <= (others => '0') when q_reg = (M-1) else q_reg+1;
tick <= '1' when q_reg = 0 else '0';

end Behavioral;