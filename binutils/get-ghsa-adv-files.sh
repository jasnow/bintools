# $HOME/get-ghsa-adv-files.sh
#
# Algorithm: Return the GHSA files that are not in RAD.
#
ls -1 ${HOME}/Projects/ruby-advisory-db/*/*/*.yml |egrep "GHSA|CVE" \
| sed -e "s,.*CVE-,CVE-," -e "s,.*GHSA-,GHSA-," -e "s,.yml,," > /tmp/$$_got

for i in 2023 2024 2025 2026 2021 2022 ; do
    echo "$i" > /dev/tty
    cd ${HOME}/Projects/advisory-database/advisories/unreviewed/$i
    git grep -liE "ruby|rails" ../$i |sed -e "s,^,$i/," > /tmp/$$_randr
    fgrep -v -f /tmp/$$_got /tmp/$$_randr 2>&1 |tee $HOME/o_$i
done
