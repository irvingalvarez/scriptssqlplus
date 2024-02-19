echo "Enter date: \c"
read sql_date

correct=n
while [ "$correct" = n ]
do
echo "Enter region code: \c"
read region
case "$region" in
"awe" ) correct=y;;
"out" ) correct=y;;
"inr" ) correct=y;;
"inr1" ) correct=y;;
"inr2" ) correct=y;;
"nese" ) correct=y;;
"nbi" ) correct=y;;
"all" ) correct=y;;
"xmk" ) correct=y;;
"xall" ) correct=y;;
"inrc" ) correct=y;;
* ) echo "Not a valid region code. Try again.";;
esac
done

export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

if test $region = "xmk" 
then
xvalid.ksh "$sql_date" | tee `date +"%d%b%y_%H:%M:%S"`_XVALIDATION_markets.log
else
if test $region = "xall"
then
xvalidall.ksh "$sql_date" | tee `date +"%d%b%y_%H:%M:%S"`_VALIDATION_XVALIDATION_markets.log
else
valid$region.ksh "$sql_date" | tee `date +"%d%b%y_%H:%M:%S"`_VALIDATION_"$region"_markets.log
fi
fi
exit
