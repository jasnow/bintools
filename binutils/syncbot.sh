cd /home/t530-dev/Projects/ruby-advisory-db
echo "SYNCIT.SH #####################################################"
syncit.sh
if [ "X$1X" == "XX"  ] ; then
    echo "AUTOGITB.SH ###############################################"
    autogitb.sh "`date '+%T' |sed -e 's,:,_,g'`"
else
    echo "NO *** AUTOGITB.SH ########################################"
fi
echo "GHIT.SH #######################################################"
ghit.sh
echo "RMBOTH.SH #####################################################"
rmboth.sh
echo "RUNALLPP.SH ###################################################"
runallpp.sh
echo "RAKE ##########################################################"
rake
# git add `ggf` ; git commit -m "msg" ; gpso
