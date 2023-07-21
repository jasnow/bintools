function pp() {
    INPUTF="$1"

    cat ${INPUTF} > /tmp/$$_FILEF
    echo "END OF FILE MARKER" >> /tmp/$$_FILEF
    ##################################################################

    (
    #pickurl ${INPUTF}
    #echo "#UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"

    egrep -v "OPTIONAL: FILL IN SEE BELOW|FILL IN IF AVAILABLE" /tmp/$$_FILEF \
    | sed -e "/description: [a-zA-Z\"'-]/s,:,: |% ," -e "s,|-$,|," \
    | tr "%" "\012" \
    | sed -e "s/^[ ]*- http/    - http/" \
          -e "s,^- ,  - ," \
          -e "s,- url: ,  - ," \
          -e "/^vulnerabilities:/,/END OF FILE MARKER/s/^/#  /" \
          -e "s/package:/package: --------------------------------------------------/" \
          -e "/GitHub advisory data below/,/END OF FILE MARKER/d" \
    | egrep -v "END OF FILE MARKER|apache.org$|^3[CE]$"
    ) > /tmp/$$_pp

    cp /tmp/$$_pp ${INPUTF}

    rm -rf /tmp/$$_FILEF /tmp/$$_pp
    # To keep debug vuly field: -e "/GitHub advisory data below/,/withdrawnAt/d"
    # delete more: "/GitHub advisory data below/,/END OF FILE MARKER/d"
}

for i in `find $(git status 2>&1  |grep 'gems/' |sed -e "s,modified:,," -e "s,deleted:,,") -type f` ; do
    pp $i
done

echo "Remember to later delete DUPs in this script."

rm -f /tmp/$$_DUPS
