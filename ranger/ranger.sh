#!/bin/bash

if ! type ranger > /dev/null 2>&1; then 
  return 
fi


ranger() { [ -n "$RANGER_LEVEL" ] && exit || LESS="$LESS -+F -+X" command ranger "$@"; }
[ -n "$RANGER_LEVEL" ] && PS1="(RANGER) $PS1"
alias rng='ranger'
ranger_cd() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}
alias rcd='ranger_cd'

source $DOTFILES/ranger/shell_automatic_cd.sh
