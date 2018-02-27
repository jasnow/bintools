tr " " "\012" < LICE* |tr "[a-z]" "[A-Z]" |sort > /tmp/$$_1
tr " " "\012" < r     |tr "[a-z]" "[A-Z]" |sort > /tmp/$$_2
sort /tmp/$$_1 /tmp/$$_2 |uniq -c |sort -n
