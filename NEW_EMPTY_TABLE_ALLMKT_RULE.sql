set echo off
set heading off
set feedback off
set verify off
set pages 3000
define 2mkt =&2;
select substr(upper('&&2mkt'),1,10) from dual;

prompt  ***The number below depicts the highest current RULE_ID number***
prompt  ***The new RULE_ID must be a value greater than this number***
select  max(RULE_ID) from &2mkt.REF_TAB_RULES;

DEFINE RULE_ID = "&RULE_ID"
DEFINE TABLE_NAME = "&TABLE_NAME"
prompt  ***Who are you? Enter a unique 5-digit code to identify yourself.***
DEFINE YOUR_NAME = "&YOUR_NAME"

SHO USER;
insert into &2mkt.REF_TAB_RULES values ('&RULE_ID', sysdate, null, null, null, '&YOUR_NAME', null, '&TABLE_NAME cannot be empty', 'select count(*) from &TABLE_NAME where rownum < 2', 'N');
insert into &2mkt.REF_TAB_RULES_RESULTS values ('&RULE_ID','0','0', sysdate, null, null, null, '&YOUR_NAME', null, 'E');
insert into &2mkt.REF_TAB_RULES_RESULTS values ('&RULE_ID','1','1000000', sysdate, null, null, null, '&YOUR_NAME', null, 'N');
insert into &2mkt.REF_TAB_RULE_REFNS values ('&TABLE_NAME','&RULE_ID', sysdate, null, null, null, '&YOUR_NAME', null);


commit;

UNDEFINE RULE_ID = "&RULE_ID"
UNDEFINE TABLE_NAME = "&TABLE_NAME"
UNDEFINE YOUR_NAME = "&YOUR_NAME"

exit;
