# Aliases
alias md5sum='md5 -r'
alias libreoffice='/Applications/LibreOffice.app/Contents/MacOS/soffice'
alias be='bundle exec'

neo()  { cd ~/devel/$1; }
_neo() { _files -W ~/devel -/; }
compdef _neo neo

neoclone() {
  git clone gitlab@gitlab.neopoly.de:$1;
  cd $1;
}

PROJECT_HOST=hummus
PROJECT_HOST_FILE=~/.hummus

read -r -d '' NEOSERVER_AUTO_SCREEN << EOM
sleep 1
screen -x && clear && exit 0
if [ "$?" != "0" ]; then
  screen && clear && exit 0
fi
echo "Screen failed! Continuing with normal shell startup"
/bin/bash -l
EOM

neoserver() {
  if [[ -n $1 ]]; then
    project=$1
  elif [[ ${PWD} =~ '.+/devel/([^/]+)' ]]; then
    project=$match[1]
  else
    project=${${PWD##*/}%%-*}
  fi

  if [[ -f $PROJECT_HOST_FILE ]]; then
    sshpass -f $PROJECT_HOST_FILE ssh $project@$PROJECT_HOST -t "$NEOSERVER_AUTO_SCREEN"
  else
    echo "(use sshpass via file: $PROJECT_HOST_FILE)"
    ssh $project@$PROJECT_HOST -t "$NEOSERVER_AUTO_SCREEN" $*
  fi
}

docsync() {
  ga .
  gc
  gl
  gp
}
