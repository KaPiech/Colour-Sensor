library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity mod_10 is
	 port(
		 CLK : in STD_LOGIC;
		 CLR : in STD_LOGIC;
		 CE : in STD_LOGIC;
		 CE_DET : in STD_LOGIC;
		 FULL : out STD_LOGIC;
		 Q : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end mod_10;


architecture mod_10 of mod_10 is  

signal Q_INT : STD_LOGIC_VECTOR(3 downto 0);

begin

	process (CLR,CLK,CE,CE_DET)		  --licznik modulo 10
	begin
		if CLR='1' then
			Q_INT <= (others =>'0');
		elsif CLK'event and CLK='1' then	
			if CE='1' and CE_DET='1' then
				if 	Q_INT = "0000" then
					FULL<='0';
					Q_INT<=Q_INT+1;
				else
					if 	Q_INT = "1001" then
						Q_INT<=(others =>'0');
						FULL<='1';
					else 
						Q_INT<=Q_INT+1;
					end if;	
				end if;
			end if;	
		end if;
	end process;
	
Q <= Q_INT;

end mod_10;
