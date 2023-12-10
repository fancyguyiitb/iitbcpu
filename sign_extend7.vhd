library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extend7 is
	port (ip: in std_logic_vector(8 downto 0); 
	      ex_op: out std_logic_vector(15 downto 0)
			);
end entity sign_extend7;

architecture bhv of sign_extend7 is

	begin
	ex_op <= "1111111" & ip when (ip(8) = '1') else
				"0000000" & ip;
end bhv;