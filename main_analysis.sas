%let user=tordah;
options noxwait;
data _null_;
rc = system("mkdir C:\Users\&user.\sastmp\logs");
put rc=;
run;
options noxwait;
data _null_;
rc = system("mkdir C:\Users\&user.\sastmp\input");
put rc=;
run;
options noxwait;
data _null_;
rc = system("mkdir C:\Users\&user.\sastmp\wk");
put rc=;
run;


%let inp='C:\Users\tordah\sastmp\input';
%let wkd='C:\Users\tordah\sastmp\wk';
%let server=C:\Users\tordah\sastmp\logs;

libname scandat 'K:\SCANDAT\SCANDAT3 Database';
libname scratch 'K:\SCANDAT\User\Torsten\TTI\data';
libname sasout 'K:\SCANDAT\User\Torsten\TTI\output';
libname icddata 'K:\SCANDAT\User\Torsten\TTI\data\icd';

libname save 'K:\SCANDAT\User\Torsten\TTI\data\save';

libname input &inp;
libname wk &wkd;

%put libname tti "%sysfunc(getoption(work))";

proc sql;
create table catnum as select distinct
catnum
from icddata.catlist
;
quit;

* Copy input datasets if they do not exist; 

%macro copyyes();
%if %sysfunc(exist(input.Studybase)) = 0 %then %do;
proc copy in=scratch out=input;
select studybase;
run;
%end;
%if %sysfunc(exist(input.catlist)) = 0 %then %do;
proc copy in=icddata out=input;
select catlist;
run;
%end;
%if %sysfunc(exist(input.Exposures_start_2)) = 0 %then %do;
proc copy in=scratch out=input;
select exposures_start_2;
run;
%end;
%if %sysfunc(exist(input.Outcomes)) = 0 %then %do;
proc copy in=scratch out=input;
select outcomes;
run;
%end;
%if %sysfunc(exist(input.Analysis1)) = 0 %then %do;
proc copy in=scratch out=input;
select Analysis1;
run;
%end;
%if %sysfunc(exist(input.Analysis2)) = 0 %then %do;
proc copy in=scratch out=input;
select Analysis2;
run;
%end;
%if %sysfunc(exist(input.Analysis3)) = 0 %then %do;
proc copy in=scratch out=input;
select Analysis3;
run;
%end;

%if %sysfunc(exist(input.program)) = 0 %then %do;
proc copy in=scratch out=input;
select program_kep;
data input.program;
set input.program_kep;
run;
%end;
%mend;
%copyyes();


data _null_;
    set catnum nobs=count;
    splitcount = round(count/20,1);
    call symput('obscount', splitcount);
    stop;
run;

data wk.dset1
     wk.dset2
     wk.dset3
     wk.dset4
     wk.dset5
     wk.dset6
     wk.dset7
     wk.dset8
	 wk.dset9
	 wk.dset10
	 wk.dset11
	 wk.dset12
	 wk.dset13
	 wk.dset14
	 wk.dset15
	 wk.dset16
	 wk.dset17
	 wk.dset18
	 wk.dset19
	 wk.dset20
     ;
set  catnum;

retain count 1 dset 1;

if dset=1 then output wk.dset1;
else if dset=2 then output wk.dset2;
else if dset=3 then output wk.dset3;
else if dset=4 then output wk.dset4;
else if dset=5 then output wk.dset5;
else if dset=6 then output wk.dset6;
else if dset=7 then output wk.dset7;
else if dset=8 then output wk.dset8;
else if dset=9 then output wk.dset9;
else if dset=10 then output wk.dset10;
else if dset=11 then output wk.dset11;
else if dset=12 then output wk.dset12;
else if dset=13 then output wk.dset13;
else if dset=14 then output wk.dset14;
else if dset=15 then output wk.dset15;
else if dset=16 then output wk.dset16;
else if dset=17 then output wk.dset17;
else if dset=18 then output wk.dset18;
else if dset=19 then output wk.dset19;
else output wk.dset20;

if count=&obscount then do;
count=0;
dset + 1;
end;
count + 1;
keep catnum;
run;

