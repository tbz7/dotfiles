# hooks
function hook {
  case $# in
    2) local name=$2; (( $+functions[$2] )) || .warn "Undefined function: $2";;
    3) local name=".hook.$1.$2"; eval "function $name { $3; }";;
    *) .warn 'Usage: hook TYPE FUNCTION\n       hook TYPE ID BODY' || return 1;;
  esac
  eval "${1}_functions=(\${${1}_functions:#$name} $name)"
  run-hooks hook_added $1 $name
}
function run-hooks {
  eval "for f (\$${1}_functions) \$f \${(q)@:2}"
}


# plugins
function plug {
  case $1 in
    clear) rm -rf ~/.zsh/plugins ~/.zcompdump;;
    update)
      for p in $__plugins; do
        if [[ -d ~/.zsh/plugins/$p ]]; then
          git -C ~/.zsh/plugins/$p pull
        else
          git clone --depth 1 "https://github.com/$p" ~/.zsh/plugins/$p
        fi
      done
      rm -f ~/.zcompdump;;
    */*)
      __plugins+=$1
      for f (~/.zsh/plugins/$1/*.plugin.zsh(N)) source $f
      [[ -d ~/.zsh/plugins/$1 ]];;
    *) .warn 'Invalid plug command';;
  esac
}
__plugins=()


# term
export COLORTERM=truecolor
unset NO_CURSOR_SHAPES
if [[ $TERM_PROGRAM == Apple_Terminal && $TERM == xterm-256color ]] TERM=nsterm
if [[ $TERM == nsterm* ]] unset COLORTERM
if [[ $TERM == linux* ]] export NO_CURSOR_SHAPES=true NO_CUSTOM_FONT=true


# zle
function widget {
  [[ $# == 2 ]] || .warn 'Usage: widget NAME BODY' || return 1
  eval "function .widget.$1() { $2; }"
  zle -N $1 .widget.$1
}
widget zle-line-init "${terminfo[smkx]+echoti smkx}; run-hooks zle_line_init"
widget zle-line-finish "run-hooks zle_line_finish; ${terminfo[rmkx]+echoti rmkx}"
widget zle-keymap-select 'run-hooks zle_keymap'


function .warn { print -P "%9F$1%f" >&2; return 1 }
