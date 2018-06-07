#!/usr/bin/env zsh
#
# Environment configurations:
#   Attach a simple introduction as the entrance for each configuration.
#   If detailed introduction is reauired, add it in the folded area.

# man color configurations: {{{
if [ "$TERM" = 'linux' ] || [ "$TERM" = 'xterm-256color' ]; then
	export LESS_TERMCAP_mb=$(printf "\e[01;36m")
	export LESS_TERMCAP_md=$(printf "\e[01;36m")
	export LESS_TERMCAP_me=$(printf "\e[0m")
	export LESS_TERMCAP_se=$(printf "\e[0m")
	export LESS_TERMCAP_so=$(printf "\e[01;44;33m")
	export LESS_TERMCAP_ue=$(printf "\e[0m")
	export LESS_TERMCAP_us=$(printf "\e[01;33m")
    export GROFF_NO_SGR=1  # for konsole and gnome-terminal
fi
#}}}

# default editor: {{{
export EDITOR=vim
export VISUAL=vim
# }}}

# eliminating delays on ESC: {{{
# This delay exists because many keys (arrows keys, ALT) rely on it as
# an escape character. Default is 0.4 seconds.
# Reset key sequences delay to 10ms.
export KEYTIMEOUT=1
# }}}
