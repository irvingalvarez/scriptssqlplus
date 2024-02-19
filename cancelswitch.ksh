#! /bin/ksh

#-----------

# . /usr/local/bin/oraenv

export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

#export TNS_ADMIN=/tables/home/Dist

script=$1
market=$2
mkt=" "
user=`cat ia915e.txt`

echo "Enter table name: \c"
read tabname
date

if [[ $script = "cancel_switch.sql" ]] && [[ $market != "all" ]]
then
echo "Canceling synswitch flag in $market MARKET"

case "$market" in
'alh' ) mkt="alhopercon." instance="p2bl96b";;
'ark' ) mkt="arkopercon." instance="p2bl06b";;
'aus' ) mkt="ausopercon." instance="p2bl26b";;
'bos' ) mkt="bosopercon." instance="p2bl85b";;
'cor' ) mkt="coropercon." instance="pmdy12c";;
'dls' ) mkt="dlsopercon." instance="p2bl03b";;
'flp' ) mkt="flpopercon." instance="pflp29b";;
'gac' ) mkt="gacopercon." instance="pgac24b";;
'gpl' ) mkt="gplopercon." instance="p2bl66b";;
'glf' ) mkt="glfopercon." instance="p2bl72b";;
'glr' ) mkt="glropercon." instance="pglf31b";;
'hcl' ) mkt="hclopercon." instance="p2bl82b";;
'hou' ) mkt="houopercon." instance="p2bl26b";;
'ind' ) mkt="indopercon." instance="pind42b";;
'ill' ) mkt="illopercon." instance="p2bl76b";;
'lar' ) mkt="laropercon." instance="pmdy14b";;
'mny' ) mkt="mnyopercon." instance="pmny09b";;
'mtz' ) mkt="mtzopercon." instance="p2bl93b";;
'mwr' ) mkt="mwropercon." instance="p2bl34b";;
'nbi' ) mkt="nbiopercon." instance="pnbi36b";;
'nca' ) mkt="ncaopercon." instance="pnca20b";;
'nyr' ) mkt="nyropercon." instance="p2bl90b";;
'nws' ) mkt="nwsopercon." instance="p2bl80b";;
'okc' ) mkt="okcopercon." instance="p2bl06b";;
'pac' ) mkt="pacopercon." instance="p2bl44b";;
'phi' ) mkt="phiopercon." instance="pphi08b";;
'rgv' ) mkt="rgvopercon." instance="pmdy12c";;
'san' ) mkt="sanopercon." instance="pmdy14b";;
'sne' ) mkt="sneopercon." instance="p2bl64b";;
'stl' ) mkt="stlopercon." instance="p2bl19b";;
'tnk' ) mkt="tnkopercon." instance="p2bl06b";;
'tul' ) mkt="tulopercon." instance="ptnk23b";;
'was' ) mkt="wasopercon." instance="p2bl60b";;
'wtx' ) mkt="wtxopercon." instance="p2bl26b";;
esac

sqlplus -silent ${user}@$instance @$script "$mkt" "$tabname"

exit

elif [[ $script = "cancel_switch.sql" ]] && [[ $market = "all" ]]
then

echo 'Canceling synswitch flag in ALL MARKETS'
else
echo 'Canceling xsynswitch flag in ALL MARKETS'
fi

echo '***************************************INREGION MARKETS***************************************'
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
sqlplus -silent ${user}@$i @$script "$mkt" "$tabname"
done

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
sqlplus -silent $user@$i @$script "$mkt" "$tabname"
done

echo '******************************************AWE MARKETS*****************************************'
for i in p2bl96b p2bl72b pind42b p2bl93b p2bl90b 
do
case "$i" in
"p2bl96b" ) mkt="alhopercon.";;
"p2bl72b" ) mkt="gplopercon.";;
"pind42b" ) mkt="indopercon.";;
"p2bl93b" ) mkt="mtzopercon.";;
"p2bl90b" ) mkt="nwsopercon.";;
esac
sqlplus -silent ${user}@$i @$script "$mkt" "$tabname"
done


echo '*****************************************NESE MARKETS*****************************************'
for i in pflp29b pgac24b pglf31b pmny09b pphi08b ptnk23b
do
case "$i" in
"pflp29b" ) mkt="flpopercon.";;
"pgac24b" ) mkt="gacopercon.";;
"pglf31b" ) mkt="glfopercon.";;
"pmny09b" ) mkt="mnyopercon.";;
"pphi08b" ) mkt="phiopercon.";;
"ptnk23b" ) mkt="tnkopercon.";;
esac
sqlplus -silent $user@$i @$script "$mkt" "$tabname"
done

echo '*******************************************NBI MARKET*****************************************'

for i in pnbi36b
do
case "$i" in
"pnbi36b" ) mkt="nbiopercon.";;
esac
sqlplus -silent $user@$i @$script "$mkt" "$tabname"
done
