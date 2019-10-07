if ! (( $+terminfo[Ss] )) return
hook zle_line_init   cursor 'echoti Ss 5'
hook zle_line_finish cursor 'echoti Ss 2'
hook zle_keymap cursor '[[ $KEYMAP == vicmd ]] && echoti Ss 2 || echoti Ss 5'
