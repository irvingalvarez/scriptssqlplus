set verify off 
set echo on 
set heading off 
set feedback on 
set pages 3000
define connection=&1;
define market=&2;

column spooldate new_value date;
select to_char(sysdate, 'YYYY_MM_DD_HH24_MI_SS')spooldate from dual;

select TABLE_NAME, MARKET_CODE, SYS_CREATION_DATE, SYS_UPDATE_DATE, COUNT_FOR_FULL, JOB_STATUS
from &connection.ref_tab_refresh where job_status in ('R','D','C') and MARKET_CODE = UPPER('&market');


update &connection.ref_tab_refresh set job_status = 'N' where job_status in ('R','D','C') and MARKET_CODE = UPPER('&market');

exit;
