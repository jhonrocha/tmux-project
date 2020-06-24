#!/usr/bin/env sh
#=============================
#   Author: Jhon Rocha
#    Email: jhmrocha@gmail.com
#  Created: 2020-06-24 10:30
#=============================
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# $1: option
# $2: default value
tmux_get() {
    local value
    value="$(tmux show -gqv "$1")"
    [ -n "$value" ] && echo "$value" || echo "$2"
}

key="$(tmux_get '@tp-key' 'p')"
launcher="$(tmux_get '@tp-launcher' 'fzf-tmux')"
file="$(tmux_get '@tp-config' "$XDG_CONFIG_HOME/tmux-project.config")"

tmux bind-key "$key" run -b "$CURRENT_DIR/tmux-project.sh \"$launcher\" \"$file\";

