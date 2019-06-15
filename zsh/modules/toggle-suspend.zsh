widget toggle-suspend 'zle push-line; BUFFER=fg; zle accept-line'
bindkey '^Z' toggle-suspend
