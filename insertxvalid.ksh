#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv
export PATH=/tables/bin:/usr/local/bin:${PATH}

export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH

export TNS_ADMIN=/usr/local/oracle/.tnstbls

tabname=$1
script=insert_table_XVALIDATION.sql

date
echo 'Inserting table in ALL MARKETS'

user=`cat ia915e.txt`
echo '***************************************INREGION MARKETS***************************************'
for i in ARK AUS COR DLS HCL HOU LAR MWR OKC RGV SAN STL TUL WTX
do
sqlplus -silent $user@pmdy25a @$script "$i" "$tabname"
done
echo '*************************************OUTREGION MARKETS****************************************'
for i in BOS GLR ILL NCA NYR PAC SNE WAS 
do
sqlplus -silent $user@pmdy25a @$script "$i" "$tabname"
done
echo '******************************************AWE MARKETS*****************************************'
for i in ALH GPL IND MTZ NWS
do
sqlplus -silent $user@pmdy25a @$script "$i" "$tabname"
done
echo '*****************************************NESE MARKETS*****************************************'
for i in FLP GAC GLF MNY PHI TNK
do
sqlplus -silent $user@pmdy25a @$script "$i" "$tabname"
done
echo '*******************************************NBI MARKET*****************************************'
sqlplus -silent $user@pmdy25a @$script "NBI" "$tabname"
