source $HOME/.env
source $HOME/.aliases
source $HOME/.lesskey

# completion and prompt
autoload -Uz compinit promptinit
compinit
promptinit

# open up a completion menu
zstyle ':completion:*' menu select

# zle
autoload -z edit-command-line
zle -N edit-command-line

# keybindings
bindkey -e                              # use emacs keybindings (default)
bindkey "\ee" edit-command-line         # <escape-e> opens EDITOR
bindkey '\em' copy-prev-shell-word      # <escape-m> duplicate last word
bindkey '^[[Z' reverse-menu-complete    # <backtab> to go backwards through completions

# complete aliases
setopt COMPLETE_ALIASES

# history
setopt APPEND_HISTORY
setopt SHARE_HISTORY
