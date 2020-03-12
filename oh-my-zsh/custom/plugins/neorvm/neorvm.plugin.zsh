if [[ -s "$HOME/.rvm/scripts/rvm" ]];
then
  export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

  alias gemdir='cd `rvm gemdir`'

  # change directory into gem dir
  chgem() {
    cd "`rvm gemdir`/gems/$1"
  }
  _chgem() {
    _directories -W `rvm gemdir`/gems;
  }
  compdef _chgem chgem
fi
