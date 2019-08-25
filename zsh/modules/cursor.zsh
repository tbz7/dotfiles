function .cursor { if [[ $NO_CURSOR_SHAPES != true ]] echo -n "\e[$1 q" }
hook zle_line_init   cursor '.cursor 5'
hook zle_line_finish cursor '.cursor 2'
hook zle_keymap cursor '[[ $KEYMAP == vicmd ]] && .cursor 2 || .cursor 5'
