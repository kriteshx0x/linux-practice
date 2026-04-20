#!/bin/bash

echo "[+] Linking configuration files..."

BASE_DIR=$(pwd)

ln -sf $BASE_DIR/bash/.bashrc ~/.bashrc
ln -sf $BASE_DIR/zsh/.zshrc ~/.zshrc
ln -sf $BASE_DIR/git/.gitconfig ~/.gitconfig
ln -sf $BASE_DIR/vim/.vimrc ~/.vimrc

echo "[✓] Symlinks created"

