function! airline#themes#hybrid#refresh()
  let s:N1 = ['#1d1f21', '#81a2be', '234', '110', '']
  let s:N2 = ['#81a2be', '#373b41', '110', '237', '']
  let s:N3 = ['#81a2be', '#282a2e', '110', '235', '']
  let s:I1 = ['#1d1f21', '#b5bd68', '234', '143', '']
  let s:I2 = ['#b5bd68', '#373b41', '143', '237', '']
  let s:I3 = ['#b5bd68', '#282a2e', '143', '235', '']
  let s:R1 = ['#1d1f21', '#cc6666', '234', '167', '']
  let s:R2 = ['#cc6666', '#373b41', '167', '237', '']
  let s:R3 = ['#cc6666', '#282a2e', '167', '235', '']
  let s:V1 = ['#1d1f21', '#f0c674', '234', '221', '']
  let s:V2 = ['#f0c674', '#373b41', '221', '237', '']
  let s:V3 = ['#f0c674', '#282a2e', '221', '235', '']
  let s:IA1 = ['#1d1f21', '#373b41', '234', '237', '']
  let s:IA2 = ['#707880', '#282a2e', '243', '235', '']

  let g:airline#themes#hybrid#palette = {
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

call airline#themes#hybrid#refresh()
