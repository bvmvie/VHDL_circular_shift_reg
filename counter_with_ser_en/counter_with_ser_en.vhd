entity counter_with_ser_en is
	generic (n: positive := 4);
	port(
		s1, s2, clk: in bit;
		q: out bit_vector(0 to n-1)
	);
end entity;

architecture rtl of counter_with_ser_en is
	signal tqi, tqq: bit_vector(0 to n-1);
	component counter_cell is
		port(
			s1, s2, clk: in bit;
			qi, qq: out bit
		);	
	end component;
begin
	cc1: counter_cell port map (s1, s2, clk, tqi(0), tqq(0));
	gen1: for i in 0 to n-2 generate
		cc2: counter_cell port map (tqi(i), tqq(i), clk, tqi(i+1), tqq(i+1));
	end generate gen1;
	q <= tqq;
end architecture;