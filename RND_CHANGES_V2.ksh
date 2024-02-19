#!/bin/ksh
# . /usr/local/bin/oraenv

export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

. $HOME/.set_oracle_env

export TNS_ADMIN=/usr/local/oracle/.tnstbls

# Oracle Environment Variables (Should be in /etc/profile)
export ORACLE_HOME=/opt/app/oracle/client/11.1.0
#export ORACLE_HOME=/usr/local/oracle/10.2.0
export ORACLE_TERM=$TERM
export TNS_ADMIN="/usr/local/oracle/.tnstbls"
export ORACLE_SID=PMDY25A
#export TNS_ADMIN="/etc"
export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

# ******************************************************

cd /tables/home/Irving/TEST
#CURDAY=`date -d yesterday +"%y%m%d"`
#CURDAY=`date -d '4 days ago' +"%y%m%d"`
CURDAY=`date +"%y%m%d"`
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

for MKT in ark okc tul mwr
do
        MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
        echo "$MKT Rnd Counts"
		Get_UNIX_ConnStrings $MKTUP
		echo $userconn
		MKT=`echo $MKT | tr  "[:upper:]" "[:lower:]"` 
		echo $MKT
		scp $userconn:/tlgvar$MKT/$MKT/log/RELEASE_SP*$CURDAY*.log .
        for x in `ls -1 RE*SP*$CURDAY*$MKTUP*.log`
        do
                grep -i 'Market: ' $x > Market.txt
				awk '{ $10= "; --"; print}' Market.txt > Market1.txt
                grep -E "Num of rows for table|, in refw" $x > "$MKTUP"_rel.txt
                awk '{ $8 = ""; $9 = ";"; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
				
                cat "$MKTUP"_rel_test.txt |  awk '$17 > 0 ' > "$MKTUP"_release_changes.txt
				
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

                cat "$MKTUP"_release_changes.txt >> "$MKTUP"_release.txt

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
				done<"$MKTUP"_release.txt
				IFS=$OIFS
				echo "</table>" >> file_table.html
        done
done

for MKT in alh aus bos cor dls flp gac glf glr gpl hcl ill ind lar mny mtz nbi nca nws nyr pac phi rgv san sne stl tnk was wtx 
do
        MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
        echo "$MKT Rnd Counts"
		Get_UNIX_ConnStrings $MKTUP
		echo $userconn
		MKT=`echo $MKT | tr  "[:upper:]" "[:lower:]"` 
		echo $MKT
		scp $userconn:/tlgvar$MKT/$MKT/log/RELEASE_SP*$CURDAY*.log .
        for x in `ls -1 RE*SP*$CURDAY*$MKTUP*.log`
        do
                grep -i 'Market: ' $x > Market.txt
  				awk '{ $10= "; --"; print}' Market.txt > Market1.txt
                grep -E "Num of rows for table|, in refw" $x > "$MKTUP"_rel.txt
                awk '{ $8 = ""; $9 = ""; $10 = ";"; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
				
                cat "$MKTUP"_rel_test.txt |  awk '$17 > 0 ' > "$MKTUP"_release_changes.txt
				
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

                cat "$MKTUP"_release_changes.txt >> "$MKTUP"_release.txt

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
				done<"$MKTUP"_release.txt
				IFS=$OIFS
				echo "</table>" >> file_table.html
        done
done


cat /tables/home/Irving/TEST/top.html ./file_table.html /tables/home/Irving/TEST/bottom.html > file_table2.html

cat file_table2.html | mail -s "$(echo -e "MKT RnD Changes $CURDAY1 \nContent-Type: text/html")" ia915e@att.com -v

#mailx -s 'RND Changes' tlg-ttqasupport@us.att.com tablesrnd@us.att.com < $CURDAY_Release.txt
#mailx -s 'RND Changes' ia915e@att.com < $CURDAY_Release.txt

mv RE*log* LogFiles/.
mv $CURDAY_Release.txt Reports/.
gzip -9f /tables/home/RND_CHANGES/LogFiles/*.log
rm *.txt file_table.html file_table2.html
