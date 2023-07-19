if [ "X$1X" == "XX" ] ; then
    echo "Usage: pp file"; exit
else
    INPUTF="$1"
fi
cat ${INPUTF} > /tmp/$$_FILEF
echo "END OF FILE MARKER" >> /tmp/$$_FILEF
######################################################################

(
#pickurl ${INPUTF}
#echo "#UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"

egrep -v "OPTIONAL: FILL IN SEE BELOW|FILL IN IF AVAILABLE" /tmp/$$_FILEF \
| sed -e "/description: [a-zA-Z\"'-]/s,:,: |% ," -e "s,|-$,|," \
| tr "%" "\012" \
| sed -e "/^vulnerabilities:/,/END OF FILE MARKER/s/^/#  /" \
      -e "s/package:/package: --------------------------------------------------/" \
      -e "s,- url: ,  - ," \
      -e "/GitHub advisory data below/,/END OF FILE MARKER/d" \
| egrep -v "END OF FILE MARKER|apache.org$|^3[CE]$" \
| yq -y
) > /tmp/$$_pp

cp /tmp/$$_pp ${INPUTF}

rm -rf /tmp/$$_FILEF /tmp/$$_pp
# To keep debug vuly field: -e "/GitHub advisory data below/,/withdrawnAt/d"
# delete more: "/GitHub advisory data below/,/END OF FILE MARKER/d"
#      -e "s/^[ ]*- http/    - http/"
#      -e "s,^- ,  - ,"
#      -e "s,- url: ,  - ,"
