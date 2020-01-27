#!/usr/bin/env zsh

which fzf 1> /dev/null 2> /dev/null

if (($?)); then
    echo "ERROR: fzf is not installed, $0 will not be loaded."
    return 1
fi

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

if [ -n "$TMUX" ]; then
    alias fzf=fzf-tmux
fi

# exclude .git .svn ./[Bb]uild/ by default
export FZF_DEFAULT_COMMAND='find . -type f | egrep -v "\.\<git\>/|\.\<svn\>/|\./[Bb]uild/"'
export FZF_DEFAULT_OPTS="--height 22 --reverse --preview 'source-highlight --failsafe -f esc256 --infer-lang --style-file=esc256.style -n -i {} | head -20'"
export FZF_CTRL_T_COMMAND='find . -type f | egrep -v "\.\<git\>/|\.\<svn\>/|\./[Bb]uild/"'
export FZF_CTRL_T_OPTS="--height 22 --reverse --preview 'source-highlight --failsafe -f esc256 --infer-lang --style-file=esc256.style -n -i {} | head -20'"
