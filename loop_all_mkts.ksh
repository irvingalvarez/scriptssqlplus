#! /bin/ksh

export PATH=/tables/bin:/usr/local/bin:${PATH}
export ORACLE_PATH=./:$ORACLE_HOME/bin:$PATH
export PATH=$PATH:$ORACLE_PATH
. $HOME/.set_oracle_env
export TNS_ADMIN=/usr/local/oracle/.tnstbls

# *****************************************************************


curdir=`pwd`
echo $curdir

cd $curdir


Get_MKT_ConnStrings () {

MKT=$1

dlcode=`whoami`


home=`echo /home/$dlcode`

typeset -u cuid=$dlcode

mktconn=`grep -i "^$MKT," $home/TLG_${cuid}_ConnStrings.lst`

USER=`echo $mktconn | awk '{FS=","} {print $2}'`
PSWD=`echo $mktconn | awk '{FS=","} {print $3}'`
INST=`echo $mktconn | awk '{FS=","} {print $4}'`

userconn=`echo $USER/$PSWD@$INST`

}

# ****************************************************************

#echo "Enter file to run:\n"
#read FileToRun


for MKT in ARK COR LAR OKC RGV SAN TUL AUS DLS HCL HOU MWR STL WTX BOS GLR ILL NCA NYR PAC SNE WAS ALH GPL IND MTZ NWS FLP GAC GLF MNY PHI TNK NBI
do

Get_MKT_ConnStrings $MKT
echo $MKT
sqlplus -s $userconn @/$curdir/all_mkts_param_values.sql '$MKT'
done
