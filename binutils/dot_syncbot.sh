######################################################################
# To get "dot" command for Ubuntu: sudo apt-get install graphviz
######################################################################
dot -Tpdf <<EOF > ${HOME}/dotout.pdf
digraph D {
  node [shape="box"]
  size="11,8"

  "syncbot.sh" -> 
    "1. ghit.sh"          -> "check/1 - git diff" ->
      "2. rmboth.sh"      -> "check/2 - git diff" -> 
        "3. runallpp.sh"  -> "check/3 - git diff + yamllint" -> 
          "4. rake"       -> "check/4 - review stdout/stderr" ->
            "5. morechks" -> 
              "6. git add" -> "7. ggf" -> "8. git commit -m msg" -> "9. gpso"

  "1. ghit.sh" -> "cd ruby-advisory-db" -> "syncit()" -> "autogitb()" ->
      "git diff" -> "rm Gemfile.lock" ->  "bundle install" -> "github_advisory_sync.rb"

      "syncit()" -> "4 git cmds (fetch,\ncheckout, merge, push)"

      "autogitb()" -> "git checkout/1"

  "2. rmboth.sh" -> "rmdups()" -> "git checkout/2" -> "rm -f, rmdir"

  "3. runallpp.sh" -> "pp()" -> "cat, echo, egrep,\nsed, tr, cp, rm"

  "5. morechks" -> "echop(), git grep,\ngrep, egrep fgrep, sed,\nawk, wc, sort, uniq" ->
      "iss661chk.sh" -> "related-advs.sh"

  "7. ggf" -> "find, git status, grep, sed"

  "9. gpso" -> "git push --set-upstream"
}
EOF
# To print out, use "lp dotout.pdf". 
#
# 7/17/2023: Ignore "pickurl"
