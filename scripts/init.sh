#!/usr/bin/env zsh

# init work space
if [[ "./init.sh" = "$0" ]]; then
    cd ..
fi
export WHAT_THE_ZSH=`pwd`

# backup old zshrc
if [[ -f ~/.zshrc ]]; then
    mv ~/.zshrc ~/.zshrc.backup
fi

# link zshrc and theme
ln -s $WHAT_THE_ZSH/scripts/zshrc ~/.zshrc
ln -sf $WHAT_THE_ZSH/themes/puella.zsh-theme ../themes/

# init local config dir
mkdir -p $WHAT_THE_ZSH/config/90-local.zsh/
cat > $WHAT_THE_ZSH/config/90-local.zsh/prompt.zsh << EOF
PUELLA_THEME_PROMPT_COLOR='green'
PUELLA_THEME_ENABLE_CLOCK=1
PUELLA_THEME_ENABLE_LASTSTATE=1
EOF

# init update timestamp
date +%s > $WHAT_THE_ZSH/.last-update
