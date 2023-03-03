 --------------------------------
 ENTITY flipflop IS
 PORT (d, clk: IN BIT;
 q: OUT BIT);
 END ENTITY;
 --------------------------------
 ARCHITECTURE arch OF flipflop IS
 BEGIN
 PROCESS (clk)
 BEGIN
 IF clk'EVENT AND clk='1' THEN
 q <= d;
 END IF;
 END PROCESS ;
 END ARCHITECTURE;
