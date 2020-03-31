function async {
  local callback=".async.callback-$((__async_callback++))" fd
  [[ $# == 2 ]] || .warn 'Usage: async BODY CALLBACK_BODY' || return 1
  eval 'function '$callback' {
    if [[ -z $2 || $2 == hup ]]; then
      () { '$2' } "$(IFS= read -rEd \"\" -u $1)"
      exec {1}<&-
    fi
    zle -F $1
    unfunction $0
  }'
  exec {fd}< <(echo "$(eval $1)"); command true
  zle -F $fd $callback
}


function hook {
  case $# in
    2) local name=$2; (( $+functions[$2] )) || .warn "Undefined function: $2";;
    3) local name=".hook.$1.$2"; eval "function $name { $3 }";;
    *) .warn 'Usage: hook TYPE FUNCTION\n       hook TYPE ID BODY' || return 1;;
  esac
  eval "${1//-/_}_functions=(\${${1//-/_}_functions:#$name} $name)"
}


function widget {
  [[ $# == 2 ]] || .warn 'Usage: widget NAME BODY' || return 1
  eval "function .widget.$1 { $2 }"
  zle -N $1 .widget.$1
}
widget zle-line-init 'local f; for f ($zle_line_init_functions) $f'
widget zle-line-finish 'local f; for f ($zle_line_finish_functions) $f'
widget zle-keymap-select 'local f; for f ($zle_keymap_select_functions) $f'


function .warn { print -P "%9F$1%f" >&2; return 1 }
