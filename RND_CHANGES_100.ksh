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


echo "COR RnD Counts" 
scp tlpvebc2:/tlgvarcor/cor/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_COR*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_COR*.log > COR_rel.txt
awk '{ $8 = ""; $9 = ""; $10 = ""; print}' COR_rel.txt > COR_rel_test.txt
cat Cor_rel_test.txt |  awk '$16 > 0 ' >> COR_release_changes.txt
cat Market.txt COR_release_changes.txt > COR_release.txt


# sed 'N;s/\n//' COR_rel.txt > COR_rel_2.txt
# tr -cd '[:print:]\n' < COR_rel_2.txt > COR_rel_3.txt
# grep -v ': 0' COR_rel_3.txt > COR_release_changes.txt
# cat Market.txt COR_release_changes.txt > COR_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_COR*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_COR*.log > COR_rel.txt
# sed 'N;s/\n//' COR_rel.txt > COR_rel_2.txt
# tr -cd '[:print:]\n' < COR_rel_2.txt > COR_rel_3.txt
# grep -v ': 0' COR_rel_3.txt > COR_release_changes.txt
# cat Market.txt COR_release_changes.txt > COR_release_2.txt
# cat COR_release_1.txt COR_release_2.txt > COR_release.txt
gzip -9f RE*log

#--scp tlpvebc2.dadc.sbc.com:/tlgvarcor/cor/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_COR*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_COR*.log > COR_rel.txt
#--grep -v ': 0' COR_rel.txt > COR_release_changes.txt
#--cat Market.txt COR_release_changes.txt > COR_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > COR_rel.txt
#--grep -v ': 0' COR_rel.txt > COR_release_changes.txt
#--cat Market.txt COR_release_changes.txt > COR_release_2.txt
#--cat COR_release_1.txt COR_release_2.txt > COR_release.txt


echo "RGV RnD Counts"
scp tlpvebc2.dadc.sbc.com:/tlgvarrgv/rgv/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_RGV*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_RGV*.log > RGV_rel.txt
awk '{ $8 = ""; $9 = ""; $10 = ""; print}' RGV_rel.txt > RGV_rel_test.txt
cat RGV_rel_test.txt |  awk '$16 > 0 ' >> RGV_release_changes.txt
cat Market.txt RGV_release_changes.txt > RGV_release.txt


# sed 'N;s/\n//' RGV_rel.txt > RGV_rel_2.txt
# tr -cd '[:print:]\n' < RGV_rel_2.txt > RGV_rel_3.txt
# grep -v ': 0' RGV_rel_3.txt > RGV_release_changes.txt
# cat Market.txt RGV_release_changes.txt > RGV_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_RGV*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_RGV*.log > RGV_rel.txt
# sed 'N;s/\n//' RGV_rel.txt > RGV_rel_2.txt
# tr -cd '[:print:]\n' < RGV_rel_2.txt > RGV_rel_3.txt
# grep -v ': 0' RGV_rel_3.txt > RGV_release_changes.txt
# cat Market.txt RGV_release_changes.txt > RGV_release_2.txt
# cat RGV_release_1.txt RGV_release_2.txt > RGV_release.txt
gzip -9f RE*log

#--scp tlpvebc2.dadc.sbc.com:/tlgvarcor/rgv/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_RGV*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_RGV*.log > RGV_rel.txt
#--grep -v ': 0' RGV_rel.txt > RGV_release_changes.txt
#--cat Market.txt RGV_release_changes.txt > RGV_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > RGV_rel.txt
#--grep -v ': 0' RGV_rel.txt > RGV_release_changes.txt
#--cat Market.txt RGV_release_changes.txt > RGV_release_2.txt
#--cat RGV_release_1.txt RGV_release_2.txt > RGV_release.txt


echo "SAN RnD Counts"
scp tlpvebc2.dadc.sbc.com:/tlgvarsan/san/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_SAN*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_SAN*.log > SAN_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' SAN_rel.txt > SAN_rel_test.txt
cat SAN_rel_test.txt |  awk '$16 > 0 ' >> SAN_release_changes.txt
cat Market.txt SAN_release_changes.txt > SAN_release.txt


# sed 'N;s/\n//' SAN_rel.txt > SAN_rel_2.txt
# tr -cd '[:print:]\n' < SAN_rel_2.txt > SAN_rel_3.txt
# grep -v ': 0' SAN_rel_3.txt > SAN_release_changes.txt
# cat Market.txt SAN_release_changes.txt > SAN_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_SAN*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_SAN*.log > SAN_rel.txt
# sed 'N;s/\n//' SAN_rel.txt > SAN_rel_2.txt
# tr -cd '[:print:]\n' < SAN_rel_2.txt > SAN_rel_3.txt
# grep -v ': 0' SAN_rel_3.txt > SAN_release_changes.txt
# cat Market.txt SAN_release_changes.txt > SAN_release_2.txt
# cat SAN_release_1.txt SAN_release_2.txt > SAN_release.txt
gzip -9f RE*log

#--scp tlpvebc2.dadc.sbc.com:/tlgvarsan/san/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_SAN*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_SAN*.log > SAN_rel.txt
#--grep -v ': 0' SAN_rel.txt > SAN_release_changes.txt
#--cat Market.txt SAN_release_changes.txt > SAN_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > SAN_rel.txt
#--grep -v ': 0' SAN_rel.txt > SAN_release_changes.txt
#--cat Market.txt SAN_release_changes.txt > SAN_release_2.txt
#--cat SAN_release_1.txt SAN_release_2.txt > SAN_release.txt


echo "LAR RnD Counts"
scp tlpvebc2.dadc.sbc.com:/tlgvarlar/lar/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_LAR*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_LAR*.log > LAR_rel.txt
awk '{ $8 = ""; $9 = ""; $10 = ""; print}' LAR_rel.txt > LAR_rel_test.txt
cat LAR_rel_test.txt |  awk '$16 > 0 ' >> LAR_release_changes.txt
cat Market.txt LAR_release_changes.txt > LAR_release.txt

# sed 'N;s/\n//' LAR_rel.txt > LAR_rel_2.txt
# tr -cd '[:print:]\n' < LAR_rel_2.txt > LAR_rel_3.txt
# grep -v ': 0' LAR_rel_3.txt > LAR_release_changes.txt
# cat Market.txt LAR_release_changes.txt > LAR_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_LAR*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_LAR*.log > LAR_rel.txt
# sed 'N;s/\n//' LAR_rel.txt > LAR_rel_2.txt
# tr -cd '[:print:]\n' < LAR_rel_2.txt > LAR_rel_3.txt
# grep -v ': 0' LAR_rel_3.txt > LAR_release_changes.txt
# cat Market.txt LAR_release_changes.txt > LAR_release_2.txt
# cat LAR_release_1.txt LAR_release_2.txt > LAR_release.txt
gzip -9f RE*log

#--scp tlpvebc2.dadc.sbc.com:/tlgvarlar/lar/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_LAR*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_LAR*.log > LAR_rel.txt
#--grep -v ': 0' LAR_rel.txt > LAR_release_changes.txt
#--cat Market.txt LAR_release_changes.txt > LAR_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > LAR_rel.txt
#--grep -v ': 0' LAR_rel.txt > LAR_release_changes.txt
#--cat Market.txt LAR_release_changes.txt > LAR_release_2.txt
#--cat LAR_release_1.txt LAR_release_2.txt > LAR_release.txt


echo "HOU RnD Counts"
scp tlpvebc2.dadc.sbc.com:/tlgvarhou/hou/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_HOU*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_HOU*.log > HOU_rel.txt
awk '{ $8 = ""; $9 = ""; $10 = ""; print}' HOU_rel.txt > HOU_rel_test.txt
cat HOU_rel_test.txt |  awk '$16 > 0 ' >> HOU_release_changes.txt
cat Market.txt HOU_release_changes.txt > HOU_release.txt

