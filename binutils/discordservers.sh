#AL: Need new authorization string (s/v6/v9)
#AL: Getting '{"message": "401: Unauthorized", "code": 0}' when running next 4 lines.
#OLD KEY: MzY2OTcxODM1MDc1Nzg4ODEy.Xzvp9w.rSrALX91wuPZsnBxvaOpxhxwIeM
curl -s \
  -H 'Content-Type: application/json' \
  -H 'authorization: ${DISCORD_AUTH} \
  'https://discord.com/api/v9/users/@me/guilds' \
| jq 
exit
#|grep '"name":' > /tmp/$$_1 
#|sort -n > /tmp/$$_1

if [ "X$1X" == "XX" ] ; then
  wc /tmp/$$_1
else
  cat /tmp/$$_1
fi

rm -f /tmp/$$_1
