library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity Edge_detector is
	 port(
		 CLK : in STD_LOGIC;	   -- clk 100...300Hz
		 Sensor : in STD_LOGIC;	   -- pushbutton entry
		 CLR : in STD_LOGIC;	   -- clear
		 PE : out STD_LOGIC        -- debounced output	
	     );
end Edge_detector;



architecture Edge_detector of Edge_detector is

signal DELAY : std_logic_vector(2 downto 0);		-- debounce register

begin
	process(CLK, CLR)
	begin

		if CLR = '1' then
			DELAY <= (others => '0');
		elsif CLK'event and CLK = '1' then
				DELAY <= DELAY(1 downto 0) & Sensor;	-- shift register
		end if;
	end process;
	
PE <= '1' when DELAY = "001" else '0';
	
end Edge_detector;