# sed 'N;s/\n//' HOU_rel.txt > HOU_rel_2.txt
# tr -cd '[:print:]\n' < HOU_rel_2.txt > HOU_rel_3.txt
# grep -v ': 0' HOU_rel_3.txt > HOU_release_changes.txt
# cat Market.txt HOU_release_changes.txt > HOU_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_HOU*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_HOU*.log > HOU_rel.txt
# sed 'N;s/\n//' HOU_rel.txt > HOU_rel_2.txt
# tr -cd '[:print:]\n' < HOU_rel_2.txt > HOU_rel_3.txt
# grep -v ': 0' HOU_rel_3.txt > HOU_release_changes.txt
# cat Market.txt HOU_release_changes.txt > HOU_release_2.txt
# cat HOU_release_1.txt HOU_release_2.txt > HOU_release.txt
gzip -9f RE*log

#--scp tlpvebc2.dadc.sbc.com:/tlgvarhou/hou/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_HOU*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_HOU*.log > HOU_rel.txt
#--grep -v ': 0' HOU_rel.txt > HOU_release_changes.txt
#--cat Market.txt HOU_release_changes.txt > HOU_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > HOU_rel.txt
#--grep -v ': 0' HOU_rel.txt > HOU_release_changes.txt
#--cat Market.txt HOU_release_changes.txt > HOU_release_2.txt
#--cat HOU_release_1.txt HOU_release_2.txt > HOU_release.txt
#--gzip -9f RE*log


echo "AUS RnD Counts"
scp tlpvebc2.dadc.sbc.com:/tlgvaraus/aus/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_AUS*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_AUS*.log > AUS_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' AUS_rel.txt > AUS_rel_test.txt
cat AUS_rel_test.txt |  awk '$16 > 0 ' >> AUS_release_changes.txt
cat Market.txt AUS_release_changes.txt > AUS_release.txt

# sed 'N;s/\n//' AUS_rel.txt > AUS_rel_2.txt
# tr -cd '[:print:]\n' < AUS_rel_2.txt > AUS_rel_3.txt
# grep -v ': 0' AUS_rel_3.txt > AUS_release_changes.txt
# cat Market.txt AUS_release_changes.txt > AUS_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_AUS*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_AUS*.log > AUS_rel.txt
# sed 'N;s/\n//' AUS_rel.txt > AUS_rel_2.txt
# tr -cd '[:print:]\n' < AUS_rel_2.txt > AUS_rel_3.txt
# grep -v ': 0' AUS_rel_3.txt > AUS_release_changes.txt
# cat Market.txt AUS_release_changes.txt > AUS_release_2.txt
# cat AUS_release_1.txt AUS_release_2.txt > AUS_release.txt
gzip -9f RE*log

#--scp tlpvebc2.dadc.sbc.com:/tlgvarhou/aus/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_AUS*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_AUS*.log > AUS_rel.txt
#--grep -v ': 0' AUS_rel.txt > AUS_release_changes.txt
#--cat Market.txt AUS_release_changes.txt > AUS_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > AUS_rel.txt
#--grep -v ': 0' AUS_rel.txt > AUS_release_changes.txt
#--cat Market.txt AUS_release_changes.txt > AUS_release_2.txt
#--cat AUS_release_1.txt AUS_release_2.txt > AUS_release.txt


echo "WTX RnD Counts"
scp tlpvebc2.dadc.sbc.com:/tlgvarwtx/wtx/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_WTX*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_WTX*.log > WTX_rel.txt
awk '{ $8 = ""; $9 = ""; $10 = ""; print}' WTX_rel.txt > WTX_rel_test.txt
cat WTX_rel_test.txt |  awk '$16 > 0 ' >> WTX_release_changes.txt
cat Market.txt WTX_release_changes.txt > WTX_release.txt


# sed 'N;s/\n//' WTX_rel.txt > WTX_rel_2.txt
# tr -cd '[:print:]\n' < WTX_rel_2.txt > WTX_rel_3.txt
# grep -v ': 0' WTX_rel_3.txt > WTX_release_changes.txt
# cat Market.txt WTX_release_changes.txt > WTX_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_WTX*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_WTX*.log > WTX_rel.txt
# sed 'N;s/\n//' WTX_rel.txt > WTX_rel_2.txt
# tr -cd '[:print:]\n' < WTX_rel_2.txt > WTX_rel_3.txt
# grep -v ': 0' WTX_rel_3.txt > WTX_release_changes.txt
# cat Market.txt WTX_release_changes.txt > WTX_release_2.txt
# cat WTX_release_1.txt WTX_release_2.txt > WTX_release.txt
gzip -9f RE*log

#--scp tlpvebc2.dadc.sbc.com:/tlgvarwtx/wtx/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_WTX*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_WTX*.log > WTX_rel.txt
#--grep -v ': 0' WTX_rel.txt > WTX_release_changes.txt
#--cat Market.txt WTX_release_changes.txt > WTX_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > WTX_rel.txt
#--grep -v ': 0' WTX_rel.txt > WTX_release_changes.txt
#--cat Market.txt WTX_release_changes.txt > WTX_release_2.txt
#--cat WTX_release_1.txt WTX_release_2.txt > WTX_release.txt


echo "OKC RnD Counts"
scp tlpvebc1.dadc.sbc.com:/tlgvarokc/okc/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_OKC*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_OKC*.log > OKC_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' OKC_rel.txt > OKC_rel_test.txt
cat OKC_rel_test.txt |  awk '$16 > 0 ' >> OKC_release_changes.txt
cat Market.txt OKC_release_changes.txt > OKC_release.txt


# sed 'N;s/\n//' OKC_rel.txt > OKC_rel_2.txt
# tr -cd '[:print:]\n' < OKC_rel_2.txt > OKC_rel_3.txt
# grep -v ': 0' OKC_rel_3.txt > OKC_release_changes.txt
# cat Market.txt OKC_release_changes.txt > OKC_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_OKC*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_OKC*.log > OKC_rel.txt
# sed 'N;s/\n//' OKC_rel.txt > OKC_rel_2.txt
# tr -cd '[:print:]\n' < OKC_rel_2.txt > OKC_rel_3.txt
# grep -v ': 0' OKC_rel_3.txt > OKC_release_changes.txt
# cat Market.txt OKC_release_changes.txt > OKC_release_2.txt
# cat OKC_release_1.txt OKC_release_2.txt > OKC_release.txt
gzip -9f RE*log

#--scp tlpvebc1.dadc.sbc.com:/tlgvarokc/okc/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_OKC*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_OKC*.log > OKC_rel.txt
#--grep -v ': 0' OKC_rel.txt > OKC_release_changes.txt
#--cat Market.txt OKC_release_changes.txt > OKC_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > OKC_rel.txt
#--grep -v ': 0' OKC_rel.txt > OKC_release_changes.txt
#--cat Market.txt OKC_release_changes.txt > OKC_release_2.txt
#--cat OKC_release_1.txt OKC_release_2.txt > OKC_release.txt


echo "HCL RnD Counts"
scp tlpvebc1.dadc.sbc.com:/tlgvarHCL/HCL/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_HCL*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_HCL*.log > HCL_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' HCL_rel.txt > HCL_rel_test.txt
cat HCL_rel_test.txt |  awk '$16 > 0 ' >> HCL_release_changes.txt
cat Market.txt HCL_release_changes.txt > HCL_release.txt


# sed 'N;s/\n//' HCL_rel.txt > HCL_rel_2.txt
# tr -cd '[:print:]\n' < HCL_rel_2.txt > HCL_rel_3.txt
# grep -v ': 0' HCL_rel_3.txt > HCL_release_changes.txt
# cat Market.txt HCL_release_changes.txt > HCL_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_HCL*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_HCL*.log > HCL_rel.txt
# sed 'N;s/\n//' HCL_rel.txt > HCL_rel_2.txt
# tr -cd '[:print:]\n' < HCL_rel_2.txt > HCL_rel_3.txt
# grep -v ': 0' HCL_rel_3.txt > HCL_release_changes.txt
# cat Market.txt HCL_release_changes.txt > HCL_release_2.txt
# cat HCL_release_1.txt HCL_release_2.txt > HCL_release.txt
gzip -9f RE*log

