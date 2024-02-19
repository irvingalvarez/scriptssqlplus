#! /bin/ksh
#-----------
#sql_date=$1
echo "Please enter date: \c"
read sql_date

export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

ckrinr2.ksh "$sql_date" | tee `date +"%d%b%y_%H:%M:%S"`_check_released_in2_markets.log
ckdinr2.ksh "$sql_date" | tee `date +"%d%b%y_%H:%M:%S"`_check_distribed_IN2_markets.log
rndinr2.ksh | tee `date +"%d%b%y_%H:%M:%S"`_RnD_SYNSWITCH_Flag_IN2_markets.log
validinr2.ksh | tee `date +"%d%b%y_%H:%M:%S"`_VALIDATION_XVALIDATION_INR2_markets.log
exit
