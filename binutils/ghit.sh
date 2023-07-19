GHITSCRIPT=$HOME/bin/github_advisory_sync.rb

cd /home/t530-dev/Projects/ruby-advisory-db

echo "SYNCIT.SH #####################################################"
syncit.sh

if [ "X$1X" == "XX"  ] ; then
    echo "AUTOGITB.SH ###############################################"
    autogitb.sh "`date '+%T' |sed -e 's,:,_,g'`"
else
    echo "NO *** AUTOGITB.SH ########################################"
fi

sed -e "s,\['FIX ME'\],vulnerabilities," ${GHITSCRIPT} \
  > $HOME/Projects/ruby-advisory-db/lib/github_advisory_sync.rb 

git diff

rm -f Gemfile.lock # was "lu" cmd
bundle

GH_API_TOKEN=${GH_TOK} bundle exec rake sync_github_advisories
