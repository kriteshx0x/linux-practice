#!/bin/bash

backup_file() {
    FILE=$1

    if [ -f "$FILE" ] || [ -L "$FILE" ]; then
        echo "[!] Backing up $FILE → $FILE.bak"
        mv "$FILE" "$FILE.bak"
    fi
}

setup_git() {
    read -p "Enter your Git username: " name
    read -p "Enter your Git email: " email

    git config --global user.name "$name"
    git config --global user.email "$email"

    echo "[✓] Git configured"
}

