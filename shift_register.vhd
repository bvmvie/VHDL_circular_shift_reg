--entity mux is
--	port(
--		a, b, sel: in bit;
--		x:out bit
--	);
--end entity;
--architecture rtl of mux is
--begin
--	x <= a when sel='0' else b;
--end architecture;

--entity flipflop is
--	port(
--		clk, d: in bit;
--		q: out bit
--	);
--end entity;
--architecture rtl of flipflop is
--begin
--	process(clk)
--		if (clk'event and clk='1') then
--			q <= d;
--		end if;
--	end process;
--end architecture;

package my_declarations_shift_reg is
	type twod is array(natural range <>, natural range <>) of bit;
end package;	

use work.my_declarations_shift_reg.all;

entity shift_register is
	generic(
		m: positive := 4;
		n: positive := 8
	);
	port(
		clk, load: in bit;
		x: in bit_vector(n-1 downto 0);
		d: in twod(0 to m-1, n-1 downto 0);
		y: out bit_vector(n-1 downto 0)
	);
end entity;
architecture rtl of shift_register is
	signal v: twod(0 to m-1, n-1 downto 0);
	signal u: twod(0 to m, n-1 downto 0);
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
	gen1: for i in 0 to n-1 generate
		u(0,i) <= x(i);
		y(i) <= u(M,i);
	end generate gen1;
	gen2: for i in 0 to m-1 generate
		gen3: for j in n-1 downto 0 generate
			mux1: mux port map (u(i,j), d(i, j), load, v(i, j));
			ff1: flipflop port map (v(i,j), clk, u(i+1,j));
		end generate gen3;
	end generate gen2;
end architecture;