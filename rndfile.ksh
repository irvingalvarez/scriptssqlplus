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
* ) echo "Not a valid region code. Try again.";;
esac
done

export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

rnd$region.ksh | tee `date +"%d%b%y_%H:%M:%S"`_RnD_SYNSWITCH_Flag_"$region"_markets.log
exit
