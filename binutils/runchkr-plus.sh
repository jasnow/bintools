cd
$HOME/bin/bin*/chkr  o_2* > long-unrev-ruby-advs-2026-01-23.txt

sed -e "s,.*GHSA-,GHSA-," -e "s,.json,," long-unrev-ruby-advs-2026-01-23.txt \
    > unrev-ruby-advs-2026-01-23.txt

# Check `rd` repo for
cd /home/t530-dev/Projects/ruby-advisory-db
for i in `cat ${HOME}/unrev-ruby-advs-2026-01-23.txt` ; do
    git grep $i
done

#pr -2  unrev-ruby-advs-2026-01-23.txt |uniq > q
