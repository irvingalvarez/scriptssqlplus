#! /bin/ksh
#-
#. /usr/local/bin/oraenv
#export PATH=/tables/bin:/usr/local/bin:${PATH}

#nohup RND_CHANGES > MKTLOG_$CURDAY.log

#. /home/opersupp/.profile

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

. $HOME/.set_oracle_env

export TNS_ADMIN=/usr/local/oracle/.tnstbls

# ******************************************************

cd /tables/home/RND_CHANGES
#CURDAY=`date -d yesterday +"%y%m%d"`
CURDAY=`date +"%y%m%d"`


        MKTUP=`echo $MKT | tr  "[:lower:]" "[:upper:]"`
        echo "$MKT Rnd Counts"
        scp blpvxmb2.bhdc.att.com:/tlgvar$MKT/$MKT/log/RELEASE_SP*$CURDAY*.log .
        for x in `ls -1 RE*SP*$CURDAY*XMK*.log`
        do
                grep -i 'Market: ' $x > Market.txt
                grep -E "Num of rows for table|, in refw" $x > XMK_rel.txt
                awk '{ $8 = ""; $9 = ""; $10 = ""; print}' XMK_rel.txt > XMK_rel_test.txt
                cat XMK_rel_test.txt |  awk '$16 > 0 ' > XMK_release_changes.txt
                cat Market.txt XMK_release_changes.txt >> XMK_release.txt
        done

cat XMK_release.txt > > $CURDAY_XMKT_Release.txt

mailx -s 'RND Changes' tlg-ttqasupport@us.att.com tablesrnd@us.att.com < $CURDAY_XMKT_Release.txt
#mailx -s 'RND Changes' ia915e@att.com < $CURDAY_Release.txt

mv RE*log* LogFiles/.
mv $CURDAY_XMKT_Release.txt Reports/.
gzip -9f /tables/home/RND_CHANGES/LogFiles/*.log
rm *.txt
