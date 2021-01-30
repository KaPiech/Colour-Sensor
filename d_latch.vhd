library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity d_latch is
	 port(
	 	 EN : in STD_LOGIC;
	 	 C : in STD_LOGIC;
		 D_D : in STD_LOGIC_VECTOR(3 downto 0);
		 D_J : in STD_LOGIC_VECTOR(3 downto 0);
		 Q_D : out STD_LOGIC_VECTOR(3 downto 0);
		 Q_J : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end d_latch;

--}} End of automatically maintained section

architecture d_latch of d_latch is
begin
	process (C, EN, D_D, D_J)
	begin 
		if C'event and C='1' then
			if EN = '1' then
            Q_D <= D_D;
			Q_J <= D_J;
         	end if;
		end if;
	end process;	
end d_latch;

