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
alias kc="kiro-cli"
alias kcr="kiro-cli chat --resume"

# nvim wrappers set TMUX_PANE_DIR before opening nvim so tmux splits inherit the
# correct CWD. on macOS, #{pane_current_path} reads the foreground process CWD
# (nvim) instead of the shell's, so we store it manually in a tmux env var.
nvd() {
  cd ~/dotfiles
  tmux set-environment TMUX_PANE_DIR "$PWD"
  nvim .
}
nvz() { tmux set-environment TMUX_PANE_DIR "$PWD" && nvim ~/.zshrc; }
nvtm() { tmux set-environment TMUX_PANE_DIR "$PWD" && nvim ~/.tmux.conf; }
alias sz="source ~/.zshrc"
nv() {
  tmux set-environment TMUX_PANE_DIR "$PWD"
  nvim "$@"
}

nvf() {
  local dir
  dir=$(find "$DEV_PROJECTS_DIR/" -maxdepth 3 -type d -not -path '*/\.*' | fzf) || return
  cd "$dir"
  tmux set-environment TMUX_PANE_DIR "$PWD"
  nvim .
}

tm() {
  if [ "$1" = "a" ]; then
    tmux attach -t "$2"
  elif [ "$1" = "ls" ]; then
    tmux list-sessions
  else
    tmux "$@"
  fi
}