data p1;
set input.program;
Var1=transtrn(var1, '&inp',trim(left("&inp")));
Var1=transtrn(var1, '&wkd',trim(left("&wkd")));
Var1=transtrn(var1, '&server',trim(left("&server")));
if var2=272 then var1='set wk.dset1;';
run;
data p2;
set input.program;
Var1=transtrn(var1, '&inp',trim(left("&inp")));
Var1=transtrn(var1, '&wkd',trim(left("&wkd")));
Var1=transtrn(var1, '&server',trim(left("&server")));
if var2=272 then var1='set wk.dset2;';
run;
data p3;
set input.program;
Var1=transtrn(var1, '&inp',trim(left("&inp")));
Var1=transtrn(var1, '&wkd',trim(left("&wkd")));
Var1=transtrn(var1, '&server',trim(left("&server")));
if var2=272 then var1='set wk.dset3;';
run;
data p4;
set input.program;
Var1=transtrn(var1, '&inp',trim(left("&inp")));
Var1=transtrn(var1, '&wkd',trim(left("&wkd")));
Var1=transtrn(var1, '&server',trim(left("&server")));
if var2=272 then var1='set wk.dset4;';
run;
data p5;
set input.program;
Var1=transtrn(var1, '&inp',trim(left("&inp")));
Var1=transtrn(var1, '&wkd',trim(left("&wkd")));
Var1=transtrn(var1, '&server',trim(left("&server")));
if var2=272 then var1='set wk.dset5;';
run;
data p6;
set input.program;
Var1=transtrn(var1, '&inp',trim(left("&inp")));
Var1=transtrn(var1, '&wkd',trim(left("&wkd")));
Var1=transtrn(var1, '&server',trim(left("&server")));
if var2=272 then var1='set wk.dset6;';
run;
data p7;
set input.program;
Var1=transtrn(var1, '&inp',trim(left("&inp")));
Var1=transtrn(var1, '&wkd',trim(left("&wkd")));
Var1=transtrn(var1, '&server',trim(left("&server")));
if var2=272 then var1='set wk.dset7;';
run;

data p8;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset8;';run;
data p9;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset9;';run;
data p10;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset10;';run;
data p11;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset11;';run;
data p12;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset12;';run;
data p13;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset13;';run;
data p14;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset14;';run;
data p15;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset15;';run;
data p16;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset16;';run;
data p17;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset17;';run;
data p18;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset18;';run;
data p19;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset19;';run;
data p20;set input.program;Var1=transtrn(var1, '&inp',trim(left("&inp")));Var1=transtrn(var1, '&wkd',trim(left("&wkd")));Var1=transtrn(var1, '&server',trim(left("&server")));if var2=272 then var1='set wk.dset20;';run;



filename p1 "&server.\p1.sas" LRECL=256;
 DATA _null_;
 Set p1;
 file p1;
 put var1 1-256 ;
 run;

filename p2 "&server.\p2.sas" LRECL=256;
 DATA _null_;
 Set p2;
 file p2;
 put var1 1-256 ;
 run;
 
 
filename p3 "&server.\p3.sas" LRECL=256;
 DATA _null_;
 Set p3;
 file p3;
 put var1 1-256 ;
 run;
 
 
filename p4 "&server.\p4.sas" LRECL=256;
 DATA _null_;
 Set p4;
 file p4;
 put var1 1-256 ;
 run;
 
 
filename p5 "&server.\p5.sas" LRECL=256;
 DATA _null_;
 Set p5;
 file p5;
 put var1 1-256 ;
 run;
 
filename p6 "&server.\p6.sas" LRECL=256;
 DATA _null_;
 Set p6;
 file p6;
 put var1 1-256 ;
 run;
 
filename p7 "&server.\p7.sas" LRECL=256;
 DATA _null_;
 Set p7;
 file p7;
 put var1 1-256 ;
 run;
 
filename p8 "&server.\p8.sas" LRECL=256;DATA _null_;Set p8;file p8;put var1 1-256 ;run;
filename p9 "&server.\p9.sas" LRECL=256;DATA _null_;Set p9;file p9;put var1 1-256 ;run;
filename p10 "&server.\p10.sas" LRECL=256;DATA _null_;Set p10;file p10;put var1 1-256 ;run;
filename p11 "&server.\p11.sas" LRECL=256;DATA _null_;Set p11;file p11;put var1 1-256 ;run;
filename p12 "&server.\p12.sas" LRECL=256;DATA _null_;Set p12;file p12;put var1 1-256 ;run;
filename p13 "&server.\p13.sas" LRECL=256;DATA _null_;Set p13;file p13;put var1 1-256 ;run;
filename p14 "&server.\p14.sas" LRECL=256;DATA _null_;Set p14;file p14;put var1 1-256 ;run;
filename p15 "&server.\p15.sas" LRECL=256;DATA _null_;Set p15;file p15;put var1 1-256 ;run;
filename p16 "&server.\p16.sas" LRECL=256;DATA _null_;Set p16;file p16;put var1 1-256 ;run;
filename p17 "&server.\p17.sas" LRECL=256;DATA _null_;Set p17;file p17;put var1 1-256 ;run;
filename p18 "&server.\p18.sas" LRECL=256;DATA _null_;Set p18;file p18;put var1 1-256 ;run;
filename p19 "&server.\p19.sas" LRECL=256;DATA _null_;Set p19;file p19;put var1 1-256 ;run;
filename p20 "&server.\p20.sas" LRECL=256;DATA _null_;Set p20;file p20;put var1 1-256 ;run;


