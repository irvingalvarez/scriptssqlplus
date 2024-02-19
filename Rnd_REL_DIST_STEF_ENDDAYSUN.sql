set echo off
set verify off
set pages 2000
define connection=&1;
set feedback off

column spooldate new_value date;
select to_char(sysdate,'MM-DD-YY')spooldate  from dual;

column Market new_value MKT;
select substr(upper('&&connection'),1,3)MKT from dual;

select oppar_run_mode,oppar_run_time,oppar_run_date, oppar_job_rec from &connection.oppar where oppar_job_name = 'DISTRIBSTEF' AND OPPAR_JOB_REC = 'ENDDAYSUN';

select oppar_db_request_flag from &connection.oppar_db where oppar_db_job_name = 'DISTRIBSTEF' and OPPAR_DB_JOB_REC = 'ENDDAYSUN'; 

set head off

PROMPT **************************************************************

exit
