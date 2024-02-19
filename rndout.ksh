#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv
user=`cat ia915e.txt`
who am i
export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls
#export TNS_ADMIN=/tables/home/Dist

date
echo 'Starting synswitch flag job for ALL MARKETS'
mkt=" "
echo '*************************************OUTREGION MARKETS****************************************'
for i in p2bl85b p2bl66b p2bl76b pnca20b p2bl80b p2bl44b p2bl64b p2bl60b  
do
case "$i" in
"p2bl85b" ) mkt="bosopercon.";;
"p2bl66b" ) mkt="glropercon.";;
"p2bl76b" ) mkt="illopercon.";;
"pnca20b" ) mkt="ncaopercon.";;
"p2bl80b" ) mkt="nyropercon.";;
"p2bl44b" ) mkt="pacopercon.";;
"p2bl64b" ) mkt="sneopercon.";;
"p2bl60b" ) mkt="wasopercon.";;
esac
sqlplus -silent $user@$i @REFTABLENAME_Switch_Flag.sql "$mkt"
done
