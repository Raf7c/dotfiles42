# Zsh
# 1. History (répertoire créé si besoin)
ZSH_STATE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
[[ -d "$ZSH_STATE" ]] || mkdir -p "$ZSH_STATE"
HISTFILE="$ZSH_STATE/history"
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# 2. Env (PATH, XDG…)
[ -f "$HOME/.config/shell/env" ] && . "$HOME/.config/shell/env"

# 3. Zinit + plugins
[ -f "$HOME/.config/zsh/zinit.zsh" ] && . "$HOME/.config/zsh/zinit.zsh"

# 4. Aliases
[ -f "$HOME/.config/shell/aliases" ] && . "$HOME/.config/shell/aliases"

# 5. Starship prompt
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"
