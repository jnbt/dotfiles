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

alias gb='git branch -v'
alias gba='gb -a'
alias gc='git commit -v'
alias gca='gc -a'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git pull -v'
alias glr='git pull -v --rebase'
alias gg="git lg"
alias gp='git push -v'
alias grep='grep --colour=auto'
alias gst='git status -s'
alias gsr='git svn rebase'
alias gcd='git svn dcommit'
alias gr='git grep'
alias gfa='git fetch --all'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gco='git checkout'