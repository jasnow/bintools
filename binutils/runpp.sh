if [ "X$1X" == "XX" ] ; then
    echo "Usage: pp.sh file" ; exit
fi
pp.sh $1 > /tmp/$$_pp ; cp /tmp/$$_pp $1
rm -f /tmp/$$_pp
