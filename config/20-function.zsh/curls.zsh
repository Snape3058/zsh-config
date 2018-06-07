#!/usr/bin/env zsh

function weather()
{
    curl "http://wttr.in/$@"
}
