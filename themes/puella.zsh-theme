# vim:set syntax=zsh

# set main part of the prompt
# e.g. username@domain for normal or username@vim for vim inner shell
# use PUELLA_THEME_PROMPT_COLOR variable to adjust its color
if [[ -z "$PUELLA_THEME_PROMPT_COLOR" ]]; then
    PUELLA_THEME_PROMPT_COLOR="green"
fi
function setPromptTitle()
{
    echo "%{$fg_bold[$PUELLA_THEME_PROMPT_COLOR]%}%n@%m"
}

# set recurive level of current shell
# immplemented with ps
# ! have bugs when a shell script is killed with ctrl-c
function setPromptLevel()
{
	ZSH_LEVEL=$((`ps | wc -l` - 5))
	if (( $ZSH_LEVEL > 1 )); then
		echo "%{$fg_bold[white]%}($ZSH_LEVEL)"
	fi
}

# set variable identifying the chroot you work in
function setPromptSChroot () {
    if [ -r /etc/debian_chroot ]
    then
        debian_chroot=$(cat /etc/debian_chroot)
        echo "%{$fg_bold[white]%}[$debian_chroot] "
    fi
}

# echo last state on rprompt when non-zero
if [[ -z "$PUELLA_THEME_ENABLE_LASTSTATE" ]]; then
    PUELLA_THEME_ENABLE_LASTSTATE=0
fi
setRPromptRetVal () {
	local RETURN_VALUE=$?
	if (($PUELLA_THEME_ENABLE_LASTSTATE))
	then
		echo "%{$fg_bold[red]%}%(?::$RETURN_VALUE)"
	fi
}

# add a clock on the rprompt
if [[ -z "$PUELLA_THEME_ENABLE_CLOCK" ]]; then
    PUELLA_THEME_ENABLE_CLOCK=0
fi
setRPromptClock () {
	if (($PUELLA_THEME_ENABLE_CLOCK))
	then
		echo "%{$fg_bold[white]%}[$(date +%T)]"
	fi
}

# !PROMPT!
PROMPT='$(setPromptSChroot)%{$reset_color%}$(setPromptTitle)$(setPromptLevel)%{$fg_bold[white]%}:%{$fg_bold[cyan]%}%~$(git_prompt_info)%{$fg_bold[yellow]%}%(!.#.$)%{$reset_color%} '

# !RPROMPT!
RPROMPT='%{$reset_color%}$(setRPromptRetVal) $(setRPromptClock)%{$reset_color%}'

# variables for git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%} ("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[white]%}) %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}[+]"
