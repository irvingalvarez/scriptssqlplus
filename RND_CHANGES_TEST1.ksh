#! /bin/ksh
#-
#. /usr/local/bin/oraenv
#export PATH=/tables/bin:/usr/local/bin:${PATH}

#nohup RND_CHANGES > MKTLOG_161014.log 

#. /home/opersupp/.profile

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

. $HOME/.set_oracle_env

export TNS_ADMIN=/usr/local/oracle/.tnstbls

# ******************************************************

#cd /tables/home/RND_CHANGES


for MKT in ark okc tul mwr
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp tlpvebc1:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
done


for MKT in cor san rgv lar aus wtx
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp tlpvebc2:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
done

# for MKT in hou
# do
	# MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	# echo "$MKT Rnd Counts"
	# scp tlpvebc2:/tlgvaraus/$MKT/log/RELEASE_SP*161014*.log .
	# grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	# grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	# awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	# cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	# cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
# done

for MKT in dls hcl stl
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp tlpvebc3:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
done

for MKT in bos nyr sne was 
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp tlpvebe1:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
done

for MKT in glr ill gpl 
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp Ulpvebc5.madc.att.com:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
done

for MKT in alh nca pac nws 
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp tlpvebp1.dadc.sbc.com:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
done

for MKT in ind 
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp olpvebe6.bodc.att.com:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
done

for MKT in glf 
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp blpvebc8.bhdc.att.com:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
done

for MKT in mtz 
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp tlpvebm1.dadc.sbc.com:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
done

for MKT in flp gac mny phi tnk 
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp blpvebe8.bhdc.att.com:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
done

for MKT in nbi 
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp olpvebc6.bodc.att.com:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	grep -i 'Market: ' RE*SP*161014_$MKTUP*.log > Market.txt
	grep -E "Num of rows for table|, in refw" RE*SP*161014_$MKTUP*.log > "$MKTUP"_rel.txt
	awk '{ $8 = ""; $9 = ""; $10 = ""; print}' "$MKTUP"_rel.txt > "$MKTUP"_rel_test.txt
	cat "$MKTUP"_rel_test.txt |  awk '$16 > 0 ' >> "$MKTUP"_release_changes.txt
	cat Market.txt "$MKTUP"_release_changes.txt > "$MKTUP"_release.txt
	
done

for MKT in xmkt 
do
	MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
	echo "$MKT Rnd Counts"
	scp blpvxmb2.bhdc.att.com:/tlgvar$MKT/$MKT/log/RELEASE_SP*161014*.log .
	for x in `ls -1 RE*SP*161014*XMK*.log`
	do
		grep -i 'Market: ' $x > Market.txt
		grep -E "Num of rows for table|, in refw" $x > XMK_rel.txt
		awk '{ $8 = ""; $9 = ""; $10 = ""; print}' XMK_rel.txt > XMK_rel_test.txt
		cat XMK_rel_test.txt |  awk '$16 > 0 ' > XMK_release_changes.txt
		cat Market.txt XMK_release_changes.txt >> XMK_release.txt
	done
done

cat ARK_release.txt COR_release.txt LAR_release.txt OKC_release.txt RGV_release.txt SAN_release.txt TUL_release.txt AUS_release.txt DLS_release.txt HCL_release.txt MWR_release.txt STL_release.txt WTX_release.txt > INREGION_release.txt
cat PAC_release.txt NCA_release.txt BOS_release.txt NYR_release.txt WAS_release.txt SNE_release.txt GLR_release.txt ILL_release.txt > OUTREGION_release.txt
cat GPL_release.txt ALH_release.txt MTZ_release.txt NWS_release.txt IND_release.txt NBI_release.txt > AWE_NBI_release.txt
cat PHI_release.txt MNY_release.txt FLP_release.txt TNK_release.txt GAC_release.txt GLF_release.txt XMK_release.txt > NESE_release.txt

cat INREGION_release.txt OUTREGION_release.txt AWE_NBI_release.txt NESE_release.txt > 161014_RELEASE.txt

