#!/bin/bash

echo "[+] Linking configuration files..."

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Core configs
ln -sf $BASE_DIR/bash/.bashrc ~/.bashrc
ln -sf $BASE_DIR/git/.gitconfig ~/.gitconfig
ln -sf $BASE_DIR/vim/.vimrc ~/.vimrc

# Zsh (if user uses it)
[ -f "$BASE_DIR/zsh/.zshrc" ] && ln -sf $BASE_DIR/zsh/.zshrc ~/.zshrc

# Kitty config
mkdir -p ~/.config/kitty
ln -sf $BASE_DIR/kitty/kitty.conf ~/.config/kitty/kitty.conf

echo "[✓] Symlinks created"

