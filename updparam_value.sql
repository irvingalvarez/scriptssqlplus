SET DEFINE ~
set trimspool on
set heading off
set echo on
--set verify off
set linesize 1000
set pagesize 5000
set arraysize 1000
set long 2000000

column mkt new_value mkt;
spool paramvaluesalltlg_23631.txt append
select distinct substr(username,1,3) mkt from all_users where username like '%REFWORK%';
select '**********************************************' from dual;
set feedback on
set heading on

select distinct PARAM_CODE,substr(PRM_VALUE,1,10) PRM_VALUE,substr(PARAM_DESCRIPTION,1,75) PARAM_DESCRIPTION,SYS_UPDATE_DATE,APPLICATION_ID
from ~mkt.refwork1410.param_values
where param_code in ('K266061_ON_OFF_FLAG');

select distinct PARAM_CODE,substr(PRM_VALUE,1,10) PRM_VALUE,substr(PARAM_DESCRIPTION,1,75) PARAM_DESCRIPTION,SYS_UPDATE_DATE,APPLICATION_ID
from ~mkt.refwork1410.param_values
where param_code in ('ALU_CTS_FOR_VOLTE');

select distinct PARAM_CODE,substr(PRM_VALUE,1,10) PRM_VALUE,substr(PARAM_DESCRIPTION,1,75) PARAM_DESCRIPTION,SYS_UPDATE_DATE,APPLICATION_ID
from ~mkt.refwork1410.param_values
where param_code in ('K272146_NONIMS_ON_OFF_FLAG');

set feedback off
commit;
exit;

