#!/usr/bin/env zsh

if [[ "./init.sh" = "$0" ]]; then
    cd ..
fi
export WHAT_THE_ZSH=`pwd`

if [[ -f ~/.zshrc ]]; then
    mv ~/.zshrc ~/.zshrc.backup
fi

ln -s $WHAT_THE_ZSH/scripts/zshrc ~/.zshrc
ln -sf $WHAT_THE_ZSH/themes/puella.zsh-theme ../themes/
touch $WHAT_THE_ZSH/config/10-alias.zsh/local.zsh
mkdir -p $WHAT_THE_ZSH/config/20-function.zsh/local.zsh/
touch $WHAT_THE_ZSH/config/20-function.zsh/local.zsh/local.zsh
date +%s > $WHAT_THE_ZSH/.last-update
