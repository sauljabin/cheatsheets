---
syntax: bash
tags: [tmux, terminal]
---
# To install tmux on macOS or Linux with Homebrew:
brew install tmux

# To install tmux on Debian or Ubuntu:
sudo apt install tmux

# To automatically attach to tmux from an interactive Zsh shell, add to ~/.zshrc:
[[ -o interactive ]] && [[ "$TERM_PROGRAM" != "vscode" ]] && \
    [[ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]] && \
    [[ "$TERM" != "screen" ]] && [[ -z "$TMUX" ]] && \
    { tmux attach-session || exec tmux new-session; }

# To install the tmux plugin manager:
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# Add the following configuration to ~/.tmux.conf:
set -g prefix C-Space
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'jimeh/tmux-themepack'
set -g @themepack 'powerline/default/cyan'
run -b '~/.tmux/plugins/tpm/tpm'

# To reload the tmux configuration:
tmux source-file "$HOME/.tmux.conf"

# To install configured plugins after starting tmux:
Ctrl-Space + I

# To split a pane horizontally or vertically:
Ctrl-Space + "
Ctrl-Space + %

# To move between panes or resize a pane:
Ctrl-Space + arrows
Ctrl-Space + Ctrl-arrows

# To close a pane:
Ctrl-Space + x
# Alternatively, exit its shell:
Ctrl + d

# To toggle pane zoom:
Ctrl-Space + z

# To enter or leave copy mode:
Ctrl-Space + [
Ctrl + c

# To create a window or move between windows:
Ctrl-Space + c
Ctrl-Space + p
Ctrl-Space + n
Ctrl-Space + 0-9
Ctrl-Space + w

# To kill a window from the command prompt:
Ctrl-Space + :
kill-window -t <window>

# To create a new session from the command prompt:
Ctrl-Space + :
new-session

# To kill a session from the command prompt:
Ctrl-Space + :
kill-session -t <session>

# To move between or list sessions:
Ctrl-Space + (
Ctrl-Space + )
Ctrl-Space + s

# To stop the tmux server and all its sessions (destructive):
tmux kill-server
