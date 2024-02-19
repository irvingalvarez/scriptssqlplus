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
spool release1610.txt append
select distinct substr(username,1,3) mkt from all_users where username like '%REFWORK%';
select '**********************************************' from dual;
--set feedback on
--set heading on

--select distinct PARAM_CODE,substr(PRM_VALUE,1,10) PRM_VALUE,substr(PARAM_DESCRIPTION,1,75) PARAM_DESCRIPTION,SYS_UPDATE_DATE,APPLICATION_ID from ~mkt.refwork1507.param_values where param_code in ('P281750_CAMPAIGN_FLAG','P281750_MMF1_ON_OFF_FLAG','P281750_ADJ_POP_FLAG','P281750_MMF2_ON_OFF_FLAG','P281750_VELOCITY_FLAG');

--select distinct PARAM_CODE,substr(PRM_VALUE,1,10) PRM_VALUE,substr(PARAM_DESCRIPTION,1,75) PARAM_DESCRIPTION,SYS_UPDATE_DATE,APPLICATION_ID from param_values where param_code in ('P281750_CAMPAIGN_FLAG','P281750_MMF1_ON_OFF_FLAG','P281750_ADJ_POP_FLAG','P281750_MMF2_ON_OFF_FLAG','P281750_VELOCITY_FLAG');
select '9. New Table CRSM_ON_OFF_RULES. PID280914' from dual;

select owner, table_name from all_tables where table_name = 'CRSM_ON_OFF_RULES';

select 'Adding 3 new columns to table INST_RSN_MAP.' from dual;
SELECT COLUMN_NAME, OWNER from all_tab_columns where table_name=upper('INST_RSN_MAP') and owner like '%REF%1607%';
SELECT COLUMN_NAME, OWNER from all_tab_columns where table_name=upper('INST_RSN_MAP') and owner like '%REF%16%' and column_name like '%FORGIVE%' and column_name like '%OVVERIDE%';

select '. Existing column name OVVERIDE_IND is changed to new name OVERRIDE_IND..' from dual;

SELECT COLUMN_NAME, OWNER from all_tab_columns where table_name=upper('INST_RSN_MAP') and owner like '%REF%16%' and column_name like '%OVERRIDE%';
