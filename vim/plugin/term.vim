" Italics
let &t_ZH = "\<Esc>[3m"
let &t_ZR = "\<Esc>[23m"

" Cursor shapes
if $NO_CURSOR_SHAPES != 'true'
  let &t_EI = "\<Esc>[2 q"
  let &t_SR = "\<Esc>[3 q"
  let &t_SI = "\<Esc>[5 q"
endif

" True color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Bracketed paste
let &t_BE = "\<Esc>[?2004h"
let &t_BD = "\<Esc>[?2004l"
let &t_PS = "\<Esc>[200~"
let &t_PE = "\<Esc>[201~"

" Focus events
let &t_ti .= "\<Esc>[?1004h"
let &t_te .= "\<Esc>[?1004l"
