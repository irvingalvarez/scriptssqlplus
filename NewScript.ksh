#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv

export PATH=/tables/bin:/usr/local/bin:${PATH}

. /home/opersupp/.profile

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

for i in AUS COR RGV SAN LAR DLS STL TUL ARK OKC MWR WTX HCL PAC WAS SNE ILL GLR NYR BOS ALH MTZ GPL NWS IND NCA NBI PHI MNY FLP
do
echo 'starting job for check_released_tables_cpw' $i
date
sqlpcon -c OPERCON -m $i -@/tables/home/Dist/TESTcheck_released_tables.NEW_CPW.sql
done
