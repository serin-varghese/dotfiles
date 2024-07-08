export PATH=$HOME/.local/bin:$HOME/.docker/bin:$PATH

# Plugin
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Change directories without `cd`
setopt auto_cd

# Load compinit and bashcompinit for autocompletions
autoload -Uz compinit bashcompinit && compinit && bashcompinit

# Use arrow-keys to search history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search

# History
HISTSIZE=5000            # How many lines of history to keep in memory
HISTFILE=~/.zsh_history  # Where to save history to disk
SAVEHIST=5000            # Number of history entries to save to disk
setopt appendhistory     # Append history to the history file (no overwriting)
setopt sharehistory      # Share history across terminals
setopt incappendhistory  # Immediately append to the history file, not just when a term is killed

# Only for Mac
if [[ $OSTYPE == darwin* ]]; then
    export http_proxy=http://127.0.0.1:9000
    export https_proxy=http://127.0.0.1:9000
    export no_proxy="localhost,127.0.0.1,wob.vw.vwg,vwgroup.com"

    export HDF5_DIR=/opt/homebrew/opt/hdf5
fi

# eza
if [ -x "$(command -v eza)" ]; then
    alias ls="eza" # just replace ls by eza and allow all other eza arguments
    alias l="ls -lbF --git" #   list, size, type
    alias ll="ls -la --git" # long, all
    alias llm="ll --sort=modified --git" # list, long, sort by modification date
    alias la="ls -lbhHigUmuSa --time-style=long-iso --git --color-scale" # all list
    alias lx="ls -lbhHigUmuSa@ --time-style=long-iso --git --color-scale" # all list and extended
    alias tree="eza --tree" # tree view
fi

# bat
if [ -x "$(command -v batcat)" ]; then
    alias bat="batcat"
fi
if [ -x "$(command -v bat)" ]; then
    alias cat="bat --style=plain"
fi
export BAT_THEME="Visual Studio Dark+"

# vscode
if [ -x "$(command -v code)" ]; then
    export EDITOR="code -w"
    export VISUAL="$EDITOR"
fi

eval "$(starship init zsh)"
