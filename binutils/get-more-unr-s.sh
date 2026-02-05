cd
if [ "X$1X" == "XX" ] ; then
    PATN="ruby"
else
    PATN="$1"
fi
egrep "${PATN}" $(grep -li ruby $(cat long*)) |egrep -v "mruby|rails|ruby/ruby|Red Hat" \
| egrep -v "ruby-lang" \
| sed -e "s,:.*,," -e "s,.*/,," |sort -u
###########
#|https:|http:"
