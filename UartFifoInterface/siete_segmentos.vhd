library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity siete_segmentos is
    PORT (
        entrada: IN  STD_LOGIC_VECTOR(7 downto 0);
        salida : OUT STD_LOGIC_VECTOR(7 downto 0)
    );
end siete_segmentos;

architecture Behavioral of siete_segmentos is
begin
    visualizador: process (entrada) begin
        case entrada is
            when "00110000" =>  salida <= x"C0"; -- 0
            when "00110001" =>  salida <= x"F9"; -- 1
            when "00110010" =>  salida <= x"A4"; -- 2
            when "00110011" =>  salida <= x"B0"; -- 3
            when "00110100" =>  salida <= x"99"; -- 4
            when "00110101" =>  salida <= x"92"; -- 5
            when "00110110" =>  salida <= x"82"; -- 6
            when "00110111" =>  salida <= x"F8"; -- 7
            when "00111000" =>  salida <= x"80"; -- 8
            when "00111001" =>  salida <= x"98"; -- 9
            when "01000001" =>  salida <= x"88"; -- A
            when "01000010" =>  salida <= x"83"; -- B
            when "01000011" =>  salida <= x"C6"; -- C
            when "01000100" =>  salida <= x"A1"; -- D
            when "01000101" =>  salida <= x"86"; -- E
            when "01000110" =>  salida <= x"8E"; -- F
            when "01000111" =>  salida <= x"90"; -- G
            when "01001000" =>  salida <= x"89"; -- H
            when "01001001" =>  salida <= x"E6"; -- I
            when "01001010" =>  salida <= x"E1"; -- J
            when "01001011" =>  salida <= x"85"; -- K
            when "01001100" =>  salida <= x"C7"; -- L
            when "01001101" =>  salida <= x"C8"; -- M
            when "01001110" =>  salida <= x"AB"; -- N
            when "01001111" =>  salida <= x"C0"; -- O
            when "01010000" =>  salida <= x"8C"; -- P
            when "01010001" =>  salida <= x"98"; -- Q
            when "01010010" =>  salida <= x"AF"; -- R
            when "01010011" =>  salida <= x"92"; -- S
            when "01010100" =>  salida <= x"87"; -- T
            when "01010101" =>  salida <= x"E3"; -- U
            when "01010110" =>  salida <= x"C1"; -- V
            when "01010111" =>  salida <= x"E2"; -- W
            when "01011000" =>  salida <= x"8F"; -- X
            when "01011001" =>  salida <= x"91"; -- Y
            when "01011010" =>  salida <= x"B6"; -- Z
            when "00101101" =>  salida <= x"BF"; -- -
            when "01011111" =>  salida <= x"F7"; -- _
            when "00101110" =>  salida <= x"7F"; -- .
            when others   =>  salida <= x"FF"; -- Nada
        end case;
    end process;
end Behavioral;