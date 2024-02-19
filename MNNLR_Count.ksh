#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv
who am i
dlcode=`whoami`

curdir=`pwd`

xmktconn=`Get_MktConnStrings.ksh XMK`

TXT_NAME=`date +"%y%m%d"`_MNNLR_PreviousDayCount.txt

sqlplus -s $xmktconn << SQL > $TXT_NAME

@/tables/home/Login_Scripts/SelectXMKTTLGREF.sql
set echo off
sho user

PROMPT Drop and Create table tmp_mnnlr_previousday

drop table tmp_mnnlr_previousday;
create table tmp_mnnlr_previousday as select * from market_npa_nxx_lr;

PROMPT Count in REFWORK - Market_Npa_Nxx_Lr

select count(*) "Market_Npa_Nxx_Lr" from &&XMKTREF..market_npa_nxx_lr;
select count(*) "tmp_mnnlr_previousday" from tmp_mnnlr_previousday;

commit;

exit 

SQL
