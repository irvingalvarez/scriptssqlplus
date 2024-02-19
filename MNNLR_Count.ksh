#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv
who am i
dlcode=`whoami`

curdir=`pwd`
CURDAY1=`date +"%m/%d/%y"`

xmktconn=`Get_MktConnStrings.ksh XMK`

TXT_NAME=`date +"%y%m%d"`_MNNLR_PreviousDayCount.txt
TXT_NAME1=`date +"%y%m%d"`_MNNLR_PreviousDayCount1.txt

ln=1
OIFS=$IFS
IFS=$";"
echo "</style> <title>REPORT</title> </head>" > file_table.html
echo "<body>" >> file_table.html
echo "<p>" >> file_table.html
echo "<html>" >> file_table.html
echo "<table id=query>" >> file_table.html
echo '<th>Drop and Create table tmp_mnnlr_previousday</th>' >> file_table.html
			

sqlplus -s $xmktconn << SQL > $TXT_NAME
set echo off

@/tables/home/Login_Scripts/SelectXMKTTLGREF.sql

--PROMPT Drop and Create table tmp_mnnlr_previousday

drop table tmp_mnnlr_previousday;
create table tmp_mnnlr_previousday as select * from market_npa_nxx_lr;

commit;

exit 

SQL
ln=1
OIFS=$IFS
IFS=$";"
while read line
do
echo "<tr>" >> file_table.html
for word in $line
do
	if [ $ln -eq 1 ]
	then
		echo "<td>$word</td>" >> file_table.html
	else
		echo "<td>$word</td>" >> file_table.html
	fi
done
echo "</tr>" >> file_table.html
echo "</p>" >> file_table.html
let ln=ln+1
done<"$TXT_NAME"

ln=1
OIFS=$IFS
IFS=$";"
echo "</style> <title>REPORT</title> </head>" >> file_table.html
echo "<body>" >> file_table.html
echo "<p>" >> file_table.html
echo "<html>" >> file_table.html
echo "<table id=query>" >> file_table.html
echo '<th>Count in REFWORK - Market_Npa_Nxx_Lr</th>' >> file_table.html

sqlplus -s $xmktconn << SQL > $TXT_NAME1

@/tables/home/Login_Scripts/SelectXMKTTLGREF.sql
set echo off

--PROMPT Count in REFWORK - Market_Npa_Nxx_Lr

select count(*) "Market_Npa_Nxx_Lr" from &&XMKTREF..market_npa_nxx_lr;
select count(*) "tmp_mnnlr_previousday" from tmp_mnnlr_previousday;
commit;

exit 

SQL

ln=1
OIFS=$IFS
IFS=$";"
while read line
do
echo "<tr>" >> file_table.html
for word in $line
do
	if [ $ln -eq 1 ]
	then
		echo "<td>$word</td>" >> file_table.html
	else
		echo "<td>$word</td>" >> file_table.html
	fi
done
echo "</tr>" >> file_table.html
echo "</p>" >> file_table.html
let ln=ln+1
done<"$TXT_NAME1"

cat top.html file_table.html bottom.html > file_table2.html
cat file_table2.html | mail -s "$(echo -e "MNNLR Count $CURDAY1 \nContent-Type: text/html")" ia915e@att.com -v

