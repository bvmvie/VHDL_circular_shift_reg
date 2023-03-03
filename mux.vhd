

 Entity mux IS PORT (
 -- khai bao cac bien input va output
	a, b, sel : in bit;
	x: out bit
 );
 end mux;
 
 -- khai bao architecture 
 
 ARCHITECTURE example of mux is
 begin
	x <= a when sel='0' else b;
 END architecture;