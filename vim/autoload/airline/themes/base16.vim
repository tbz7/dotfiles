function! airline#themes#base16#refresh()
  let s:N1 = airline#themes#get_highlight2(['IncSearch', 'fg'], ['Title', 'fg'])
  let s:N2 = airline#themes#get_highlight2(['Title', 'fg'], ['VertSplit', 'fg'])
  let s:N3 = airline#themes#get_highlight2(['Title', 'fg'], ['IncSearch', 'fg'])
  let s:I1 = airline#themes#get_highlight2(['IncSearch', 'fg'], ['String', 'fg'])
  let s:I2 = airline#themes#get_highlight2(['String', 'fg'], ['VertSplit', 'fg'])
  let s:I3 = airline#themes#get_highlight2(['String', 'fg'], ['IncSearch', 'fg'])
  let s:R1 = airline#themes#get_highlight2(['IncSearch', 'fg'], ['Debug', 'fg'])
  let s:R2 = airline#themes#get_highlight2(['Debug', 'fg'], ['VertSplit', 'fg'])
  let s:R3 = airline#themes#get_highlight2(['Debug', 'fg'], ['IncSearch', 'fg'])
  let s:V1 = airline#themes#get_highlight2(['IncSearch', 'fg'], ['Boolean', 'fg'])
  let s:V2 = airline#themes#get_highlight2(['Boolean', 'fg'], ['VertSplit', 'fg'])
  let s:V3 = airline#themes#get_highlight2(['Boolean', 'fg'], ['IncSearch', 'fg'])
  let s:IA1 = airline#themes#get_highlight2(['Cursor', 'fg'], ['VertSplit', 'fg'])
  let s:IA2 = airline#themes#get_highlight2(['Cursor', 'fg'], ['IncSearch', 'fg'])

  let g:airline#themes#base16#palette = {
  \ 'accents': {'red': airline#themes#get_highlight('Constant')},
  \ 'inactive': airline#themes#generate_color_map(s:IA1, s:IA2, s:IA2),
  \ 'insert':  extend(airline#themes#generate_color_map(s:I1, s:I2, s:I3),
  \     {'airline_warning': s:V1, 'airline_error': s:R1}),
  \ 'normal':  extend(airline#themes#generate_color_map(s:N1, s:N2, s:N3),
  \     {'airline_warning': s:V1, 'airline_error': s:R1}),
  \ 'replace': extend(airline#themes#generate_color_map(s:R1, s:R2, s:R3),
  \     {'airline_warning': s:V1, 'airline_error': s:R1}),
  \ 'visual':  extend(airline#themes#generate_color_map(s:V1, s:V2, s:V3),
  \     {'airline_warning': s:V1, 'airline_error': s:R1}),
  \ 'insert_modified':  {'airline_c': s:V3, 'airline_warning': s:V1, 'airline_error': s:R1},
  \ 'normal_modified':  {'airline_c': s:V3, 'airline_warning': s:V1, 'airline_error': s:R1},
  \ 'replace_modified': {'airline_c': s:V3, 'airline_warning': s:V1, 'airline_error': s:R1},
  \ 'visual_modified':  {'airline_c': s:R3, 'airline_warning': s:V1, 'airline_error': s:R1},
  \}
endfunction

call airline#themes#base16#refresh()
