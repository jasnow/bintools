( egrep "^cve:|^ghsa:" $(find $(git status |grep gems) -type f) |grep yml
  git grep -E "^cve:|^ghsa:" | grep yml
) |egrep "CVE-|GHSA" |sed -e "s,/CVE-.*.yml:, ," -e "s,/GHSA-.*.yml:, ," \
| sort |uniq -d |awk '{ print "echo; grep", $3, $1"/*" }' |bash |grep -v "http"
