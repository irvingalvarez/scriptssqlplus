who am i
export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls
#export TNS_ADMIN=/tables/home/Dist

date
echo 'Starting validation log job for ALL INREGION MARKETS'
mkt=" "
user=`cat ia915e.txt`
echo '*************************************INREGION MARKETS****************************************'
num=1
for i in p2bl06b p2bl26b pmdy12c p2bl03b p2bl82b pmdy14b p2bl34b p2bl06b pmdy12c pmdy14b p2bl19b p2bl06b p2bl26b p2bl26b
do
case "$i" in
"p2bl06b" )
case "$num" in
1 ) mkt="arkopercon." num=2;;
5 ) mkt="okcopercon." num=6;;
8 ) mkt="tulopercon." num=9;;
esac;;
"pmdy12c" )
case "$num" in
3 ) mkt="coropercon." num=4;;
6 ) mkt="rgvopercon." num=7;;
esac;;
"pmdy14b" )
case "$num" in
4 ) mkt="laropercon." num=5;;
7 ) mkt="sanopercon." num=8;;
esac;;
"p2bl26b" )
case "$num" in
2 ) mkt="ausopercon." num=3;;
9 ) mkt="wtxopercon." num=10;;
10 ) mkt="houopercon." num=1;;
esac;;
"p2bl03b" ) mkt="dlsopercon.";;
"p2bl82b" ) mkt="hclopercon.";;
"p2bl34b" ) mkt="mwropercon.";;
"p2bl19b" ) mkt="stlopercon.";;
esac
sqlplus -silent $user@$i @VALIDATION.sql "$mkt"
done
