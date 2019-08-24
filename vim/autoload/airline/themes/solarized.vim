let s:N1 = airline#themes#get_highlight('NormalMode')
let s:N2 = airline#themes#get_highlight('PmenuSel')
let s:N3 = airline#themes#get_highlight('FoldColumn')
let s:I1 = airline#themes#get_highlight('InsertMode')
let s:R1 = airline#themes#get_highlight('ReplaceMode')
let s:V1 = airline#themes#get_highlight('VisualMode')
let s:IA1 = airline#themes#get_highlight('StatusLineNC')
let s:IA2 = airline#themes#get_highlight('LineNr')
let s:W = airline#themes#get_highlight2(['Error', 'bg'], ['WarningMsg', 'fg'])
let s:E = airline#themes#get_highlight('Error')

let g:airline#themes#solarized#palette = {
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
