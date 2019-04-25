#!/usr/bin/env zsh

# jump to shortcuts
function cl {
    if ((1 != $#)); then
        echo "usage: cl <path>"
        echo "Change directory following the links in '~/.links/'"
        return 1
    fi

    cd -P ~/.links/$@
}

# create shortcut links required by cl
function mkcl {
    if ((1 != $# && 2 != $#)); then
        echo "usage: mkcl <path> [name]"
        echo "Link '~/.links/name' to 'path'."
        return 1
    fi

    mkdir -p ~/.links/
    ln -s $1:A ~/.links/$2
}

# remove shortcut links in ~/.links/
function rmcl {
    if ((0 == $#)); then
        echo "usage: rmcl <link> ..."
        echo "Remove the 'link's in '~/.links/'."
        return 1
    fi

    for i in $@; do
        rm ~/.links/"$i"
    done
}

# list shortcut links in ~/.links/
function lscl {
    mkdir -p ~/.links/
    ls $@ ~/.links
}
alias llcl='lscl -l'

# completion for command cl
compdef _cl cl
function _cl {
    _path_files -/ -W ~/.links/
}

# completion for command mkcl
compdef _mkcl mkcl
function _mkcl {
    _arguments "1: :_path_files -/"
}

# completion for command rmcl
compdef _rmcl rmcl
function _rmcl {
    _arguments "*: :($(ls ~/.links/ 2>/dev/null))"
}
