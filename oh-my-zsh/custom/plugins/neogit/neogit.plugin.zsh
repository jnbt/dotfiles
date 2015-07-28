neogit() {
  git config user.name "Jonas Thiel"
  git config user.email "jt@neopoly.de"
  echo -n "Name: "
  git config user.name
  echo -n "E-Mail: "
  git config user.email
}

gpu() {
  git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}

alias ga='git add'
alias gb='git branch -v'
alias gba='gb -a'
alias gc='git commit -v'
alias gca='gc -a'
alias gcd='git svn dcommit'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gfa='git fetch --all'
alias gg="git lg"
alias gl='git pull -v'
alias glg='git log --stat --color'
alias glgg='git log --graph --color'
alias glgp='git log --stat --color -p'
alias glr='git pull -v --rebase'
alias gm='git merge'
alias gp='git push -v'
alias gr='git grep'
alias grep='grep --colour=auto'
alias grhh='git reset HEAD --hard'
alias gsr='git svn rebase'
alias gst='git status -s'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
