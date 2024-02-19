#! /bin/ksh
#-
#. /usr/local/bin/oraenv
#export PATH=/tables/bin:/usr/local/bin:${PATH}

#nohup RND_CHANGES > MKTLOG_161013.log 

#. /home/opersupp/.profile

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

. $HOME/.set_oracle_env

export TNS_ADMIN=/usr/local/oracle/.tnstbls

# ******************************************************

#cd /tables/home/RND_CHANGES


for MKT in ark cor lar okc rgv san tul aus dls hcl mwr stl wtx bos glr ill nca nyr pac sne was alh gpl ind mtz nws flp gac glf mny phi tnk nbi

#for MKT in cor

do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	#echo "COR RnD Counts" 
	scp tlpvebc2:/tlgvar$MKT/$MKT/log/RELEASE_SP*161013*.log .
	grep -i 'Market: ' RE*SP*161013_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161013_$MKTUP*.log > "$MKTUP"_rel.txt

	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt


done