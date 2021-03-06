ZSH=$HOME/.oh-my-zsh

# Theming
if [ x"$TERM_PROGRAM" = x"iTerm.app" -o x"$TERM_PROGRAM" = x"Hyper" ]; then
  # Install a powerline font: https://github.com/powerline/fonts
  ZSH_THEME="powerlevel9k/powerlevel9k"
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
  POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
  POWERLEVEL9K_VCS_GIT_ICON=''
  POWERLEVEL9K_VCS_VCS_HG_ICON=''
fi

# No auto update
DISABLE_AUTO_UPDATE="true"

# Dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(
  asdf
  autojump
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

export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
