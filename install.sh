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
symlink "$DOTFILES_DIR/bin/notes-link"     "$HOME/.local/bin/notes-link"

ensure_global_gitignore() {
  local pattern="$1"
  local excludes_file
  excludes_file="$(git config --global core.excludesFile || true)"

  if [[ -z "$excludes_file" ]]; then
    excludes_file="$HOME/.gitignore"
    git config --global core.excludesFile "$excludes_file"
  fi

  excludes_file="${excludes_file/#\~/$HOME}"
  touch "$excludes_file"

  if ! grep -qxF "$pattern" "$excludes_file"; then
    echo "$pattern" >> "$excludes_file"
    echo "  added '$pattern' to $excludes_file"
  fi
}

echo "Ensuring global gitignore rules..."
ensure_global_gitignore "@notes/"

echo "Done."
