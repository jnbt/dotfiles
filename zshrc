ZSH=$HOME/.oh-my-zsh


# No auto update
DISABLE_AUTO_UPDATE="true"

# Dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(
  asdf
  autojump
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC="true"
  jnbt
  local
  neo
  neogit
  neorvm
  osx
  tmux
  tmuxinator
  nvm
  rvm
  rake-fast
)

export ASDF_DIR=$(brew --prefix asdf)

export ZSH_CUSTOM="$HOME/personal/dotfiles/oh-my-zsh/custom"
source $ZSH/oh-my-zsh.sh

# Device specific config should live in .local.zsh

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
iterm2_print_user_vars() {
  iterm2_set_user_var rvmCurrent $(rvm current)
}
export STARSHIP_CONFIG=~/.starship
eval "$(starship init zsh)"

export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
