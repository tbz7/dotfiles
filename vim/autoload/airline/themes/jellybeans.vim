function! airline#themes#jellybeans#refresh()
  let s:N1 = ['#151515', '#8fbfdc', '233', '110', '']
  let s:N2 = ['#8fbfdc', '#333333', '110', '236', '']
  let s:N3 = ['#8fbfdc', '#1c1c1c', '110', '234', '']
  let s:I1 = ['#151515', '#799d6a', '233', '107', '']
  let s:I2 = ['#799d6a', '#333333', '107', '236', '']
  let s:I3 = ['#799d6a', '#1c1c1c', '107', '234', '']
  let s:R1 = ['#151515', '#cf6a4c', '233', '167', '']
  let s:R2 = ['#cf6a4c', '#333333', '167', '236', '']
  let s:R3 = ['#cf6a4c', '#1c1c1c', '167', '234', '']
  let s:V1 = ['#151515', '#ffb964', '233', '215', '']
  let s:V2 = ['#ffb964', '#333333', '215', '236', '']
  let s:V3 = ['#ffb964', '#1c1c1c', '215', '234', '']
  let s:IA1 = ['#151515', '#333333', '233', '236', '']
  let s:IA2 = ['#e8e8d3', '#1c1c1c', '188', '234', '']

  let g:airline#themes#jellybeans#palette = {
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

call airline#themes#jellybeans#refresh()
