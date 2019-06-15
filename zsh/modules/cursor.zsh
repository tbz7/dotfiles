if [[ $NO_CURSOR_SHAPES == true ]] return
hook zle_line_init   cursor 'echo -n "\e[5 q"'
hook zle_line_finish cursor 'echo -n "\e[2 q"'
hook zle_keymap cursor '[[ $KEYMAP == vicmd ]] && echo -n "\e[2 q" || echo -n "\e[5 q"'
