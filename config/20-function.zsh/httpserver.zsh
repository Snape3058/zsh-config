#!/usr/bin/env zsh

function httpserver-kill () {
    port=8080
    if [ -n "$1" ]; then
            port=$1
    fi

    kill `lsof -i :$port | grep 'python3' | awk '{print $2}'`
    return $?
}

function httpserver
{
    port=8080
    if [ -n "$1" ]; then
        port=$1
    fi
    if (($port <= 1024 && 0 != $UID)); then
        sudo="sudo"
    fi

    dir=`pwd`
    if [ -n "$2" ]; then
        dir="$2"
    fi

    name="$0.$port"
    if [ -n "$3" ]; then
        name="$3"
    fi

    if [ $# -eq 0 ] || [ $# -gt 3 ] || [ ! -d "$dir" ]; then
        echo "httpserver <port> [dir=pwd] [session_name='$0.<port>']"
        return 1
    fi

    screen -d -m -S $name sh -c "cd $dir && $sudo python3 -m http.server $port || read"
}
