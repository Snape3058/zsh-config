#!/usr/bin/env zsh

function cl {
    if ((1 != $#)); then
        echo "usage: cl <path>"
        echo "Change directory following the links in '~/.links/'"
        return 1
    fi

    cd -P ~/.links/$@
}

# completion for command cl
compdef _cl cl
function _cl {
    _path_files -/ -W ~/.links/
}
