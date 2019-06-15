hook zle_line_init   focus 'echo -n "\e[?1004h"'
hook zle_line_finish focus 'echo -n "\e[?1004l"'

widget focus-gained 'run-hooks focus_gained'
widget focus-lost   'run-hooks focus_lost'

bindkey -M main  '\e[I' focus-gained '\e[O' focus-lost
bindkey -M vicmd '\e[I' focus-gained '\e[O' focus-lost
