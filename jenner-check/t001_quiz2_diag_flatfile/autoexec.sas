options obs=100; /* cap input rows for the captured run */

/* sample stand-in for the course-supplied quiz2.q2_diag table */
data QUIZ2.q2_diag;
length hdghraencwid 8 hdgcd $ 8 hraadmdtm 8;
format hraadmdtm datetime20.;
input hdghraencwid hdgcd $ adm :datetime18.;
hraadmdtm = adm;
drop adm;
datalines;
1 I10 15FEB2002:08:00:00
1 E119 20MAR2002:09:30:00
2 I10 01JAN2002:00:00:00
2 J189 12DEC2002:23:59:00
3 I219 05MAY2002:10:00:00
3 I10 31DEC2001:23:00:00
4 E119 01JAN2003:00:00:00
4 I10 09SEP2002:14:00:00
5 K359 17JUL2002:07:15:00
6 I10 22AUG2002:16:45:00
6 I10 23AUG2002:11:00:00
7 J189 02JUN2002:12:00:00
8 E119 14OCT2002:18:30:00
9 K359 30NOV2002:06:00:00
10 I259 11MAR2002:13:20:00
;
run;
