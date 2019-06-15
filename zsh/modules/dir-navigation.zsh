setopt autopushd

hook chpwd dir-navigation 'forward_dirstack=()'

widget dir-nav-prev '
  if (( $#dirstack )); then
    local saved=($PWD $forward_dirstack)
    popd > /dev/null
    forward_dirstack=($saved)

    run-hooks precmd
    zle reset-prompt
  fi
'
widget dir-nav-next '
  if (( $#forward_dirstack )); then
    local saved=($forward_dirstack)
    pushd $forward_dirstack[1] > /dev/null
    forward_dirstack=(${saved:1})

    run-hooks precmd
    zle reset-prompt
  fi
'
bindkey '\e[1;3D' dir-nav-prev '\e[1;3C' dir-nav-next
