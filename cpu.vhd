library ieee;
use ieee.std_logic_1164.all;

entity CPU is 
	port(clk: in std_logic);
end entity;

architecture completete of CPU is
	
	component FSM is 
	port( opcode:in std_logic_vector(3 downto 0);
--			t1_70:in std_logic_vector(7 downto 0);
--			c_i, z_i, z_in, c_out, z_out:in std_logic;
         z: in std_logic;
			clk:in std_logic;
			output_state: out std_logic_vector(4 downto 0)
		 );
	end component;
	
	component DataPath is
	port(
			clk: in std_logic; state: in std_logic_vector(4 downto 0); 
			--out_c_i, out_z_i, out_z_in, out_c_out, out_z_out: out std_logic;
			--opcode: in std_logic_vector(3 downto 0);
			alu_Co: out std_logic_vector(15 downto 0)
		 );
	end component;
	
	
	signal alu_Co: std_logic_vector(15 downto 0);
	signal state: std_logic_vector(4 downto 0);
	signal opcode: std_logic_vector(3 downto 0);
	signal z: std_logic;
	
	begin
		Main_Data: component Datapath
			port map(clk, state, alu_Co);
			
		Main_FSM: component FSM
			port map(opcode, z, clk, state);
end architecture;