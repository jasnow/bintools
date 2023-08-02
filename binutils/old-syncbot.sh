cd /home/t530-dev/Projects/ruby-advisory-db

echo "GHIT.SH #####################################################" 
ghit.sh $1

echo "RMBOTH.SH ##################################################"
rmboth.sh

echo "RUNALLPP.SH ##################################################"
runallpp.sh

echo "RAKE ######################################################"
rake

# git add `ggf` ; git commit -m "msg" ; gpso
