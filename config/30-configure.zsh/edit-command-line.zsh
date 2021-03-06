#!/usr/bin/env zsh

# Enable Ctrl-x-e to edit command line

## enable edit-command-line
autoload -U edit-command-line
zle -N edit-command-line

## Emacs style:
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

## Vi style:
# bindkey -M vicmd v edit-command-line