#--scp tlpvebc1.dadc.sbc.com:/tlgvarHCL/HCL/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_HCL*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_HCL*.log > HCL_rel.txt
#--grep -v ': 0' HCL_rel.txt > HCL_release_changes.txt
#--cat Market.txt HCL_release_changes.txt > HCL_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > HCL_rel.txt
#--grep -v ': 0' HCL_rel.txt > HCL_release_changes.txt
#--cat Market.txt HCL_release_changes.txt > HCL_release_2.txt
#--cat HCL_release_1.txt HCL_release_2.txt > HCL_release.txt


echo "ARK RnD Counts"
scp tlpvebc1.dadc.sbc.com:/tlgvarark/ark/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_ARK*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_ARK*.log > ARK_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' ARK_rel.txt > ARK_rel_test.txt
cat ARK_rel_test.txt |  awk '$16 > 0 ' >> ARK_release_changes.txt
cat Market.txt ARK_release_changes.txt > ARK_release.txt

# sed 'N;s/\n//' ARK_rel.txt > ARK_rel_2.txt
# tr -cd '[:print:]\n' < ARK_rel_2.txt > ARK_rel_3.txt
# grep -v ': 0' ARK_rel_3.txt > ARK_release_changes.txt
# cat Market.txt ARK_release_changes.txt > ARK_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_ARK*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_ARK*.log > ARK_rel.txt
# sed 'N;s/\n//' ARK_rel.txt > ARK_rel_2.txt
# tr -cd '[:print:]\n' < ARK_rel_2.txt > ARK_rel_3.txt
# grep -v ': 0' ARK_rel_3.txt > ARK_release_changes.txt
# cat Market.txt ARK_release_changes.txt > ARK_release_2.txt
# cat ARK_release_1.txt ARK_release_2.txt > ARK_release.txt
gzip -9f RE*log

#--scp tlpvebc1.dadc.sbc.com:/tlgvarark/ark/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_ARK*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_ARK*.log > ARK_rel.txt
#--grep -v ': 0' ARK_rel.txt > ARK_release_changes.txt
#--cat Market.txt ARK_release_changes.txt > ARK_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > ARK_rel.txt
#--grep -v ': 0' ARK_rel.txt > ARK_release_changes.txt
#--cat Market.txt ARK_release_changes.txt > ARK_release_2.txt
#--cat ARK_release_1.txt ARK_release_2.txt > ARK_release.txt


echo "DLS RnD Counts"
scp tlpvebc3:/tlgvardls/dls/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_DLS*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_DLS*.log > DLS_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' DLS_rel.txt > DLS_rel_test.txt
cat DLS_rel_test.txt |  awk '$16 > 0 ' >> DLS_release_changes.txt
cat Market.txt DLS_release_changes.txt > DLS_release.txt

# sed 'N;s/\n//' DLS_rel.txt > DLS_rel_2.txt
# tr -cd '[:print:]\n' < DLS_rel_2.txt > DLS_rel_3.txt
# grep -v ': 0' DLS_rel_3.txt > DLS_release_changes.txt
# cat Market.txt DLS_release_changes.txt > DLS_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_DLS*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_DLS*.log > DLS_rel.txt
# sed 'N;s/\n//' DLS_rel.txt > DLS_rel_2.txt
# tr -cd '[:print:]\n' < DLS_rel_2.txt > DLS_rel_3.txt
# grep -v ': 0' DLS_rel_3.txt > DLS_release_changes.txt
# cat Market.txt DLS_release_changes.txt > DLS_release_2.txt
# cat DLS_release_1.txt DLS_release_2.txt > DLS_release.txt
gzip -9f RE*log


echo "HCL RnD Counts"
scp tlpvebc3:/tlgvarhcl/hcl/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_HCL*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_HCL*.log > HCL_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' HCL_rel.txt > HCL_rel_test.txt
cat HCL_rel_test.txt |  awk '$16 > 0 ' >> HCL_release_changes.txt
cat Market.txt HCL_release_changes.txt > HCL_release.txt

# sed 'N;s/\n//' HCL_rel.txt > HCL_rel_2.txt
# tr -cd '[:print:]\n' < HCL_rel_2.txt > HCL_rel_3.txt
# grep -v ': 0' HCL_rel_3.txt > HCL_release_changes.txt
# cat Market.txt HCL_release_changes.txt > HCL_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_HCL*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_HCL*.log > HCL_rel.txt
# sed 'N;s/\n//' HCL_rel.txt > HCL_rel_2.txt
# tr -cd '[:print:]\n' < HCL_rel_2.txt > HCL_rel_3.txt
# grep -v ': 0' HCL_rel_3.txt > HCL_release_changes.txt
# cat Market.txt HCL_release_changes.txt > HCL_release_2.txt
# cat HCL_release_1.txt HCL_release_2.txt > HCL_release.txt
gzip -9f RE*log

#--scp tlpvebc3:/tlgvarhcl/hcl/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_HCL*.log > Market.txt
#--grep -E "Num of rows for table|, in refw" RE*SP*161013_HCL*.log > HCL_rel.txt
#--sed 'N;s/\n//' HCL_rel.txt > HCL_rel_2.txt
#--tr -cd '[:print:]\n' < HCL_rel_2.txt > HCL_rel_3.txt
#--grep -v ': 0' HCL_rel_3.txt > HCL_release_changes.txt
#--cat Market.txt HCL_release_changes.txt > HCL_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A_HCL*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > HCL_rel.txt
#--grep -v ': 0' HCL_rel.txt > HCL_release_changes.txt
#--cat Market.txt HCL_release_changes.txt > HCL_release_2.txt
#--cat HCL_release_1.txt HCL_release_2.txt > HCL_release.txt


echo "STL RnD Counts"
scp tlpvebc3:/tlgvarstl/stl/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_STL*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_STL*.log > STL_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' STL_rel.txt > STL_rel_test.txt
cat STL_rel_test.txt |  awk '$16 > 0 ' >> STL_release_changes.txt
cat Market.txt STL_release_changes.txt > STL_release.txt

# sed 'N;s/\n//' STL_rel.txt > STL_rel_2.txt
# tr -cd '[:print:]\n' < STL_rel_2.txt > STL_rel_3.txt
# grep -v ': 0' STL_rel_3.txt > STL_release_changes.txt
# cat Market.txt STL_release_changes.txt > STL_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_STL*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_STL*.log > STL_rel.txt
# sed 'N;s/\n//' STL_rel.txt > STL_rel_2.txt
# tr -cd '[:print:]\n' < STL_rel_2.txt > STL_rel_3.txt
# grep -v ': 0' STL_rel_3.txt > STL_release_changes.txt
# cat Market.txt STL_release_changes.txt > STL_release_2.txt
# cat STL_release_1.txt STL_release_2.txt > STL_release.txt
gzip -9f RE*log

#--scp tlpvebc3:/tlgvarstl/stl/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_STL*.log > Market.txt
#--grep -E "Num of rows for table|, in refw" RE*SP*161013_STL*.log > STL_rel.txt
#--sed 'N;s/\n//' STL_rel.txt > STL_rel_2.txt
#--tr -cd '[:print:]\n' < STL_rel_2.txt > STL_rel_3.txt
#--grep -v ': 0' STL_rel_3.txt > STL_release_changes.txt
#--cat Market.txt STL_release_changes.txt > STL_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > STL_rel.txt
#--grep -v ': 0' STL_rel.txt > STL_release_changes.txt
#--cat Market.txt STL_release_changes.txt > STL_release_2.txt
#--cat STL_release_1.txt STL_release_2.txt > STL_release.txt
#--gzip -9f RE*log


echo "MWR RnD Counts"
scp tlpvebc1:/tlgvarmwr/mwr/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_MWR*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_MWR*.log > MWR_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' MWR_rel.txt > MWR_rel_test.txt
cat MWR_rel_test.txt |  awk '$16 > 0 ' >> MWR_release_changes.txt
cat Market.txt MWR_release_changes.txt > MWR_release.txt

