#!/usr/bin/env bash
# Using capture-pane on tmux, give a fzf prompt of recent commands,
# allowing the user to copy the output of one.
# fzf-tmux and xclip required for this script.
# By Jaywalker, Luke and Jhon

launcher_cmd() {
  if [ "$2" = "quick" ]; then
    head -n 1
  elif [ "$1" = "fzf-tmux" ]; then
    fzf-tmux -d 35% --multi --exit-0 --cycle --reverse --bind='ctrl-r:toggle-all' --bind='ctrl-s:toggle-sort' --no-preview --header="Copy which command's output?"
  elif [ "$1" = "dmenu" ]; then
    dmenu -p "Copy which command's output?" -i -l 10 
  else
    # Simply use the command
    $1
  fi
}

launcher=$1
file=$2

# Choose
launcher_cmd "$launcher" "$quick_key" < $file | xargs printf 
