#! /bin/ksh
#-----------
export PATH=/tables/bin:/usr/local/bin:${PATH}

. /home/opersupp/.profile

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

validnese.ksh | tee `date +"%d%b%y_%H:%M:%S"`_VALIDATION_XVALIDATION_NESE_markets.log
exit
