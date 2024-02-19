#!/usr/bin/ksh
PDIR=/tables/home/Dist
date=`date "+%Y_%m_%d`
for i in `ls ${PDIR}/${date}_*_SYNSWITCH_FLAG_Check.log`
do
  filename=$i
done
#mailx -s "Sync Switch Flag Check Log" charles.backstrom@cingular.com  \
#		    susan.oday@cingular.com \
#		    david.cromwell@cingular.com \
#		    aaron.r.baldwin@cingular.com \
#		    susan.oday@cingular.com \
#		    mary.hwa@cingular.com < ${filename}
 if [ $filename ] 
 then
    echo file found
 else
  mailx -s "Sync Switch Flag Check Log not found" charles.backstrom@cingular.com  \
		    susan.oday@cingular.com \
		    david.cromwell@cingular.com \
		    aaron.r.baldwin@cingular.com \
		    susan.oday@cingular.com \
		    mary.hwa@cingular.com < $PDIR/.file_not_found
    exit;
 fi
 if ( test -e $filename )
 then
  mailx -s "Sync Switch Flag Check Log" charles.backstrom@cingular.com  \
		    susan.oday@cingular.com \
		    david.cromwell@cingular.com \
		    aaron.r.baldwin@cingular.com \
		    susan.oday@cingular.com \
		    mary.hwa@cingular.com < ${filename}
  exit ;
 fi
