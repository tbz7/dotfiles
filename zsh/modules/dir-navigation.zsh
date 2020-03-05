hook chpwd dir-navigation 'forward_dirstack=()'

widget dir-nav-prev '
  if (( $#dirstack )); then
    local f saved=($PWD $forward_dirstack)
    popd > /dev/null
    forward_dirstack=($saved)

    for f ($precmd_functions) $f
    zle reset-prompt
  fi
'
widget dir-nav-next '
  if (( $#forward_dirstack )); then
    local f saved=($forward_dirstack)
    pushd $forward_dirstack[1] > /dev/null
    forward_dirstack=(${saved:1})

    for f ($precmd_functions) $f
    zle reset-prompt
  fi
'
bindkey '\e[1;3D' dir-nav-prev '\e[1;3C' dir-nav-next
