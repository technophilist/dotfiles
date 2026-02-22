# init starship prompt
eval "$(starship init zsh)"

# display system info
fastfetch

# enable vim
bindkey -v

# aliases
alias lg="lazygit"
alias nvd="cd ~/dotfiles && nvim ."
alias nvz="nvim ~/.zshrc"
alias nvtm="nvim ~/.tmux.conf"
alias sz="source ~/.zshrc"
alias nv="nvim"

tm() {
  if [ "$1" = "a" ]; then
    tmux attach -t "$2"
  elif [ "$1" = "ls" ]; then
    tmux list-sessions
  else
    tmux "$@"
  fi
}
