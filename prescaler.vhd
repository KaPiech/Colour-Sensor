library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity prescaler is
	port(
		CLK : in STD_LOGIC;
		CEO : out STD_LOGIC
		);	   
end prescaler;



architecture prescaler of prescaler is

signal DIVIDER: std_logic_vector(19 downto 0);	-- internal divider register 
constant divide_factor: integer := 612500 ;			-- divide factor 612 500
												

begin 
	process (CLK)
	begin
		if CLK'event and CLK = '1' then
				if DIVIDER = (divide_factor-1) then
					DIVIDER <= (others => '0');
				elsif DIVIDER < (divide_factor-1) then
					DIVIDER <= DIVIDER + 1;
				else 
					DIVIDER <= (others => '0');
				end if;
		end if;
	end process;

CEO <= '1' when DIVIDER = (divide_factor-1)  else '0';
	
end prescaler;
