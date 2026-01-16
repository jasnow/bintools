grep "ghsa:|cve:" $(find . -name "[A-Z0-9-]*.yml" |egrep -v "CVE\-") \
| egrep -v "GHSA.*ghsa:|:  cve:|:  ghsa"
