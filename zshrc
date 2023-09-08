#
# Environment
#
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl@1.1/lib/
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export HOMEBREW_NO_AUTO_UPDATE=1
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#
# ASDF
#
. $(brew --prefix asdf)/libexec/asdf.sh

#
# Colorize in ls
#
# export LSCOLORS="EHfxcxdxBxegecabagacad"
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

#
# Autosuggest
#
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC="true"

#
# History search
#
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
export HISTSIZE=1000000
export SAVEHIST=1000000

#
# Shell completion
#

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'l:|=* r:|=*' 'l:|=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '/Users/jt/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Enable bash compability for ZSH completion
autoload bashcompinit && bashcompinit

#
# Own features
#
features=(
  jnbt
  local
  neo
  neogit
  neorvm
)

for feature in $features; do
  source "$HOME/personal/dotfiles/zsh-plugins/$feature.plugin.zsh"
done

#
# iTerm 2 integrations
#
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh


#
# Starship prompt
#
export STARSHIP_CONFIG=~/.starship
eval "$(starship init zsh)"

#
# Syntax Highlighting
#
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Device specific config should live in .local.zsh
