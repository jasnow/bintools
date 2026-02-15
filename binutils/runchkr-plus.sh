cd
$HOME/bin/bin*/chkr o_2* > long-unrev-ruby-advs-2026-01-23.txt

sed -e "s,.*GHSA-,GHSA-," -e "s,.json,," long-unrev-ruby-advs-2026-01-23.txt \
    > unrev-ruby-advs-2026-01-23.txt

# Check `rd` repo for
cd /home/t530-dev/Projects/ruby-advisory-db
for i in `cat ${HOME}/unrev-ruby-advs-2026-01-23.txt` ; do
    git grep $i
done \
| awk '{ print $3, "-", $1 }' \
| sed -e "s,https://github.com/advisories/,," -e "s,:$,," \
| egrep -v "rubies/ruby|rubies/mruby|rubies/jruby|gems/"

#pr -2  unrev-ruby-advs-2026-01-23.txt |uniq > q
