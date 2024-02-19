#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv
export PATH=/tables/bin:/usr/local/bin:${PATH}

#. /home/opersupp/.profile

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

. $HOME/.set_oracle_env

export TNS_ADMIN=/usr/local/oracle/.tnstbls

# ******************************************************

#cd /tlgtables/RNDSWITCHJOB

CURDAY=`date +"%Y%m%d"`
CURDAY1=`date +"%m/%d/%y"`


Get_UNIX_ConnStrings () {

   MKT=$1

   dlcode=`whoami`

   home=`echo /home/$dlcode`

   cuid=`echo $dlcode | tr '[:lower:]' '[:upper:]'`

   mktconn=`grep -i "^$MKT," $home/${cuid}_Box.lst`

   box=`echo $mktconn | awk -F"," '{print $2}'`


   userconn=`echo $box`

}

for MKT in ark okc tul mwr alh aus bos cor dls flp gac glf glr gpl hcl ill ind lar mny mtz nbi nca nws nyr pac phi rgv san sne stl tnk was wtx 
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKTUP Synswitch"
	Get_UNIX_ConnStrings $MKTUP
	MKT=`echo $MKT | tr  "[:upper:]" "[:lower:]"` 
	scp $userconn:/tlgvar$MKT/$MKT/log/*SYNSW*$CURDAY*.log .	
#	scp tlpvebc2:/tlgvarcor/cor/log/*SYNSW*`date +"%Y%m%d"`*.log .
	grep -i 'Host' SYN*log > Mkt.txt
	awk '{ $10= "; AREA"; print}' Mkt.txt > Market1.txt

	
	ln=1
	OIFS=$IFS
	IFS=$";"
	echo "</style> <title>REPORT</title> </head>" >> file_table.html
	echo "<body>" >> file_table.html
	echo "<p>" >> file_table.html
	echo "<html>" >> file_table.html
	echo "<table id=query>" >> file_table.html
	while read line
	do
	for word in $line
	do
		if [ $ln -eq 1 ]
		then
			echo "<th>$word</th>" >> file_table.html
		else
			echo "<th>$word</th>" >> file_table.html
		fi
	done
	let ln=ln+1
	done<Market1.txt
	IFS=$OIFS
				
	grep -i 'Switch active snapshot' SYN*log > "$MKTUP"_syn.txt
	awk '{ $7 = "; from"; print}' "$MKTUP"_syn.txt > "$MKTUP"_syn1.txt
	
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
	done<"$MKTUP"_syn1.txt
	IFS=$OIFS
	echo "</table>" >> file_table.html
	
	grep -i 'Operational Job' SYN*log > "$MKTUP"_end1.txt
	
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
	done<"$MKTUP"_end1.txt
	IFS=$OIFS
	echo "</table>" >> file_table.html
	
	
	grep -i 'Host' XSYN*log > Xmkt.txt
	awk '{ $10= "; AREA"; print}' Xmkt.txt > XMarket1.txt
	
	ln=1
	OIFS=$IFS
	IFS=$";"
	echo "</style> <title>REPORT</title> </head>" >> file_table.html
	echo "<body>" >> file_table.html
	echo "<p>" >> file_table.html
	echo "<html>" >> file_table.html
	echo "<table id=query>" >> file_table.html
	while read line
	do
	for word in $line
	do
		if [ $ln -eq 1 ]
		then
			echo "<th>$word</th>" >> file_table.html
		else
			echo "<th>$word</th>" >> file_table.html
		fi
	done
	let ln=ln+1
	done<XMarket1.txt
	IFS=$OIFS
	
	grep -i 'Switch active snapshot' XSYN*log > "$MKTUP"_xsyn.txt
	awk '{ $7 = "; from"; print}' "$MKTUP"_xsyn.txt > "$MKTUP"_xsyn1.txt
	
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
	done<"$MKTUP"_xsyn1.txt
	IFS=$OIFS
	echo "</table>" >> file_table.html

	grep -i 'Operational Job' XSYN*log > "$MKTUP"_end2.txt
	
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
	done<"$MKTUP"_end2.txt
	IFS=$OIFS
	echo "</table>" >> file_table.html
	
	
	#cat Mkt.txt "$MKTUP"_syn1.txt "$MKTUP"_end1.txt Xmkt.txt "$MKTUP"_xsyn1.txt "$MKTUP"_end2.txt > "$MKTUP"_SYN.txt
	gzip -9f *log

done

cat top.html file_table.html bottom.html > file_table2.html


cat file_table2.html | mail -s "$(echo -e "SYNSWITCH REPORT $CURDAY1 \nContent-Type: text/html")" tablesrnd@att.com -v


mv *.log* /tlgtables/RNDSWITCHJOB/Logs
mv `date +"%Y%m%d"`_SYN.txt Reports/.
gzip -9f Reports/*
rm file_table.html file_table2.html
rm *.txt
