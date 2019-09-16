if [[ -z $TMUX ]] return
hook preexec tmux-env '
  eval $(tmux if -F "#{m:*Z*,#F}" "switchc; resizep -Z" switchc\; showenv -s)
'
