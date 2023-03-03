

entity counter_cell is
	port(
		s1, s2, clk: in bit;
		qi, qq: out bit
	);
end entity;

architecture rtl of counter_cell is
	signal temp: bit;
begin
	qi <= s1 and s2;
	process (clk)
	begin
		if (clk'event and clk='1') then
			temp <= temp xor (s1 and s2);
		end if;
	end process;
	qq <= temp;
end architecture;