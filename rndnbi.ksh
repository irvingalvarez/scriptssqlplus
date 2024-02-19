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

echo '*******************************************NBI MARKET*****************************************'
for i in pnbi36b
do
case "$i" in
"pnbi36b" ) mkt="nbiopercon.";;
esac
sqlplus -silent $user@$i @REFTABLENAME_Switch_Flag.sql "$mkt"
done



