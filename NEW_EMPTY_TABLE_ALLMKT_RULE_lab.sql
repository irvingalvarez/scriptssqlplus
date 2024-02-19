column spooldate new_value date;
select to_char(sysdate,'YYYY_MM_DD_HH24_MI_SS') spooldate from dual;

spool &date._NEW_EMPTY_TABLE_RULE.log

set lines 2000;
set pages 50000;
conn dlsopercon/odls6@p2bl03b
prompt  ***The number below depicts the highest current RULE_ID number***
prompt  ***The new RULE_ID must be a value greater than this number***
select  max(RULE_ID) from REF_TAB_RULES;

DEFINE RULE_ID = "&RULE_ID"
DEFINE TABLE_NAME = "&TABLE_NAME"
prompt  ***Who are you? Enter a unique 5-digit code to identify yourself.***
DEFINE YOUR_NAME = "&YOUR_NAME"

CONN glropercon/glropercon@l2bl66b 
SHO USER;
insert into REF_TAB_RULES values ('&RULE_ID', sysdate, null, null, null, '&YOUR_NAME', null, '&TABLE_NAME cannot be empty', 'select count(*) from &TABLE_NAME where rownum < 2', 'N');
insert into REF_TAB_RULES_RESULTS values ('&RULE_ID','0','0', sysdate, null, null, null, '&YOUR_NAME', null, 'E');
insert into REF_TAB_RULES_RESULTS values ('&RULE_ID','1','1000000', sysdate, null, null, null, '&YOUR_NAME', null, 'N');
insert into REF_TAB_RULE_REFNS values ('&TABLE_NAME','&RULE_ID', sysdate, null, null, null, '&YOUR_NAME', null);


exit
