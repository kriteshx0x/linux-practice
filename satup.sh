#!/bin/bash
set -e

echo "[+] Starting Linux setup..."

source scripts/utils.sh

bash scripts/install_tools.sh
bash scripts/setup_symlinks.sh

setup_git

echo "[✓] Setup complete!"

