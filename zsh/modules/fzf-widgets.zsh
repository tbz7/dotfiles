function .fzf-widgets.widget {
  widget $1 "
    local alarm=(\$alarm_functions)
    alarm_functions=()
    local lines=(\${(@f)\"\$($2)\":#})
    alarm_functions=(\$alarm)
    zle redisplay
    if (( \$#lines )); then $3; fi
  "
}
.fzf-widgets.widget fzf-files 'fzf < $TTY' \
    'LBUFFER=$LBUFFER$lines:q\ '
.fzf-widgets.widget fzf-history \
    'fc -l 1 | fzf +m +s --tac -n2.. --query=$LBUFFER' \
    'zle vi-fetch-history -n $lines[1]'
.fzf-widgets.widget fzf-vim 'fzf < $TTY' \
    'zle push-line
     BUFFER=vim\ $lines:q
     zle accept-line'
(( $+commands[fzf] )) && bindkey '^t' fzf-files '^r' fzf-history '\ev' fzf-vim
