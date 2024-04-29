/ q tick/rte.q  -p 5013
system"l tick/sym.q"

h_tp:hopen 5010;

lastTrade: `sym xkey 0#trade   //we key by sym as we want to know this on a per sym basis 

upd:{[t;d]  insert[t;d];
            if[t~`trade;              //if the table is trade, then add the data to lastTrade       
                `lastTrade upsert d]};

h_tp"(.u.sub[`;`])";

.u.end:{}