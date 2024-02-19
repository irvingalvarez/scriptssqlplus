set verify off
set echo on
set feed on
define market=&1;
define tabname=&2;

select  upper('&market') from dual;
select  upper('&tabname') from dual;

insert into xmkbopercon.xvalidation_log values (
upper('&tabname'), upper('&market'), sysdate, null, null, null, 'SPC1D', null);

commit;

set feedback off
select '**********************************************' from dual;

exit
