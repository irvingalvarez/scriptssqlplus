#! /bin/ksh
#-----------
#sql_date=$1
echo "Please enter date: \c"
read sql_date

export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

ckrinr1.ksh "$sql_date" | tee `date +"%d%b%y_%H:%M:%S"`_check_released_in1_markets.log
ckdinr1.ksh "$sql_date" | tee `date +"%d%b%y_%H:%M:%S"`_check_distribed_IN1_markets.log
rndinr1.ksh | tee `date +"%d%b%y_%H:%M:%S"`_RnD_SYNSWITCH_Flag_IN1_markets.log
validinr1.ksh | tee `date +"%d%b%y_%H:%M:%S"`_VALIDATION_XVALIDATION_INR1_markets.log
exit
