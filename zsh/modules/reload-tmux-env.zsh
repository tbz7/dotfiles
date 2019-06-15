if [[ -n $TMUX ]] hook preexec reload-tmux-env 'eval $(tmux switchc\; showenv -s)'
