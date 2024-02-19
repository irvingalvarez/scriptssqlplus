export PATH=/tables/bin:/usr/local/bin:${PATH}
export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH
export TNS_ADMIN=/usr/local/oracle/.tnstbls

user=`cat ia915e.txt`
correct=n
connection=xmkbopercon.
while [ "$correct" = n ]
do
echo "Enter market to check: \c"
read market
case "$market" in
"xmk" ) correct=y;;
"alh" ) correct=y;;
"ark" ) correct=y;;
"aus" ) correct=y;;
"bos" ) correct=y;;
"cor" ) correct=y;;
"dls" ) correct=y;;
"flp" ) correct=y;;
"gac" ) correct=y;;
"glr" ) correct=y;;
"gpl" ) correct=y;;
"glf" ) correct=y;;
"hcl" ) correct=y;;
"hou" ) correct=y;;
"ill" ) correct=y;;
"ind" ) correct=y;;
"lar" ) correct=y;;
"mny" ) correct=y;;
"mtz" ) correct=y;;
"mwr" ) correct=y;;
"nbi" ) correct=y;;
"nca" ) correct=y;;
"nws" ) correct=y;;
"nyr" ) correct=y;;
"okc" ) correct=y;;
"pac" ) correct=y;;
"phi" ) correct=y;;
"rgv" ) correct=y;;
"san" ) correct=y;;
"sne" ) correct=y;;
"stl" ) correct=y;;
"tul" ) correct=y;;
"tnk" ) correct=y;;
"was" ) correct=y;;
"wtx" ) correct=y;;
* ) echo "Not a valid market code. Try again.";;
esac
done

sqlplus -silent $user@pmdy25a @check_jobstatus.sql "$connection" "$market"
exit
