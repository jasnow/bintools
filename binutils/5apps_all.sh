for i in \
    ${HOME}/Projects/Practice-Git-with-Rails5 \
    ${HOME}/Projects/rt_demo_app5 \
    ${HOME}/Projects/rt_first_app5 \
    ${HOME}/Projects/show-me-the-food5 \
    ${HOME}/Projects/tasks5 \
\
    ${HOME}/Projects/hello_app5 \
    ${HOME}/Projects/sample_app_5_0_rt \
    ${HOME}/Projects/sp50rt_2_3 \
    ${HOME}/Projects/toy_app5
do
#    ${HOME}/Projects/*edge
    cd $i # {$HOME}/Projects/$i
    echo $i "=================================================="
    if [ "X$1X" == "XX" ] ; then
        rerake
    else
        if [ "X$1X" == "XrX" ] ; then
            rake
        else
            if [ "X$1X" == "XggX" ] ; then
                git status
            else
                overcommit --install
                git push
            fi
        fi
    fi
done
echo "Remember that 24*5 and t*5 must have to be run separately."
