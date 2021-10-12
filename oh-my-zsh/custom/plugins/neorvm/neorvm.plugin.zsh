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
else
  rvm() {
    case $1 in
      use)
        shift
        full="$1"
        version="${full%%@*}"
        echo "Executing: asdf current ruby $version"
        asdf shell ruby $version
      ;;
      install)
        shift
        full="$1"
        version="${full%%@*}"
        echo "Executing: asdf install ruby $version"
        asdf install ruby $version
      ;;
      current)
        asdf current ruby | head -n1 | awk '{print $1;}'
      ;;
      *)
        echo "RVM compabality layer"
        echo "USAGE: rvm [COMMAND] [OPTIONS]"
        echo
        echo "This is a compatibility layer based on asdf, only limited commands are supported:"
        echo
        echo "Commands:"
        echo " install - Installs a specific Ruby version"
        echo " current - Reports the currently used Ruby version"
        echo " use     - Activate a specific Ruby version"
    esac
  }
fi
