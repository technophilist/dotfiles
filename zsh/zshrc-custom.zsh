# init starship prompt
eval "$(starship init zsh)"

# display system info
fastfetch

# enable vim
bindkey -v

# aliases
alias lg="lazygit"

tm() {
  if [ "$1" = "a" ]; then
    tmux attach -t "$2"
  elif [ "$1" = "ls" ]; then
    tmux list-sessions
  else
    tmux "$@"
  fi
}
