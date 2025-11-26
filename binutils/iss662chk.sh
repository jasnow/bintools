git grep "^ghsa:" |sed -e "s,CVE-.*ghsa:,," |sort |uniq -d