# sed 'N;s/\n//' MWR_rel.txt > MWR_rel_2.txt
# tr -cd '[:print:]\n' < MWR_rel_2.txt > MWR_rel_3.txt
# grep -v ': 0' MWR_rel_3.txt > MWR_release_changes.txt
# cat Market.txt MWR_release_changes.txt > MWR_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_MWR*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_MWR*.log > MWR_rel.txt
# sed 'N;s/\n//' MWR_rel.txt > MWR_rel_2.txt
# tr -cd '[:print:]\n' < MWR_rel_2.txt > MWR_rel_3.txt
# grep -v ': 0' MWR_rel_3.txt > MWR_release_changes.txt
# cat Market.txt MWR_release_changes.txt > MWR_release_2.txt
# cat MWR_release_1.txt MWR_release_2.txt > MWR_release.txt
gzip -9f RE*log

#--scp tlpvebc1:/tlgvarmwr/mwr/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_MWR*.log > Market.txt
#--grep -E "Num of rows for table|, in refw" RE*SP*161013_MWR*.log > MWR_rel.txt
#--sed 'N;s/\n//' MWR_rel.txt > MWR_rel_2.txt
#--tr -cd '[:print:]\n' < MWR_rel_2.txt > MWR_rel_3.txt
#--grep -v ': 0' MWR_rel_3.txt > MWR_release_changes.txt
#--cat Market.txt MWR_release_changes.txt > MWR_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > MWR_rel.txt
#--grep -v ': 0' MWR_rel.txt > MWR_release_changes.txt
#--cat Market.txt MWR_release_changes.txt > MWR_release_2.txt
#--cat MWR_release_1.txt MWR_release_2.txt > MWR_release.txt


echo "PAC RnD Counts"
scp tlpvebp1:/tlgvarpac/pac/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_PAC*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_PAC*.log > PAC_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' PAC_rel.txt > PAC_rel_test.txt
cat PAC_rel_test.txt |  awk '$16 > 0 ' >> PAC_release_changes.txt
cat Market.txt PAC_release_changes.txt > PAC_release.txt

# sed 'N;s/\n//' PAC_rel.txt > PAC_rel_2.txt
# tr -cd '[:print:]\n' < PAC_rel_2.txt > PAC_rel_3.txt
# grep -v ': 0' PAC_rel_3.txt > PAC_release_changes.txt
# cat Market.txt PAC_release_changes.txt > PAC_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_PAC*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_PAC*.log > PAC_rel.txt
# sed 'N;s/\n//' PAC_rel.txt > PAC_rel_2.txt
# tr -cd '[:print:]\n' < PAC_rel_2.txt > PAC_rel_3.txt
# grep -v ': 0' PAC_rel_3.txt > PAC_release_changes.txt
# cat Market.txt PAC_release_changes.txt > PAC_release_2.txt
# cat PAC_release_1.txt PAC_release_2.txt > PAC_release.txt
gzip -9f RE*log

#--scp tlpvebp1:/tlgvarpac/pac/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_PAC*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_PAC*.log > PAC_rel.txt
#--grep -v ': 0' PAC_rel.txt > PAC_release_changes.txt
#--cat Market.txt PAC_release_changes.txt > PAC_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > PAC_rel.txt
#--grep -v ': 0' PAC_rel.txt > PAC_release_changes.txt
#--cat Market.txt PAC_release_changes.txt > PAC_release_2.txt
#--cat PAC_release_1.txt PAC_release_2.txt > PAC_release.txt

#--echo "PAC RnD Counts 2"
#--scp tlpvebp1:/tlgvarpac/pac/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_PAC*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_PAC*.log > PAC_rel.txt
#--grep -v ': 0' PAC_rel.txt > PAC_release_changes.txt
#--cat Market.txt PAC_release_changes.txt > PAC_release_3.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > PAC_rel.txt
#--grep -v ': 0' PAC_rel.txt > PAC_release_changes.txt
#--cat Market.txt PAC_release_changes.txt > PAC_release_4.txt
#--cat PAC_release_3.txt PAC_release_4.txt > PAC_release_5.txt
#--gzip -9f RE*log


echo "NCA RnD Counts"
scp tlpvebp1:/tlgvarnca/nca/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_NCA*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_NCA*.log > NCA_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' NCA_rel.txt > NCA_rel_test.txt
cat NCA_rel_test.txt |  awk '$16 > 0 ' >> NCA_release_changes.txt
cat Market.txt NCA_release_changes.txt > NCA_release.txt

# sed 'N;s/\n//' NCA_rel.txt > NCA_rel_2.txt
# tr -cd '[:print:]\n' < NCA_rel_2.txt > NCA_rel_3.txt
# grep -v ': 0' NCA_rel_3.txt > NCA_release_changes.txt
# cat Market.txt NCA_release_changes.txt > NCA_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_NCA*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_NCA*.log > NCA_rel.txt
# sed 'N;s/\n//' NCA_rel.txt > NCA_rel_2.txt
# tr -cd '[:print:]\n' < NCA_rel_2.txt > NCA_rel_3.txt
# grep -v ': 0' NCA_rel_3.txt > NCA_release_changes.txt
# cat Market.txt NCA_release_changes.txt > NCA_release_2.txt
# cat NCA_release_1.txt NCA_release_2.txt > NCA_release.txt
gzip -9f RE*log

#--scp tlpvebp1:/tlgvarnca/nca/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_NCA*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_NCA*.log > NCA_rel.txt
#--grep -v ': 0' NCA_rel.txt > NCA_release_changes.txt
#--cat Market.txt NCA_release_changes.txt > NCA_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > NCA_rel.txt
#--grep -v ': 0' NCA_rel.txt > NCA_release_changes.txt
#--cat Market.txt NCA_release_changes.txt > NCA_release_2.txt
#--cat NCA_release_1.txt NCA_release_2.txt > NCA_release.txt

#--echo "NCA RnD Counts 2"
#--scp tlpvebp1:/tlgvarnca/nca/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_NCA*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_NCA*.log > NCA_rel.txt
#--grep -v ': 0' NCA_rel.txt > NCA_release_changes.txt
#--cat Market.txt NCA_release_changes.txt > NCA_release_3.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > NCA_rel.txt
#--grep -v ': 0' NCA_rel.txt > NCA_release_changes.txt
#--cat Market.txt NCA_release_changes.txt > NCA_release_4.txt
#--cat NCA_release_3.txt NCA_release_4.txt > NCA_release_5.txt

echo "BOS RnD Counts"
scp tlpvebe1:/tlgvarbos/bos/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_BOS*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_BOS*.log > BOS_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' BOS_rel.txt > BOS_rel_test.txt
cat BOS_rel_test.txt |  awk '$16 > 0 ' >> BOS_release_changes.txt
cat Market.txt BOS_release_changes.txt > BOS_release.txt

# sed 'N;s/\n//' BOS_rel.txt > BOS_rel_2.txt
# tr -cd '[:print:]\n' < BOS_rel_2.txt > BOS_rel_3.txt
# grep -v ': 0' BOS_rel_3.txt > BOS_release_changes.txt
# cat Market.txt BOS_release_changes.txt > BOS_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_BOS*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_BOS*.log > BOS_rel.txt
# sed 'N;s/\n//' BOS_rel.txt > BOS_rel_2.txt
# tr -cd '[:print:]\n' < BOS_rel_2.txt > BOS_rel_3.txt
# grep -v ': 0' BOS_rel_3.txt > BOS_release_changes.txt
# cat Market.txt BOS_release_changes.txt > BOS_release_2.txt
# cat BOS_release_1.txt BOS_release_2.txt > BOS_release.txt
gzip -9f RE*log

#--scp tlpvebe1:/tlgvarbos/bos/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_BOS*.log > Market.txt
#--grep -E "Num of rows for table|, in refw" RE*SP*161013_BOS*.log > BOS_rel.txt
#--sed 'N;s/\n//' BOS_rel.txt > BOS_rel_2.txt
#--tr -cd '[:print:]\n' < BOS_rel_2.txt > BOS_rel_3.txt
#--grep -v ': 0' BOS_rel_3.txt > BOS_release_changes.txt
#--cat Market.txt BOS_release_changes.txt > BOS_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > BOS_rel.txt
#--grep -v ': 0' BOS_rel.txt > BOS_release_changes.txt
#--cat Market.txt BOS_release_changes.txt > BOS_release_2.txt
#--cat BOS_release_1.txt BOS_release_2.txt > BOS_release.txt
#--gzip -9f RE*log

