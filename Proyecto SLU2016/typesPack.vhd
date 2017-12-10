library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


package typesPack is
	subtype pixel is STD_LOGIC_VECTOR(7 DOWNTO 0);
	subtype iterator is integer range 0 to 8;
	subtype byte is integer range 0 to 256;
	type real_s is range 0.0 to 1.0;
	type window is array(0 TO 8) of pixel;
	type tupla IS
	 RECORD
		num : pixel;
		peso :  byte;
	 END RECORD;
	type window_pair is array(0 TO 8) of tupla;

 procedure swap (variable list	: inout window_pair; constant  a:in iterator; constant b:in iterator);
end typesPack;

package body typesPack is
  procedure swap (variable list	: inout window_pair; constant  a:in iterator; constant b:in iterator) is
  variable aux: tupla;	
  begin
	if (a/=b) then
		aux := list(a);
		list(a) := list(b);
		list(b) := aux;
	end if;
  end swap;

end typesPack;