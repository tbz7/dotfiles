if [[ $TERM_PROGRAM == Apple_Terminal && $TERM == xterm-256color ]] TERM=nsterm

export COLORTERM=truecolor
unset NO_CURSOR_SHAPES

if [[ $TERM == nsterm* ]] unset COLORTERM
if [[ $TERM == linux* ]] export NO_CURSOR_SHAPES=true NO_CUSTOM_FONT=true
