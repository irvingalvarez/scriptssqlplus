#! /bin/ksh

# *****************************************************************
curdir=`pwd`
echo $curdir
cd $curdir
uploaddir=`echo $curdir/upload`
echo $uploaddir
backupdir=`echo $curdir/backup`
echo $backupdir
# ****************************************************************
d=`date +"%y%m%d_%H%M%S"`
attuid=`whoami`
echo "***** FTPing contents of "$uploaddir" to viper.sbms.sbc.com:/home/$attuid/scripts/ftp *****"
ls -lrt $uploaddir
scp -r $uploaddir/*.* $attuid@viper.sbms.sbc.com:/home/$attuid/scripts/ftp
echo ""
echo "***** Moving uploaded files to "$backupdir" ***** "
echo ""
echo ""
mv $uploaddir/*.* $backupdir
echo ""
echo ""
echo "***** Archiving and compressing files in "$backupdir" ***** DON'T FORGET TO CLEAN THIS FOLDER REGULARLY"
echo ""
tar cvf $backupdir/$d.tar $backupdir/*.* --remove-files --exclude='*.gz'
gzip $backupdir/$d.tar

echo "ls -lrt" $uploaddir
ls -lrt $uploaddir
echo ""
echo "ls -lrt" $backupdir
ls -lrt $backupdir


exit
