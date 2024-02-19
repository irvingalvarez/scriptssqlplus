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
echo 'Starting synswitch flag job for INR1'
mkt=" "
echo '***************************************INR1 MARKETS***************************************'
num=1
for i in p2bl06b pmdy12c pmdy14b p2bl06b pmdy12c pmdy14b p2bl06b
do
case "$i" in
"p2bl06b" )
case "$num" in
1 ) mkt="arkopercon." num=2;;
4 ) mkt="okcopercon." num=5;;
7 ) mkt="tulopercon." num=1;;
esac;;
"pmdy12c" )
case "$num" in
2 ) mkt="coropercon." num=3;;
5 ) mkt="rgvopercon." num=6;;
esac;;
"pmdy14b" )
case "$num" in
3 ) mkt="laropercon." num=4;;
6 ) mkt="sanopercon." num=7;;
esac;;
esac
sqlplus -silent $user@$i @REFTABLENAME_Switch_Flag.sql "$mkt"
done
