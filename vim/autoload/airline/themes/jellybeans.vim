let s:N1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Structure', 'fg'])
let s:N2 = airline#themes#get_highlight2(['Todo', 'fg'], ['SignColumn', 'bg'])
let s:N3 = airline#themes#get_highlight2(['Todo', 'fg'], ['SpecialKey', 'bg'])
let s:I1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Special', 'fg'])
let s:R1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Constant', 'fg'])
let s:V1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Type', 'fg'])
let s:IA1 = airline#themes#get_highlight('SignColumn')
let s:IA2 = airline#themes#get_highlight('SpecialKey')
let s:W = airline#themes#get_highlight2(['Normal', 'bg'], ['Type', 'fg'])
let s:E = airline#themes#get_highlight2(['Normal', 'bg'], ['Constant', 'fg'])
let s:WE = {'airline_warning': s:W, 'airline_error': s:E}

let g:airline#themes#jellybeans#palette = {
\ 'accents': {'red': airline#themes#get_highlight('Constant')},
\ 'inactive': airline#themes#generate_color_map(s:IA1, s:IA2, s:IA2),
\ 'insert':  extend(airline#themes#generate_color_map(s:I1, s:N2, s:N3), s:WE),
\ 'normal':  extend(airline#themes#generate_color_map(s:N1, s:N2, s:N3), s:WE),
\ 'replace': extend(airline#themes#generate_color_map(s:R1, s:N2, s:N3), s:WE),
\ 'visual':  extend(airline#themes#generate_color_map(s:V1, s:N2, s:N3), s:WE),
\}
