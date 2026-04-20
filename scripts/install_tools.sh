#!/bin/bash

echo "[+] Installing tools..."

sudo apt update

sudo apt install -y \
    git \
    curl \
    vim \
    zsh \
    htop \
    tree

echo "[✓] Tools installed"

