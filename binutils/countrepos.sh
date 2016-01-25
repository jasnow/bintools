IGNOREFILES="chklics|ATTIC|countrepos|do-pull|stats|GENERAL|yml$|cmp-ay"

echo "Total Active Rails projects"
ls -1 $HOME/Projects |egrep -v ${IGNOREFILES} > /tmp/$$_OUTPUT
if [ "X$1X" = "XX" ] ; then
    cat /tmp/$$_OUTPUT |wc
else
    cat /tmp/$$_OUTPUT |pr -t2 -e |uniq |sed -e "s,^,    ,"
fi

echo "    Active Rails 5 projects"
ls -1 $HOME/Projects |egrep -v ${IGNOREFILES} |egrep "5" > /tmp/$$_OUTPUT
if [ "X$1X" = "XX" ] ; then
    cat /tmp/$$_OUTPUT |wc |sed -e "s,^,    ,"
else
    cat /tmp/$$_OUTPUT |pr -t2 -e |uniq |sed -e "s,^,    ,"
fi

echo "    Active NON-Rails 5 (2,3,4) projects"
ls -1 $HOME/Projects |egrep -v ${IGNOREFILES} |egrep -v "5" > /tmp/$$_OUTPUT
if [ "X$1X" = "XX" ] ; then
    cat /tmp/$$_OUTPUT |wc |sed -e "s,^,    ,"
else
    cat /tmp/$$_OUTPUT |pr -t2 -e |uniq |sed -e "s,^,    ,"
fi

echo "Broken Rails 5 and Bootstrap projects (see below)"

echo
echo "Both (Github and Bitbucket) projects"
grep -i github `grep -li bitbucket $HOME/Projects/*/.git/config ` |sed -e "s,.*/,," |wc

echo "Github projects (1st: ok; 2nd: broken - NOTE: Include above BOTH count)"
echo "    OK:"
#grep http $HOME/PRojects/*/.git/config |cut -d'/' -f1-6 |sort -u |egrep github |wc |sed -e "s,^,   ,"
grep -il github $HOME/Projects/*/.git/config | wc |sed -e "s,^,   ,"
echo "    BROKEN:"
grep http $HOME/Projects/*BROK*/*/.git/config |cut -d'/' -f1-10 \
|sort -u |grep github |wc |sed -e "s,^,   ,"

echo "Bitbucket projects - NOTE: Include above BOTH count)"
echo "    OK:"
grep -il bitbucket $HOME/Projects/*/.git/config | wc |sed -e "s,^,   ,"
echo "    BROKEN:"
grep http $HOME/Projects/*BROK*/*/.git/config \
| cut -d'/' -f1-10 |sort -u |grep bitbucket |wc |sed -e "s,^,   ,"

echo
echo "Active Projects with no Licenses"
chklics |egrep -v "~$" |wc

echo "Total Active Rails projects"
ls -1 $HOME/Projects |egrep -v ${IGNOREFILES} > /tmp/$$_OUTPUT
if [ "X$1X" = "XX" ] ; then
    cat /tmp/$$_OUTPUT |wc
else
    cat /tmp/$$_OUTPUT |pr -t2 -e |uniq |sed -e "s,^,    ,"
fi

echo "    (Forked) Projects with parent/upstream"
grep -l 'remote "parent"' $HOME/Projects/*/.git/config \
| awk -F'/' '{ print $5 }' |sort |tee /tmp/$$_PARENTS | wc |sed -e "s,^,    ,"

echo "    (Forked) Projects with parent/upstream (in $HOME/Projects/do-pull-request-first.txt file)"
grep -v "^#" $HOME/Projects/do-pull-request-first.txt | wc |sed -e "s,^,    ,"

fgrep -v -f $HOME/Projects/do-pull-request-first.txt /tmp/$$_PARENTS 
fgrep -v -f /tmp/$$_PARENTS  do-pull-request-first.txt |egrep -v "^#" 
diff $HOME/Projects/do-pull-request-first.txt /tmp/$$_PARENTS |egrep -v "#|^[0-9,d]*$"

echo "    NOT-SYNCED-WITH-PARENT"
egrep -l 'not-synched' $HOME/Projects/*/.git/config \
| awk -F'/' '{ print $5 }' |tee /tmp/$$_NOTSYNCED | wc |sed -e "s,^,    ,"
if [ "X$1X" = "XX" ] ; then
    :
else
    cat /tmp/$$_NOTSYNCED |pr -t2 -e |uniq |sed -e "s,^,    ,"
fi

echo "    MY PROJECTS/NO-PARENTS"
ls -1 $HOME/Projects \
| egrep -v -f /tmp/$$_PARENTS | egrep -v -f /tmp/$$_NOTSYNCED \
| egrep -v ${IGNOREFILES} |wc |sed -e "s,^,    ,"

echo "# of gems in Gemfiles and gemspecs"
(
cat $HOME/Projects/*/Gemfile \
| grep "gem " | sed -e "s,^[ ]*,," -e "s,',,g" -e "s/,//" -e 's,",,g'

cat $HOME/Projects/*BROK*/*/Gemfile \
| grep "gem " | sed -e "s,^[ ]*,," -e "s,',,g" -e "s/,//" -e 's,",,g'

cat $HOME/Projects/*/*gemspec |egrep "add_dev|add_dep" |sed -e "s,.*<,," -e "s,\[.*,," 

cat $HOME/Projects/*BROK*/*/*gemspec 2> /dev/null \
| egrep "add_dev|add_dep" |sed -e "s,.*<,," -e "s,\[.*,," 
) |awk '{ print $2 }' |sed -e "s,['\",],,g" | egrep -v "3.0.0|gem$|^$" \
| sort |uniq -c |sort -n |wc

rm /tmp/$$_*
