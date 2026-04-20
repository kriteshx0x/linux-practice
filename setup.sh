#!/bin/bash

set -e

echo "[+] Starting setup..."

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$BASE_DIR/scripts/utils.sh"

# Install tools
bash "$BASE_DIR/scripts/install_tools.sh"

# Backup existing configs
backup_file ~/.bashrc
backup_file ~/.zshrc
backup_file ~/.vimrc
backup_file ~/.gitconfig

# Apply configs
bash "$BASE_DIR/scripts/setup_symlinks.sh"

# Git setup
setup_git

# Set zsh as default shell
chsh -s "$(which zsh)" || echo "[!] Could not change shell"

echo "[✓] Setup complete!"
echo "Restart terminal or run: zsh"

