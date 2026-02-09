# Zinit - Zsh plugin manager
# https://github.com/zdharma-continuum/zinit

# 1. Install & source Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "$ZINIT_HOME/zinit.zsh"

# 2. Plugins
zinit load zsh-users/zsh-completions
zinit wait lucid for \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    atinit"zicompinit; zicdreplay" \
        zsh-users/zsh-syntax-highlighting

# 3. Completions
: ${XDG_CACHE_HOME:=$HOME/.cache}
mkdir -p "$XDG_CACHE_HOME/zsh"
autoload -Uz compinit
compinit -C -d "$XDG_CACHE_HOME/zsh/.zcompdump"

# Completion style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# 4. Zinit completion
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
