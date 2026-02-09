#!/usr/bin/env bash
# Usage : bash scripts/deploy.sh

set -eu

DOTS_ROOT="${DOTS_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"

mkdir -p "$HOME/.config"

ln -sfn "$DOTS_ROOT/.zshrc" "$HOME/.zshrc"
echo "Link created: $HOME/.zshrc -> $DOTS_ROOT/.zshrc"

ln -sfn "$DOTS_ROOT/.config/shell" "$HOME/.config/shell"
echo "Link created: $HOME/.config/shell -> $DOTS_ROOT/.config/shell"

ln -sfn "$DOTS_ROOT/.config/zsh" "$HOME/.config/zsh"
echo "Link created: $HOME/.config/zsh -> $DOTS_ROOT/.config/zsh"

ln -sfn "$DOTS_ROOT/.config/tmux" "$HOME/.config/tmux"
echo "Link created: $HOME/.config/tmux -> $DOTS_ROOT/.config/tmux"

ln -sfn "$DOTS_ROOT/.config/kitty" "$HOME/.config/kitty"
echo "Link created: $HOME/.config/kitty -> $DOTS_ROOT/.config/kitty"
