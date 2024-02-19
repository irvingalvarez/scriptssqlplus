#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv
who am i
export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls
#export TNS_ADMIN=/tables/home/Dist

tabname=$1
script=insert_table_validation.sql

date
echo 'Inserting table in ALL MARKETS'

connection=" "
mkt=" "
user=`cat ia915e.txt`
echo '***************************************INREGION MARKETS***************************************'
num=1
for i in p2bl06b p2bl26b pmdy12c p2bl03b p2bl82b pmdy14b p2bl34b p2bl06b pmdy12c pmdy14b p2bl19b p2bl06b p2bl26b p2bl26b
do
case "$i" in
"p2bl06b" )
case "$num" in
1 ) connection="arkopercon." mkt="ark" num=2;;
5 ) connection="okcopercon." mkt="okc" num=6;;
8 ) connection="tulopercon." mkt="tul" num=9;;
esac;;
"pmdy12c" )
case "$num" in
3 ) connection="coropercon." mkt="cor" num=4;;
6 ) connection="rgvopercon." mkt="rgv" num=7;;
esac;;
"pmdy14b" )
case "$num" in
4 ) connection="laropercon." mkt="lar" num=5;;
7 ) connection="sanopercon." mkt="san" num=8;;
esac;;
"p2bl26b" )
case "$num" in
2 ) connection="ausopercon." mkt="aus" num=3;;
9 ) connection="wtxopercon." mkt="wtx" num=10;;
10 ) connection="houopercon." mkt="hou" num=1;;
esac;;
"p2bl03b" ) connection="dlsopercon." mkt="dls";;
"p2bl82b" ) connection="hclopercon." mkt="hcl";;
"p2bl34b" ) connection="mwropercon." mkt="mwr";;
"p2bl19b" ) connection="stlopercon." mkt="stl";;
esac

sqlplus -silent $user@$i @$script "$connection" "$mkt" "$tabname"
done
echo '*************************************OUTREGION MARKETS****************************************'
for i in p2bl85b p2bl66b p2bl76b pnca20b p2bl80b p2bl44b p2bl64b p2bl60b  
do
case "$i" in
"p2bl85b" ) connection="bosopercon." mkt="bos";;
"p2bl66b" ) connection="glropercon." mkt="glr";;
"p2bl76b" ) connection="illopercon." mkt="ill";;
"pnca20b" ) connection="ncaopercon." mkt="nca";;
"p2bl80b" ) connection="nyropercon." mkt="nyr";;
"p2bl44b" ) connection="pacopercon." mkt="pac";;
"p2bl64b" ) connection="sneopercon." mkt="sne";;
"p2bl60b" ) connection="wasopercon." mkt="was";;
esac
sqlplus -silent $user@$i @$script "$connection" "$mkt" "$tabname"
done
echo '******************************************AWE MARKETS*****************************************'
for i in p2bl96b p2bl72b pind42b p2bl93b p2bl90b 
do
case "$i" in
"p2bl96b" ) connection="alhopercon." mkt="alh";;
"p2bl72b" ) connection="gplopercon." mkt="gpl";;
"pind42b" ) connection="indopercon." mkt="ind";;
"p2bl93b" ) connection="mtzopercon." mkt="mtz";;
"p2bl90b" ) connection="nwsopercon." mkt="nws";;
esac
sqlplus -silent $user@$i @$script "$connection" "$mkt" "$tabname"
done

echo '*****************************************NESE MARKETS*****************************************'
for i in pflp29b pgac24b pglf31b pmny09b pphi08b ptnk23b
do
case "$i" in
"pflp29b" ) connection="flpopercon." mkt="flp";;
"pgac24b" ) connection="gacopercon." mkt="gac";;
"pglf31b" ) connection="glfopercon." mkt="glf";;
"pmny09b" ) connection="mnyopercon." mkt="mny";;
"pphi08b" ) connection="phiopercon." mkt="phi";;
"ptnk23b" ) connection="tnkopercon." mkt="tnk";;
esac
sqlplus -silent $user@$i @$script "$connection" "$mkt" "$tabname"
done

echo '*******************************************NBI MARKET*****************************************'
for i in pnbi36b
do
case "$i" in
"pnbi36b" ) connection="nbiopercon." mkt="nbi";;
esac
sqlplus -silent $user@$i @$script "$connection" "$mkt" "$tabname"
done


