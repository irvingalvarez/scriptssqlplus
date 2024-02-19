export PATH=/tables/bin:/usr/local/bin:${PATH}
export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH
export TNS_ADMIN=/usr/local/oracle/.tnstbls

user=`cat ia915e.txt`
correct=n
connection=" "
instance=" "
while [ "$correct" = n ]
do
echo "Enter market to connect to: \c"
read market
case "$market" in
"xmk" ) correct=y connection=xmkbopercon. instance=pmdy25a;;
"alh" ) correct=y connection=alhopercon. instance=p2bl96b;;
"all" ) correct=y;;
"ark" ) correct=y connection=arkopercon. instance=p2bl06b;;
"aus" ) correct=y connection=ausopercon. instance=p2bl26b;;
"bos" ) correct=y connection=bosopercon. instance=p2bl85b;;
"cor" ) correct=y connection=coropercon. instance=pmdy12c;;
"dls" ) correct=y connection=dlsopercon. instance=p2bl03b;;
"flp" ) correct=y connection=flpopercon. instance=pflp29b;;
"gac" ) correct=y connection=gacopercon. instance=pgac24b;;
"glr" ) correct=y connection=glropercon. instance=p2bl66b;;
"gpl" ) correct=y connection=gplopercon. instance=p2bl72b;;
"glf" ) correct=y connection=glfopercon. instance=pglf31b;;
"hcl" ) correct=y connection=hclopercon. instance=p2bl82b;;
"hou" ) correct=y connection=houopercon. instance=p2bl26b;;
"ill" ) correct=y connection=illopercon. instance=p2bl76b;;
"ind" ) correct=y connection=indopercon. instance=pind42b;;
"lar" ) correct=y connection=laropercon. instance=pmdy14b;;
"mny" ) correct=y connection=mnyopercon. instance=pmny09b;;
"mtz" ) correct=y connection=mtzopercon. instance=p2bl93b;;
"mwr" ) correct=y connection=mwropercon. instance=p2bl34b;;
"nbi" ) correct=y connection=nbiopercon. instance=pnbi36b;;
"nca" ) correct=y connection=ncaopercon. instance=pnca20b;;
"nws" ) correct=y connection=nwsopercon. instance=p2bl90b;;
"nyr" ) correct=y connection=nyropercon. instance=p2bl80b;;
"okc" ) correct=y connection=okcopercon. instance=p2bl06b;;
"pac" ) correct=y connection=pacopercon. instance=p2bl44b;;
"phi" ) correct=y connection=phiopercon. instance=pphi08b;;
"rgv" ) correct=y connection=rgvopercon. instance=pmdy12c;;
"san" ) correct=y connection=sanopercon. instance=pmdy14b;;
"sne" ) correct=y connection=sneopercon. instance=p2bl64b;;
"stl" ) correct=y connection=stlopercon. instance=p2bl19b;;
"tul" ) correct=y connection=tulopercon. instance=p2bl06b;;
"tnk" ) correct=y connection=tnkopercon. instance=ptnk23b;;
"was" ) correct=y connection=wasopercon. instance=p2bl60b;;
"wtx" ) correct=y connection=wtxopercon. instance=p2bl26b;;
* ) echo "Not a valid market code. Try again.";;
esac
done

echo "Enter table name: \c"
read tabname

if test $market = "xmk"
then
insertxvalid.ksh "$tabname"| tee `date +"%d%b%y_%H:%M:%S"`_INSERT_XVALID_LOG_ALL_XMK.log
else if test $market = "all"
then
insertallvalid.ksh "$tabname"| tee `date +"%d%b%y_%H:%M:%S"`_INSERT_VALID_LOG_ALL_markets.log

else
sqlplus -silent $user@$instance @insert_table_validation_log.sql "$connection" "$market" "$tabname"| tee `date +"%d%b%y_%H:%M:%S"`_INSERT_VALID_SPECIFIC_market.log

fi
fi
exit
