#!/bin/bash

setup_git() {
    read -p "Enter your Git username: " name
    read -p "Enter your Git email: " email

    git config --global user.name "$name"
    git config --global user.email "$email"

    echo "[✓] Git configured"
}

