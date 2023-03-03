use work.my_declarations_shift_reg.all;

entity circular_shift is
	generic (
		m: positive := 4;
		n: positive := 8
	);
	port(
		clk, load: in bit;
		d: in twod (0 to m-1, n-1 downto 0);
		q: inout twod (0 to m-1, n-1 downto 0)
	);
end entity;

architecture rtl of circular_shift is
	signal v: twod (0 to m-1, n-1 downto 0);
	component mux is
		port(
			a, b, sel: in bit;
			x: out bit
		);
	end component;
	component flipflop is
		port(
			d, clk: in bit;
			q: out bit
		);
	end component;
begin
	gen1: for i in 0 to m-2 generate
		gen2: for j in n-1 downto 0 generate
			mux1: mux port map (d(i+1, j), q(i, j), load, v(i+1,j));
			ff1 : flipflop port map (v(i, j), clk, q(i, j));
		end generate gen2;
	end generate gen1;
	gen3: for i in n-1 downto 0 generate
		mux2: mux port map (d(0, i), q(m-1, i), v(0, i));
		ff2: flipflop port map (v(m-1, i), clk, q(m-1, i));
	end generate gen3;
end architecture;