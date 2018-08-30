#!/bin/bash
set -euox pipefail 

BACKUP_DIR=/tmp/dotconfig_backup/tmuxconfig
DIR="$(cd "$(dirname "$0")"; pwd -P)"

rm -rf $BACKUP_DIR
mkdir -p $BACKUP_DIR
[ -e ~/.tmux.conf ] && mv ~/.tmux.conf $BACKUP_DIR
ln -sf $DIR/tmux.conf ~/.tmux.conf
