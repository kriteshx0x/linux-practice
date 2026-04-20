#!/bin/bash

set -e

echo "======================================"
echo "[+] Linux Dev Environment Setup Start"
echo "======================================"

# Resolve repo base directory (important for portability)
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[+] Base directory: $BASE_DIR"

# Load utility functions
source "$BASE_DIR/scripts/utils.sh"

# -------------------------------
# STEP 1: Install required tools
# -------------------------------
echo "[+] Installing required tools..."
bash "$BASE_DIR/scripts/install_tools.sh"

# -------------------------------
# STEP 2: Backup existing configs
# -------------------------------
echo "[+] Backing up existing configs..."
backup_file ~/.bashrc
backup_file ~/.zshrc
backup_file ~/.vimrc
backup_file ~/.gitconfig

# -------------------------------
# STEP 3: Apply configurations
# -------------------------------
echo "[+] Applying configuration symlinks..."
bash "$BASE_DIR/scripts/setup_symlinks.sh"

# -------------------------------
# STEP 4: Setup Git
# -------------------------------
echo "[+] Configuring Git..."
setup_git

# -------------------------------
# STEP 5: Set Zsh as default shell
# -------------------------------
if command -v zsh >/dev/null 2>&1; then
    echo "[+] Setting Zsh as default shell..."
    chsh -s "$(which zsh)" || echo "[!] Could not change shell automatically"
fi

# -------------------------------
# DONE
# -------------------------------
echo "======================================"
echo "[✓] Setup Complete!"
echo "Restart your terminal or run: zsh"
echo "======================================"

