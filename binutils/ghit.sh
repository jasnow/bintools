cd /home/t530-dev/Projects/ruby-advisory-db

function syncit() {
    echo "SYNCIT.SH #####################################################"
    git fetch parent
    git checkout master
    git merge parent/master
    git push
}

function autogitb() {
    if [ "X$1X" == "XX" ] ; then
        echo "AUTOGITB.SH ###############################################"
        git checkout -b "ghsa-sync-`date '+20%y-%m-%d'`-`date '+%T' |sed -e 's,:,_,g'`"
    else
        echo "NO *** AUTOGITB.SH ########################################"
    fi
}

syncit

autogitb $1

# 7/21/2023: Use official version now.
#GHITSCRIPT=$HOME/bin/github_advisory_sync.rb
#sed -e "s,\['FIX ME'\],vulnerabilities," ${GHITSCRIPT} \
#  > $HOME/Projects/ruby-advisory-db/lib/github_advisory_sync.rb
#
#cp $HOME/bin/binutils/Rakefile .
#cp $HOME/bin/binutils/runallpp.sh lib
#cp $HOME/bin/binutils/rmboth.sh   lib

git diff

rm -f Gemfile.lock # was "lu" cmd
bundle

GH_API_TOKEN=${GH_TOK} bundle exec rake sync_github_advisories

if [ "X$1X" == "XrawX" ] ; then
    :
else
    runallpp.sh

    rmboth.sh
fi