systask command "sas &server\p1.sas -MEMSIZE MAX" nowait taskname=p1;
systask command "sas &server\p2.sas -MEMSIZE MAX" nowait taskname=p2;
systask command "sas &server\p3.sas -MEMSIZE MAX" nowait taskname=p3;
systask command "sas &server\p4.sas -MEMSIZE MAX" nowait taskname=p4;
systask command "sas &server\p5.sas -MEMSIZE MAX" nowait taskname=p5;
systask command "sas &server\p6.sas -MEMSIZE MAX" nowait taskname=p6;
systask command "sas &server\p7.sas -MEMSIZE MAX" nowait taskname=p7;
systask command "sas &server\p8.sas -MEMSIZE MAX" nowait taskname=p8;
systask command "sas &server\p9.sas -MEMSIZE MAX" nowait taskname=p9;
systask command "sas &server\p10.sas -MEMSIZE MAX" nowait taskname=p10;
systask command "sas &server\p11.sas -MEMSIZE MAX" nowait taskname=p11;
systask command "sas &server\p12.sas -MEMSIZE MAX" nowait taskname=p12;
systask command "sas &server\p13.sas -MEMSIZE MAX" nowait taskname=p13;
systask command "sas &server\p14.sas -MEMSIZE MAX" nowait taskname=p14;
systask command "sas &server\p15.sas -MEMSIZE MAX" nowait taskname=p15;
systask command "sas &server\p16.sas -MEMSIZE MAX" nowait taskname=p16;
systask command "sas &server\p17.sas -MEMSIZE MAX" nowait taskname=p17;
systask command "sas &server\p18.sas -MEMSIZE MAX" nowait taskname=p18;
systask command "sas &server\p19.sas -MEMSIZE MAX" nowait taskname=p19;
systask command "sas &server\p20.sas -MEMSIZE MAX" nowait taskname=p20;

waitfor _all_ p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20;

proc datasets library=wk;
copy out=save;
run;
quit;



data des_results;
  set wk.pedes2_:;
run;

data des2_results;
  set wk.pedescat2:;
run;


data exp_results;
  set wk.peexp_:; 
run;

data events;
set wk.output_event_:; 
run;

proc sql;
create table final_res_des2 as select
a.*,
b.engcat as catagory
from des2_results a left join icddata.catlist b
on a.catnum=b.catnum;
quit;


proc sql;
create table final_res_des as select
a.*,
b.engcat as catagory
from des_results a left join icddata.catlist b
on a.catnum=b.catnum
where a.parameter = 'max_des';
quit;


proc sql;
create table final_res_exp as select
a.*,
b.engcat as catagory
from exp_results a left join icddata.catlist b
on a.catnum=b.catnum
where a.parameter = 'exposed2';
quit;


proc sql;
create table events2 as select
catnum, count(catnum) as events
from events
group by catnum;
quit;


proc sql;
create table final_des2_events as select
a.*,
b.events
from final_res_des2 a left join events2 b
on a.catnum=b.catnum;
quit;

proc sql;
create table final_des_events as select
a.*,
b.events
from final_res_des a left join events2 b
on a.catnum=b.catnum;
quit;


proc sql;
create table final_exp_events as select
a.*,
b.events
from final_res_exp a left join events2 b
on a.catnum=b.catnum;
quit;



data des_results;
  set wk.pedes2_:;
run;

data descat_results;
  set wk.pedescat2_:;
run;


data exp_results;
  set wk.peexp_:; 
run;

data events;
set wk.output_event_:; 
run;

proc sql;
create table final_res_descat as select
a.*,
b.engcat as catagory
from descat_results a left join icddata.catlist b
on a.catnum=b.catnum
where a.parameter = 'descat';
quit;


proc sql;
create table final_res_des as select
a.*,
b.engcat as catagory
from des_results a left join icddata.catlist b
on a.catnum=b.catnum
where a.parameter = 'max_des';
quit;


proc sql;
create table final_res_exp as select
a.*,
b.engcat as catagory
from exp_results a left join icddata.catlist b
on a.catnum=b.catnum
where a.parameter = 'exposed2';
quit;


proc sql;
create table events2 as select
catnum, count(catnum) as events
from events
group by catnum;
quit;


proc sql;
create table final_descat_events as select
a.*,
b.events
from final_res_descat a left join events2 b
on a.catnum=b.catnum
order by catnum, ClassVal0;
quit;


proc sql;
create table final_des_events as select
a.*,
b.events
from final_res_des a left join events2 b
on a.catnum=b.catnum;
quit;


proc sql;
create table final_exp_events as select
a.*,
b.events
from final_res_exp a left join events2 b
on a.catnum=b.catnum;
quit;




proc multtest inpvalues(ProbChiSq)=final_des_events fdr bonferroni noprint out=final_des_events_multitest;
run;

proc multtest inpvalues(ProbChiSq)=final_exp_events fdr bonferroni noprint out=final_exp_events_multitest;
run;

proc multtest inpvalues(ProbChiSq)=final_descat_events fdr bonferroni noprint out=final_descat_events_multitest;
run;


data descat;
set final_descat_events_multitest;
if fdr_p lt 0.05 and fdr_p ne . and ClassVal0 eq 5;
run;


data exp5;
set final_exp_events_multitest;
if fdr_p lt 0.05 and fdr_p ne .;
run;
