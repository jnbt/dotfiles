vhosts(){ "${EDITOR:-vi}" /usr/local/etc/nginx; }
hosts(){ "${EDITOR:-vi}" /etc/hosts; }

c(){ cd ~/Inwork/$1; }
_c(){ _files -W ~/Inwork -/; }
compdef _c c

# autocorrect is more annoying than helpful
unsetopt correct_all

# Configure
export DEFAULT_USER='jt'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='editor'
fi

# ssh wrapper that rename current tmux window to the hostname of the
# remote host.
ssh() {
  # Do nothing if we are not inside tmux or ssh is called without arguments
  if [[ $# == 0 || -z $TMUX ]]; then
      command ssh $@
      return
  fi
  # The hostname is the last parameter (i.e. ${(P)#})
  local remote=${${(P)#}%.*}
  local old_name="$(tmux display-message -p '#W')"
  local renamed=0
  # Save the current name
  if [[ $remote != -* ]]; then
      renamed=1
      tmux rename-window $remote
  fi
  command ssh $@
  if [[ $renamed == 1 ]]; then
      tmux rename-window "$old_name"
  fi
}

jnbtgit() {
  git config user.name "Jonas Thiel"
  git config user.email "jonas@thiel.io"
  echo -n "Name: "
  git config user.name
  echo -n "E-Mail: "
  git config user.email
}

startdocker() {
  docker-machine start default
  eval "$(docker-machine env default)"
}
