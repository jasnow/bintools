if [ "X$1X" == "X676X" ] ; then
    GHITSCRIPT=$HOME//github_advisory_sync.rb #PR#676:
else
    GHITSCRIPT=$HOME/bin/binutils/github_advisory_sync.rb
fi

sed -e "s,\['FIX ME'\],vulnerabilities," ${GHITSCRIPT} \
  > $HOME/Projects/ruby-advisory-db/lib/github_advisory_sync.rb 

git diff

lu
bundle

GH_API_TOKEN=${GH_TOK} bundle exec rake sync_github_advisories
#rm -fr gems/redcloth/ gems/arabic-prawn/