/ q tick/gw.q
h_hdb:hopen 5012;
h_rdb:hopen 5011;

/ stored procedure in gateway
/ sd:start date; ed:end date; ids:list of ids or symbols
getTradeData:{[sd;ed;ids]
  hdb:h_hdb(`selectFunc;`trade;sd;ed;ids);
  rdb:h_rdb(`selectFunc;`trade;sd;ed;ids);
  hdb,rdb }

