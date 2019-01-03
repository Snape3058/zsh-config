#!/usr/bin/env zsh

function weather()
{
    curl "http://wttr.in/$@"
}

function pubip()
{
    curl "https://myip.ipip.net/"
}
