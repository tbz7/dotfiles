function! airline#themes#monokai#refresh()
  let s:N1 = ['#272822', '#66d9ef', '234', '81', '']
  let s:N2 = ['#e8e8e3', '#383a3e', '252', '236', '']
  let s:N3 = ['#e8e8e3', '#2d2e27', '252', '235', '']
  let s:I1 = ['#272822', '#a6e22d', '234', '148', '']
  let s:I2 = ['#e8e8e3', '#383a3e', '252', '236', '']
  let s:I3 = ['#e8e8e3', '#2d2e27', '252', '235', '']
  let s:R1 = ['#272822', '#f92772', '234', '197', '']
  let s:R2 = ['#e8e8e3', '#383a3e', '252', '236', '']
  let s:R3 = ['#e8e8e3', '#2d2e27', '252', '235', '']
  let s:V1 = ['#272822', '#fd9720', '234', '208', '']
  let s:V2 = ['#e8e8e3', '#383a3e', '252', '236', '']
  let s:V3 = ['#e8e8e3', '#2d2e27', '252', '235', '']
  let s:IA1 = ['#8f908a', '#383a3e', '243', '236', '']
  let s:IA2 = ['#8f908a', '#2d2e27', '243', '235', '']

  let g:airline#themes#monokai#palette = {
  \ 'accents': {'red': airline#themes#get_highlight('Statement')},
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

call airline#themes#monokai#refresh()
