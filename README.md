# Dotfiles 42 — Zsh, Tmux, Kitty

Configuration type dotfiles : Zsh, Tmux, Kitty.

**Compatible 42 sans sudo** : tout est dans `$HOME` (XDG, `~/.local`, `~/.config`). Aucune installation système ni droit administrateur requis.

## Structure

```
dotfile_for42/
├── .zshrc                 # Point d’entrée Zsh (à lier dans ~)
├── README.md
└── .config/
    ├── shell/             # env, aliases (partagés)
    ├── zsh/               # zinit.zsh
    ├── tmux/              # tmux.conf, options, keybindings, plugins.conf, themes/
    └── kitty/             # kitty.conf + thèmes auto clair/sombre
```

## Déployer (liens symboliques)

Depuis la racine du dépôt (ou là où se trouve ce dossier) :

```bash
DOTS="$HOME/.dotfiles/dotfile_for42"   # ou le chemin où est ce dossier

mkdir -p "$HOME/.config"
ln -sfn "$DOTS/.zshrc" "$HOME/.zshrc"
ln -sfn "$DOTS/.config/shell" "$HOME/.config/shell"
ln -sfn "$DOTS/.config/zsh" "$HOME/.config/zsh"
ln -sfn "$DOTS/.config/tmux" "$HOME/.config/tmux"
ln -sfn "$DOTS/.config/kitty" "$HOME/.config/kitty"
```

Le `.zshrc` charge `~/.config/shell/env`, `~/.config/zsh/zinit.zsh` et `~/.config/shell/aliases`. Tmux et Kitty utilisent `~/.config/tmux` et `~/.config/kitty`.

## Prérequis à 42 (sans sudo)

| Outil | Obligatoire | Note |
|-------|-------------|------|
| **zsh** | Oui | Souvent déjà le shell par défaut. |
| **tmux** | Non | Si absent, la config tmux est ignorée. |
| **Kitty** | Non | Config utilisée seulement si Kitty est lancé (souvent pas dispo sur les postes 42). |
| **Starship** | Non | Prompt fancy uniquement si binaire dans `PATH` (ex. `~/.local/bin`). Install possible en user : [starship.rs](https://starship.rs). |
| **nvim/vim** | Non | `EDITOR` s’adapte à ce qui est disponible. |

Optionnel : exécuter une fois `scripts/shell.sh` pour migrer l’historique bash/zsh vers XDG et créer les dossiers cache/state (sinon le `.zshrc` crée le minimum pour l’historique).

## Tmux

Les plugins (TPM, vim-tmux-navigator, etc.) ne sont pas inclus. Après déploiement, installer TPM une fois :

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Puis dans tmux : **Ctrl+Space** puis **I** pour installer les plugins listés dans `plugins.conf`.

## Contenu

| Composant | Fichiers |
|-----------|----------|
| **Zsh** | `.zshrc`, `.config/zsh/zinit.zsh` |
| **Shell** | `.config/shell/env`, `.config/shell/aliases` |
| **Tmux** | `.config/tmux/*.conf`, `themes/`, README |
| **Kitty** | `.config/kitty/*.conf`, README |
