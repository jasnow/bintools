#!/usr/bin/env bash

# USAGE: Either 
#    "unsyncnot.sh"   (default: yes, create new branch)
#    "unsyncbot.sh ." (skip creating new branch)

echo "In unsyncbot.sh"

function syncit() {
    echo "IN SYNCIT ########################################################"
    git fetch parent
    git checkout master
    git merge parent/master
    git push
}

function autogitb() {
    if [ "X$1X" == "XX" ] ; then
        echo "IN AUTOGITB ##################################################"
        git checkout -b "ghsa-syncbot-$(date '+20%y-%m-%d')-$(date '+%T' |sed -e 's,:,_,g')"
    else
        echo "NO *** AUTOGITB.SH ########################################"
    fi
}

syncit

autogitb "$1"

# 7/21/2023: Use official version now.
#GHITSCRIPT=$HOME/bin/github_advisory_sync.rb
#sed -e "s,\['FIX ME'\],vulnerabilities," ${GHITSCRIPT} \
#  > $HOME/Projects/ruby-advisory-db/lib/github_advisory_sync.rb

git diff

rm -f Gemfile.lock

bundle install

GH_API_TOKEN=${GH_TOK} bundle exec rake sync_unreviewed_github_advisories

if [ "X$1X" == "XrawX" ] ; then
    echo "No post-processing.sh and ignore-dup-advs.sh runs"
else
    scripts/post-processing.sh
    scripts/ignore-dup-advs.sh
    git restore gems/jquery-ui-rails/CVE-2022-31160.yml
fi
