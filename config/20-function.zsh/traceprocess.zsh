#!/usr/bin/env zsh

function traceprocess()
{
	if ((1 != $#)); then
		return 1
	fi
	if ! [ "$1" -eq "$1" ] 2>/dev/null; then
		return 1
	fi
	if ((1 == $1)); then
		ps -o pid -o command $1
		return $?
	fi
	traceprocess `ps -f $1 | tail -n 1 | awk '{print $3}'`
	ps -o pid -o command $1 | tail -n 1
	return $?
}

