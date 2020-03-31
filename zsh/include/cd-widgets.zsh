hook chpwd cd-widgets 'forward_dirstack=()'

widget cd-back '
  if (( $#dirstack )); then
    local f saved=($PWD $forward_dirstack)
    popd > /dev/null
    forward_dirstack=($saved)

    for f ($precmd_functions) $f
    zle reset-prompt
  fi
'
widget cd-forward '
  if (( $#forward_dirstack )); then
    local f saved=($forward_dirstack)
    pushd $forward_dirstack[1] > /dev/null
    forward_dirstack=(${saved:1})

    for f ($precmd_functions) $f
    zle reset-prompt
  fi
'
