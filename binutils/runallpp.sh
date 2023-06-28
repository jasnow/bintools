for i in `find $(git status 2>&1  |grep 'gems/' |sed -e "s,modified:,," -e "s,deleted:,,") -type f` ; do
    pp.sh $i
done

echo "Remember to later delete DUPs in this script."

rm -f /tmp/$$_DUPS
