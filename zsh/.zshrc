# Base directory of this repo (resolved dynamically)
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load aliases
[ -f "$BASE_DIR/aliases.zsh" ] && source "$BASE_DIR/aliases.zsh"

# Load prompt config
[ -f "$BASE_DIR/ps1-config.sh" ] && source "$BASE_DIR/ps1-config.sh"

# Default editor
export EDITOR=vim

# Quality of life
setopt autocd

# Load aliases
[ -f ~/repos/linux-config/zsh/aliases.zsh ] && source ~/repos/linux-config/zsh/aliases.zsh

# Load prompt
[ -f ~/repos/linux-config/zsh/ps1-config.sh ] && source ~/repos/linux-config/zsh/ps1-config.sh

export EDITOR=vim

