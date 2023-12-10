library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity FSM is 
	port( opcode:in std_logic_vector(3 downto 0);
--			t1_70:in std_logic_vector(7 downto 0);
--			c_i, z_i, z_in, c_out, z_out:in std_logic;
         z: in std_logic;
			clk:in std_logic;
			output_state: out std_logic_vector(4 downto 0)
		 );
end entity;

architecture struct of FSM is


--Represents id for each state we we using
constant s1  : std_logic_vector(4 downto 0):= "00001";  
constant s2  : std_logic_vector(4 downto 0):= "00010";
constant s3  : std_logic_vector(4 downto 0):= "00011";
constant s4  : std_logic_vector(4 downto 0):= "00100";
constant s5  : std_logic_vector(4 downto 0):= "00101";
constant s6  : std_logic_vector(4 downto 0):= "00110";
constant s7  : std_logic_vector(4 downto 0):= "00111";
constant s8  : std_logic_vector(4 downto 0):= "01000";
constant s9  : std_logic_vector(4 downto 0):= "01001";  
constant s10 : std_logic_vector(4 downto 0):= "01010";
constant s11 : std_logic_vector(4 downto 0):= "01011";
constant s12 : std_logic_vector(4 downto 0):= "01100";
constant s13 : std_logic_vector(4 downto 0):= "01101";
constant s14 : std_logic_vector(4 downto 0):= "01110";
constant s15 : std_logic_vector(4 downto 0):= "01111";
constant s16 : std_logic_vector(4 downto 0):= "10000";
constant s17 : std_logic_vector(4 downto 0):= "10001";

----Signals which represent present and next state id
signal y_present: std_logic_vector(4 downto 0) :=s1;
signal y_next: std_logic_vector(4 downto 0) :=s1;

begin
		output_state <= y_present;
		
	Moveon: process(clk)
	
	begin
			if(rising_edge(clk)) then
				y_present <= y_next;
			end if;
			
	end process;

	next_state:process(y_present,opcode)
   begin
		case y_present is
		
			when s1=>
				case opcode is
					when "0001" =>		--adi
						y_next<=s5;   

					when "1010" =>      --lw
						y_next<=s15;

					when "1011" =>      --sw
						y_next<=s15;

					when "1000" =>		--lhi
						y_next<=s7;   

					when "1001" =>		--lli
						y_next<=s7;   

					when "1100" =>		--beq
						y_next<=s8;
					
					when "1101" =>		--jal
						y_next<=s11;
					
					when "1111" =>		--jlr
						y_next<=s13;

					when others =>
						y_next<=s2;
				end case;
				
			when s2=>
				y_next <= s3;
			
			when s3=>
				y_next <= s4;

			when s4=>
				y_next <= s1;
				
			when s5=>
				y_next <= s4;
				
			when s7=>
				y_next<=s4;
				
			when s11=> 
				y_next<=s12;

			when s15=> 
				case opcode is
					when "1010" =>  --lw
						y_next<=s16;
					when "1011" =>  --sw
						y_next<=s17;
					when others=>
					   y_next<=s15;
				end case;
				
			when s13=>
				y_next<=s14;
				
			when s8=> 
				if(z='0') then
					y_next<=s9;
				else
					y_next<=s10;
				end if;
			
			when s9=>
				y_next<=s1;
			
			when s10=>
				y_next<=s1;

			when s12=>
				y_next<=s1;

			when s14=>
				y_next<=s1;

			when s16=>
				y_next<=s1;

			when s17=>
				y_next<=s1;
			
				
			when others=>
				y_next<=s1;
				
end case;
end process;
end architecture;