echo "NYR RnD Counts"
scp tlpvebe1:/tlgvarnyr/nyr/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_NYR*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_NYR*.log > NYR_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' NYR_rel.txt > NYR_rel_test.txt
cat NYR_rel_test.txt |  awk '$16 > 0 ' >> NYR_release_changes.txt
cat Market.txt NYR_release_changes.txt > NYR_release.txt

# sed 'N;s/\n//' NYR_rel.txt > NYR_rel_2.txt
# tr -cd '[:print:]\n' < NYR_rel_2.txt > NYR_rel_3.txt
# grep -v ': 0' NYR_rel_3.txt > NYR_release_changes.txt
# cat Market.txt NYR_release_changes.txt > NYR_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_NYR*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_NYR*.log > NYR_rel.txt
# sed 'N;s/\n//' NYR_rel.txt > NYR_rel_2.txt
# tr -cd '[:print:]\n' < NYR_rel_2.txt > NYR_rel_3.txt
# grep -v ': 0' NYR_rel_3.txt > NYR_release_changes.txt
# cat Market.txt NYR_release_changes.txt > NYR_release_2.txt
# cat NYR_release_1.txt NYR_release_2.txt > NYR_release.txt
gzip -9f RE*log

#--scp tlpvebe1:/tlgvarnyr/nyr/log/RELEASE_SP*161013*.log . 
#--grep -i 'Market: ' RE*SP*161013_NYR*.log > Market.txt
#--grep -E "Num of rows for table|, in refw" RE*SP*161013_NYR*.log > NYR_rel.txt
#--sed 'N;s/\n//' NYR_rel.txt > NYR_rel_2.txt
#--tr -cd '[:print:]\n' < NYR_rel_2.txt > NYR_rel_3.txt
#--grep -v ': 0' NYR_rel_3.txt > NYR_release_changes.txt
#--cat Market.txt NYR_release_changes.txt > NYR_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > NYR_rel.txt
#--grep -v ': 0' NYR_rel.txt > NYR_release_changes.txt
#--cat Market.txt NYR_release_changes.txt > NYR_release_2.txt
#--cat NYR_release_1.txt NYR_release_2.txt > NYR_release.txt
#--gzip -9f RE*log

echo "WAS RnD Counts"
scp tlpvebe1:/tlgvarwas/was/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_WAS*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_WAS*.log > WAS_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' WAS_rel.txt > WAS_rel_test.txt
cat WAS_rel_test.txt |  awk '$16 > 0 ' >> WAS_release_changes.txt
cat Market.txt WAS_release_changes.txt > WAS_release.txt

# sed 'N;s/\n//' WAS_rel.txt > WAS_rel_2.txt
# tr -cd '[:print:]\n' < WAS_rel_2.txt > WAS_rel_3.txt
# grep -v ': 0' WAS_rel_3.txt > WAS_release_changes.txt
# cat Market.txt WAS_release_changes.txt > WAS_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_WAS*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_WAS*.log > WAS_rel.txt
# sed 'N;s/\n//' WAS_rel.txt > WAS_rel_2.txt
# tr -cd '[:print:]\n' < WAS_rel_2.txt > WAS_rel_3.txt
# grep -v ': 0' WAS_rel_3.txt > WAS_release_changes.txt
# cat Market.txt WAS_release_changes.txt > WAS_release_2.txt
# cat WAS_release_1.txt WAS_release_2.txt > WAS_release.txt
gzip -9f RE*log

#--scp tlpvebe1:/tlgvarwas/was/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_WAS*.log > Market.txt
#--grep -E "Num of rows for table|, in refw" RE*SP*161013_WAS*.log > WAS_rel.txt
#--sed 'N;s/\n//' WAS_rel.txt > WAS_rel_2.txt
#--tr -cd '[:print:]\n' < WAS_rel_2.txt > WAS_rel_3.txt
#--grep -v ': 0' WAS_rel_3.txt > WAS_release_changes.txt
#--cat Market.txt WAS_release_changes.txt > WAS_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > WAS_rel.txt
#--grep -v ': 0' WAS_rel.txt > WAS_release_changes.txt
#--cat Market.txt WAS_release_changes.txt > WAS_release_2.txt
#--cat WAS_release_1.txt WAS_release_2.txt > WAS_release.txt
#--gzip -9f RE*log

echo "SNE RnD Counts"
scp tlpvebe1:/tlgvarsne/sne/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_SNE*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_SNE*.log > SNE_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' SNE_rel.txt > SNE_rel_test.txt
cat SNE_rel_test.txt |  awk '$16 > 0 ' >> SNE_release_changes.txt
cat Market.txt SNE_release_changes.txt > SNE_release.txt

# sed 'N;s/\n//' SNE_rel.txt > SNE_rel_2.txt
# tr -cd '[:print:]\n' < SNE_rel_2.txt > SNE_rel_3.txt
# grep -v ': 0' SNE_rel_3.txt > SNE_release_changes.txt
# cat Market.txt SNE_release_changes.txt > SNE_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_SNE*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_SNE*.log > SNE_rel.txt
# sed 'N;s/\n//' SNE_rel.txt > SNE_rel_2.txt
# tr -cd '[:print:]\n' < SNE_rel_2.txt > SNE_rel_3.txt
# grep -v ': 0' SNE_rel_3.txt > SNE_release_changes.txt
# cat Market.txt SNE_release_changes.txt > SNE_release_2.txt
# cat SNE_release_1.txt SNE_release_2.txt > SNE_release.txt
gzip -9f RE*log

#--scp tlpvebe1:/tlgvarsne/sne/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_SNE*.log > Market.txt
#--grep -E "Num of rows for table|, in refw" RE*SP*161013_SNE*.log > SNE_rel.txt
#--sed 'N;s/\n//' SNE_rel.txt > SNE_rel_2.txt
#--tr -cd '[:print:]\n' < SNE_rel_2.txt > SNE_rel_3.txt
#--grep -v ': 0' SNE_rel_3.txt > SNE_release_changes.txt
#--cat Market.txt SNE_release_changes.txt > SNE_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > SNE_rel.txt
#--grep -v ': 0' SNE_rel.txt > SNE_release_changes.txt
#--cat Market.txt SNE_release_changes.txt > SNE_release_2.txt
#--cat SNE_release_1.txt SNE_release_2.txt > SNE_release.txt
#--gzip -9f RE*log

echo "GLR RnD Counts"
scp ulpvebc5.madc.att.com:/tlgvarglr/glr/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_GLR*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_GLR*.log > GLR_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' GLR_rel.txt > GLR_rel_test.txt
cat GLR_rel_test.txt |  awk '$16 > 0 ' >> GLR_release_changes.txt
cat Market.txt GLR_release_changes.txt > GLR_release.txt


# sed 'N;s/\n//' GLR_rel.txt > GLR_rel_2.txt
# tr -cd '[:print:]\n' < GLR_rel_2.txt > GLR_rel_3.txt
# grep -v ': 0' GLR_rel_3.txt > GLR_release_changes.txt
# cat Market.txt GLR_release_changes.txt > GLR_release_1.txt
# grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
# grep -i 'Num of rows for table' RE*SP*161013A*.log > GLR_rel.txt
# grep -v ': 0' GLR_rel.txt > GLR_release_changes.txt
# cat Market.txt GLR_release_changes.txt > GLR_release_2.txt
# cat GLR_release_1.txt GLR_release_2.txt > GLR_release.txt
gzip -9f RE*log

echo "ILL RnD Counts"
scp ulpvebc5.madc.att.com:/tlgvarill/ill/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_ILL*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_ILL*.log > ILL_rel.txt
awk '{ $8 = ""; $9 = ""; $10 = ""; print}' ILL_rel.txt > ILL_rel_test.txt
cat ILL_rel_test.txt |  awk '$16 > 0 ' >> ILL_release_changes.txt
cat Market.txt ILL_release_changes.txt > ILL_release.txt


