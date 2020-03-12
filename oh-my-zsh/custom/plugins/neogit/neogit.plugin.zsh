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

ggone() {
  echo "Execute: git remote prune origin"
  git remote prune origin
  branches=$(git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}')
  echo
  echo "The following local branched will be FORCE-removed:"
  while IFS= read -r branch; do
    echo "* $branch"
  done <<< "$branches"
  echo
  read -q "REPLY?Are you sure? (y/N)"
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo $(echo $branches | xargs git branch -D)
  else
    echo "Cancelled"
  fi
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
alias gpf='git push -v --force-with-lease'
alias gr='git grep'
alias grep='grep --colour=auto'
alias grhh='git reset HEAD --hard'
alias gsr='git svn rebase'
alias gst='git status -s'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gps='git push -v -o ci.skip'
alias gpfs='git push -v -o ci.skip --force-with-lease'

git-by-size() {
  if [[ -n $1 ]]; then
    git rev-list --objects --all | grep "$(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -$1 | awk '{print$1}')"
  else
    echo "USAGE: git-by-size AMOUNT"
    echo "Lists the AMOUNT largest files in the current repo"
  fi
}
