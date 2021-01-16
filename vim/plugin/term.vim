" Cursor shapes
let &t_EI = system('tput Ss 2 2> /dev/null')
let &t_SR = system('tput Ss 3 2> /dev/null')
let &t_SI = system('tput Ss 5 2> /dev/null')

" True color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Bracketed paste
let &t_BE = "\<Esc>[?2004h"
let &t_BD = "\<Esc>[?2004l"
let &t_PS = "\<Esc>[200~"
let &t_PE = "\<Esc>[201~"

" Focus events
let &t_fe = "\<Esc>[?1004h"
let &t_fd = "\<Esc>[?1004l"
