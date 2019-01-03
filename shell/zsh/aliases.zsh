## Pipe Aliases (Global)
alias -g L='|less'
alias -g G='|grep'
alias -g T='|tail'
alias -g H='|head'
alias -g W='|wc -l'
alias -g S='|sort'

alias -g git-commit-fixups='echo "Execute the following commands: " && for file in `git diff --name-only --cached`; do commit=$(git log --pretty=format:"%h" -n 1 $file); echo git commit -m \"FIXUP $commit\" $file; done'
alias -g git-commit-fixups-alt='echo "Execute the following commands: " && for file in `git ls-files -m`; do commit=$(git log --pretty=format:"%h" -n 1 $file); echo git commit -m \"FIXUP $commit\" $file; done'
