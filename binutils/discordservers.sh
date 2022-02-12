curl -s \
  -H 'Content-Type: application/json' \
  -H 'authorization: MzY2OTcxODM1MDc1Nzg4ODEy.Xzvp9w.rSrALX91wuPZsnBxvaOpxhxwIeM' \
  'https://discord.com/api/v6/users/@me/guilds' \
| jq |grep '"name":' > /tmp/$$_1 
#|sort -n > /tmp/$$_1

if [ "X$1X" == "XX" ] ; then
  wc /tmp/$$_1
else
  cat /tmp/$$_1
fi

rm -f /tmp/$$_1