# sed 'N;s/\n//' ILL_rel.txt > ILL_rel_2.txt
# tr -cd '[:print:]\n' < ILL_rel_2.txt > ILL_rel_3.txt
# grep -v ': 0' ILL_rel_3.txt > ILL_release_changes.txt
# cat Market.txt ILL_release_changes.txt > ILL_release_1.txt
# grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
# grep -i 'Num of rows for table' RE*SP*161013A*.log > ILL_rel.txt
# grep -v ': 0' ILL_rel.txt > ILL_release_changes.txt
# cat Market.txt ILL_release_changes.txt > ILL_release_2.txt
# cat ILL_release_1.txt ILL_release_2.txt > ILL_release.txt
gzip -9f RE*log

echo "GPL RnD Counts"
scp ulpvebc5.madc.att.com:/tlgvargpl/gpl/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_GPL*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_GPL*.log > GPL_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' GPL_rel.txt > GPL_rel_test.txt
cat GPL_rel_test.txt |  awk '$16 > 0 ' >> GPL_release_changes.txt
cat Market.txt GPL_release_changes.txt > GPL_release.txt

# sed 'N;s/\n//' GPL_rel.txt > GPL_rel_2.txt
# tr -cd '[:print:]\n' < GPL_rel_2.txt > GPL_rel_3.txt
# grep -v ': 0' GPL_rel_3.txt > GPL_release_changes.txt
# cat Market.txt GPL_release_changes.txt > GPL_release_1.txt
# grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_GPL*.log > GPL_rel.txt
# sed 'N;s/\n//' GPL_rel.txt > GPL_rel_2.txt
# tr -cd '[:print:]\n' < GPL_rel_2.txt > GPL_rel_3.txt
# grep -v ': 0' GPL_rel_3.txt > GPL_release_changes.txt
# cat Market.txt GPL_release_changes.txt > GPL_release_2.txt
# cat GPL_release_1.txt GPL_release_2.txt > GPL_release.txt
gzip -9f RE*log

echo "ALH RnD Counts"
scp tlpvebp1:/tlgvaralh/alh/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_ALH*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_ALH*.log > ALH_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' ALH_rel.txt > ALH_rel_test.txt
cat ALH_rel_test.txt |  awk '$16 > 0 ' >> ALH_release_changes.txt
cat Market.txt ALH_release_changes.txt > ALH_release.txt

# sed 'N;s/\n//' ALH_rel.txt > ALH_rel_2.txt
# tr -cd '[:print:]\n' < ALH_rel_2.txt > ALH_rel_3.txt
# grep -v ': 0' ALH_rel_3.txt > ALH_release_changes.txt
# cat Market.txt ALH_release_changes.txt > ALH_release_1.txt
# grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_ALH*.log > ALH_rel.txt
# sed 'N;s/\n//' ALH_rel.txt > ALH_rel_2.txt
# tr -cd '[:print:]\n' < ALH_rel_2.txt > ALH_rel_3.txt
# grep -v ': 0' ALH_rel_3.txt > ALH_release_changes.txt
# cat Market.txt ALH_release_changes.txt > ALH_release_2.txt
# cat ALH_release_1.txt ALH_release_2.txt > ALH_release.txt
gzip -9f RE*log

echo "MTZ RnD Counts"
scp tlpvebm1:/tlgvarmtz/mtz/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_MTZ*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_MTZ*.log > MTZ_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' MTZ_rel.txt > MTZ_rel_test.txt
cat MTZ_rel_test.txt |  awk '$16 > 0 ' >> MTZ_release_changes.txt
cat Market.txt MTZ_release_changes.txt > MTZ_release.txt

# sed 'N;s/\n//' MTZ_rel.txt > MTZ_rel_2.txt
# tr -cd '[:print:]\n' < MTZ_rel_2.txt > MTZ_rel_3.txt
# grep -v ': 0' MTZ_rel_3.txt > MTZ_release_changes.txt
# cat Market.txt MTZ_release_changes.txt > MTZ_release_1.txt
# grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
# grep -i 'Num of rows for table' RE*SP*161013A*.log > MTZ_rel.txt
# grep -v ': 0' MTZ_rel.txt > MTZ_release_changes.txt
# cat Market.txt MTZ_release_changes.txt > MTZ_release_2.txt
# cat MTZ_release_1.txt MTZ_release_2.txt > MTZ_release.txt
gzip -9f RE*log

#--echo "MTZ RnD Counts 2"
#--scp dhptg46b:/tlgvarmtz/mtz/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_MTZ*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_MTZ*.log > MTZ_rel.txt
#--grep -v ': 0' MTZ_rel.txt > MTZ_release_changes.txt
#--cat Market.txt MTZ_release_changes.txt > MTZ_release_3.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > MTZ_rel.txt
#--grep -v ': 0' MTZ_rel.txt > MTZ_release_changes.txt
#--cat Market.txt MTZ_release_changes.txt > MTZ_release_4.txt
#--cat MTZ_release_3.txt MTZ_release_4.txt > MTZ_release_5.txt

echo "NWS RnD Counts"
scp tlpvebp1:/tlgvarnws/nws/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_NWS*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_NWS*.log > NWS_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' NWS_rel.txt > NWS_rel_test.txt
cat NWS_rel_test.txt |  awk '$16 > 0 ' >> NWS_release_changes.txt
cat Market.txt NWS_release_changes.txt > NWS_release.txt

# sed 'N;s/\n//' NWS_rel.txt > NWS_rel_2.txt
# tr -cd '[:print:]\n' < NWS_rel_2.txt > NWS_rel_3.txt
# grep -v ': 0' NWS_rel_3.txt > NWS_release_changes.txt
# cat Market.txt NWS_release_changes.txt > NWS_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_NWS*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_NWS*.log > NWS_rel.txt
# sed 'N;s/\n//' NWS_rel.txt > NWS_rel_2.txt
# tr -cd '[:print:]\n' < NWS_rel_2.txt > NWS_rel_3.txt
# grep -v ': 0' NWS_rel_3.txt > NWS_release_changes.txt
# cat Market.txt NWS_release_changes.txt > NWS_release_2.txt
# cat NWS_release_1.txt NWS_release_2.txt > NWS_release.txt
gzip -9f RE*log

#--scp tlpvebp1:/tlgvarnws/nws/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_NWS*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_NWS*.log > NWS_rel.txt
#--grep -v ': 0' NWS_rel.txt > NWS_release_changes.txt
#--cat Market.txt NWS_release_changes.txt > NWS_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > NWS_rel.txt
#--grep -v ': 0' NWS_rel.txt > NWS_release_changes.txt
#--cat Market.txt NWS_release_changes.txt > NWS_release_2.txt
#--cat NWS_release_1.txt NWS_release_2.txt > NWS_release.txt
#--gzip -9f RE*log

#---echo "NWS RnD Counts 2"
#---scp dhptg48a:/tlgvarnws/nws/log/RELEASE_SP*161013*.log .
#---grep -i 'Market: ' RE*SP*161013_NWS*.log > Market.txt
#---grep -i 'Num of rows for table' RE*SP*161013_NWS*.log > NWS_rel.txt
#---grep -v ': 0' NWS_rel.txt > NWS_release_changes.txt
#---cat Market.txt NWS_release_changes.txt > NWS_release_3.txt
#---grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#---grep -i 'Num of rows for table' RE*SP*161013A*.log > NWS_rel.txt
#--grep -v ': 0' NWS_rel.txt > NWS_release_changes.txt
#--cat Market.txt NWS_release_changes.txt > NWS_release_4.txt
#--cat NWS_release_3.txt NWS_release_4.txt > NWS_release_5.txt
#--gzip -9f RE*log

echo "NBI RnD Counts"
scp olpvebc6.bodc.att.com:/tlgvarnbi/nbi/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_NBI*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_NBI*.log > NBI_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' NBI_rel.txt > NBI_rel_test.txt
cat NBI_rel_test.txt |  awk '$16 > 0 ' >> NBI_release_changes.txt
cat Market.txt NBI_release_changes.txt > NBI_release.txt

