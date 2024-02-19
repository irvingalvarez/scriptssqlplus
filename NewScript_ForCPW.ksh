#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv

export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

. /home/opersupp/.profile

export TNS_ADMIN=/usr/local/oracle/.tnstbls

for i in COR MNY PHI 
do
echo 'starting job for check_released_tables_cpw' $i
date
sqlpcon -c OPERCON -m $i -@/tables/home/Dist/TESTcheck_released_tables.NEW_CPW.sql
done
