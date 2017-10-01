----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:21:48 09/30/2017 
-- Design Name: 
-- Module Name:    seq1100circuit - Behavioral 
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

entity seq1100circuit is
    Port ( x : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           z : out  STD_LOGIC);
end seq1100circuit;

architecture Behavioral of seq1100circuit is


	signal D1, Q0, Q1, Q0N, Q1N: STD_LOGIC;
	component FlipflopD
		Port (D   : in STD_LOGIC;
				clk : in STD_LOGIC;
				Q   : out STD_LOGIC;
				Qn  : out STD_LOGIC);
	end component;

begin

	D1 <= (x and Q0) or (Q0 and Q1);
	z <= (not(x)) and Q1 and (not(Q0));

	FF0: FlipflopD port map (D 	=> x,
									 clk	=> clk,
									 Q		=> Q0,
									 Qn	=> Q0N);
									
	FF1: FlipflopD port map (D		=> D1,
									 clk	=> clk,
									 Q		=> Q1,
									 Qn	=> Q1N);
									
end Behavioral;