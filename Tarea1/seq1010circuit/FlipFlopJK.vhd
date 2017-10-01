----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:04 10/01/2017 
-- Design Name: 
-- Module Name:    FlipFlopJK - Behavioral 
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

entity FlipFlopJK is
	PORT( J : in std_logic;
			K : in std_logic;
			clk: in std_logic;
			Q : out std_logic;
			Qn: out std_logic);
end FlipFlopJK;

architecture Behavioral of FlipFlopJK is

begin
	process(clk)
		variable TMP: std_logic;
	begin
		if(clk='1' and Clk'EVENT) then
			if(J='0' and K='0')then
				TMP:=TMP;
			elsif(J='1' and K='1')then
				TMP:= not TMP;
			elsif(J='0' and K='1')then
				TMP:='0';
			else
				TMP:='1';
			end if;
		end if;
		Q<=TMP;
		Qn <=not TMP;
end PROCESS;


end Behavioral;

