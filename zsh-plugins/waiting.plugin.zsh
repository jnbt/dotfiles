export COMPLETION_WAITING_DOTS="%F{red}…%f"
expand-or-complete-with-dots() {
  printf '\e[?7l%s\e[?7h' "${(%)COMPLETION_WAITING_DOTS}"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
# Set the function as the default tab completion widget
bindkey -M emacs "^I" expand-or-complete-with-dots
bindkey -M viins "^I" expand-or-complete-with-dots
bindkey -M vicmd "^I" expand-or-complete-with-dots