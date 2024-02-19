user=`cat ia915e.txt`
who am i
export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls
#export TNS_ADMIN=/tables/home/Dist

date
echo 'Starting validation log job for NESE MARKETS'
mkt=" "
echo '******************************************NESE MARKETS****************************************'
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
sqlplus -silent $user@$i @VALIDATION.sql "$mkt"
done
