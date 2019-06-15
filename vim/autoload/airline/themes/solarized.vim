function! airline#themes#solarized#refresh()
  let s:N1 = ['#fdf6e3', '#93a1a1', '15', '14', '']
  let s:N2 = ['#eee8d5', '#586e75', '7', '10', '']
  let s:N3 = ['#586e75', '#073642', '10', '0', '']
  let s:I1 = ['#fdf6e3', '#268bd2', '15', '4', '']
  let s:I2 = ['#eee8d5', '#586e75', '7', '10', '']
  let s:I3 = ['#586e75', '#073642', '10', '0', '']
  let s:R1 = ['#fdf6e3', '#dc322f', '15', '1', '']
  let s:R2 = ['#eee8d5', '#586e75', '7', '10', '']
  let s:R3 = ['#586e75', '#073642', '10', '0', '']
  let s:V1 = ['#fdf6e3', '#d33682', '15', '5', '']
  let s:V2 = ['#eee8d5', '#586e75', '7', '10', '']
  let s:V3 = ['#586e75', '#073642', '10', '0', '']
  let s:IA1 = ['#073642', '#586e75', '0', '10', '']
  let s:IA2 = ['#657b83', '#002b36', '11', '8', '']
  let s:W = ['#073642', '#cb4b16', '0', '9', '']
  let s:E = ['#073642', '#dc322f', '0', '1', '']

  let g:airline#themes#solarized#palette = {
  \ 'accents': {'red': airline#themes#get_highlight('Constant')},
  \ 'inactive': airline#themes#generate_color_map(s:IA1, s:IA2, s:IA2),
  \ 'insert':  extend(airline#themes#generate_color_map(s:I1, s:I2, s:I3),
  \     {'airline_warning': s:W, 'airline_error': s:E}),
  \ 'normal':  extend(airline#themes#generate_color_map(s:N1, s:N2, s:N3),
  \     {'airline_warning': s:W, 'airline_error': s:E}),
  \ 'replace': extend(airline#themes#generate_color_map(s:R1, s:R2, s:R3),
  \     {'airline_warning': s:W, 'airline_error': s:E}),
  \ 'visual':  extend(airline#themes#generate_color_map(s:V1, s:V2, s:V3),
  \     {'airline_warning': s:W, 'airline_error': s:E}),
  \ 'insert_modified':  {'airline_c': s:V3, 'airline_warning': s:W, 'airline_error': s:E},
  \ 'normal_modified':  {'airline_c': s:V3, 'airline_warning': s:W, 'airline_error': s:E},
  \ 'replace_modified': {'airline_c': s:V3, 'airline_warning': s:W, 'airline_error': s:E},
  \ 'visual_modified':  {'airline_c': s:R3, 'airline_warning': s:W, 'airline_error': s:E},
  \}
endfunction

call airline#themes#solarized#refresh()
