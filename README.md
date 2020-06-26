# tmux-project

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://wfxr.mit-license.org/2018)
![version 0.0.1](https://img.shields.io/badge/version-0.0.1-red.svg)

`tmux-project` is a tmux plugin for managing sessions, windows and panes.

## Dependencies

- Launcher: Make sure you have a launcher or finder to be able to select:
  - [fzf](https://github.com/junegunn/fzf) [Recommended]
  - [dmenu](https://github.com/junegunn/fzf)
  - awk

## Install

### Via [TPM](https://github.com/tmux-plugins/tpm) (Recommend)

Add this line to your tmux config file, then hit `prefix + I`:

``` tmux
set -g @plugin 'jhonrocha/tmux-project'
```

### Manually

Clone this repo somewhere and source `tmux-project.tmux` at the config file.

## Usage

The default key-binding is `p`(of course prefix hit is needed), it can be modified
by setting value to `@tp-key` at tmux config file.
There is also an option to set which launcher to use. By default it is `fzf-tmux`,
you can use `dmenu` or any custom command with `@tp-launcher`.

The default file to get configuration is `$XDG_CONFIG_HOME/tmux-project.config`.
You can change it using `@tp-file`.

``` tmux
set -g @tp-key 'k'
set -g @tp-launcher 'dmenu -c -l 30 -bw 2'
set -g @tp-file '~/.cache/tmux-project.config'
```

### The Config File
The config file should store a list of: `action:FULL_PATH` where the actions 
supported are:

- session -> opens a new session on the path
- window -> opens a new window on the path
- pane -> opens a new horizontal pane on the path
- hpane -> opens a new horizontal pane on the path
- vpane -> opens a new vertical pane on the path

```
session:/home/user/projec1
session:/home/user/projec2
window:/home/
pane:/
hpane:/home/user/projec5
vpane:/home/user/projec6
```

## Contibutors

- [Jhon Rocha](https://github.com/jhonrocha)

## License

[MIT](https://github.com/jhonrocha/tmux-project/blob/master/LICENSE)
