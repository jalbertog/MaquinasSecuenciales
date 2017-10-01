----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:01 09/30/2017 
-- Design Name: 
-- Module Name:    seq1100diagram - Behavioral 
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

entity seq1100diagram is
    Port ( x : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           z : out  STD_LOGIC);
end seq1100diagram;

architecture Behavioral of seq1100diagram is

	type estados is (A, B, C, D);
	signal estado_act, estado_sig : estados;

begin

-- Actualizacion de los estados
	process(clk, reset)
	begin
		if (reset = '1') then
			estado_act <= A;
		elsif (clk'event and clk = '1') then
			estado_act <= estado_sig;
		end if;
	end process;



	-- logica de estado siguiente
	process(estado_act, x)
	begin
		z <= '0'; -- salida por defecto

		case estado_act is

			when A =>
				if x = '0' then
					estado_sig <= A;
				else
					estado_sig <= B;
				end if;

			when B =>
				if x = '0' then
					estado_sig <= A;
				else
					estado_sig <= C;
				end if;

			when C =>
				if x = '0' then
					estado_sig <= D;
				else
					estado_sig <= C;
				end if;

			when D =>
				if x = '0' then
					estado_sig <= A;
					z <= '1'; -- activacion de la salida tipo Mealy
				else
					estado_sig <= B;
				end if;

			end case;
	end process;



end Behavioral;
