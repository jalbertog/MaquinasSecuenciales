----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:47 10/01/2017 
-- Design Name: 
-- Module Name:    seq1010diagram - Behavioral 
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

entity seq1010diagram is
	Port (x : in STD_LOGIC;
			clk : in STD_LOGIC;
			reset : in STD_LOGIC;
			z : out STD_LOGIC);
end seq1010diagram;

architecture Behavioral of seq1010diagram is
type estados is (A,B,C,D);
signal estado_act,estado_sig : estados;
begin
--- Actualizacion de estado
process (clk,reset)
begin
	if (reset = '1') then
		estado_act <= A;
	elsif (clk'event and clk = '1') then
		estado_act <= estado_sig;
	end if;
end process;

--logica de estado siguiente
process (estado_act,x)
begin 
	case estado_act is
		when A => 
			if x = '0' then
				estado_sig <= A;
			else
				estado_sig <= B;
			end if;
		when B => 
			if x = '0' then
				estado_sig <= C;
			else
				estado_sig <= B;
			end if;
		when C =>
			if x = '0' then
				estado_sig <= A;
			else
				estado_sig <= D;
			end if;
		when D =>
			if x = '0' then
				estado_sig <= C;
			else
				estado_sig <= B;
			end if;
	end case;
end process;

-- logica de salida

z <= '1' when (estado_act = D and x = '0') else '0';

end Behavioral;

