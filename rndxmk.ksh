#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv
export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

date
echo 'Starting xsynswitch flag job for ALL MARKETS'
mkt=" "
user=`cat ia915e.txt`
echo '***************************************INREGION MARKETS***************************************'
num=1
for i in p2bl06b p2bl26b pmdy12c PdlsO1_db p2bl82b pmdy14b PMWRO1_DB pokco1_db PTULO1_DB pmdy12c pmdy14b pstlo1_db p2bl06b p2bl26b p2bl26b 
do case "$i" in "p2bl06b" ) case "$num" in
1 ) mkt="arkopercon." num=2;;
esac;;
"pmdy12c" )
case "$num" in
3 ) mkt="coropercon." num=4;;
5 ) mkt="rgvopercon." num=6;;
esac;;
"pmdy14b" )
case "$num" in
4 ) mkt="laropercon." num=5;;
6 ) mkt="sanopercon." num=7;;
esac;;
"p2bl26b" )
case "$num" in
2 ) mkt="ausopercon." num=3;;
8 ) mkt="wtxopercon." num=9;;
9 ) mkt="houopercon." num=1;;
esac;;
"PTULO1_DB" ) mkt="tulopercon.";;
"PdlsO1_db" ) mkt="dlsopercon.";;
"p2bl82b" ) mkt="hclopercon.";;
"PMWRO1_DB" ) mkt="mwropercon.";;
"pstlo1_db" ) mkt="stlopercon.";;
"pokco1_db" ) mkt="okcopercon.";;
esac
sqlplus -silent $user@$i @XREFTABLENAME_XSwitch_Flag.sql "$mkt"
done
echo '*************************************OUTREGION MARKETS****************************************'
for i in p2bl85b p2bl66b p2bl76b pncao1_db p2bl80b p2bl44b psneo1_db p2bl60b  
do
case "$i" in
"p2bl85b" ) mkt="bosopercon.";;
"p2bl66b" ) mkt="glropercon.";;
"p2bl76b" ) mkt="illopercon.";;
"pncao1_db" ) mkt="ncaopercon.";;
"p2bl80b" ) mkt="nyropercon.";;
"p2bl44b" ) mkt="pacopercon.";;
"psneo1_db" ) mkt="sneopercon.";;
"p2bl60b" ) mkt="wasopercon.";;
esac
sqlplus -silent $user@$i @XREFTABLENAME_XSwitch_Flag.sql "$mkt"
done
echo '******************************************AWE MARKETS*****************************************'
for i in p2bl96b p2bl72b pind42b pmtzo1_db p2bl90b 
do
case "$i" in
"p2bl96b" ) mkt="alhopercon.";;
"p2bl72b" ) mkt="gplopercon.";;
"pind42b" ) mkt="indopercon.";;
"pmtzo1_db" ) mkt="mtzopercon.";;
"p2bl90b" ) mkt="nwsopercon.";;
esac
sqlplus -silent $user@$i @XREFTABLENAME_XSwitch_Flag.sql "$mkt"
done

echo '*****************************************NESE MARKETS*****************************************'
for i in pflp29b pgac24b pglf31b PMNYO1_DB pphi08b ptnk23b
do
case "$i" in
"pflp29b" ) mkt="flpopercon.";;
"pgac24b" ) mkt="gacopercon.";;
"pglf31b" ) mkt="glfopercon.";;
"PMNYO1_DB" ) mkt="mnyopercon.";;
"pphi08b" ) mkt="phiopercon.";;
"ptnk23b" ) mkt="tnkopercon.";;
esac
sqlplus -silent $user@$i @XREFTABLENAME_XSwitch_Flag.sql "$mkt"
done

echo '*******************************************NBI MARKET*****************************************'
for i in pnbi36b
do
case "$i" in
"pnbi36b" ) mkt="nbiopercon.";;
esac
sqlplus -silent $user@$i @XREFTABLENAME_XSwitch_Flag.sql "$mkt"
done


