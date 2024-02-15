/* EPI5143 Quiz 2 */
/* Nora Szabo */
/* Feburary 19 2024 */

* Create read-only library for quiz 2;
libname QUIZ2 "/home/u63569093/EPI5143/quiz2" ACCESS=READONLY;

/* Question 1 - Create dataset with only admission data from 2002 */

data q2_diag_2002;
set quiz2.q2_diag;
if '01JAN2002'd<=datepart(hraadmdtm)<'01JAN2003'd;
run;

/* Question 2 - Make a variable diag_cat from hdgcd rolled to 3 characters */

data q2_diag_2002_d;
set q2_diag_2002;
diag_cat = substr(hdgcd,1,3);
run;

/* Question 3 - use proc freq to make a frequency table for most to least
frequent diagnosis */

proc freq data=q2_diag_2002_d order=freq;
tables diag_cat;
run;

/* I10 is the most frequent diagnosis */

/* Question 4 - create a variable that is coded 1 for the most frequent
diagnosis and 0 otherwise */
data q2_diag_2002_d;
set q2_diag_2002_d;
I10=0;
if diag_cat="I10" then I10=1; 
run;

/* Question 5 - create a flat file with respect to hdghraencwid
that includes a variable to indicate if the admission includes
the most frequent diagnosis */
Proc means data=q2_diag_2002_d noprint;
class hdghraencwid;
types hdghraencwid;
var I10;
Output out=q2_diag_2002_df max(I10)=I10;
run;

/* Question 6 - create a frequency table for the most frequent diagnosis 
flag */
proc freq data=q2_diag_2002_df;
tables I10;
run;
