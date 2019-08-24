let s:N1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Statement', 'fg'])
let s:N2 = airline#themes#get_highlight('Pmenu')
let s:N3 = airline#themes#get_highlight2(['Pmenu', 'fg'], ['CursorLine', 'bg'])
let s:I1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Special', 'fg'])
let s:R1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Constant', 'fg'])
let s:V1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Function', 'fg'])
let s:IA1 = airline#themes#get_highlight2(['Comment', 'fg'], ['Pmenu', 'bg'])
let s:IA2 = airline#themes#get_highlight2(['Comment','fg'], ['CursorLine','bg'])
let s:W = airline#themes#get_highlight('Search')
let s:E = airline#themes#get_highlight('DiffDelete')

let g:airline#themes#hybrid#palette = {
\ 'accents': {'red': airline#themes#get_highlight('WarningMsg')},
\ 'inactive': airline#themes#generate_color_map(s:IA1, s:IA2, s:IA2),
\ 'insert':  extend(airline#themes#generate_color_map(s:I1, s:N2, s:N3),
\     {'airline_warning': s:W, 'airline_error': s:E}),
\ 'normal':  extend(airline#themes#generate_color_map(s:N1, s:N2, s:N3),
\     {'airline_warning': s:W, 'airline_error': s:E}),
\ 'replace': extend(airline#themes#generate_color_map(s:R1, s:N2, s:N3),
\     {'airline_warning': s:W, 'airline_error': s:E}),
\ 'visual':  extend(airline#themes#generate_color_map(s:V1, s:N2, s:N3),
\     {'airline_warning': s:W, 'airline_error': s:E}),
\}
