library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port (
        ALU_A, ALU_B: in std_logic_vector(15 downto 0);
        Control: in std_logic_vector(3 downto 0);
        Z_flag: out std_logic;
        ALU_C: out std_logic_vector(15 downto 0)
    );
end entity alu;

architecture struct of ALU is
    component adder_16_bit is
        port (
            A, B: in std_logic_vector(15 downto 0);
            S: out std_logic_vector(15 downto 0);
            Cout: out std_logic
        );
    end component;

    component sub_16_bit is
        port (
            A, B: in std_logic_vector(15 downto 0);
            S: out std_logic_vector(15 downto 0);
            Cout: out std_logic
        );
    end component;

    component and_16_bit is
        port (
            A, B: in std_logic_vector(15 downto 0);
            C: out std_logic_vector(15 downto 0)
        );
    end component and_16_bit;

    component or_16_bit is
        port (
            A, B: in std_logic_vector(15 downto 0);
            C: out std_logic_vector(15 downto 0)
        );
    end component or_16_bit;

    component imp_16_bit is
        port (
            A, B: in std_logic_vector(15 downto 0);
            C: out std_logic_vector(15 downto 0)
        );
    end component imp_16_bit;

    component mul_16_bit is
        port (
            A, B: in std_logic_vector(15 downto 0);
            C: out std_logic_vector(15 downto 0)
        );
    end component mul_16_bit;

    signal s1, s2, s3, s4, s8, imm: std_logic_vector(15 downto 0);
    signal s6, s7: std_logic;
    signal s5: std_logic_vector(15 downto 0);
begin
    add_instance: adder_16_bit
        port map (
            A => ALU_A, B => ALU_B, S => s1, Cout => s6
        );
    sub_instance: sub_16_bit
        port map (
            A => ALU_A, B => ALU_B, S => s8, Cout => s7
        );
    and_instance: and_16_bit
        port map (
            A => ALU_A, B => ALU_B, C => s2
        );
    imp_16_instance: imp_16_bit
        port map (
            A => ALU_A, B => ALU_B, C => s3
        );

    or_16_instance: or_16_bit
        port map (
            A => ALU_A, B => ALU_B, C => s4
        );

    mul_16_instance: mul_16_bit
        port map (
            A => ALU_A, B => ALU_B, C => s5
        );

    process(ALU_A, ALU_B, Control)
    begin
        -- Initialize Z_flag to '0' by default
        Z_flag <= '0';

        if Control = "0000" then
            imm <= s1;
            if s1 = "0000000000000000" then
                Z_flag <= '1';
            end if;

        elsif Control = "0010" then
            imm <= s8;
            if s8 = "0000000000000000" then
                Z_flag <= '1';
            end if;

        elsif Control = "0100" then
            imm <= s2;
            if s2 = "0000000000000000" then
                Z_flag <= '1';
            end if;

        elsif Control = "0011" then
            imm <= s3;
            if s3 = "0000000000000000" then
                Z_flag <= '1';
            end if;

        elsif Control = "0101" then
            imm <= s4;
            if s4 = "0000000000000000" then
                Z_flag <= '1';
            end if;

        elsif Control = "0110" then
            imm <= s5;
            if s5 = "0000000000000000" then
                Z_flag <= '1';
            end if;
			else
			imm <="1111111111111111";
			Z_flag <='0';

        end if;
    end process;
	 ALU_C<= imm;
end architecture struct;
