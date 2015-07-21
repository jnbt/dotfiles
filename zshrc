ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jnbt-power"

# No auto update
DISABLE_AUTO_UPDATE="true"

# Dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(git ruby osx autojump rvm neo jnbt neogit local mix)

export ZSH_CUSTOM="$HOME/personal/dotfiles/oh-my-zsh/custom"
source $ZSH/oh-my-zsh.sh

# User configuration, device specific config should live in .zshrc.local
# export A=B
