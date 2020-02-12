# async
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


# hooks
function hook {
  case $# in
    2) local name=$2; (( $+functions[$2] )) || .warn "Undefined function: $2";;
    3) local name=".hook.$1.$2"; eval "function $name { $3 }";;
    *) .warn 'Usage: hook TYPE FUNCTION\n       hook TYPE ID BODY' || return 1;;
  esac
  eval "${1}_functions=(\${${1}_functions:#$name} $name)"
}
function run-hooks {
  eval "for f (\$${1}_functions) \$f"
}
trap 'run-hooks alarm' ALRM
TMOUT=10


# term
if [[ $TERM_PROGRAM == Apple_Terminal && $TERM == xterm-256color ]] TERM=nsterm
if [[ $TERM == nsterm* ]] zmodload zsh/nearcolor
if [[ $TERM == linux* ]] export NO_CUSTOM_FONT=true


# theme
zmodload zsh/mapfile
function theme {
  [[ $1 == -s ]] && mapfile[$HOME/.theme]=$2 && shift
  [[ -f ~/.zsh/themes/$1 ]] || .warn "Invalid theme: $1" || return 1
  theme=(${=mapfile[$HOME/.zsh/themes/${THEME::=$1}]})
}
export THEME; declare -gA theme=()
theme ${THEME:-${mapfile[$HOME/.theme]:-gruvbox}}


# zle
function widget {
  [[ $# == 2 ]] || .warn 'Usage: widget NAME BODY' || return 1
  eval "function .widget.$1 { $2 }"
  zle -N $1 .widget.$1
}
widget zle-line-init "${terminfo[smkx]+echoti smkx}; run-hooks zle_line_init"
widget zle-line-finish "run-hooks zle_line_finish;${terminfo[rmkx]+echoti rmkx}"
widget zle-keymap-select 'run-hooks zle_keymap'


function .warn { print -P "%9F$1%f" >&2; return 1 }
