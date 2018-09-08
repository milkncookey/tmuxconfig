#!/bin/bash
set -euox pipefail

# In case tmux is not installed yet, then why you trying to config
if ! type "tmux" > /dev/null; then
    while true; do
        read -p "Do you wish to install tmux?
" yn
        case $yn in
            Yes ) sudo apt-get install tmux; break;;
            * ) echo "Continuing without installing tmux"; break;;
        esac
    done
fi

BACKUP_DIR=/tmp/dotconfig_backup/tmuxconfig
DIR="$(cd "$(dirname "$0")"; pwd -P)"

rm -rf $BACKUP_DIR
mkdir -p $BACKUP_DIR
[ -e ~/.tmux.conf ] && mv ~/.tmux.conf $BACKUP_DIR
ln -sf $DIR/tmux.conf ~/.tmux.conf
