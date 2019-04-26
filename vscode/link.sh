#! /bin/bash

DIR=`readlink -f $(dirname $0)`

ln -sf $DIR/settings.json ~/.config/Code/User/settings.json
ln -sf $DIR/keybindings.json ~/.config/Code/User/keybindings.json
