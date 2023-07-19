######################################################################
# To get "dot" command for Ubuntu: sudo apt-get install graphviz
######################################################################
dot -Tpdf <<EOF > ${HOME}/dotout.pdf
digraph D {
  node [shape="box"]
  size="11,8"

  "syncbot.sh" -> 
    "1. ghit.sh"         -> "check/1 - git diff" ->
      "2. rmboth.sh"     -> "check/2 - git diff" -> 
        "3. runallpp.sh" -> "check/3 - git diff + yamllint" -> 
          "4. rake"      -> "check/4 - review stdout/stderr" ->
            "5. morechk" -> 
              "6. git add" -> "7. ggf" -> "8. git commit -m msg" -> "9. gpso"

  "1. ghit.sh" -> "cd ruby-advisory-db" -> "syncit.sh" -> "autogitb.sh" ->
    "git diff" -> "rm Gemfile.lock" ->  "bundle install" -> "github_advisory_sync.rb"

     "syncit.sh" -> "4 git cmds (fetch,\ncheckout, merge, push)"

     "autogitb.sh" -> "git checkout/1"

  "2. rmboth.sh" -> "git checkout/2" -> "rmdups.sh" -> "rm -f, rmdir"

  "3. runallpp.sh" -> "pp.sh" -> "cat, echo, egrep,\nsed, tr, cp, rm"

  "7. ggf" -> "find, git status, grep, sed"

  "9. gpso" -> "git push --set-upstream"
}
EOF
# To print out, use "lp dotout.pdf". 
#
# 7/17/2023: Ignore "pickurl"
