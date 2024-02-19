who am i
export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls
#export TNS_ADMIN=/tables/home/Dist

date
echo 'Starting validation log job for INR2 MARKETS'
mkt=" "
user=`cat ia915e.txt`
echo '*************************************INREGION2 MARKETS****************************************'
num=1
for i in p2bl26b p2bl03b p2bl82b p2bl34b p2bl19b p2bl26b p2bl26b
do
case "$i" in
"p2bl26b" )
case "$num" in
1 ) mkt="ausopercon." num=2;;
2 ) mkt="wtxopercon." num=3;;
3 ) mkt="houopercon." num=1;;
esac;;
"p2bl03b" ) mkt="dlsopercon.";;
"p2bl82b" ) mkt="hclopercon.";;
"p2bl34b" ) mkt="mwropercon.";;
"p2bl19b" ) mkt="stlopercon.";;
esac
sqlplus -silent $user@$i @VALIDATION.sql "$mkt"
done
