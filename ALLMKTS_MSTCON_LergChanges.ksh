#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv

# ***********************************************************************

export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

export ORACLE_HOME=/opt/app/oracle/client/11.1.0
export ORACLE_TERM=$TERM
export TNS_ADMIN="/usr/local/oracle/.tnstbls"
export ORACLE_SID=PMDY25A
 export TNS_ADMIN="/etc"
export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

# **********************************************************************

#cd /tables/home/LERG_DATA/VHLERG_CTNINV/

Get_XMKT_ConnStrings () {

   MKT=$1

   dlcode=`whoami`

   #dlcode='jd8296'

   home=`echo /home/$dlcode`

#   typeset -u cuid=$dlcode

   cuid=`echo $dlcode | tr '[:lower:]' '[:upper:]'`

   xmktconn=`grep -i "^$MKT," $home/TLG_${cuid}_ConnStrings.lst`

   XUSER=`echo $xmktconn | awk -F"," '{print $2}'`
   XPSWD=`echo $xmktconn | awk -F"," '{print $3}'`
   XINST=`echo $xmktconn | awk -F"," '{print $4}'`

}

Get_XMKT_ConnStrings XMK

# *****************************************************************


for MKT in AUS COR RGV SAN LAR DLS STL TUL ARK OKC MWR WTX HCL PAC WAS SNE ILL GLR NYR BOS ALH MTZ GPL NWS IND NCA PHI MNY NBI FLP TNK GLF GAC
#for MKT in AUS
do

   dlcode=`whoami`

   home=`echo /home/$dlcode`
   echo $home

 #  typeset -u cuid=$dlcode

   cuid=`echo $dlcode | tr '[:lower:]' '[:upper:]'`

   mktconn=`grep -i "^$MKT," $home/TLG_${cuid}_ConnStrings.lst`

   USER=`echo $mktconn | awk -F"," '{print $2}'`
   PSWD=`echo $mktconn | awk -F"," '{print $3}'`
   INST=`echo $mktconn | awk -F"," '{print $4}'`

   userconn=`echo $USER/$PSWD@$INST`

#   sqlplus -s $userconn @/tables/home/LERG_DATA/VHLERG_CTNINV/NNVH_LERG_CTNINV_Check.sql "$XUSER" "$XPSWD"

sqlplus -s $userconn << SQL

@/tables/home/Login_Scripts/SelectXMKTTLGREF.sql
@/tables/home/Login_Scripts/SelectMKTCODE.sql
-- @/tables/home/Login_Scripts/SelectMKTTLGActive.sql

-- SET DEFINE OFF;

column DB_VER NEW_VALUE DBVER;
select substr(version,1,4) DB_VER from db_version;

column MKT_REF NEW_VALUE MKTREF
select distinct substr(OWNER,1,16) MKT_REF from all_tables where owner like '%REFREADCO&&DBVER%' and owner not like 'X%REFREADCO&&DBVER%';

-- declare DBUSER=&1;
-- declare DBPASS=&2;

set lines 1000
set pages 1000

create database link XLER connect to ${XUSER} identified by ${XPSWD} using 'PMDY25A';

-- select product_type,count(*) from &&XMKTREF..npa_nxx_vh@XLER group by product_type;

set echo off

PROMPT Npa, Nxx with different VH coordinates.

select distinct npa,nxx,rel from tmp_nnvh_lerg_vh_diff@XLER
where  (rel = '&&MKTCOD' or REL in (select related_market from market where billing_id = '1'))
order  by npa,nxx;

PROMPT Npa, Nxx not in CTN_INV

select distinct NPA,NXX,v_coordinate,h_coordinate,rc_abbr_name,rc_state,to_char(effective_date,'DD-MON-YYYY') "VH_EFFDATE"
from   jd8296.tmp_npanxxvhlerg@XLER
where  (npa,nxx) in
(select distinct npa,nxx from tmp_nnvh_lerg_vh_diff@XLER t
 where  (rel = '&&MKTCOD' or REL in (select related_market from market where billing_id = '1'))
 and     not exists (select distinct substr(ctn,1,6) from ctn_inv where substr(ctn,1,6) = t.npa||t.nxx))
 order by to_char(effective_date,'DD-MON-YYYY'),npa,nxx;


create table tmp_nnvh_lerg_thisweekchg as
(select distinct NPA,NXX,v_coordinate,h_coordinate,rc_abbr_name,rc_state,to_char(effective_date,'DD-MON-YYYY') "VH_EFFDATE"
 from    jd8296.tmp_npanxxvhlerg@XLER
 where  (npa,nxx) in
 (select distinct npa,nxx from tmp_nnvh_lerg_vh_diff@XLER t
 where  (rel = '&&MKTCOD' or REL in (select related_market from market where billing_id = '1'))
 and     not exists (select distinct substr(ctn,1,6) from ctn_inv where substr(ctn,1,6) = t.npa||t.nxx)));

insert into jd8296.tmp_nnvh_lerg_thisweekchg@XLER select * from tmp_nnvh_lerg_thisweekchg
where (npa,nxx) not in (select npa,nxx from jd8296.tmp_nnvh_lerg_thisweekchg@XLER);

commit;

PROMPT Npa, Nxx in CTN_INV

select distinct npa,nxx from tmp_nnvh_lerg_vh_diff@XLER t
where  (rel = '&&MKTCOD' or REL in (select related_market from market where billing_id = '1'))
and exists (select distinct substr(ctn,1,6) from ctn_inv where substr(ctn,1,6) = t.npa||t.nxx)
order by npa,nxx;

drop table tmp_nnvh_lerg_thisweekchg;

drop database link XLER;

SET DEFINE ON;
SQL

done