# sed 'N;s/\n//' NBI_rel.txt > NBI_rel_2.txt
# tr -cd '[:print:]\n' < NBI_rel_2.txt > NBI_rel_3.txt
# grep -v ': 0' NBI_rel_3.txt > NBI_release_changes.txt
# cat Market.txt NBI_release_changes.txt > NBI_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_NBI*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_NBI*.log > NBI_rel.txt
# sed 'N;s/\n//' NBI_rel.txt > NBI_rel_2.txt
# tr -cd '[:print:]\n' < NBI_rel_2.txt > NBI_rel_3.txt
# grep -v ': 0' NBI_rel_3.txt > NBI_release_changes.txt
# cat Market.txt NBI_release_changes.txt > NBI_release_2.txt
# cat NBI_release_1.txt NBI_release_2.txt > NBI_release.txt
gzip -9f RE*log

#--scp olpvebc6.bodc.att.com:/tlgvarnbi/nbi/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_NBI*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_NBI*.log > NBI_rel.txt
#--grep -v ': 0' NBI_rel.txt > NBI_release_changes.txt
#--cat Market.txt NBI_release_changes.txt > NBI_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > NBI_rel.txt
#--grep -v ': 0' NBI_rel.txt > NBI_release_changes.txt
#--cat Market.txt NBI_release_changes.txt > NBI_release_2.txt
#--cat NBI_release_1.txt NBI_release_2.txt > NBI_release.txt
#--gzip -9f RE*log

echo "IND RnD Counts"
scp olpvebe6.bodc.att.com:/tlgvarind/ind/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_IND*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_IND*.log > IND_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' IND_rel.txt > IND_rel_test.txt
cat IND_rel_test.txt |  awk '$16 > 0 ' >> IND_release_changes.txt
cat Market.txt IND_release_changes.txt > IND_release.txt

# sed 'N;s/\n//' IND_rel.txt > IND_rel_2.txt
# tr -cd '[:print:]\n' < IND_rel_2.txt > IND_rel_3.txt
# grep -v ': 0' IND_rel_3.txt > IND_release_changes.txt
# cat Market.txt IND_release_changes.txt > IND_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_IND*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_IND*.log > IND_rel.txt
# sed 'N;s/\n//' IND_rel.txt > IND_rel_2.txt
# tr -cd '[:print:]\n' < IND_rel_2.txt > IND_rel_3.txt
# grep -v ': 0' IND_rel_3.txt > IND_release_changes.txt
# cat Market.txt IND_release_changes.txt > IND_release_2.txt
# cat IND_release_1.txt IND_release_2.txt > IND_release.txt
gzip -9f RE*log

#--scp  olpvebe6.bodc.att.com:/tlgvarind/ind/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_IND*.log > Market.txt
#--grep -E "Num of rows for table|, in refw" RE*SP*161013_IND*.log > IND_rel.txt
#--sed 'N;s/\n//' IND_rel.txt > IND_rel_2.txt
#--tr -cd '[:print:]\n' < IND_rel_2.txt > IND_rel_3.txt
#--grep -v ': 0' IND_rel_3.txt > IND_release_changes.txt
#--cat Market.txt IND_release_changes.txt > IND_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > IND_rel.txt
#--grep -v ': 0' IND_rel.txt > IND_release_changes.txt
#--cat Market.txt IND_release_changes.txt > IND_release_2.txt
#--cat IND_release_1.txt IND_release_2.txt > IND_release.txt
#--gzip -9f RE*log

echo "PHI RnD Counts"
scp blpvebe8.bhdc.att.com:/tlgvarphi/phi/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_PHI*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_PHI*.log > PHI_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' PHI_rel.txt > PHI_rel_test.txt
cat PHI_rel_test.txt |  awk '$16 > 0 ' >> PHI_release_changes.txt
cat Market.txt PHI_release_changes.txt > PHI_release.txt

# sed 'N;s/\n//' PHI_rel.txt > PHI_rel_2.txt
# tr -cd '[:print:]\n' < PHI_rel_2.txt > PHI_rel_3.txt
# grep -v ': 0' PHI_rel_3.txt > PHI_release_changes.txt
# cat Market.txt PHI_release_changes.txt > PHI_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_PHI*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_PHI*.log > PHI_rel.txt
# sed 'N;s/\n//' PHI_rel.txt > PHI_rel_2.txt
# tr -cd '[:print:]\n' < PHI_rel_2.txt > PHI_rel_3.txt
# grep -v ': 0' PHI_rel_3.txt > PHI_release_changes.txt
# cat Market.txt PHI_release_changes.txt > PHI_release_2.txt
# cat PHI_release_1.txt PHI_release_2.txt > PHI_release.txt
gzip -9f RE*log

#--scp blpvebe8.bhdc.att.com:/tlgvarphi/phi/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_PHI*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_PHI*.log > PHI_rel.txt
#--grep -v ': 0' PHI_rel.txt > PHI_release_changes.txt
#--cat Market.txt PHI_release_changes.txt > PHI_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > PHI_rel.txt
#--grep -v ': 0' PHI_rel.txt > PHI_release_changes.txt
#--cat Market.txt PHI_release_changes.txt > PHI_release_2.txt
#--cat PHI_release_1.txt PHI_release_2.txt > PHI_release.txt
#--gzip -9f RE*log

echo "MNY RnD Counts"
scp blpvebe8.bhdc.att.com:/tlgvarmny/mny/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_MNY*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_MNY*.log > MNY_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' MNY_rel.txt > MNY_rel_test.txt
cat MNY_rel_test.txt |  awk '$16 > 0 ' >> MNY_release_changes.txt
cat Market.txt MNY_release_changes.txt > MNY_release.txt

# sed 'N;s/\n//' MNY_rel.txt > MNY_rel_2.txt
# tr -cd '[:print:]\n' < MNY_rel_2.txt > MNY_rel_3.txt
# grep -v ': 0' MNY_rel_3.txt > MNY_release_changes.txt
# cat Market.txt MNY_release_changes.txt > MNY_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_MNY*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_MNY*.log > MNY_rel.txt
# sed 'N;s/\n//' MNY_rel.txt > MNY_rel_2.txt
# tr -cd '[:print:]\n' < MNY_rel_2.txt > MNY_rel_3.txt
# grep -v ': 0' MNY_rel_3.txt > MNY_release_changes.txt
# cat Market.txt MNY_release_changes.txt > MNY_release_2.txt
# cat MNY_release_1.txt MNY_release_2.txt > MNY_release.txt
gzip -9f RE*log

#--scp  blpvebe8.bhdc.att.com:/tlgvarmny/mny/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_MNY*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_MNY*.log > MNY_rel.txt
#--grep -v ': 0' MNY_rel.txt > MNY_release_changes.txt
#--cat Market.txt MNY_release_changes.txt > MNY_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > MNY_rel.txt
#--grep -v ': 0' MNY_rel.txt > MNY_release_changes.txt
#--cat Market.txt MNY_release_changes.txt > MNY_release_2.txt
#--cat MNY_release_1.txt MNY_release_2.txt > MNY_release.txt
#--gzip -9f RE*log

echo "FLP RnD Counts"
scp blpvebe8.bhdc.att.com:/tlgvarflp/flp/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_FLP*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_FLP*.log > FLP_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' FLP_rel.txt > FLP_rel_test.txt
cat FLP_rel_test.txt |  awk '$16 > 0 ' >> FLP_release_changes.txt
cat Market.txt FLP_release_changes.txt > FLP_release.txt

# sed 'N;s/\n//' FLP_rel.txt > FLP_rel_2.txt
# tr -cd '[:print:]\n' < FLP_rel_2.txt > FLP_rel_3.txt
# grep -v ': 0' FLP_rel_3.txt > FLP_release_changes.txt
# cat Market.txt FLP_release_changes.txt > FLP_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_FLP*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_FLP*.log > FLP_rel.txt
# sed 'N;s/\n//' FLP_rel.txt > FLP_rel_2.txt
# tr -cd '[:print:]\n' < FLP_rel_2.txt > FLP_rel_3.txt
# grep -v ': 0' FLP_rel_3.txt > FLP_release_changes.txt
# cat Market.txt FLP_release_changes.txt > FLP_release_2.txt
# cat FLP_release_1.txt FLP_release_2.txt > FLP_release.txt
gzip -9f RE*log

