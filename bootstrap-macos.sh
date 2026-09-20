#!/bin/bash
# strict error handling mode
set -euo pipefail

REPO_URL="https://github.com/technophilist/dotfiles.git"
REPO_DIR="$HOME/dotfiles"

# brew installation needs command line tools
if ! xcode-select -p &>/dev/null; then
	echo "Installing Command Line Tools… re-run when done."
	xcode-select --install
	exit 0
fi

# setup brew
if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew…"
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	if [ -d /opt/homebrew ]; then
		export PATH="/opt/homebrew/bin:$PATH"   # Apple Silicon
	else
		export PATH="/usr/local/bin:$PATH"      # Intel
	fi
fi

# setup dotfiles
if [ ! -d "$REPO_DIR" ]; then
	echo "Cloning dotfiles…"
	git clone "$REPO_URL" "$REPO_DIR"
fi

# install packages (Brewfile has git, stow, etc.)
brew bundle --file "$REPO_DIR/Brewfile"

# link configs with stow
(cd "$REPO_DIR" && stow aerospace karabiner nvim sketchybar starship tmux)

# install tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# setup zsh
if [ ! -d "$HOME/dev-projects" ]; then
	echo "Creating $HOME/dev-projects…"
	mkdir -p "$HOME/dev-projects"
fi

if [ ! -f "$HOME/.zshrc" ]; then
	echo "Creating ~/.zshrc…"
	touch "$HOME/.zshrc"
fi

if ! grep -qF "zshrc-custom.zsh" "$HOME/.zshrc"; then
	echo "Wiring zshrc-custom.zsh into ~/.zshrc…"
	cat >> "$HOME/.zshrc" <<'EOF'

# local dev projects path
export DEV_PROJECTS_DIR="$HOME/dev-projects"

# --- Load custom config from dotfile ---
ZSH_CUSTOM_CONFIG="$HOME/dotfiles/zsh/zshrc-custom.zsh"

if [ -f "$ZSH_CUSTOM_CONFIG" ]; then
    source "$ZSH_CUSTOM_CONFIG"
else
    echo "Unable to load custom zsh config from dotfile. Config not found at $ZSH_CUSTOM_CONFIG"
fi

# init zoxide
eval "$(zoxide init zsh)"
EOF
fi

echo "✅ Done. All setup! Open a new terminal (or run: exec zsh) to pick up your zsh config."
