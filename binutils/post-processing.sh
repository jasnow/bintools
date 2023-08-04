#!/usr/bin/env bash

# Usage: Usually called by "syncbot.sh" script, but can be run separately."

if [ "X$(basename $(pwd))X" == "Xruby-advisory-dbX" ] ; then
    :
else
    echo "Change dir to ruby-advisory-db first."
    exit
fi

function pp() {
    INPUTF="$1"

    cat "${INPUTF}" > /tmp/$$_FILEF
    echo "END OF FILE MARKER" >> /tmp/$$_FILEF

    (
    grep -Ev "OPTIONAL: FILL IN SEE BELOW|FILL IN IF AVAILABLE" /tmp/$$_FILEF \
    | sed -e "/description: [a-zA-Z\"'-]/s,:,: |% ," -e "s,|-$,|," \
    | tr "%" "\012" \
    | sed -e "s/^[ ]*- http/    - http/" \
          -e "s,^- ,  - ," \
          -e "s,- url: ,  - ," \
          -e "/^vulnerabilities:/,/END OF FILE MARKER/s/^/#  /" \
          -e "s/package:/package: --------------------------------------------------/" \
          -e "/GitHub advisory data below/,/END OF FILE MARKER/d" \
    | grep -Ev "END OF FILE MARKER|apache.org$|^3[CE]$"
    ) > /tmp/$$_pp
    # To keep debug vuly field: -e "/GitHub advisory data below/,/withdrawnAt/d"
    # To delete more: "/GitHub advisory data below/,/END OF FILE MARKER/d"

    cp /tmp/$$_pp "${INPUTF}"

    rm -rf /tmp/$$_FILEF /tmp/$$_pp
}

if [ "X$(git status |grep -c "/" |awk '{ print $1 }')X" == "X0X" ] ; then
    echo "Nothing to post-process so exiting."
else
    git ls-files -o | grep -E "gems/|rubies/" |while read -r LINE ; do
        pp "${LINE}"
    done
fi
