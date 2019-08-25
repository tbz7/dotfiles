widget fzf-files '
  local files=(${(@f)"$(fzf < $TTY)":#})
  zle redisplay
  if (( $#files )) LBUFFER=$LBUFFER$files:q\ ;
'
widget fzf-history '
  local line=(${(@f)"$(fc -l 1 | fzf +m +s --tac -n2.. --query=$LBUFFER)":#})
  zle redisplay
  if (( $#line )) zle vi-fetch-history -n $line[1]
'
widget fzf-vim '
  local files=(${(@f)"$(fzf < $TTY)":#})
  zle redisplay
  if (( $#files )); then
    zle push-line
    BUFFER=vim\ $files:q
    zle accept-line
  fi
'
(( $+commands[fzf] )) && bindkey '^t' fzf-files '^r' fzf-history '\ev' fzf-vim
