sed -e "s,\['FIX ME'\],vulnerabilities," $HOME/bin/binutils/github_advisory_sync.rb \
  > $HOME/Projects/ruby-advisory-db/lib/github_advisory_sync.rb 

git diff

lu
bundle

GH_API_TOKEN=${GH_TOK} bundle exec rake sync_github_advisories
#rm -fr gems/redcloth/ gems/arabic-prawn/
