set verify off
set echo on
set feed on
define connection=&1;
define market=&2;
define tabname=&3;

select  upper('&market') from dual;
select  upper('&tabname') from dual;

insert into &connection.validation_log values (
upper('&tabname'), upper('&market'), sysdate, null, null, null, 'SPC1D', null);

commit;

set feedback off
select '**********************************************' from dual;

exit
