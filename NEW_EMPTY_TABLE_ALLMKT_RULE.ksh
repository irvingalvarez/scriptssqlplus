sql_date=$1
user=`cat ia915e.txt`
who am i
export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

echo $1
echo 'starting creating of empty table rule for ALL'
mkt=" "
num=1
for i in p2bl06b p2bl26b pmdy12c p2bl03b p2bl82b pmdy14b p2bl34b p2bl06b pmdy12c pmdy14b p2bl19b p2bl06b p2bl26b p2bl26b p2bl85b p2bl66b p2bl76b pnca20b p2bl80b p2bl44b p2bl64b p2bl60b p2bl96b p2bl72b pind42b p2bl93b p2bl90b pflp29b pgac24b pglf31b pmny09b pphi08b ptnk23b pnbi36b pmdy25a
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
"p2bl85b" ) mkt="bosopercon.";;
"p2bl66b" ) mkt="glropercon.";;
"p2bl76b" ) mkt="illopercon.";;
"pnca20b" ) mkt="ncaopercon.";;
"p2bl80b" ) mkt="nyropercon.";;
"p2bl44b" ) mkt="pacopercon.";;
"p2bl64b" ) mkt="sneopercon.";;
"p2bl60b" ) mkt="wasopercon.";;
"p2bl96b" ) mkt="alhopercon.";;
"p2bl72b" ) mkt="gplopercon.";;
"pind42b" ) mkt="indopercon.";;
"p2bl93b" ) mkt="mtzopercon.";;
"p2bl90b" ) mkt="nwsopercon.";;
"pflp29b" ) mkt="flpopercon.";;
"pgac24b" ) mkt="gacopercon.";;
"pglf31b" ) mkt="glfopercon.";;
"pmny09b" ) mkt="mnyopercon.";;
"pphi08b" ) mkt="phiopercon.";;
"ptnk23b" ) mkt="tnkopercon.";;
"pnbi36b" ) mkt="nbiopercon.";;
"pmdy25a" ) mkt="xmkbopercon.";;
esac
sqlplus -silent $user@$i @NEW_EMPTY_TABLE_ALLMKT_RULE.sql "$sql_date" "$mkt"
done
