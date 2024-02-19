#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv

who am i
export PATH=/tables/bin:/usr/local/bin:${PATH}

. /home/opersupp/.profile

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

date
for i in AUS COR RGV SAN LAR DLS STL TUL ARK OKC MWR WTX HCL PAC WAS SNE ILL GLR NYR BOS ALH MTZ GPL NWS IND NCA NBI
do
echo 'starting distribed tables job for' $i
date
sqlpcon -c OPERCON -m $i -@/tables/home/Dist/CHECK_released_tables.NEW.sql 
done

