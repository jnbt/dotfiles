ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=")"

function jnbt_status {
  (( spare_width = ${COLUMNS} ))
  prompt=""

  branch=$(current_branch)
  ruby_version=$(rvm-prompt i v g)
  path_size=${#PWD}
  branch_size=${#branch}
  ruby_size=${#ruby_version}

  if [[ ${#branch} -eq 0 ]]
    then (( ruby_size = ruby_size + 1 ))
  else
    (( branch_size = branch_size + 4 ))
    if [[ -n $(git status -s 2> /dev/null) ]]; then
      (( branch_size = branch_size + 2 ))
    fi
  fi

  (( spare_width = ${spare_width} - (${path_size} + ${branch_size} + ${ruby_size}) ))

  while [ ${#prompt} -lt $spare_width ]; do
    prompt=" $prompt"
  done

  prompt="%{%F{green}%}$PWD$prompt$ruby_version%{$reset_color%} $(git_prompt_info)%{$reset_color%}"

  echo $prompt
}

jnbt_precmd() {
  print ""
  print -rP "$(jnbt_status)"
}
add-zsh-hook precmd jnbt_precmd
export PROMPT="⚡ "
