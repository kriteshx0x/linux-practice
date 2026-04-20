#!/usr/bin/env bash
# =============================================================================
# setup.sh — dotfiles bootstrap for linux-config
# Author  : ritesh
# Repo    : https://github.com/ritesh/linux-config
# =============================================================================

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$HOME/.dotfiles-setup.log"

# ── colours ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

info()    { echo -e "${CYAN}[info]${RESET}  $*" | tee -a "$LOG_FILE"; }
success() { echo -e "${GREEN}[ok]${RESET}    $*" | tee -a "$LOG_FILE"; }
warn()    { echo -e "${YELLOW}[warn]${RESET}  $*" | tee -a "$LOG_FILE"; }
die()     { echo -e "${RED}[error]${RESET} $*" | tee -a "$LOG_FILE"; exit 1; }

# ── guards ───────────────────────────────────────────────────────────────────
[[ "$(uname -s)" != "Linux" ]] && die "Linux only."
command -v git &>/dev/null     || die "git is required. Install it first."

# ── banner ───────────────────────────────────────────────────────────────────
echo -e "${BOLD}"
echo "  ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗"
echo "  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝"
echo "  ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗"
echo "  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║"
echo "  ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║"
echo "  ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝"
echo -e "${RESET}  linux-config bootstrap — by ritesh\n"

# ── steps ────────────────────────────────────────────────────────────────────
info "Installing tools..."
bash "$DOTFILES_DIR/scripts/install_tools.sh"

info "Linking dotfiles..."
bash "$DOTFILES_DIR/scripts/setup_symlinks.sh"

success "Done. Open a new shell or run: source ~/.zshrc"
