#!/usr/bin/env zsh
#
# Customized commands:
# This file defines aliases of overriding default command arguments or defining new commands with specific arguments.

# ls
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -F'

# cd
alias cdlib='cd `pwd | sed "s/include/lib/g"`'
alias cdinc='cd `pwd | sed "s/lib/include/g"`'
alias cdp='cd -P'

# less
alias less='less -R -x4'

# cp
alias cp-LinkAsLink='cp --no-dereference'
alias cp-LinkAsFile='cp --dereference'

# other "-h" operations
alias df='df -h -T'
alias free='free -h'

# grep
# grep is set by oh-my-zsh
alias egrep='egrep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias -g with='| egrep '
alias -g without='| egrep -v '

# date
alias datenum='date "+%s%N"'
alias datetime='date "+%Y-%m-%d_%H:%M:%S"'
alias datestr='date "+%Y-%m-%d"'
alias timestr='date "+%H:%M:%S"'

# gcc / llvm
alias gtest='gcc -D __GTEST_ON__ -lgtest -lgtest_main'
alias gtest++='g++ -D __GTEST_ON__ -lgtest -lgtest_main'
alias llvm='clang -emit-llvm -S -Xclang -disable-O0-optnone'

# vim
alias vim='vim -O'
alias temp.cpp='cd ~/temp && vim temp.cpp && cd -'

# tmux
alias tmux='tmux -2'

# make
alias make='make -j`nproc`'

# curl
alias google='proxychains curl -s -I -L https://www.google.com/ | head -n 1'
alias baidu='curl -s -I -L https://www.baidu.com/ | head -n 1'
alias g204='curl -s -I -L g.cn/generate_204 | head -n 1'
alias myip='curl myip.ipip.net'

# mktemp
alias tempdir='cd `mktemp -d`'
alias tempdirhere='cd `mktemp -d -p .`'

# tree
alias tree='tree -I ".git|.svn|[Bb]uild" -a'
