#!/usr/bin/env bash
# =============================================================================
# setup_symlinks.sh — creates all dotfile symlinks
# =============================================================================

set -euo pipefail
source "$(dirname "$0")/utils.sh"

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

info "Creating symlinks..."

# zsh
link_file "$DOTFILES_DIR/zsh/.zshrc"          "$HOME/.zshrc"
link_file "$DOTFILES_DIR/zsh/aliases.zsh"     "$HOME/.zsh_aliases"
link_file "$DOTFILES_DIR/zsh/functions.zsh"   "$HOME/.zsh_functions"

# git
link_file "$DOTFILES_DIR/git/gitconfig"       "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/git/gitignore"       "$HOME/.gitignore_global"

# kitty
mkdir -p "$HOME/.config/kitty"
link_file "$DOTFILES_DIR/kitty/kitty.conf"    "$HOME/.config/kitty/kitty.conf"
link_file "$DOTFILES_DIR/kitty/theme.conf"    "$HOME/.config/kitty/theme.conf"

# tmux
link_file "$DOTFILES_DIR/tmux/tmux.conf"      "$HOME/.tmux.conf"

# fastfetch
mkdir -p "$HOME/.config/fastfetch"
link_file "$DOTFILES_DIR/fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"

success "All symlinks created."