#--scp  blpvebe8.bhdc.att.com:/tlgvarflp/flp/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_FLP*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_FLP*.log > FLP_rel.txt
#--grep -v ': 0' FLP_rel.txt > FLP_release_changes.txt
#--cat Market.txt FLP_release_changes.txt > FLP_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > FLP_rel.txt
#--grep -v ': 0' FLP_rel.txt > FLP_release_changes.txt
#--cat Market.txt FLP_release_changes.txt > FLP_release_2.txt
#--cat FLP_release_1.txt FLP_release_2.txt > FLP_release.txt
#--gzip -9f RE*log

echo "TNK RnD Counts"
scp blpvebe8.bhdc.att.com:/tlgvartnk/tnk/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_TNK*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_TNK*.log > TNK_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' TNK_rel.txt > TNK_rel_test.txt
cat TNK_rel_test.txt |  awk '$16 > 0 ' >> TNK_release_changes.txt
cat Market.txt TNK_release_changes.txt > TNK_release.txt

# sed 'N;s/\n//' TNK_rel.txt > TNK_rel_2.txt
# tr -cd '[:print:]\n' < TNK_rel_2.txt > TNK_rel_3.txt
# grep -v ': 0' TNK_rel_3.txt > TNK_release_changes.txt
# cat Market.txt TNK_release_changes.txt > TNK_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_TNK*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_TNK*.log > TNK_rel.txt
# sed 'N;s/\n//' TNK_rel.txt > TNK_rel_2.txt
# tr -cd '[:print:]\n' < TNK_rel_2.txt > TNK_rel_3.txt
# grep -v ': 0' TNK_rel_3.txt > TNK_release_changes.txt
# cat Market.txt TNK_release_changes.txt > TNK_release_2.txt
# cat TNK_release_1.txt TNK_release_2.txt > TNK_release.txt
gzip -9f RE*log

#--scp blpvebe8.bhdc.att.com:/tlgvartnk/tnk/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_TNK*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_TNK*.log > TNK_rel.txt
#--grep -v ': 0' TNK_rel.txt > TNK_release_changes.txt
#--cat Market.txt TNK_release_changes.txt > TNK_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > TNK_rel.txt
#--grep -v ': 0' TNK_rel.txt > TNK_release_changes.txt
#--cat Market.txt TNK_release_changes.txt > TNK_release_2.txt
#--cat TNK_release_1.txt TNK_release_2.txt > TNK_release.txt
#--gzip -9f RE*log

echo "GAC RnD Counts"
scp blpvebe8.bhdc.att.com:/tlgvargac/gac/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_GAC*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_GAC*.log > GAC_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' GAC_rel.txt > GAC_rel_test.txt
cat GAC_rel_test.txt |  awk '$16 > 0 ' >> GAC_release_changes.txt
cat Market.txt GAC_release_changes.txt > GAC_release.txt

# sed 'N;s/\n//' GAC_rel.txt > GAC_rel_2.txt
# tr -cd '[:print:]\n' < GAC_rel_2.txt > GAC_rel_3.txt
# grep -v ': 0' GAC_rel_3.txt > GAC_release_changes.txt
# cat Market.txt GAC_release_changes.txt > GAC_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_GAC*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_GAC*.log > GAC_rel.txt
# sed 'N;s/\n//' GAC_rel.txt > GAC_rel_2.txt
# tr -cd '[:print:]\n' < GAC_rel_2.txt > GAC_rel_3.txt
# grep -v ': 0' GAC_rel_3.txt > GAC_release_changes.txt
# cat Market.txt GAC_release_changes.txt > GAC_release_2.txt
# cat GAC_release_1.txt GAC_release_2.txt > GAC_release.txt
gzip -9f RE*log

#--scp blpvebe8.bhdc.att.com:/tlgvargac/gac/log/RELEASE_SP*161013*.log . 
#--grep -i 'Market: ' RE*SP*161013_GAC*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_GAC*.log > GAC_rel.txt
#--grep -v ': 0' GAC_rel.txt > GAC_release_changes.txt
#--cat Market.txt GAC_release_changes.txt > GAC_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > GAC_rel.txt
#--grep -v ': 0' GAC_rel.txt > GAC_release_changes.txt
#--cat Market.txt GAC_release_changes.txt > GAC_release_2.txt
#--cat GAC_release_1.txt GAC_release_2.txt > GAC_release.txt
#--gzip -9f RE*log

echo "GLF RnD Counts"
scp blpvebc8.bhdc.att.com:/tlgvarglf/glf/log/RELEASE_SP*161013*.log .
grep -i 'Market: ' RE*SP*161013_GLF*.log > Market.txt
grep -E "Num of rows for table|, in refw" RE*SP*161013_GLF*.log > GLF_rel.txt

awk '{ $8 = ""; $9 = ""; $10 = ""; print}' GLF_rel.txt > GLF_rel_test.txt
cat GLF_rel_test.txt |  awk '$16 > 0 ' >> GLF_release_changes.txt
cat Market.txt GLF_release_changes.txt > GLF_release.txt

# sed 'N;s/\n//' GLF_rel.txt > GLF_rel_2.txt
# tr -cd '[:print:]\n' < GLF_rel_2.txt > GLF_rel_3.txt
# grep -v ': 0' GLF_rel_3.txt > GLF_release_changes.txt
# cat Market.txt GLF_release_changes.txt > GLF_release_1.txt
# grep -i 'Market: ' RE*SP*161013A_GLF*.log > Market.txt
# grep -E "Num of rows for table|, in refw" RE*SP**161013A_GLF*.log > GLF_rel.txt
# sed 'N;s/\n//' GLF_rel.txt > GLF_rel_2.txt
# tr -cd '[:print:]\n' < GLF_rel_2.txt > GLF_rel_3.txt
# grep -v ': 0' GLF_rel_3.txt > GLF_release_changes.txt
# cat Market.txt GLF_release_changes.txt > GLF_release_2.txt
# cat GLF_release_1.txt GLF_release_2.txt > GLF_release.txt
gzip -9f RE*log

#--scp blpvebc8.bhdc.att.com:/tlgvarglf/glf/log/RELEASE_SP*161013*.log .
#--grep -i 'Market: ' RE*SP*161013_GLF*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013_GLF*.log > GLF_rel.txt
#--grep -v ': 0' GLF_rel.txt > GLF_release_changes.txt
#--cat Market.txt GLF_release_changes.txt > GLF_release_1.txt
#--grep -i 'Market: ' RE*SP*161013A*.log > Market.txt
#--grep -i 'Num of rows for table' RE*SP*161013A*.log > GLF_rel.txt
#--grep -v ': 0' GLF_rel.txt > GLF_release_changes.txt
#--cat Market.txt GLF_release_changes.txt > GLF_release_2.txt
#--cat GLF_release_1.txt GLF_release_2.txt > GLF_release.txt
#--gzip -9f RE*log

cat COR_release.txt RGV_release.txt SAN_release.txt LAR_release.txt HOU_release.txt AUS_release.txt WTX_release.txt OKC_release.txt HCL_release.txt ARK_release.txt DLS_release.txt HCL_release.txt STL_release.txt MWR_release.txt > INREGION_release.txt

cat PAC_release.txt cat PAC_release_5.txt NCA_release.txt NCA_release_5.txt BOS_release.txt NYR_release.txt WAS_release.txt SNE_release.txt GLR_release.txt ILL_release.txt GPL_release.txt ALH_release.txt MTZ_release.txt MTZ_release_5.txt NWS_release.txt NWS_release_5.txt IND_release.txt NBI_release.txt > OUTREGION_release.txt

cat PHI_release.txt MNY_release.txt FLP_release.txt TNK_release.txt GAC_release.txt GLF_release.txt > NEW_release.txt

cat INREGION_release.txt OUTREGION_release.txt NEW_release.txt > 161013_RELEASE.txt

mailx -s 'RND Changes' tlg-ttqasupport@us.att.com < 161014_RELEASE.txt

# mv RE*log* LogFiles/.
# mv 161013_RELEASE.txt Reports/.
# gzip -9f /tables/home/RND_CHANGES/LogFiles/*.log 
# gzip -9f /tables/home/RND_CHANGES/Reports/*.txt
# rm *.txt
