h:neg hopen `$":",first .z.x
syms:`AMD`AMZN`DELL`INTC`NVDA;
prices:syms!45.15 191.10 178.50 128.04 341.30;
n:2;
flag:1;

getmovement:{[s] rand[0.0001]*prices[s]};

getprice:{[s] prices[s]+:rand[1 -1]*getmovement[s]; prices[s]};
getbid:{[s] prices[s]-getmovement[s]};
getask:{[s] prices[s]+getmovement[s]};

.z.ts:{
  s:n?syms;
  $[0<flag mod 10;
    h(".u.upd";`quote;(n#.z.N;s;getbid'[s];getask'[s];n?1000;n?1000)); 
    h(".u.upd";`trade;(n#.z.N;s;getprice'[s];n?1000))];
  flag+:1; };

\t 100

