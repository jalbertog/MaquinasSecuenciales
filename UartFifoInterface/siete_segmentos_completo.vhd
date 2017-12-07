library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity siete_segmentos_completo is
    PORT (
        clk , mostrar   : IN  STD_LOGIC;
        D0    : IN  STD_LOGIC_VECTOR(7 downto 0);
        D1    : IN  STD_LOGIC_VECTOR(7 downto 0);
		  D2    : IN  STD_LOGIC_VECTOR(7 downto 0);
		  D3    : IN  STD_LOGIC_VECTOR(7 downto 0);
        salida: OUT STD_LOGIC_VECTOR(7 downto 0);
        MUX   : OUT STD_LOGIC_VECTOR(3 downto 0)
    );
end siete_segmentos_completo;

architecture Behavioral of siete_segmentos_completo is
	COMPONENT clk200Hz IS
		PORT (
		  clk: in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out : out STD_LOGIC
        );
    END COMPONENT;
    
    COMPONENT siete_segmentos IS
		PORT (
            entrada: IN  STD_LOGIC_VECTOR(7 downto 0);
            salida : OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    END COMPONENT;
    
    COMPONENT siete_segmentos_mux IS
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
    END COMPONENT;
    
    signal clk_out : STD_LOGIC := '0';
    signal digito  : STD_LOGIC_VECTOR(7 downto 0);
begin
    clk_i: clk200Hz PORT MAP(
        clk,mostrar, clk_out
    );
    
    mux_i: siete_segmentos_mux PORT MAP(
        clk_out, mostrar, D0, D1, D2, D3, digito, MUX
    );
    
    seg_i: siete_segmentos PORT MAP(
        digito, salida
    );
end Behavioral;