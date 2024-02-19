who am i
xuseri=`whoami`
xfilen=$1
echo Sending $xfilen...
awk 'sub("$","\r")' $xfilen > _$xfilen
uuencode _$xfilen $xfilen | mailx -m -r $xuseri@viper.sbms.sbc.com -s "$xfilen" $xuseri@att.com 
echo "Email sent."
rm -f _$xfilen