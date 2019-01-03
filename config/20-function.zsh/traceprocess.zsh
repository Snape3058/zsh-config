#!/usr/bin/env zsh

function traceprocess()
{
	if ((1 != $#)); then
		return 1
	fi
	if ! [ "$1" -eq "$1" ] 2>/dev/null; then
		return 1
	fi

    # output header and pid 1
	if ((1 == $1)); then
		ps -o pid -o command $1
		return $?
	fi

    # recursion
	traceprocess `ps h -o ppid $1`

    # output current pid
	ps h -o pid -o command $1
	return $?
}

