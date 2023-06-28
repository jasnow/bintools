rmdups.sh
if [ "X$1X" == "XX" ] ; then
    git checkout -- lib/github_advisory_sync.rb
else
    echo "Keeping lib/github_advisory_sync.rb"
fi
