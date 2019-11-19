#!/usr/bin/env zsh
#
# Open with:
# This file defines aliases that customizes the open method of
# specific files.

# configurations for terminal
  # Text:
alias -s txt='vim'
alias -s tex='vim'
  # Shell:
alias -s sh='vim'
alias -s zsh='vim'
  # C/C++:
alias -s c='vim'
alias -s cc='vim'
alias -s cpp='vim'
alias -s cxx='vim'
alias -s h='vim'
alias -s hpp='vim'
alias -s i='vim "+set syntax=c"'
alias -s ii='vim "+set syntax=cpp"'
alias -s ll='vim'
  # Java:
alias -s java='vim'
alias -s jar='java -jar'
  # HTML:
alias -s html='vim'
alias -s php='vim'
alias -s css='vim'
alias -s js='vim'
  # GDB:
function __gdbinit__ {
    gdbinit=$1
    shift
    args=()
    for i in $@; do
        args+=("-ex" $i)
    done
    cgdb -ex "source $gdbinit" $(echo $args)
}
alias -s gdb='__gdbinit__'
alias -s gdbinit='__gdbinit__'

# configurations for X
  # Images:
alias -s bmp='xdg-open'
alias -s gif='xdg-open'
alias -s ico='xdg-open'
alias -s jpg='xdg-open'
alias -s jpeg='xdg-open'
alias -s png='xdg-open'
alias -s svg='xdg-open'
alias -s tif='xdg-open'
alias -s tiff='xdg-open'
  # Documents:
    # PDF:
alias -s pdf='xdg-open'
    # Document:
alias -s doc='xdg-open'
alias -s docx='xdg-open'
alias -s odt='xdg-open'
alias -s fodt='xdg-open'
    # Spreadsheet:
alias -s xls='xdg-open'
alias -s xlsx='xdg-open'
alias -s ods='xdg-open'
alias -s fods='xdg-open'
    # Slides:
alias -s ppt='xdg-open'
alias -s pptx='xdg-open'
alias -s odp='xdg-open'
alias -s fodp='xdg-open'
    # Graph:
alias -s vdx='xdg-open'
alias -s vsd='xdg-open'
alias -s vsdx='xdg-open'
alias -s odg='xdg-open'
alias -s fodg='xdg-open'
    # Formulae:
alias -s odf='xdg-open'
