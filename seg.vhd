library IEEE;
use IEEE.STD_logic_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;


entity SEG is 
	port(
		D_RED : in STD_logic_Vector(3 downto 0 );
		J_RED : in STD_logic_Vector(3 downto 0 );
		D_GREEN : in STD_logic_Vector(3 downto 0 );
		J_GREEN : in STD_logic_Vector(3 downto 0 );
		D_BLUE : in STD_logic_Vector(3 downto 0 );
		J_BLUE : in STD_logic_Vector(3 downto 0 );
		CE : in STD_logic;
		C : in STD_logic;
		SEG_DATA:  out STD_Logic_vector(6 downto 0);
		ANODE:  out STD_Logic_vector(7 downto 0)
		); 
end SEG;

architecture SEG of SEG is 	  -- modu³ konwertuj¹cy(4 bit na 7SEG) oraz steruj¹cy wyœwietlaczami   
	signal Q : STD_LOGIC_VECTOR(3 downto 0);
	signal AN : STD_LOGIC_VECTOR(7 downto 0);
	
begin
	process(C)				
	begin	
		if C'event and C='1' then
			if CE = '1' then
				case AN is 								 
					when "01111111" => AN <="10111111";  --przesuwanie 0 w prawo(zmiana anody)
										Q <= D_RED;		 --multipleksacja wyjœcia SEG_DATA
					when "10111111" => AN <="11011111";
										Q <= J_RED;
					when "11011111" => AN <="11101111"; 
										Q <= "1111";
					when "11101111" => AN <="11110111";
										Q <= D_GREEN;
					when "11110111" => AN <="11111011";
										Q <= J_GREEN;
					when "11111011" => AN <="11111101";
										Q <= "1111";
					when "11111101" => AN <="11111110";
										Q <= D_BLUE;
					when "11111110" => AN <="01111111";
										Q <= J_BLUE;
					when others => AN <="01111111";
									Q <= D_RED;
				end case;
				
				ANODE <= AN;
				
			end if;
		end if; 
	end process; 	
	
	with Q select							--konwersja 4bit na 7SEG
	SEG_DATA <= 	"1000000" when "0000",	--0
	"1111001" when "0001",	--1
	"0100100" when "0010",	--2	
	"0110000" when "0011",  --3
	"0011001" when "0100",  --4
	"0010010" when "0101",  --5
	"0000010" when "0110",  --6
	"1111000" when "0111",  --7
	"0000000" when "1000",  --8
	"0010000" when "1001",  --9
	"0111111" when "1111",  --  - 
	"0000000" when others;	--when others	
end SEG;		
