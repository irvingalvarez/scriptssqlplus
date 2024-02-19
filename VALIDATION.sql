set echo off
set heading off
set feedback off
set verify off
set pages 3000
define market1=&1;

select substr(upper('&&market1'),1,10) from dual;
set feedback on
select * from &market1.validation_log; 

set feedback off
select '**********************************************' from dual;

exit;
