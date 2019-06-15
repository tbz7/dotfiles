if [[ $TERM == xterm-256color ]]; then
  if [[ -n $VTE_VERSION ]]; then
    TERM=vte-256color
  elif [[ $TERM_PROGRAM == Apple_Terminal ]]; then
    TERM=nsterm
  fi
fi

export COLORTERM=truecolor
unset NO_CURSOR_SHAPES

if [[ $TERM == nsterm* ]] unset COLORTERM
if [[ $TERM == linux* ]] export NO_CURSOR_SHAPES=true NO_CUSTOM_FONT=true
