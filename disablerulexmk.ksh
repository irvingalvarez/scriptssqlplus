#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv
who am i
export PATH=/tables/bin:/usr/local/bin:${PATH}

user=`cat ia915e.txt`

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls
#export TNS_ADMIN=/tables/home/Dist
echo "Enter rule_id: "
read rule_id
if (test -z "${rule_id}" )
then
   echo "rule_id can't be blank"
      exit
      fi

sqlplus -silent $user@pmdy25a @disable_rule_xmkt.sql  "$rule_id"


