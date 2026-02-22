# set default editor to nvim
export VISUAL="nvim"
export EDITOR="nvim"

# init starship prompt
eval "$(starship init zsh)"

# display system info once per shell instance
if [[ -z "$FASTFETCH_SHOWN" ]]; then
    fastfetch
    export FASTFETCH_SHOWN=1
fi

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
