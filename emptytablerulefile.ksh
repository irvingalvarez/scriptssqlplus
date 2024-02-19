export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

NEW_EMPTY_TABLE_ALLMKT_RULE.ksh  | tee `date +"%d%b%y_%H:%M:%S"`_.log
exit
