export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

rundate.ksh | tee `date +"%d%b%y_%H:%M:%S"`_rundate.log
exit
