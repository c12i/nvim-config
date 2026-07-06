#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

symlink() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "  $dst -> $src"
}

echo "Creating symlinks..."

symlink "$DOTFILES_DIR/.wezterm.lua"       "$HOME/.wezterm.lua"
symlink "$DOTFILES_DIR/.ghostty.conf"      "$HOME/.config/ghostty/config"
symlink "$DOTFILES_DIR/.zellij.kdl"        "$HOME/.config/zellij/config.kdl"
symlink "$DOTFILES_DIR/.yazi.toml"         "$HOME/.config/yazi/yazi.toml"
symlink "$DOTFILES_DIR/.yazi-keymap.toml"  "$HOME/.config/yazi/keymap.toml"

echo "Done."
