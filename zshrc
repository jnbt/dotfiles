ZSH=$HOME/.oh-my-zsh

# Theming
if [ x"$TERM_PROGRAM" = x"iTerm.app" ]; then
  ZSH_THEME="powerlevel9k/powerlevel9k"
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rvm)
  POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
  POWERLEVEL9K_MODE="awesome-patched"
  POWERLEVEL9K_VCS_GIT_ICON=''
  POWERLEVEL9K_VCS_VCS_HG_ICON=''
fi

# No auto update
DISABLE_AUTO_UPDATE="true"

# Dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(
  autojump
  jnbt
  jsontools
  local
  mix
  neo
  neogit
  osx
  ruby
  rvm
  tmux
  tmuxinator
  travis
  nvm
)

export ZSH_CUSTOM="$HOME/personal/dotfiles/oh-my-zsh/custom"
source $ZSH/oh-my-zsh.sh

# Device specific config should live in .local.zsh

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk

