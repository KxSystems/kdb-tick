quote:([]time:`timespan$();sym:`symbol$();bid:`float$();ask:`float$();bsize:`int$();asize:`int$())

\l tick/u.q

.u.init[];

.u.snap:{0#quote};

.u.end:{};

lst:0#quote;

upd:{lst::-1#y};

.z.ts:{if[count lst;.u.pub[`quote;update time:.z.N from lst]]};
\t 16

(hopen `$":",.z.x 0)"(.u.sub[`quote;`AMD];`.u `i`L)";

