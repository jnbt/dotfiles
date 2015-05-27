# Exports
export SF_DIR="$HOME/devel/smartfox"

# Aliases
alias md5sum='md5 -r'

neo()  { cd ~/devel/$1; }
_neo() { _files -W ~/devel -/; }
compdef _neo neo

resin()  { "${EDITOR:-vi}" ~/devel/resin/conf/$1; }
_resin() { _files -W ~/devel/resin/conf/ -/; }
compdef _resin resin

neoclone() {
  git clone gitlab@gitlab.neopoly.de:$1;
  cd $1;
}

neocloneold() {
  cd ~/devel;
  git clone git@office.neopoly.de:$1;
  cd $1;
  gco develop;
}

PROJECT_HOST=doener
PROJECT_HOST_FILE=~/.doener

neoserver() {
  if [[ -n $1 ]]; then
    project=$1
  else
    project=${${PWD##*/}%%-*}
  fi

  if [[ -f $PROJECT_HOST_FILE ]]; then
    sshpass -f $PROJECT_HOST_FILE ssh $project@$PROJECT_HOST
  else
    echo "(use sshpass via file: $PROJECT_HOST_FILE)"
    ssh $project@$PROJECT_HOST $*
  fi
}
