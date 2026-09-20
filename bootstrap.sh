#!/bin/bash
# strict error handling mode
set -euo pipefail

REPO_URL="https://github.com/technophilist/dotfiles.git"
REPO_DIR="$HOME/dotfiles"

# platform detection
if [ "$(uname)" = "Darwin" ]; then
	PLATFORM="macos"
elif [ "$(uname)" = "Linux" ]; then
	PLATFORM="linux"
else
	echo "Error: only macOS and Linux are supported" >&2
	exit 1
fi

# brew installation needs command line tools
if [ "$PLATFORM" = "macos" ]; then
	if ! xcode-select -p &>/dev/null; then
		echo "Installing Command Line Tools… re-run when done."
		xcode-select --install
		exit 0
	fi
fi

# setup brew
if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew…"
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	if [ "$PLATFORM" = "macos" ]; then
		if [ -d /opt/homebrew ]; then
			export PATH="/opt/homebrew/bin:$PATH"   # Apple Silicon
		else
			export PATH="/usr/local/bin:$PATH"      # Intel
		fi
	else
		export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
	fi
fi

# setup zsh
if ! command -v zsh &>/dev/null; then
	echo "Zsh missing. Installing…"
	brew install zsh
	echo "Switch to zsh (chsh -s $(command -v zsh)) and re-run this script."
	exit 0
fi

if [ "$(basename "$SHELL")" != "zsh" ]; then
	echo "Switch to zsh (chsh -s $(command -v zsh)) and re-run this script."
	exit 0
fi

# setup dotfiles
if [ ! -d "$REPO_DIR" ]; then
	echo "Cloning dotfiles…"
	git clone "$REPO_URL" "$REPO_DIR"
fi

# install packages (Brewfile has git, stow, etc.)
brew bundle --file "$REPO_DIR/Brewfile"

# link configs with stow
if [ "$PLATFORM" = "macos" ]; then
	(cd "$REPO_DIR" && stow)
else
	(cd "$REPO_DIR" && stow tmux nvim starship)
fi

# install tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo "✅ Done. All setup!"
