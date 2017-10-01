----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:07:29 10/01/2017 
-- Design Name: 
-- Module Name:    seq1010circuit - Behavioral 
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

entity seq1010circuit is
	Port ( x	: in STD_LOGIC;
			clk : in STD_LOGIC;
			z: out STD_LOGIC);
end seq1010circuit;

architecture Behavioral of seq1010circuit is
signal J0,K0,J1,K1,Q0,Q0N,Q1,Q1N : STD_LOGIC;

component FlipFlopJK
	PORT( J : in std_logic;
			K : in std_logic;
			clk: in std_logic;
			Q : out std_logic;
			Qn: out std_logic);
end component;

begin

J0 <= Q1 or (x);
K0 <= Q1;
J1 <= (not x) and Q0;
K1 <= (Q0 and (not x)) or (x and Q0N);
z <= (not x) and Q1 and Q0N; 

FF0 : FlipFlopJK port map ( J => J0,
									K => K0,
									clk => clk,
									Q => Q0,
									Qn => Q0N);

FF1 : FlipFlopJK port map ( J => J1,
									K => K1,
									clk => clk,
									Q => Q1,
									Qn => Q1N);

end Behavioral;

