ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jnbt2"

# No auto update
DISABLE_AUTO_UPDATE="true"

# Dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(git textmate ruby osx autojump rvm neo jnbt neogit local)

export ZSH_CUSTOM="$HOME/personal/dotfiles/oh-my-zsh/custom"
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:$PATH"