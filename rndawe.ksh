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
echo 'Starting synswitch flag job for AWE'
mkt=" "

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
sqlplus -silent $user@$i @REFTABLENAME_Switch_Flag.sql "$mkt" 
done

