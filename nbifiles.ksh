#! /bin/ksh
#-----------
#sql_date=$1
echo "Please enter date: \c"
read sql_date

export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

ckrnbi.ksh "$sql_date" | tee `date +"%d%b%y_%H:%M:%S"`_check_released_nbi_markets.log
ckdnbi.ksh "$sql_date" | tee `date +"%d%b%y_%H:%M:%S"`_check_distribed_NBI_markets.log
rndnbi.ksh | tee `date +"%d%b%y_%H:%M:%S"`_RnD_SYNSWITCH_Flag_NBI_markets.log
validnbi.ksh | tee `date +"%d%b%y_%H:%M:%S"`_VALIDATION_XVALIDATION_NBI_markets.log
exit
