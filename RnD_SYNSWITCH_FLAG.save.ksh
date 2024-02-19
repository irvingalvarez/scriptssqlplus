#! /bin/ksh
#-----------
. /usr/local/bin/oraenv
export PATH=/tables/bin:/usr/local/bin:${PATH}
export TNS_ADMIN=/usr/local/oracle/.tnstbls

for i in san lar cor rgv hou aus hcl dls okc tul stl ark mwr wtx was pac sne ill glr nyr bos rrn alh gpl nws mtz nbi nca   
do
echo 'starting Synswitch job for' $i
date
refmkt=`GetConnStr -Po $i oper` 

sqlplus -s $refmkt @ REFTABLENAME_Switch_Flag_sh.sql
#ExecSql -P $i oper /tables/home/Dist/REFTABLENAME_Switch_Flag_sh.sql
done

for i in san lar cor rgv hou aus hcl dls okc tul stl ark mwr wtx was pac sne ill glr nyr bos rrn alh gpl nws mtz nbi nca
do
echo 'starting Xsynswitch job for' $i
date

refmkt=`GetConnStr -Po $i oper`

sqlplus -s $refmkt @ XREFTABLENAME_XSwitch_Flag_sh.sql

#ExecSql -P $i oper /tables/home/Dist/XREFTABLENAME_XSwitch_Flag_sh.sql

done
