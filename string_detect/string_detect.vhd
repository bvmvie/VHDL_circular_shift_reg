library ieee;
use ieee.std_logic_1164.all;

entity string_detect is
	port(
		clk: in std_logic;
		ascii_code: in std_logic_vector(7 downto 0);
		flag: out std_logic := '0');
end entity;

architecture rtl of string_detect is
	type s is (w, V, H, D, L);
	signal str: s := w;
begin
	process(clk, ascii_code)
	begin
		if (rising_edge(clk)) then
			case str is
				when w =>
					if (ascii_code = "01010110") then
						str <= V;
					else
						str <= w;
					end if;
				when V =>
					if (ascii_code = "01001000") then
						str <= H;
					elsif (ascii_code = "01010110") then
						str <= V;
					else
						str <= w;
					end if;
				when H =>
					if (ascii_code = "01000100") then
						str <= D;
					elsif (ascii_code = "01001000") then
						str <= H;
					elsif (ascii_code = "01010110") then
						str <= V;
					else
						str <= w;
					end if;
				when D =>
					if (ascii_code = "01001100") then
						str <= L;
					elsif (ascii_code = "01000100") then
						str <= D;
					elsif (ascii_code = "01010110") then
						str <= V;
					else 
						str <= w;
					end if;
				when L =>
					flag <= '1';
			end case;
		end if;
	end process;
end architecture;