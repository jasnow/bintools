if [ "X$1X" == "XX" ] ; then
    echo "Usage: pp file"; exit
else
    INPUTF="$1"
fi
cat ${INPUTF} > /tmp/$$_FILEF
echo "END OF FILE MARKER" >> /tmp/$$_FILEF
######################################################################

egrep -v "OPTIONAL: FILL IN SEE BELOW|FILL IN IF AVAILABLE" /tmp/$$_FILEF \
| sed -e "/GitHub advisory data below/,/END OF FILE MARKER/d" \
      -e "/description: [a-zA-Z\"'-]/s,:,: |% ," -e "s,|-$,|," \
| tr "%" "\012" \
| egrep -v "name: |ecosystem: |END OF FILE MARKER|vectorString:|withdrawnAt:" \
| sed -e "s/^[ ]*- http/    - http/" \
      -e "s,^- ,  - ," \
      -e "s,- url: ,  - ," \
      -e "/^vulnerabilities:/,/identifier/s/^/#  /" \
  > /tmp/$$_pp

cp /tmp/$$_pp ${INPUTF}

rm -rf /tmp/$$_FILEF /tmp/$$_pp
# To keep debug vuly field: "/GitHub advisory data below/,/withdrawnAt/d"
