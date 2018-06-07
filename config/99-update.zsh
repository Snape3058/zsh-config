#!/usr/bin/env zsh

# update time stamp
function update_config_repository_timestamp() {
    echo `date +%s` > $WHAT_THE_ZSH/.last-update
}

# the update process
function update_config_repository() {
    screen -S test -d -m bash -c "cd $WHAT_THE_ZSH/ && git pull"
}

# update config every 15 days
if (( $(date +%s) >= $(echo `cat $WHAT_THE_ZSH/.last-update` + 1296000 | bc) )); then
    update_config_repository_timestamp
    update_config_repository
fi
