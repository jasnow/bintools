function dups1dir() {
    echo "Check for duplicate" ${1} "values in same dir"

    for i in $(find gems rubies -type d |grep "/") ; do
        echo "----------------------------------------"
        for a in `cat $i/* | egrep -A 1 "${1}:" |sed -e "s,^    - ,," \
            -e "s,$1: ,," |egrep -v ":$|url:|^\-\-|osvdb:|github" |sort |uniq -d |grep -v ":"`
do
            git grep $a |egrep "$1:| - " |egrep -v "http"
        done |sort
    done
}

dups1dir "cve" |uniq
echo
dups1dir "ghsa" |uniq
