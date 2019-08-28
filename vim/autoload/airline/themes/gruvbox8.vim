let s:N1 = airline#themes#get_highlight2(['Normal','bg'], ['StatusLineNC','bg'])
let s:N2 = airline#themes#get_highlight2(['StatusLineNC', 'bg'], ['Pmenu','bg'])
let s:N3 =
\   airline#themes#get_highlight2(['StatusLineNC','bg'],['CursorLine','bg'])
let s:I1 = airline#themes#get_highlight('InsertMode')
let s:I3 = airline#themes#get_highlight2(['Normal', 'fg'], ['Pmenu', 'bg'])
let s:R1 = airline#themes#get_highlight('ReplaceMode')
let s:V1 = airline#themes#get_highlight('VisualMode')
let s:V3 = airline#themes#get_highlight2(['Normal', 'bg'], ['TabLine', 'fg'])
let s:IA = airline#themes#get_highlight2(['TabLine', 'fg'], ['CursorLine','bg'])
let s:E = airline#themes#get_highlight2(['Normal', 'bg'], ['WarningMsg', 'fg'])
let s:WE = {'airline_warning': s:V1, 'airline_error': s:E}
let s:M = airline#themes#get_highlight('Identifier')
let s:M = [s:M[0], '', s:M[2], '', '']
let s:MWE = extend({'airline_c': s:M}, s:WE)
let s:TF = airline#themes#get_highlight2(['Normal', 'bg'], ['Normal','bg'])

let g:airline#themes#gruvbox8#palette = {
\ 'accents': {'red': airline#themes#get_highlight('Special')},
\ 'inactive': airline#themes#generate_color_map(s:IA, s:IA, s:IA),
\ 'insert':  extend(airline#themes#generate_color_map(s:I1, s:N2, s:I3), s:WE),
\ 'normal':  extend(airline#themes#generate_color_map(s:N1, s:N2, s:N3), s:WE),
\ 'replace': extend(airline#themes#generate_color_map(s:R1, s:N2, s:I3), s:WE),
\ 'visual':  extend(airline#themes#generate_color_map(s:V1, s:N2, s:V3), s:WE),
\ 'inactive_modified': s:MWE, 'insert_modified': s:MWE,
\ 'normal_modified': s:MWE, 'replace_modified': s:MWE, 'visual_modified': s:MWE,
\ 'tabline': {
\   'airline_tab': s:N2, 'airline_tabsel': s:N1, 'airline_tabtype': s:V1,
\   'airline_tabfill': s:TF, 'airline_tabhid': s:IA, 'airline_tabmod': s:I1,
\ },
\}
