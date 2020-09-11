#!/usr/bin/env zsh

function aiadd
{
    if [ $# -ne 3 ]; then
        echo "Usage: $0 <cp|mv> <appimage> <alias>"
        return 1
    fi
    if [ "$1"x != "cp"x ] && [ "$1"x != "mv"x ]; then
        echo "Unrecognized command '$1'."
        echo "Only 'cp' or 'mv' is allowed."
        return 1
    fi
    if [ "`ls $2 | awk -F '.' '{print tolower($NF)}'`"x != "appimage"x ]; then
        echo "Target executable '$2' is not an AppImage."
        return 1
    fi
    target="$HOME/.local/appimage/`basename $2`"
    mkdir -p $HOME/.local/appimage $HOME/.local/bin && \
        $1 -i $2 $HOME/.local/appimage && \
        chmod +x $target && \
        ln -s $target $HOME/.local/bin/$3
}

function airm
{
    if [ $# -eq 0 ]; then
        echo "Usage: $0 [appimage-alias] ..."
        return 1
    fi
    while [ $# -ne 0 ]; do
        target="$HOME/.local/bin/$1"
        if [ ! -L $target ]; then
            echo "Target alias '$1' does not exist or is not installed with aiadd."
            return 1
        fi
        realtarget=`realpath $target`
        if [ "`ls $realtarget | awk -F '.' '{print tolower($NF)}'`"x != "appimage"x ] && [ -x $realtarget ]; then
            echo "Target executable is not an AppImage."
            return 1
        fi
        rm $target $realtarget
        shift
    done
}

alias ails="find ~/.local/bin -type l -exec ls -l {} \\; | grep appimage | awk '{print \$(NF-2)}' | xargs -r ls --color=auto"
alias aill="ails -l"
