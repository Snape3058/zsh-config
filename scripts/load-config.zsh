#!/usr/bin/env zsh

function _load_config() {
    for config ($1/*.zsh); do
        if [[ -f "$config" ]]; then
            source "$config"
        elif [[ -d "$config" ]]; then
            _load_config $config
        fi
    done
}

_load_config $WHAT_THE_ZSH/config/
