#!/usr/bin/env bash
# List options to pen a new session, window, pane or horizontal pane by location
# By Jhon
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
launcher_cmd "$launcher" "$quick_key" < $file | { IFS=':' read -r action path
  if [ "$action" = "session" ]; then
    tmux_socket=$(echo $TMUX | cut -d',' -f1)
    section_name=$(TMUX="" tmux -S "$tmux_socket" new-session -c "$path" -d -P)
    tmux switch-client -t "$session_name"
  elif [ "$action" = "window" ]; then
    tmux new-window -c $path
  elif [ "$action" = "pane" ] || [ "$action" = "vpane" ]; then
    tmux split-window -v -c $path
  elif [ "$action" = "hpane" ]; then
    tmux split-window -h -c $path
  fi
}
