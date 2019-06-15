function widget {
  if [[ $# != 2 ]]; then
    echo 'Usage: widget NAME COMMANDS' >&2
    return 1
  fi
  eval "function .widget.$1 { $2; }"
  zle -N $1 .widget.$1
}

widget zle-line-init   "${terminfo[smkx]+echoti smkx}; run-hooks zle_line_init"
widget zle-line-finish "run-hooks zle_line_finish; ${terminfo[rmkx]+echoti rmkx}"
widget zle-keymap-select 'run-hooks zle_keymap'
