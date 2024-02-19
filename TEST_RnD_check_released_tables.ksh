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
echo 'starting Empty table job for' $i
date
sqlpcon -c CUSTMC -m $i -@/tables/bin/sql/empty_table_cnt.sql 
done

# refmkt=`GetConnStr -Po $i con`
# sqlplus -s $refmkt @ /tables/bin/sql/empty_table_cnt.sql
# ExecSql -P $i con /tables/bin/sql/empty_table_cnt.sql


# for i in pac bos ill glr nyr sne was
# do
# echo 'starting Empty table job for' $i
# date
# refmkt=`GetConnStr -Po $i con`
# sqlplus -s $refmkt @ /tables/bin/sql/empty_table_cnt.sql
# ExecSql -P $i con /tables/bin/sql/empty_table_cnt.sql
# done

# for i in alh mtz nws gpl nbi
# do
# echo 'starting Empty table job for' $i
# date
# refmkt=`GetConnStr -Po $i con`
# sqlplus -s $refmkt @ /tables/bin/sql/empty_table_cnt.sql
# ExecSql -P $i con /tables/bin/sql/empty_table_cnt.sql
# done

# echo 'starting Empty table job for rrn' 
# ExecSql -P rrn q /tables/bin/sql/empty_table_cnt.sql

# export TNS_ADMIN=/usr/local/oracle/.tnstbls

# for i in ind nca 
# do
# echo 'starting Empty table job for' $i
# date
# refmkt=`GetConnStr -Po $i con`
# sqlplus -s $refmkt @ /tables/bin/sql/empty_table_cnt.sql
# ExecSql -P $i con /tables/bin/sql/empty_table_cnt.sql
# done
