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
echo '***************************************INREGION MARKETS***************************************'
for i in p2bl06b pmdy12c pmdy14b p2bl26b  
do
case "$i" in
"p2bl06b" ) mkt="okcopercon.";;
"pmdy12c" ) mkt="rgvopercon.";;
"pmdy14b" ) mkt="sanopercon.";;
"p2bl26b" ) mkt="wtxopercon.";;
esac
sqlplus -silent $user@$i @REFTABLENAME_Switch_Flag.sql "$mkt"
done


