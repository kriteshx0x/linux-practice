#!/usr/bin/env bash
# =============================================================================
# install_tools.sh — installs all required packages and tools
# =============================================================================

set -euo pipefail
source "$(dirname "$0")/utils.sh"

# ── apt packages ─────────────────────────────────────────────────────────────
APT_PACKAGES=(
  zsh git curl wget unzip ripgrep fd-find bat fzf tmux
  neovim kitty fonts-firacode fastfetch eza
)

info "Updating package index..."
sudo apt-get update -qq

info "Installing apt packages..."
for pkg in "${APT_PACKAGES[@]}"; do
  if dpkg -s "$pkg" &>/dev/null; then
    warn "  $pkg already installed, skipping"
  else
    sudo apt-get install -y -qq "$pkg" && success "  installed $pkg"
  fi
done

# ── zsh as default shell ──────────────────────────────────────────────────────
if [[ "$SHELL" != "$(which zsh)" ]]; then
  info "Setting zsh as default shell..."
  chsh -s "$(which zsh)" && success "Default shell → zsh"
else
  warn "zsh already default shell"
fi

# ── oh-my-zsh ─────────────────────────────────────────────────────────────────
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  info "Installing oh-my-zsh..."
  RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  success "oh-my-zsh installed"
else
  warn "oh-my-zsh already present"
fi

# ── powerlevel10k ──────────────────────────────────────────────────────────────
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [[ ! -d "$P10K_DIR" ]]; then
  info "Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
  success "Powerlevel10k installed"
else
  warn "Powerlevel10k already present"
fi

success "All tools installed."
