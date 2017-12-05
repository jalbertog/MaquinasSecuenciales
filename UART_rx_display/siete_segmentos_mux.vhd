library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity siete_segmentos_mux is 
    PORT (
        clk   : IN  STD_LOGIC;
		  mostrar	: IN	std_logic;
        D0    : IN  STD_LOGIC_VECTOR(7 downto 0);  --Primer digito.
        D1    : IN  STD_LOGIC_VECTOR(7 downto 0);  --Segundo digito.
		  D2    : IN  STD_LOGIC_VECTOR(7 downto 0);
		  D3    : IN  STD_LOGIC_VECTOR(7 downto 0);
        salida: OUT STD_LOGIC_VECTOR(7 downto 0);  --Salida del multiplexor (valor a desplegar).
        MUX   : OUT STD_LOGIC_VECTOR(3 downto 0)   --Valor que define cual digito se va a mostrar.
    );
end siete_segmentos_mux;

architecture Behavioral of siete_segmentos_mux is
    type estados is (rst, v0, v1, v2, v3);
    signal estado : estados;
begin
    visualizadores: process (clk) begin
        if rising_edge(clk) then
			if (mostrar = '0')then
            case estado is
                when v0 =>
                    salida <= D2;--"000001";
                    MUX <= "1110";
                    estado <= v1;
                when v1 =>
                    salida <= D3;--"000001";
                    MUX <= "1101";
                    estado <= v2;
                when v2 =>
                    salida <= D1;
                    MUX <= "1011";
                    estado <= v3;
                when others =>
                    salida <= D0;
                    MUX <= "0111";
                    estado <= v0;
            end case;
				
			else

			           salida <= D0;
                    MUX <= "0111";
                    estado <= v0;
				
			end if;
        end if;
    end process;
end Behavioral;