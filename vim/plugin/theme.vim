let g:airline_powerline_fonts = $NO_CUSTOM_FONT != 'true'
let g:airline_skip_empty_sections = 1
let g:gruvbox_italic = 1
let g:jellybeans_use_term_italics = 1
let g:monokai_term_italic = 1
let g:onedark_terminal_italics = 1
let g:solarized_term_italics = 1

function! s:Base16Patch()
  let fg = synIDattr(synIDtrans(hlID('Normal')), 'bg')
  exe 'hi DiffAdd    guifg='.fg.' guibg='.synIDattr(synIDtrans(hlID('String')), 'fg')
  exe 'hi DiffText   guifg='.fg.' guibg='.synIDattr(synIDtrans(hlID('Function')), 'fg')
  exe 'hi DiffDelete guifg='.fg.' guibg='.synIDattr(synIDtrans(hlID('Identifier')), 'fg')
endfunction
augroup Theme
  au! ColorScheme * hi MatchParen guifg=NONE
  au! ColorScheme base16-* call <SID>Base16Patch()
augroup END

let &termguicolors = $COLORTERM == 'truecolor'
let s:aliases = {'': 'gruvbox', 'solarized': 'solarized8_dark'}
silent! execute 'colorscheme ' . get(s:aliases, $THEME, $THEME)
