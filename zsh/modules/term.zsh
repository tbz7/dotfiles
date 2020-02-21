# True color fallback
if [[ $TERM_PROGRAM == Apple_Terminal && $TERM == xterm-256color ]] TERM=nsterm
if [[ $TERM == nsterm* ]] zmodload zsh/nearcolor

# Key mode fix
if [[ -n $terminfo[smkx] && -n $terminfo[rmkx] ]]; then
  hook zle-line-init   keys 'echoti smkx'
  hook zle-line-finish keys 'echoti rmkx'
fi

# Cursor shapes
if [[ -n $terminfo[Ss] ]]; then
  hook zle-line-init   cursor 'echoti Ss 5'
  hook zle-line-finish cursor 'echoti Ss 2'
  hook zle-keymap-select cursor '[[ $KEYMAP == vicmd ]] && echoti Ss 2 || echoti Ss 5'
fi

# Focus events
hook zle-line-init   focus 'echo -n "\e[?1004h"'
hook zle-line-finish focus 'echo -n "\e[?1004l"'
widget zle-focus-gained 'run-hooks zle-focus-gained'
widget zle-focus-lost   'run-hooks zle-focus-lost'
bindkey -M main  '\e[I' zle-focus-gained '\e[O' zle-focus-lost
bindkey -M vicmd '\e[I' zle-focus-gained '\e[O' zle-focus-lost
