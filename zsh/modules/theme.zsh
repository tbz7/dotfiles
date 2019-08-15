zmodload zsh/mapfile

function theme {
  local sticky
  zparseopts -D -- s=sticky

  if ! [[ -f ~/.zsh/themes/$1 ]]; then
    echo "Invalid theme: $1"
    return 1
  fi

  export THEME=$1
  if [[ -n $sticky ]] mapfile[$HOME/.theme]=$THEME

  zstyle ':theme' colors ${=mapfile[$HOME/.zsh/themes/$THEME]}

  hook hook_added theme 'if [[ $1 == theme ]] $2'
  run-hooks theme
}

function _theme {
  _arguments -A '-*' '-s[sticky]' '::theme:(~/.zsh/themes/*(:t))'
}
hook postcompinit theme 'compdef _theme theme'

theme ${THEME:-${mapfile[$HOME/.theme]:-gruvbox}}
