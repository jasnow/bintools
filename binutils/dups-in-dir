function ChkDirFor() {
  echo "Check for duplicate" $1 "values in same dir"
  egrep "^$1 "  $(find gems rubies -name "*.yml") \
  | sort |uniq -d
# -c |sort -n |awk '$1 != 1 { print $0 }'
}
ChkDirFor "cve:"
ChkDirFor "ghsa:"
ChkDirFor "osvdb:"
