# Homebrew bundle for dotfiles — works on macOS and Linux (Linuxbrew).
# Shared CLI tools apply to both; macOS-only packages are wrapped in `if OS.mac?`.

# shared
brew "git"
brew "stow"
brew "zoxide"
brew "fzf"
brew "ripgrep"
brew "fd"
brew "lazygit"
brew "starship"
brew "tmux"
brew "neovim"

# macOS only
if OS.mac?
	tap "felixkratz/formulae" # sketchybar

	brew "sketchybar"

	cask "aerospace"
	cask "karabiner-elements"
	cask "iterm2"
	cask "font-sketchybar-app-font"
	cask "font-jetbrains-mono-nerd-font"
end