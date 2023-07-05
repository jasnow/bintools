echo "DESCRIPTION CHECK:"
git grep "^description:" |grep -v "|$"
