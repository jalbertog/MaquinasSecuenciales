library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.typesPack.all;

entity sort_3x3 is
generic (
vwidth: integer:=8
);
port (
Clk : in std_logic;
RSTn : in std_logic;
w11 : in std_logic_vector(7 downto 0);
w12 : in std_logic_vector(7 downto 0);
w13 : in std_logic_vector(7 downto 0);
w21 : in std_logic_vector(7 downto 0);
w22 : in std_logic_vector(7 downto 0);
w23 : in std_logic_vector(7 downto 0);
w31 : in std_logic_vector(7 downto 0);
w32 : in std_logic_vector(7 downto 0);
w33 : in std_logic_vector(7 downto 0);
DVw : in std_logic;
DVs : out std_logic;
s1 : out std_logic_vector(7 downto 0);
s2 : out std_logic_vector(7 downto 0);
s3 : out std_logic_vector(7 downto 0);
s4 : out std_logic_vector(7 downto 0);
s5 : out std_logic_vector(7 downto 0);
s6 : out std_logic_vector(7 downto 0);
s7 : out std_logic_vector(7 downto 0);
s8 : out std_logic_vector(7 downto 0);
s9 : out std_logic_vector(7 downto 0)
);
end sort_3x3;


architecture Behavioral of sort_3x3 is
begin

	Median_process: process(Clk,RSTn)
	variable w_in : window_pair;
	variable index_min : iterator;
	variable index_max : iterator;
	variable Sum : byte;
	variable umbral : byte;
	begin
	umbral := 105;
	if RSTn = '0' then
		s1 <= (others=>'0');
		s2 <= (others=>'0');
		s3 <= (others=>'0');
		s4 <= (others=>'0');
		s5 <= (others=>'0');
		s6 <= (others=>'0');
		s7 <= (others=>'0');
		s8 <= (others=>'0');
		s9 <= (others=>'0');
		DVs <= '0';
	elsif rising_edge(Clk) then -- Cambiar rising_edge(Clk) por Clk = '1' si es para simular el tb
		if DVw = '1' then
			w_in(0).num := w11;
			w_in(0).peso := 20;
			w_in(1).num := w12;
			w_in(1).peso := 25;
			w_in(2).num := w13;
			w_in(2).peso := 20;
			w_in(3).num := w21;
			w_in(3).peso := 25;
			w_in(4).num := w22;
			w_in(4).peso := 30; --pixel medio
			w_in(5).num := w23;
			w_in(5).peso := 25;
			w_in(6).num := w31;
			w_in(6).peso := 20;
			w_in(7).num := w32;
			w_in(7).peso := 25;
			w_in(8).num := w33;
			w_in(8).peso := 20;

			index_min := 0;
			index_max := 0;
			for i in 1 TO 8 loop
				if w_in(i).num < w_in(index_min).num then
					index_min := i;
				end if;
				if w_in(index_max).num < w_in(i).num then
					index_max := i;
				end if;
			end loop;
		
		if index_max = 0 then
	  		if index_min = 8 then
   				swap(w_in,8,index_max);
  			else
   				swap(w_in,8,index_max);
  				swap(w_in,0,index_min);
			end if;
 	
 		else
  			swap(w_in,0,index_min);
  			swap(w_in,8,index_max);
 		end if;

		index_min := 1;
		index_max := 1;
		for i in 2 TO 7 loop
			if w_in(i).num < w_in(index_min).num then
				index_min := i;
			end if;
			if w_in(index_max).num < w_in(i).num then
				index_max := i;
			end if;
		end loop;
		
		if index_max = 1 then
	  		if index_min = 7  then
   				swap(w_in,7,index_max);
  			else
   				swap(w_in,7,index_max);
  				swap(w_in,1,index_min);
			end if;
 	
 		else
  			swap(w_in,1,index_min);
  			swap(w_in,7,index_max);
 		end if;

		index_min := 2;
		index_max := 2;
		for i in 3 TO 6 loop
			if w_in(i).num < w_in(index_min).num then
				index_min := i;
			end if;
			if w_in(index_max).num < w_in(i).num then
				index_max := i;
			end if;
		end loop;
		
		if index_max = 2 then
	  		if index_min = 6 then
   				swap(w_in,6,index_max);
  			else
   				swap(w_in,6,index_max);
  				swap(w_in,6,index_min);
			end if;
 	
 		else
  			swap(w_in,2,index_min);
  			swap(w_in,6,index_max);
 		end if;

		index_min := 3;
		index_max := 3;
		for i in 4 TO 5 loop
			if w_in(i).num < w_in(index_min).num then
				index_min := i;
			end if;
			if w_in(index_max).num < w_in(i).num then
				index_max := i;
			end if;
		end loop;
		
		if index_max = 3 then
	  		if index_min = 5 then
   				swap(w_in,5,index_max);
  			else
   				swap(w_in,5,index_max);
  				swap(w_in,3,index_min);
			end if;
 	
 		else
  			swap(w_in,3,index_min);
  			swap(w_in,5,index_max);
 		end if;

	--	median <= CONV_STD_LOGIC_VECTOR(w_in(4), 9);
		s1 <= w_in(0).num;
		s2 <= w_in(1).num;
		s3 <= w_in(2).num;
		s4 <= w_in(3).num;
		s5 <= w_in(4).num;
		s6 <= w_in(5).num;
		s7 <= w_in(6).num;
		s8 <= w_in(7).num;
		s9 <= w_in(8).num;
		
		Sum := 0;
		for i in 0 to 8 loop
			Sum := Sum + w_in(i).peso;
			if Sum > umbral then
				s5 <= w_in(i).num;
				exit;
			end if;
		end loop;
		
		DVs <= '1';
		end if;

		if DVw = '1' then
			DVs <= '1';
		end if;

	end if;
		
	end process; 

end Behavioral;