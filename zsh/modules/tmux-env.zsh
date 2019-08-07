if [[ -n $TMUX ]] hook preexec tmux-env 'eval $(tmux switchc\; showenv -s)'
